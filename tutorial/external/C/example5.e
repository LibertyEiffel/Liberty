class EXAMPLE5
   --
   -- How to use some other external "C" features (i.e. calling C from Eiffel).
   --
   -- To compile this file:
   --
   --       compile example5
   --

create {ANY}
   make

feature {ANY}
   make
      local
         x: INTEGER; format: STRING
      do
         -- How to call printf (example #1):
         x := 2
         format := "[
                      x = %d

                    ]"

         printf_integer(format.to_external, x)
         -- How to call printf (example #2):
         format := "[
                      x = %.2f

                    ]"

         printf_real(format.to_external, 3.14)
         -- How to call printf (example #3):
         inline_printf_integer(2)
         -- How to add to variables:
         x := sum(x, x)
         io.put_string("x = " + x.to_string + "%N")
      end

feature {}
   printf_integer (format: POINTER; i: INTEGER)
         -- Call the C predefined `printf' function using `format' and `i'.
         -- (Also note here the signature example.)
      external "C macro signature (char*,int)"
      alias "printf"
      end

   printf_real (format: POINTER; d: REAL)
         -- Call the C predefined `printf' function using `format' and `i'.
         -- (Also note here the signature example.)
      external "C macro signature (char*,double)"
      alias "printf"
      end

   inline_printf_integer (i: INTEGER)
         -- Using the inline C definition. (Inside the alias string,
         -- the $i refer the `i' argument.)
      external "C inline"
      alias "[
              printf("i = %d\n",$i);

             ]"
      end

   sum (a, b: INTEGER): INTEGER
         -- Using the inline C definition. (Inside the alias string,
         -- the $a refer the `a' argument.)
      external "C inline"
      alias "[
              ($a + $b)

             ]"
      end

end -- class EXAMPLE5
