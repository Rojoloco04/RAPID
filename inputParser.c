#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// UNITS ALWAYS NEED TO BE NM

// struct for each point
typedef struct {
    int x;
    int y;
} Coordinate;

typedef struct {
    int r;
    int theta;
} Polar;

// error function
static void error(const char *msg) {
    fprintf(stderr, "*ERROR: %s\n", msg);
    exit(1);
}

// read input file
// grab the path starting from "xy"
Coordinate *getCoordinates(const char *filename, size_t *count) {
    FILE *fp = fopen(filename, "r");
    if (!fp) { perror("fopen"); return NULL; }

    char line[256]; // buffer for reading file
    int reading = 0;
    int x, y;

    size_t capacity = 8; // array capacity
    *count = 0; // current number of coordinate pairs
   
    Coordinate *coordinates = malloc(capacity * sizeof(Coordinate));
    if (!coordinates) { fclose(fp); return NULL; }

    while (fgets(line, sizeof(line), fp)) {
        if (!reading && strncmp(line, "XY", 2) == 0) {
            reading = 1;
            memmove(line, line + 2, strlen(line + 2) + 1); // strips leading "XY"
        }

        if (reading) {
            if (strstr(line, "ENDEL")) break; // end of coordinates

            if (sscanf(line, "%d : %d", &x, &y) == 2) {
                if (*count == capacity) { // array dynamic resize
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

// convert path to polar arcs

// send to FPGA ?


int main(void) {
    size_t count = 0;
    Coordinate *coordinates = getCoordinates("input.gds", &count);
    if (!coordinates) error("Failed to parse coordinates\n");

    // test print statement
    for (size_t i = 0; i < count; i++) {
        printf("coord[%zu] = (%d, %d)\n", i, coordinates[i].x, coordinates[i].y);
    }

    // convert coordinates to polar arcs
    


    free(coordinates);
    return 0;
}