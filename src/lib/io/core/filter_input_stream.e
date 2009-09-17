deferred class FILTER_INPUT_STREAM
	--
	-- A filtered input stream.
	--

inherit
	INPUT_STREAM
insert
	FILTER
		redefine stream
		end

feature {ANY}
	end_of_input: BOOLEAN is
		do
			Result := not is_connected or else stream.end_of_input
		end

	can_read_character: BOOLEAN is
		do
			Result := is_connected and then stream.can_read_character
		end

	valid_last_character: BOOLEAN is
		do
			Result := is_connected and then stream.valid_last_character
		end

	can_read_line: BOOLEAN is
		do
			Result := is_connected and then stream.can_read_line
		end

	can_unread_character: BOOLEAN is
		do
			Result := is_connected and then stream.can_unread_character
		end

	disconnect is
		do
			stream.disconnect
			stream := Void
		end

feature {STREAM}
	do_detach is
		do
			if filter /= Void then
				filter.do_detach
				filter := Void
			end
			stream := Void
		end

feature {}
	stream: INPUT_STREAM

end -- class FILTER_INPUT_STREAM
