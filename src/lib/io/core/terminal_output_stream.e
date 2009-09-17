deferred class TERMINAL_OUTPUT_STREAM
	--
	-- A "terminal" output stream is an output stream connected to a "real" character flow. There are many kinds
	-- of "real" data flows:
	--  + a file
	--  + a string
	--  + a virtual flow, such as a null-provider
	--  + . . .
	--

inherit
	OUTPUT_STREAM

feature {ANY}
	can_put_character (c: CHARACTER): BOOLEAN is
		do
			Result := True
		end

	can_disconnect: BOOLEAN is True

end -- class TERMINAL_OUTPUT_STREAM
