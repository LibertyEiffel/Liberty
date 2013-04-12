indexing
	description: "Gsl matrix example: shows how gsl errors are handled"
	copyright: "(C) 2006 Raphael Mack <mail@raphael-mack.de>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_ERROR
create {ANY}  make

feature {ANY}
	make is
		local
			a, b: GSL_MATRIX_REAL_64
			h: GSL_ERROR_HANDLER
		do
			h.set_off -- unset default gsl_error_handler
			h.reset_ieee_exceptions
			create a.from_collection2 ( {ARRAY2[REAL_64] 0,3, 0,3,
															<< 1.0, 2.0, 3.0, 4.0;
																2.0, 3.0, 4.0, 9.0e307;
																0.0, 0.0, 9.0, 8.0;
																4.0, 4.0, 3.0, 3.0>>})
			io.put_string(a.out + "%N")
			create b.copy(a)
--         b.set_raise_on_error
			b.add(a)

			io.put_string(a.out + "%N")
			io.put_string(b.out + "%N")

			if b.has_error then
				io.put_string("B has: " + b.err_explanation + "%N")
			end

			if h.has_ieee_exception then
				io.put_string("IEEE Exceptions: " + h.ieee_explanation + " occured.%N")
			end

		end

end

			
