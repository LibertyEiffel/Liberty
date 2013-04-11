class TEST_MATH_FUN

inherit
	EIFFELTEST_TOOLS

insert
	GSL_MATH_FUNCTIONS
	
create {ANY} 
	make
	
feature {ANY}

	make is
		local
			t: TUPLE[REAL_64, INTEGER_32]
		do
			assert((gsl_log1p(1) - 0.69314718).abs < 0.00000001)
			assert((gsl_asinh(5) - 2.312438341).abs < 0.00000001)

			t := gsl_frexp(40)
			assert((t.item_1 - 0.625).abs < 0.00000001)
			assert(t.item_2 = 6)
			assert(gsl_pow_4(5) = 625)
			assert(gsl_pow_4(5) = gsl_pow_int(5, 4))

			assert(gsl_fcmp(1.0, 2.0, 0.01) = -1)
			assert(gsl_fcmp(2.0, 1.0, 0.01) = 1)
			assert(gsl_fcmp(2.0, 2.0, 0.01) = 0)
			assert(gsl_fcmp(2.0, 2.1, 10) = 0)
			
		end

end -- TEST_MATH_FUN
