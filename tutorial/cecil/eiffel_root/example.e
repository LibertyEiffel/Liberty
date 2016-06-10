class EXAMPLE
   --
   -- The Eiffel program is running first, then calls the C program which is in charge of calling the
   -- Eiffel feature `show_values'.
   -- Note that the Eiffel root object is not passed to the C world. Thus, the C code uses
   -- predefined `eiffel_root_object' to access the very first created Eiffel object.
   --
   -- To compile this example, use command:
   --
   --  se c -cecil cecil.se example c_prog.c
   --

create {ANY}
   make

feature {ANY}
   make
      do
         do_it
         call_c_prog
      end

   do_it
      do
         io.put_string("Hi from Eiffel world.%N")
      end

feature {}
   call_c_prog
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
