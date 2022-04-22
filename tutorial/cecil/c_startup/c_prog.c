#include <stdio.h>
#include "eiffel.h"

int main(int argc,char*argv[]) {
  /* Do here what you want to do before starting Eiffel code :
   */
  printf("Hi from C world.\n");

  /* Must be called once before calling Eiffel code :
   */
  initialize_eiffel_runtime(argc, argv);


  /* Now calling Eiffel code :
   */
  eiffel_do_it(eiffel_root_object);
  printf("I am back to C world.\n");
  eiffel_do_it(eiffel_root_object);
  printf("I am back (again) to C world.\n");
  exit (0);
}
