// Basic C++ class to test the Liberty Eiffel C++ interface
class Bar {

public:

  char character_attribute;

  double double_attribute;

  Bar (char c) {
    character_attribute = c;
  }

  char get_character ();

  double get_double ();

  static void do_print (int i);

  static char do_print_and_return (int i);

};

