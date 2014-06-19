class EXAMPLE1
   --
   -- How to use external "C" features (i.e. calling C from Eiffel).
   --
   -- To compile this file:
   --
   --       compile example1 c_glue1.c
   --
   -- You may also prefer:
   --
   --       gcc -c c_glue1.c
   --       compile example1 c_glue1.o
   --

inherit
   ANY

create {ANY}
   make

feature {ANY}
   make
      local
         i: INTEGER; c: CHARACTER
      do
         -- To send an INTEGER to the C world:
         integer_to_c(6)
         -- To send a CHARACTER to the C world:
         character_to_c('a')
         -- To send a BOOLEAN to the C world:
         boolean_to_c(True)
         -- To send a REAL (i.e. a REAL_64) to the C world:
         real_64_to_c(3.5)
         -- To send a REAL_32 to the C world:
         real_32_to_c({REAL_32 3.5})
         -- To send the internal storage of a STRING to the C world:
         string_storage_to_c(("Hi C World %N").to_external)
         -- To send `Current' address to the C world:
         any_to_c(Current)
         -- To send a STRING to the C world:
         any_to_c(create {ANY_STRING}.make_from_string("Hi"))
         -- To get an INTEGER from the C world:
         i := c_int2eiffel
         io.put_integer(i)
         -- To get an CHARACTER from the C world:
         c := c_char2eiffel
         io.put_character(c)
         -- To pass the address on an INTEGER attribute:
         set_integer_attribute($integer_attribute)
         std_output.put_integer(integer_attribute)
         std_output.put_new_line
         -- Calling the hello C function:
         if hello then
            std_output.put_string(" C man !%N")
         end
      end

feature {}
   integer_to_c (i: INTEGER)
         -- Call the C `integer_to_c' function with `i' as argument (see c_glue1.c).
      external "C"
      end

   character_to_c (c: CHARACTER)
         -- Call the C `character_to_c' function with `c' as argument (see c_glue1.c).
      external "C"
      end

   boolean_to_c (b: BOOLEAN)
         -- Call the C `boolean_to_c' function with `b' as argument (see c_glue1.c).
      external "C"
      end

   real_32_to_c (r: REAL_32)
         -- Call the C `real_32_to_c' function with `r' as argument (see c_glue1.c).
      external "C"
      end

   real_64_to_c (d: REAL_64)
         -- Call the C `real_64_to_c' function with `d' as argument (see c_glue1.c).
      external "C"
      end

   string_storage_to_c (s: POINTER)
         -- Call the C `string_storage_to_c' function with `s' as argument (see
         -- c_glue1.c).
      external "C"
      end

   any_to_c (a: ANY)
         -- Call the C `any_to_c' function with `a' as argument (see c_glue1.c).
      external "C"
      end

   c_int2eiffel: INTEGER
         -- Call the C `c_int2eiffel' function (see c_glue1.c).
      external "C"
      end

   c_char2eiffel: CHARACTER
         -- Call the C `c_char2eiffel' function (see c_glue1.c).
      external "C"
      end

   integer_attribute: INTEGER

   set_integer_attribute (integer_pointer: POINTER)
         -- Call the C `set_integer_attribute' function with the address of an
         -- INTEGER attribute (see c_glue1.c).
      external "C"
      end

   hello: BOOLEAN
      external "C"
      end

end -- class EXAMPLE1
