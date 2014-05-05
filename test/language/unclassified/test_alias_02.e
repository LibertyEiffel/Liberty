class TEST_ALIAS_02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         f: FUNCTION[TUPLE[INTEGER], INTEGER]
      do
         f := agent square(?)
         assert(f(2) = 4)
         assert(f(4) = 16)
      end

   square (i: INTEGER): INTEGER is
      do
         Result := i*i
      end

end
