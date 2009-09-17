class NULL_OUTPUT_STREAM
	--
	-- This "null" output just swallows any character
	-- (like /dev/null does on Unix)
	--

inherit
	TERMINAL_OUTPUT_STREAM

feature {ANY}
	is_connected: BOOLEAN is True

	disconnect is
		do
			filter := Void
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
		end

	filtered_flush is
		do
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("NULL_OUTPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("NULL_INPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

end -- class NULL_OUTPUT_STREAM
