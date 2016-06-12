// Basic C++ class to test the Liberty Eiffel C++ interface

#include "Foo.h"

int Foo::get_integer() {
  return integer_attribute;
}

float Foo::get_real() {
  return real_attribute;
}

void Foo::set_integer(int i) {
  integer_attribute = i;
}

void Foo::set_real(float r) {
  real_attribute = r;
}
