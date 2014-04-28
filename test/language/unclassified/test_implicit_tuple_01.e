class TEST_IMPLICIT_TUPLE_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      do
         printf("%%s", "test")
      end

   printf (s: STRING; arg: TUPLE) is
      local
         a: TUPLE[STRING]
      do
         assert(s.is_equal("%%s"))
         assert(a ?:= arg)
         a ::= arg
         assert(a.first.is_equal("test"))
      end

end
