indexing
	description: "example to show how to use gsl_vector classes"
	copyright: "(C) 2006 Raphael Mack <rmack@student.ethz.ch>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

class TEST_VECTOR
create {ANY}  make
feature {ANY} make is
		local
			i: INTEGER
		do
			create vector_64.make (10)
			create vector_32.make (10)
			from i := 0 until i >= 10 loop
				vector_64.put (0.123456789 * i, i)
				vector_32.put ((0.123456789 * i).force_to_real_32, i)
				i := i + 1
			end

			print ("v64 = " + vector_64.out + "%N")
			print ("v32 = " + vector_32.out + "%N")
			print ("minmax = [" + vector_32.minmax.item_1.out + ", " + vector_32.minmax.item_2.out + "]%N")
			print ("minmax_index = [" + vector_32.minmax_index.item_1.out + ", " + vector_32.minmax_index.item_2.out + "]%N")
		end

	vector_64: GSL_VECTOR_REAL_64
	vector_32: GSL_VECTOR_REAL_32

end

			
