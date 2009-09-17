class NULL_INPUT_STREAM
	--
	-- This "null" stream provides an unbroken sequence of '%U'
	-- (like /dev/zero does on Unix)
	--

inherit
	TERMINAL_INPUT_STREAM
		redefine filtered_read_line_in
		end

feature {ANY}
	end_of_input: BOOLEAN is False

	is_connected: BOOLEAN is True

	can_unread_character: BOOLEAN is True

	disconnect is
		do
			filter := Void
		end

feature {FILTER_INPUT_STREAM}
	filtered_read_character is
		do
		end

	filtered_unread_character is
		do
		end

	filtered_last_character: CHARACTER is '%U'

	filtered_read_line_in (buffer: STRING) is
		do
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("NULL_INPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("NULL_INPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

end -- class NULL_INPUT_STREAM
