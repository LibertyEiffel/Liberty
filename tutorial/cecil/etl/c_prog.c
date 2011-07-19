#include "eiffel.h"

static EIF_OBJ c_side_memory;

void send_factory_to_c(EIF_OBJ example) {
  c_side_memory = EXAMPLE_new_string(example, "foo\n");
}

EIF_OBJ string_back_to_eiffel(void) {
  return c_side_memory;
}

#define eif_adopt(x) (EIF_STUFF_eif_adopt(0,(x)))

void call_eif_adopt_from_c(void) {
  eif_adopt(c_side_memory);
}

#define eif_wean(x) (EIF_STUFF_eif_wean(0,(x)))

void call_eif_wean_from_c(void) {
  eif_wean(c_side_memory);
}
