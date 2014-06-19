class EXAMPLE
   --
   -- This example shows how to create Eiffel objects from C using a factory.
   -- It is now possible (and simpler) to directly create Eiffel objects from
   -- C, see the example called "creation".
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
         c_factory: C_FACTORY; string: STRING
      do
         create c_factory
         string := call_c_prog(c_factory)
         io.put_string(string)
         io.put_new_line
      end

   call_c_prog (c_factory: C_FACTORY): STRING
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
