indexing
	description: "Gsl matrix example:  shows how to allocate, initialize and read from a matrix using the functions gsl_matrix_alloc, gsl_matrix_set and gsl_matrix_get."
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_MATRIX
create {ANY}  make
feature {ANY}
	make is
		local
			i,j: INTEGER
			h: GSL_ERROR_HANDLER
		do
			h.set_off
			create matrix.make (10, 3)
			create matrix32.make (10, 3)
			from i := 0 until i>=10 loop
				from j:=0 until j>=3 loop
					matrix.put (0.23 + 10 * i + j, i, j)
					matrix32.put ((0.23 + 10 * i + j).force_to_real_32, i, j)
					j := j+1
				end
				i:=i+1
			end

			print ("Bar%N")
			from i:=0 until i>=10 loop
				from j:=0 until j>=3 loop
					-- Shame on Paolo for such an inefficient print. TODO:
					-- provide something as easy but performing
					print ("m("+i.out+","+j.out+") = "+matrix.item(i,j).out +"%N")
					print ("m("+i.out+","+j.out+") = "+matrix32.item(i,j).out +"%N")
					j := j+1
				end
				i:=i+1
			end

			create matrix.from_collection2 ( {ARRAY2[REAL] 0,3, 0,3,
														<< 1.0, 2.0, 3.0, 4.0;
															2.0, 3.0, 4.0, 5.0;
															0.0, 0.0, 9.0, 8.0;
															4.0, 4.0, 3.0, 3.0>>})
		io.put_string("m = " + matrix.out + "%N")
		io.put_string("min = " + matrix.min.out + "%N")
		
	end

	matrix: GSL_MATRIX_REAL_64
	matrix32: GSL_MATRIX_REAL_32
	
end

			
