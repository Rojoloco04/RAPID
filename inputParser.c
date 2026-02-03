#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>
#include <math.h>

#define PI 3.14159

typedef struct {
    long x;
    long y;
} Point;

typedef struct {
    int layer;
    int datatype;
    Point *pts;
    size_t n, cap;
} Polygon;

static void close(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    exit(1);
}

static void rstrip(char *s) {
    size_t n = strlen(s);
    while (n > 0 && (s[n-1] == '\n' || s[n-1] == '\r')) s[--n] = '\0';
}

static char *lskip(char *s) {
    while (*s && isspace((unsigned char)*s)) s++;
    return s;
}

static int starts_with(const char *s, const char *prefix) {
    while (*prefix) {
        if (*s++ != *prefix++) return 0;
    }
    return 1;
}

static void poly_init(Polygon *p) {
    p->layer = -1;
    p->datatype = -1;
    p->pts = NULL;
    p->n = 0;
    p->cap = 0;
}

static void poly_free(Polygon *p) {
    free(p->pts);
    p->pts = NULL;
    p->n = p->cap = 0;
}

static void poly_push(Polygon *p, long x, long y) {
    if (p->n == p->cap) {
        size_t newcap = p->cap ? p->cap * 2 : 16;
        Point *np = (Point*)realloc(p->pts, newcap * sizeof(Point));
        if (!np) close("out of memory");
        p->pts = np;
        p->cap = newcap;
    }
    p->pts[p->n++] = (Point){x, y};
}

/*
  Parses lines like:
    "XY -100: -100"
    "-100: 100"
    "100: 100"
  Returns 1 if parsed x,y successfully, 0 otherwise.
*/
static int parse_xy_pair(const char *line, long *x, long *y) {
    // Copy to a buffer so we can safely manipulate.
    char buf[256];
    snprintf(buf, sizeof(buf), "%s", line);

    // Remove optional leading "XY"
    char *s = (char*)buf;
    s = lskip(s);
    if (starts_with(s, "XY")) {
        s += 2;
    }
    s = lskip(s);

    // KLayout ASCII uses "x: y"
    // We'll use sscanf with the colon.
    long tx, ty;
    if (sscanf(s, "%ld : %ld", &tx, &ty) == 2) {
        *x = tx;
        *y = ty;
        return 1;
    }
    // Some variants might omit spaces around colon
    if (sscanf(s, "%ld:%ld", &tx, &ty) == 2) {
        *x = tx;
        *y = ty;
        return 1;
    }
    return 0;
}

/*
  Example laser command model (you can change this to your real hardware protocol):
    - G0: rapid move (laser off)
    - G1: draw move (laser on)
  Units: nanometers (nm) here.
*/
static void emit_laser_path_from_polygon(const Polygon *p, double coord_unit_nm) {
    if (p->n < 2) return;

    printf(";; --- BOUNDARY layer=%d datatype=%d points=%zu ---\n",
           p->layer, p->datatype, p->n);

    // Move to first point with laser OFF
    double x0 = p->pts[0].x * coord_unit_nm;
    double y0 = p->pts[0].y * coord_unit_nm;
    printf("G0 X%.3f Y%.3f  ; rapid to start (laser OFF)\n", x0, y0);

    // Trace segments with laser ON
    for (size_t i = 1; i < p->n; i++) {
        double x1 = p->pts[i].x * coord_unit_nm;
        double y1 = p->pts[i].y * coord_unit_nm;
        printf("G1 X%.3f Y%.3f  ; draw (laser ON)\n", x1, y1);
    }

    // Also print polar vectors (per segment)
    printf(";; Segment vectors (polar):\n");
    for (size_t i = 1; i < p->n; i++) {
        long dx = p->pts[i].x - p->pts[i-1].x;
        long dy = p->pts[i].y - p->pts[i-1].y;

        double dx_nm = dx * coord_unit_nm;
        double dy_nm = dy * coord_unit_nm;

        double r = hypot(dx_nm, dy_nm);
        double theta = atan2(dy_nm, dx_nm);      // radians
        double theta_deg = theta * (180.0 / PI);

        printf(";;  i=%zu  dx=%.3f nm  dy=%.3f nm  r=%.3f nm  theta=%.3f deg\n",
               i, dx_nm, dy_nm, r, theta_deg);
    }
    printf("\n");
}

int main(void) {
    const char *filename = "input.gds";
    FILE *fp = fopen(filename, "r");
    if (!fp) close("could not open input.gds");

    // Defaults if UNITS isn't found
    // In GDS, second number is often the database unit in meters.
    // Example: UNITS 0.001 1e-09  => 1 coord unit = 1e-09 m = 1 nm
    double db_unit_m = 1e-9;   // fallback: 1 nm
    double coord_unit_nm = db_unit_m / 1e-9;

    enum { ST_OUTSIDE = 0, ST_IN_BOUNDARY, ST_IN_XY } state = ST_OUTSIDE;

    Polygon cur;
    poly_init(&cur);

    char line[512];
    while (fgets(line, sizeof(line), fp)) {
        rstrip(line);
        char *s = lskip(line);
        if (*s == '\0') continue; // skip empty

        // UNITS
        if (starts_with(s, "UNITS")) {
            double a, b;
            if (sscanf(s, "UNITS %lf %lf", &a, &b) == 2) {
                db_unit_m = b;
                coord_unit_nm = db_unit_m / 1e-9;
                // printf("Parsed UNITS: user=%g db(m)=%g => coord_unit_nm=%g\n", a, b, coord_unit_nm);
            }
            continue;
        }

        // Start of a boundary
        if (starts_with(s, "BOUNDARY")) {
            if (state != ST_OUTSIDE) {
                // If nested/weird formatting, flush current polygon
                poly_free(&cur);
                poly_init(&cur);
            }
            state = ST_IN_BOUNDARY;
            continue;
        }

        if (state == ST_IN_BOUNDARY) {
            if (starts_with(s, "LAYER")) {
                int layer;
                if (sscanf(s, "LAYER %d", &layer) == 1) cur.layer = layer;
                continue;
            }
            if (starts_with(s, "DATATYPE")) {
                int dt;
                if (sscanf(s, "DATATYPE %d", &dt) == 1) cur.datatype = dt;
                continue;
            }
            if (starts_with(s, "XY")) {
                state = ST_IN_XY;
                // fall through to parse coordinates on this same line
            }
        }

        if (state == ST_IN_XY) {
            if (starts_with(s, "ENDEL")) {
                // Done reading points; process polygon
                emit_laser_path_from_polygon(&cur, coord_unit_nm);
                poly_free(&cur);
                poly_init(&cur);
                state = ST_OUTSIDE;
                continue;
            }

            long x, y;
            if (parse_xy_pair(s, &x, &y)) {
                poly_push(&cur, x, y);
            } else {
                // If the file includes something unexpected inside XY section, you can decide:
                // ignore it, warn, or error. Here we'll warn.
                fprintf(stderr, "Warning: could not parse XY line: '%s'\n", s);
            }
            continue;
        }

        // Everything else: ignored
    }

    poly_free(&cur);
    fclose(fp);
    return 0;
}
