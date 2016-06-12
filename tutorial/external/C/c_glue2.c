/* Hand-written C code to be used with example2.e */

#include <stdio.h>

void write_integer_attribute(int*attribute) {
  /* 
     Assume an Eiffel INTEGER is really mapped as a C int.
     Have a look is sys/runtime/base.h
     One can also use the -cecil interface to be always compatible.
  */
  *attribute=2;
}

void call_back_1(void* target, void*routine_ptr) {
  ((void (*)(void*))routine_ptr)(target);
}

int call_back_2(void* target, void*routine_ptr) {
  return (((int (*)(void*))routine_ptr)(target));
}

int call_back_3(void* target, void*routine_ptr, void*eiffel_string) {
  return (((int (*)(void*,void*))routine_ptr)(target,eiffel_string));
}

int call_back_4(void* target, void*routine_ptr, void*eiffel_string) {
  return (((int (*)(void*,void*,char))routine_ptr)(target,eiffel_string,'G'));
}

void call_back_5(void* target, void*routine_ptr) {
  (((void (*)(void*,void*))routine_ptr)(target,target));
}

void call_back_6(void* target, void*routine_ptr) {
  (((void (*)(void*))routine_ptr)(target));
}

int call_back_7(void* target, void*routine_ptr) {
  return ((((int (*)(void*))routine_ptr)(target)));
}
