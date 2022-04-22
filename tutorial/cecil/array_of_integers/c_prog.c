#include <stdio.h>
#include "eiffel.h"

void c_prog (EIF_OBJ values) {
  int i;
  int val;
  
  for (i=array_of_int_lower(values);
       i <= array_of_int_upper(values);
       i++) {
    val = array_of_int_item(values,i);
    printf("%d\n",val);
  }
}


