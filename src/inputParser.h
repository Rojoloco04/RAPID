/*
 * inputParser.h - GDS2 coordinate parser for the RAPID PC tool.
 *
 * Provides two functions:
 *   getCoordinates()  parse XY integer pairs from a text GDS2 file
 *   convertToPolar()  convert XY pairs to polar (r, theta) coordinates
 *
 * GDS2 text file format expected:
 *   XY <x> : <y>
 *   <x> : <y>
 *   ...
 *   ENDEL
 *
 * Coordinates are in micrometres (integer). Theta is in degrees [0, 360).
 */

#pragma once
#include <stddef.h>
#include <stdint.h>

typedef struct {
    int x;
    int y;
} Coordinate;

typedef struct {
    double r;
    double theta;
} PolarPoint;

Coordinate *getCoordinates(const char *filename, size_t *count);
PolarPoint  *convertToPolar(const Coordinate *coords, size_t count);
