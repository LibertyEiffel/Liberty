class TEST_STRING_REPLACING

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         buffer: STRING
      do
         assert("foo    bar    ".is_equal("foo%Tbar%T".replacing("%T", "    ")))
         buffer := ""
         ".a.b.c.d.".replacing_in(".", "", buffer)
         assert("abcd".is_equal(buffer))
      end

end
