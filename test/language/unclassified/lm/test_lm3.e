class TEST_LM3

inherit
   EIFFELTEST_TOOLS
   
create {ANY}
   run

feature {ANY}
   a_thing: AUX_THING_A
   b_thing: AUX_THING_B

   run
      local
         i : INTEGER
      do
         create a_thing.make
         create b_thing.make
         from
            i := 0
         until
            i > a_thing.upper
         loop
            if a_thing.is_special(i) then
               io.put_string ("in AUX_THING_A ")
               io.put_string (i.to_string)
               io.put_string (" is special%N")
            end
            i := i + 1
         end
         label_assert("a[0] is not special", not a_thing.is_special(0))
         label_assert("a[1] is special", a_thing.is_special(1))
         from
            i := 0
         until
            i > b_thing.upper
         loop
            if b_thing.is_special(i) then
               io.put_string ("in AUX_THING_B ")
               io.put_string (i.to_string)
               io.put_string (" is special%N")
            end
            i := i + 1
         end
         label_assert("b[0] is not special", not b_thing.is_special(0))
         label_assert("b[1] is not special", not b_thing.is_special(1))
         label_assert("b[2] is not special", not b_thing.is_special(2))
         label_assert("b[3] is special", b_thing.is_special(3))
         label_assert("b[4] is special", b_thing.is_special(4))
      end

end -- class TEST_LM3
