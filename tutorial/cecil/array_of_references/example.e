class EXAMPLE
   --
   -- The Eiffel program is running first, then call the C program which is in charge to print the
   -- contents of `animals' using `lower'/`upper'/`item' of ARRAY[ANIMAL].
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
         cat: CAT; dog: DOG
      do
         create cat
         create dog
         animals := {ARRAY[ANIMAL] 1, << cat, dog, cat >> }
         call_c_prog(animals)
      end

feature {}
   animals: ARRAY[ANIMAL]

   call_c_prog (a: like animals)
      external "C"
      alias "c_prog"
      end

end -- class EXAMPLE
