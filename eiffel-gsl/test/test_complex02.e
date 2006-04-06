class TEST_COMPLEX02

inherit
   EIFFELTEST_TOOLS

insert
	MATH_CONSTANTS

creation
   make
   
feature

   make is
      local
			c, d: GSL_COMPLEX_REAL_64
      do
			create c.make_rect(2, 2)
			assert(c.arg ~= (Pi / 4))

			assert(c.abs ~= 8.0.sqrt)

			create d.make_rect(-1, -2)

			assert(d.abs2 ~= 5)

			assert(d.logabs ~= 0.804718956217050)
      end

end
