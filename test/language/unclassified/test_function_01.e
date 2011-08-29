class TEST_FUNCTION_01

insert EIFFELTEST_TOOLS

creation make

feature 
	make is
		local x: ARRAY[INTEGER_32]; y: ARRAY[INTEGER_8]
		do
			verify ("Hello","Hello")
		end

	verify (v1, v2: ANY) is
		do
			assert(v1.is_equal(v2))
		end
end


