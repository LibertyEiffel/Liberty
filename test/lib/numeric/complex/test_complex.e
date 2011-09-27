-- This file is part of Liberty Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COMPLEX

insert
	EIFFELTEST_TOOLS
	COMPLEX_CONSTANTS
	PLATFORM

creation {ANY} make

feature {ANY}
	make is
		local
			a,b,c,d, zero, one: COMPLEX_64
		do
			one := a.one; zero := a.zero;
			a := a.one; b.set(-1.0, 0.0)
			("i=#(1), i^1=#(2), i^2=#(3)%N" # &i # &(i^1) # &(i^2)).print_on(std_output)
			assert (i^1 = i)
			assert (i^2 = b)
			
			a.set(1.2, 1.1)
			b.set(1.2, 2.1)
			assert(a+i-i = a)
			assert(a+i = b)

			c.set(2.1, 3.3)
			d.set(3.1, 3.3)
			assert(c + zero = c)
			assert(c + one = d)

			assert(b*c = complex(-4.41,8.37))

			-- d := 1.6
			-- assert(d = d)
			-- assert(d >= 1.59)
			-- assert(d <= 1.61)
			-- d := 2
			-- assert(d = 2.0)
			-- i := 2
			-- d := i
			-- assert(d = 2)
			-- assert(d = 2.0)
			-- d := 1.51.to_string.to_real
			-- assert(d < 1.511)
			-- assert(d > 1.509)
			-- d := (-1.51).to_string.to_real
			-- assert(d > -1.52)
			-- assert(d < -1.50)
			-- assert(d.abs < 1.52)
			-- assert(d.abs > 1.50)
			-- assert((-d).abs < 1.52)
			-- assert((-d).abs > 1.50)
			-- d := 4.0
			-- d2 := 2.0
			-- assert(d.sqrt = d2)
		end

end -- class TEST_COMPLEX
