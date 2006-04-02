indexing
	description: "Gsl complex example"
	copyright: "(C) 2006"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_COMPLEX
	
create make
	
feature make is
		local
			c: GSL_COMPLEX_REAL_64
		do
			create c.make_polar(3.0, 1.57)
			
			print(c.out + "%N")
			c.set_real(-3)
			c.set_imag(0)
			c.set_imag(c.imag + 1.0)
			print(c.out + "%N")
			create c.make_rect(3.0, 1.7)
		end

end

			
