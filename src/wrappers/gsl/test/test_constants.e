class TEST_CONSTANTS

inherit
	EIFFELTEST_TOOLS

insert
	GSL_CONSTANTS
	
create {ANY} 
	make
	
feature {ANY}

	make is
		do
			assert((const_e - 2.718281828).abs < 0.00000001)
			assert((const_pi - 3.141592654).abs < 0.00000001)
			assert((const_log2e - (const_e.log / 2.log)).abs < 0.00000001)
			assert((const_sqrt2 - (2.0).sqrt).abs < 0.00000001)
			assert((const_sqrt1_2 - (0.5).sqrt).abs < 0.00000001)
			assert((const_sqrt3 - (3).sqrt).abs < 0.00000001)
			assert((const_pi_4 - const_pi / 4.0).abs < 0.00000001)
			assert((const_1_pi - 1.0 / const_pi).abs < 0.00000001)
			assert((const_lnpi - const_pi.log).abs < 0.00000001)
			
		end

end -- TEST_CONSTANTS
