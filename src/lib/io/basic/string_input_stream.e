class STRING_INPUT_STREAM
	--
	-- An input stream where the data is read from a string.
	--

inherit
	TERMINAL_INPUT_STREAM
		redefine valid_last_character, dispose
		end

creation {ANY}
	from_string

feature {ANY}
	end_of_input: BOOLEAN is
		do
			Result := offset > string.upper
		end

	is_connected: BOOLEAN

	can_unread_character: BOOLEAN is
		do
			Result := offset >= string.lower
		end

	disconnect is
		do
			filter := Void
			is_connected := False
		end

	valid_last_character: BOOLEAN is
		do
			Result := string.valid_index(offset)
		end

feature {FILTER_INPUT_STREAM}
	filtered_read_character is
		do
			offset := offset + 1
		end

	filtered_unread_character is
		do
			offset := offset - 1
		end

	filtered_last_character: CHARACTER is
		do
			Result := string.item(offset)
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("STRING_INPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("STRING_INPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {}
	dispose is
		do
			-- No need to force people to disconnect such a STREAM.
		end
	
	from_string (a_string: like string) is
		require
			a_string /= Void
		do
			string := a_string.twin
			offset := string.lower - 1
			is_connected := True
		end

	string: STRING
			-- where the data comes from

	offset: INTEGER

end -- class STRING_INPUT_STREAM
