class EXAMPLE
   --
   -- This example shows how to create Eiffel objects from C.
   --
   -- To compile this example, use command:
   --
   --  se c -cecil cecil.se example c_prog.c
   --

create {ANY}
   make

feature {ANY}
   make
      local
         string: STRING
      do
         string := call_c_prog
         io.put_string(string)
         io.put_new_line
      end

   call_c_prog: STRING
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
