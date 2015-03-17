class EXAMPLE6
   --
   -- How to use C struct from Eiffel.
   --
   -- To compile this file:
   --
   --       compile example6 c_glue6.c
   --

create {ANY}
   make

feature {ANY}
   point_pointer: POINTER

   make
      local
         r: REAL; size: INTEGER
      do
         -- Calling the C `malloc_point' function from Eiffel:
         point_pointer := malloc_point
         check
            point_pointer.is_not_null
         end
         -- Setting fields of the Point* struct:
         set_x(point_pointer, 1.0)
         -- Getting the x field with the `get_x' function:
         r := get_x(point_pointer)
         io.put_string(r.to_string + "%N")
         -- Getting the C sizeof using an inline:
         size := sizeof_point
         io.put_string("sizeof(Point) = " + size.to_string + "%N")
      end

feature {}
   malloc_point: POINTER
         -- Call the C `malloc_point' function (see c_glue4.c).
      external "[
                 C use "c_glue6.h"
               ]"
      ensure
         Result.is_not_null
      end

   set_x (point_star: POINTER; x_value: REAL)
      require
         point_star.is_not_null
      external "[
                 C struct Point access x type float use "c_glue6.h"
               ]"
      end

   get_x (point_star: POINTER): REAL
      external "[
                 C struct Point access x use "c_glue6.h"
               ]"
      end

   sizeof_point: INTEGER
      external "[
                 C
                   inline
                   use "c_glue6.h"
               ]"
      alias "sizeof(Point)"
      ensure
         Result >= 0
      end

end -- class EXAMPLE6
