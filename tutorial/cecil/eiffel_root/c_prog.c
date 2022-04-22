#include <stdio.h>
#include "eiffel.h"

void c_prog (void) {
  printf("Hi from C world.\n");
  Eiffel_do_it(eiffel_root_object);
}
