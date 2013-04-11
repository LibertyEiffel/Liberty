class TEST_COMPLEX03

inherit
	EIFFELTEST_TOOLS

create {ANY} 
	make
	
feature {ANY}

	make is
		local
			a, b, c, d: GSL_COMPLEX_REAL_64
		do
			b.make_rect(0.5,2.0)
			d.make_rect(2.0,3.5)
			c := d - b
			assert(c.real = 1.5)
			assert(c.imag = 1.5)
			a.make_rect(1.5, 1.5)
			assert(c.is_equal(a))
		end

end -- TEST_COMPLEX00
