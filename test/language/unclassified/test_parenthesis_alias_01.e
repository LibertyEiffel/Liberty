class TEST_PARENTHESIS_ALIAS_01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         a: PROCEDURE[TUPLE[STRING, INTEGER]]
         f: FUNCTION[TUPLE[INTEGER], INTEGER]
      do
         a := agent paren(?,?)
         a("test", 42)
         f := agent echo(?)
         assert(f(42) = 42)
      end

   paren (s: STRING; i: INTEGER)
      do
         assert(s.is_equal("test"))
         assert(i = 42)
      end

   echo (i: INTEGER): INTEGER
      do
         Result := i
      end

end
