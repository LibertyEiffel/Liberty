// Basic C++ class to test the Liberty Eiffel C++ interface

#include <iostream>
#include "Bar.h"

char Bar::get_character () {
  return character_attribute;
}

double Bar::get_double () {
  return double_attribute;
}

void Bar::do_print (int i) {

  std::cout << i << "\n";
}

char Bar::do_print_and_return (int i) {

  std::cout << i << "\n";
  return 'Y';
}
