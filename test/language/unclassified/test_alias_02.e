class TEST_ALIAS_02

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make is
      local
         f: like sq
         g: like u
      do
         f := sq
         assert(f(2) = 4)
         assert(f(4) = 16)

         g := u
         assert(g /= Void)
         assert(g() = 42)

         assert(u /= Void)
         assert(u() = 42)

         assert(universal = 42)

         --| **** TODO: not-syntactic case
         --| assert(sq(2) = 4)
         --| assert(sq(4) = 16)
      end

   sq: FUNCTION[TUPLE[INTEGER], INTEGER] is
      do
         Result := agent square(?)
      end

   square (i: INTEGER): INTEGER is
      do
         Result := i*i
      end

   u: FUNCTION[TUPLE, INTEGER] is
      do
         Result := agent universal
      end

   universal: INTEGER is 42

end
