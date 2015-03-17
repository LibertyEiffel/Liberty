class TEST_IMPLICIT_TUPLE_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         printf(1, "%%s", "test")
         printf(2, "empty")
      end

   printf (id: INTEGER; s: STRING; arg: TUPLE)
      local
         a: TUPLE[STRING]
      do
         inspect
            id
         when 1 then
            assert(arg.count = 1)
            assert(s.is_equal("%%s"))
            assert(a ?:= arg)
            a ::= arg
            assert(a.first.is_equal("test"))
            assert(arg.out.is_equal("[test]"))
         when 2 then
            assert(arg.count = 0)
            assert(s.is_equal("empty"))
            assert(arg.out.is_equal("[]"))
         end
      end

end
