/* Hand-written C code to be used with example4.e */

#include <stdlib.h>
#include "c_glue4.h"

Point * malloc_point(void) {
  Point* point;
  point = (Point*)malloc(sizeof(Point));
  point->x = 0.0;
  point->x = 0.0;
  return point;
}
