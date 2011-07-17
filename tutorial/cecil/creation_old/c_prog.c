#include <stdio.h>
#include "eiffel.h"

void* c_prog (EIF_OBJ c_factory) {
  return string_make(c_factory,(unsigned char*)"Hi world !");
}
