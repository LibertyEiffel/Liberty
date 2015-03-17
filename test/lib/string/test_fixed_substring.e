class TEST_FIXED_SUBSTRING

insert
   EIFFELTEST_TOOLS
   STRING_HANDLER

create {}
   make

feature {ANY}
   make
      do
         fixed := source.intern
         substring := fixed.substring(8, 13)
         assert("string".is_equal(substring))
         subsubstring := substring.substring(1, 3)
         assert("str".is_equal(subsubstring))
         subsubstring.unshare
         assert("string".is_equal(substring))
         assert("str".is_equal(subsubstring))
      end

   source: STRING "Source string...."
   fixed: FIXED_STRING
   substring: FIXED_STRING
   subsubstring: FIXED_STRING

end -- class TEST_FIXED_SUBSTRING
