class BAD_FEATURE_THEN_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert(foo = 42)
      end

   foo: INTEGER then "foo" end

end
