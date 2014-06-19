class EXAMPLE4
   --
   -- How to compile :
   --                   g++ -c Bar.cpp
   --                   compile -o example4 example4 Bar.o
   --
   -- As well as :
   --                   compile -o example4 example4 Bar.cpp
   --

create {ANY}
   make

feature {ANY}
   make
      local
         bar_pointer: POINTER; c: CHARACTER
      do
         bar_pointer := new_bar('x')
         c := do_print_and_return(3)
         io.put_character(c)
         io.put_new_line
         delete_bar(bar_pointer)
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

   do_print_and_return (i: INTEGER): CHARACTER
         -- Calling static `Bar::do_print_and_return' passing `i' as argument.
         -- The returned C++ type is char which is supposed to match
         -- with CHARACTER. The file "Bar.h" must be #included (if not
         -- yet done).
      external "[
                 C++ [static Bar "Bar.h" ] (EIF_INTEGER): char
               ]"
      end

   delete_bar (bar_pointer: POINTER)
         -- Calling C++ delete of class `Bar' on `bar_pointer'. The file
         -- "Bar.h" must be #included (if not yet done).
      external "[
                 C++ [delete Bar "Bar.h"] ()
               ]"
      end

end -- class EXAMPLE4
