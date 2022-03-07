class TEST_ASSIGN
   --
   -- Test assign (aka setter)
   --

insert
   MATH_CONSTANTS

create {ANY}
   make

feature {ANY}
   make
      do
         create a
         create b
         a.value := 42
         b.precise := Evalue + 1.0
         print("A is " + a.tagged_out + " b is " + b.tagged_out + "...%N")
      end

   a, b: AUX_ASSIGN

end -- class TEST_ASSIGN
