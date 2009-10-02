class STRING_OUTPUT_STREAM
	--
	-- An output stream where data is written to a string buffer.
	--

inherit
	TERMINAL_OUTPUT_STREAM

creation {ANY}
	make, connect_to

feature {ANY}
	to_string: STRING is
			-- A copy of the internal buffer. If you don't want memory consumption, see `append_in'.
		do
			Result := string.twin
		end

	append_in (a_string: STRING) is
			-- Append the contents of the internal buffer to the given string.
		require
			a_string /= Void
		do
			a_string.append(string)
		end

	is_connected: BOOLEAN

	disconnect is
		do
			filter := Void
			is_connected := False
		end

	clear is
			-- Remove all stored characters
		do
			string.clear_count
		ensure
			string.is_empty
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			string.extend(c)
		end

	filtered_flush is
		do
			-- nothing to do
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("STRING_OUTPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("STRING_OUTPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {}
	make is
		do
			string := ""
			is_connected := True
		end

	connect_to (a_string: like string) is
		require
			not a_string.immutable
		do
			string := a_string
			is_connected := True
		ensure
			string = a_string
		end

	string: STRING
			-- where the characters go to

invariant
	not string.immutable

end -- class STRING_OUTPUT_STREAM
