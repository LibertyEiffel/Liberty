class TEST_FEATURE_THEN_02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert("foo".is_equal(foo))
         assert(foo = foo)
      end

   foo: STRING once then "foo" end

end
