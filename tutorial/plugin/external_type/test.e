class TEST

creation {}
	make

feature {}
	make is
		local
			uint: UNSIGNED_INT_WRAPPER
		do
			create uint.from_integer_64(42)
			io.put_string("The (unsigned) answer is: ")
			io.put_integer(uint.as_integer_64)
		end

end
