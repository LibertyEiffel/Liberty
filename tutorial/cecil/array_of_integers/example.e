class EXAMPLE
   --
   -- The Eiffel program is running first, then call the C program which is in charge to print the contents
   -- of `values' using `item' of ARRAY[INTEGER].
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
         values := {ARRAY[INTEGER] 1, << 1, 2, 3 >> }
         call_c_prog(values)
      end

feature {}
   values: ARRAY[INTEGER]

   call_c_prog (v: ARRAY[INTEGER])
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
