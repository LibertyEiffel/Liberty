class TEST_AUTOMATON_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert_number("1".intern, True)
         assert_number("a".intern, False)
         assert_number("1.".intern, False)
         assert_number("1.0".intern, True)
         assert_number(".3".intern, True)
         assert_number(".".intern, False)
         assert_number("24.a3".intern, False)
         assert_number("3.1415926535897932384626".intern, True)
         assert_number("2.6.31".intern, False)
      end

   assert_number (num: FIXED_STRING; is_num: BOOLEAN)
      local
         aux: AUX_AUTOMATON_01
      do
         create aux.make(num)
         aux.run
         if is_num then
            message_assert(agent is_a_number(num), aux.is_number)
            message_assert(agent expected(num, aux) + " was expected", num.is_equal(aux.found_number))
         else
            message_assert(agent is_not_a_number(num), not aux.is_number)
         end
      end

feature {} -- assert messages
   is_a_number (num: FIXED_STRING): STRING
      do
         Result := num.out + once " is a number"
      end

   expected (num: FIXED_STRING; aux: AUX_AUTOMATON_01): STRING
      do
         Result := "Expected " + num.out + " but got " + aux.found_number.out
      end

   is_not_a_number (num: FIXED_STRING): STRING
      do
         Result := num.out + once " is not a number"
      end

end
