class EXAMPLE2
   --
   -- How to compile:
   --                   g++ -c Foo.cpp
   --                   compile -o example2 example2 Foo.o
   --
   -- As well as:
   --                   compile -o example2 example2 Foo.cpp
   --

create {ANY}
   make

feature {ANY}
   make
      local
         foo_pointer: POINTER
      do
         foo_pointer := new_foo
         set_integer(foo_pointer, 3)
         io.put_integer(get_integer(foo_pointer))
         io.put_new_line
         set_real(foo_pointer, 3.0)
         io.put_real(get_real(foo_pointer))
         io.put_new_line
      end

   new_foo: POINTER
         -- Creation of a C++ `Foo' object. The file "Foo.h" must be
         -- #included and the C++ creation function has no argument.
      external "[
                 C++ [new Foo "Foo.h"] ()
               ]"
      end

   set_integer (foo_pointer: POINTER; i: INTEGER)
         -- Calling C++ `set_integer' member function of C++ class `Foo'
         -- using `foo_pointer' as target. This member procedure as
         -- an argument (matching with `i') of type EIF_INTEGER (which match
         -- with INTEGER). The file "Foo.h" must be #included (if not
         -- yet done).
      external "[
                 C++ [Foo "Foo.h"] (EIF_INTEGER)
               ]"
      end

   get_integer (foo_pointer: POINTER): INTEGER
         -- Calling a C++ `get_integer' member function using `foo_pointer' as
         -- target. The file "Foo.h" must be #included (if not yet done).
      external "[
                 C++ [Foo "Foo.h"] (): int
               ]"
      end

   set_real (foo_pointer: POINTER; r: REAL)
         -- Calling `set_real' C++ member procedure using `foo_pointer' as target
         -- and `r' as argument. The file "Foo.h" must be #included (if not
         -- yet done).
      external "[
                 C++ [Foo "Foo.h"] (EIF_REAL)
               ]"
      end

   get_real (foo_pointer: POINTER): REAL
         -- Calling `get_real' C++ member function using `foo_pointer' as target.
         -- The file "Foo.h" must be #included (if not yet done).
      external "[
                 C++ [Foo "Foo.h"] (): float
               ]"
      end

end -- class EXAMPLE2
