indexing
	description: "Gsl complex example"
	copyright: "(C) 2006-2008"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_COMPLEX
	
create {ANY} make
	
feature {ANY} make is
		local
			c, d, e: GSL_COMPLEX_REAL_64
		do
			c.make_polar(3.0, 1.57)
			d.make_polar(3.0, -1.57)
			-- create e.make_zero -- not required, as this is nothing but default_create
			e := c
--			e := e + d
			print("c = " + c.out + "%N")
			print("d = " + d.out + "%N")
			print("e = " + e.out + "%N")
			
			c.set_real(-3)
			c.set_imag(0)
			c.set_imag(c.imag + 1.0)
			print(c.out + "%N")
--			c.make_rect(3.0, 1.7)
			
		end

end

			
