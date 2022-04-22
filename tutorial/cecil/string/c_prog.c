#include <stdio.h>
#include "eiffel.h"

void c_prog (EIF_OBJ eiffel_string) {
  STRING_extend(eiffel_string,'H');
  STRING_extend(eiffel_string,'i');
  STRING_extend(eiffel_string,'\n');
}
