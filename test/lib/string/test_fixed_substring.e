class TEST_FIXED_SUBSTRING

creation make

feature {ANY}
	make is
		do
			fixed := source.intern
			create substring.from_fixed_string(fixed, 8,13)
			check
				"string".is_equal(substring)
			end
			print ("Fixed is "+fixed+" extracted substring is '"+substring+"'%N")
		end

	source: STRING is "Source string...."
	fixed: FIXED_STRING
	substring: FIXED_SUBSTRING
end -- class TEST_FIXED_SUBSTRING
