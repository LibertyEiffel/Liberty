class TEST_FUNCTION_01

insert EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      do
         verify ("Hello","Hello")
      end

   verify (v1, v2: ABSTRACT_STRING) is
      do
         assert(v1.is_equal(v2))
      end
end
