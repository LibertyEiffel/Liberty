class EXAMPLE1
   --
   -- How to compile :
   --                   g++ -c Foo.cpp
   --                   g++ -c Bar.cpp
   --                   compile -o example1 example1 Foo.o Bar.o
   --
   -- As well as :
   --                   compile -o example1 example1 Foo.cpp Bar.cpp
   --

create {ANY}
   make

feature {ANY}
   make
      local
         foo_pointer, bar_pointer: POINTER; c: CHARACTER
      do
         foo_pointer := new_foo
         bar_pointer := new_bar('x')
         c := get_character(bar_pointer)
         io.put_character(c)
         io.put_new_line
      end

   new_foo: POINTER
         -- Creation of a C++ `Foo' object. The file "Foo.h" must be
         -- #included and the C++ creation function has no argument.
      external "[
                 C++ [new Foo "Foo.h"] ()
               ]"
      end

   new_bar (c: CHARACTER): POINTER
         -- Creation of a C++ `Bar' object. The file "Bar.h" must be
         -- #included and the C++ creation function has one argument
         -- (matching with `c') of type EIF_CHARACTER (matching with
         -- CHARACTER).
      external "[
                 C++ [new Bar "Bar.h"] (EIF_CHARACTER)
               ]"
      end

   get_character (bar_pointer: POINTER): CHARACTER
         -- Calling C++ `get_character' member function without argument using
         -- `bar_pointer' as target of the C++ call. The file "Bar.h" must be
         -- #included (if not yet done).
      external "[
                 C++ [Bar "Bar.h"] (): char
               ]"
      end

end -- class EXAMPLE1
