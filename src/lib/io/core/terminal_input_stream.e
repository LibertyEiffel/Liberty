deferred class TERMINAL_INPUT_STREAM
	--
	-- A "terminal" input stream is an input stream connected to a "real" character flow. There are many kinds of
	-- "real" data flows:
	--  + a file
	--  + a string
	--  + a virtual flow, such as a null-provider
	--  + . . .
	--

inherit
	INPUT_STREAM

feature {ANY}
	can_read_character, can_read_line, can_disconnect: BOOLEAN is True

	valid_last_character: BOOLEAN is
		do
			Result := can_unread_character
		end

end -- class TERMINAL_INPUT_STREAM
