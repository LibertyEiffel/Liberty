class EXAMPLE3
   --
   -- How to compile :
   --                   g++ -c Bar.cpp
   --                   compile -o example3 example3 Bar.o
   --
   -- As well as :
   --                   compile -o example3 example3 Bar.cpp
   --

create {ANY}
   make

feature {ANY}
   make
      local
         bar_pointer: POINTER
      do
         bar_pointer := new_bar('x')
         do_print(3)
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

   do_print (i: INTEGER)
         -- Calling static `Bar::do_print' passing `i' as argument. The file
         -- "Bar.h" must be #included (if not yet done).
      external "[
                 C++ [static Bar "Bar.h" ] (EIF_INTEGER)
               ]"
      end

   delete_bar (bar_pointer: POINTER)
         -- Calling C++ delete of class `Bar' on `bar_pointer'. The file
         -- "Bar.h" must be #included (if not yet done).
      external "[
                 C++ [delete Bar "Bar.h"] ()
               ]"
      end

end -- class EXAMPLE3
