class TEST_STRING_SUBCLASS

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         s2: AUX_S2
         s, s3: STRING
      do
         create s2.make_from_string("a string")
         s := "a string"
         label_assert("STRING.is_eqal(AUX_S2)", s.is_equal(s2))

         s3 := s2.substring(3, 8)
         label_assert("dynamic type", s2 ?:= s3)
      end

end
