class FORMATTER
	-- A STRING_FORMATTER class using a buffer string as output. 
	
	-- Strings and messages can be easily appended with `append' and
	-- `put_message'.
	
	-- The formatted content can be printed on streams with `print_on' and
	-- appended to other strings with `append_on'

inherit
	STRING_FORMATTER
		redefine default_create, out, print_on
		end

creation {ANY}
	default_create

feature {ANY}
	reset is
		-- Clears the content of Current's buffer. 
		do
			buffer.clear_count
		end

	reset_with (a_string: STRING) is
		-- Overwrite the content of Current's buffer with a copy of `a_string'.
		do
			buffer.copy(a_string)
		end

	out: STRING is
		-- A newly create copy of Current content
		do
			create Result.copy(buffer)
		end

	append (a_string: STRING) is
		-- Append `a_string' to the content of Current
		do
			buffer.append(a_string)
		end

	append_on (a_string: STRING) is
		-- Append the content of Current to `a_string'
		require a_string/=Void
		do
			a_string.append(buffer)
		end
	print_on (a_stream: OUTPUT_STREAM) is
			-- Put current content on `a_stream'
		do
			a_stream.put_string(buffer)
			reset
		end

	count: INTEGER is
		-- Content length
		do
			Result:=buffer.count
		end
feature {} -- Implementation
	default_create is
		do
			create buffer.make_empty
		end

	put (c: CHARACTER) is
		do
			buffer.append_character(c)
		end

	put_item (item: ANY) is
		do
			buffer.append(item.out)
		end

	buffer: STRING

end -- class FORMATTER
