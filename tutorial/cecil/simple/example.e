class EXAMPLE
   --
   -- The Eiffel program is running first, then calls the C program which is in charge of calling the
   -- Eiffel feature `show_values' of this EXAMPLE class.
   --
   -- To compile this example, use command:
   --
   --  se c -cecil cecil.se example c_prog.c
   --
   -- Is is also possible to C precompile the c_prog.c file doing:
   --
   --  gcc -c c_prog.c
   --  se c -cecil cecil.se example c_prog.o
   --

create {ANY}
   make

feature {ANY}
   make
      do
         values := {ARRAY[INTEGER] 1, << 1, 2, 3 >> }
         call_c_prog(Current)
      end

   show_values
      local
         i: INTEGER
      do
         from
            i := values.lower
         until
            i > values.upper
         loop
            io.put_integer(values.item(i))
            io.put_new_line
            i := i + 1
         end
      end

feature {}
   values: ARRAY[INTEGER]

   call_c_prog (current_object: like Current)
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
