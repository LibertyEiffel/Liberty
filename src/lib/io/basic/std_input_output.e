class STD_INPUT_OUTPUT
	--
	-- To implement the good old `io' feature.
	--

inherit
	TERMINAL_INPUT_OUTPUT_STREAM
		redefine dispose
		end

creation {ANY}
	make

feature {}
	make is
		do
		end

feature {ANY}
	is_connected: BOOLEAN is
		do
			-- Yes, it is an "and" and not an "or": it must be strong enough,
			-- otherwise the system won't work
			Result := std_input /= Void and then std_input.is_connected
				and then (std_output /= Void and then std_output.is_connected)
		end

	disconnect is
		do
			std_input.disconnect
			std_output.disconnect
		end

feature {ANY}
	end_of_input: BOOLEAN is
		do
			Result := std_input.end_of_input
		end

	can_unread_character: BOOLEAN is
		do
			Result := std_input.can_unread_character
		end

feature {FILTER_INPUT_STREAM} -- input features:
	filtered_read_character is
		do
			std_input.read_character
		end

	filtered_unread_character is
		do
			std_input.unread_character
		end

	filtered_last_character: CHARACTER is
		do
			Result := std_input.last_character
		end

feature {FILTER_OUTPUT_STREAM} -- output features:
	filtered_put_character (c: CHARACTER) is
		do
			std_output.put_character(c)
		end

	filtered_flush is
		do
			std_output.flush
		end

feature {FILTER} -- meaningless features:
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("STD_INPUT_OUTPUT.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("STD_INPUT_OUTPUT.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {}
	dispose is
		do
			check
				io = Current
			end
			-- Nothing to dispode for `io'.
		end
	
invariant
	not_filtered: not input_is_filtered and not output_is_filtered

end -- class STD_INPUT_OUTPUT
