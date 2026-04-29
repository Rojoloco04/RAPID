/*
 * inputParser.c - GDS2 coordinate parser for the RAPID PC tool.
 *
 * See inputParser.h for the public API.
 */

#include "inputParser.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#define PI 3.14159265358979323846

/*
 * getCoordinates - parse XY integer pairs from a text GDS2 file.
 *
 * Scans lines until it finds one starting with "XY", then reads
 * "int : int" pairs until "ENDEL" is encountered.  The returned array
 * is heap-allocated (caller must free).  *count is set to the number
 * of valid pairs found.  Returns NULL on I/O or allocation failure.
 */
Coordinate *getCoordinates(const char *filename, size_t *count) {
    FILE *fp = fopen(filename, "r");
    if (!fp) { perror("fopen"); return NULL; }

    char line[256];
    int reading = 0;
    int x, y;

    size_t capacity = 8;
    *count = 0;

    Coordinate *coordinates = malloc(capacity * sizeof(Coordinate));
    if (!coordinates) { fclose(fp); return NULL; }

    while (fgets(line, sizeof(line), fp)) {
        if (!reading && strncmp(line, "XY", 2) == 0) {
            reading = 1;
            memmove(line, line + 2, strlen(line + 2) + 1);
        }

        if (reading) {
            if (strstr(line, "ENDEL")) break;

            if (sscanf(line, "%d : %d", &x, &y) == 2) {
                if (*count == capacity) {
                    capacity *= 2;
                    Coordinate *temp = realloc(coordinates, capacity * sizeof(Coordinate));
                    if (!temp) { free(coordinates); fclose(fp); return NULL; }
                    coordinates = temp;
                }
                coordinates[*count].x = x;
                coordinates[*count].y = y;
                (*count)++;
            }
        }
    }

    fclose(fp);
    return coordinates;
}

/*
 * convertToPolar - convert XY coordinate pairs to polar (r, theta).
 *
 * r     = sqrt(x^2 + y^2)  (micrometres)
 * theta = atan2(y, x) normalised to [0, 360) degrees
 *
 * The returned array is heap-allocated (caller must free).
 * Returns NULL on allocation failure.
 */
PolarPoint *convertToPolar(const Coordinate *coords, size_t count) {
    PolarPoint *polar = malloc(count * sizeof(PolarPoint));
    if (!polar) return NULL;

    for (size_t i = 0; i < count; i++) {
        double x = (double)coords[i].x;
        double y = (double)coords[i].y;

        polar[i].r = sqrt(x * x + y * y);

        double theta_deg = atan2(y, x) * (180.0 / PI);
        if (theta_deg < 0) theta_deg += 360.0;
        polar[i].theta = theta_deg;
    }

    return polar;
}
