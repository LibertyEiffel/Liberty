class SIMPLE_INPUT_OUTPUT_STREAM
	--
	-- Just a centralized access to and input stream and an output stream.
	--
	-- Note that it cannot be filtered itself (see invariant).
	--

inherit
	TERMINAL_INPUT_OUTPUT_STREAM

creation {ANY}
	make

feature {}
	make (a_in: like in_stream; a_out: like out_stream) is
		do
			in_stream := a_in
			out_stream := a_out
		end

	in_stream: INPUT_STREAM

	out_stream: OUTPUT_STREAM

feature {ANY}
	is_connected: BOOLEAN is
		do
			-- Yes, it is an "and" and not an "or": it must be strong enough,
			-- otherwise the system won't work
			Result := in_stream /= Void and then in_stream.is_connected
				and then (out_stream /= Void and then out_stream.is_connected)
		end

	disconnect is
		do
			in_stream.disconnect
			out_stream.disconnect
		end

feature {ANY}
	end_of_input: BOOLEAN is
		do
			Result := in_stream.end_of_input
		end

	can_unread_character: BOOLEAN is
		do
			Result := in_stream.can_unread_character
		end

feature {FILTER_INPUT_STREAM} -- input features:
	filtered_read_character is
		do
			in_stream.read_character
		end

	filtered_unread_character is
		do
			in_stream.unread_character
		end

	filtered_last_character: CHARACTER is
		do
			Result := in_stream.last_character
		end

feature {FILTER_OUTPUT_STREAM} -- output features:
	filtered_put_character (c: CHARACTER) is
		do
			out_stream.put_character(c)
		end

	filtered_flush is
		do
			out_stream.flush
		end

feature {FILTER} -- meaningless features:
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("INPUT_OUTPUT_STREAM_CONNECTOR.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("INPUT_OUTPUT_STREAM_CONNECTOR.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

invariant
	not_filtered: not input_is_filtered and not output_is_filtered

end -- class SIMPLE_INPUT_OUTPUT_STREAM
