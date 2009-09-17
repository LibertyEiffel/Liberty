deferred class TERMINAL_INPUT_OUTPUT_STREAM
	--
	-- A stream that is at the same time an input stream and an output stream.
	--

inherit
	TERMINAL_INPUT_STREAM
		rename filter as input_filter,
			set_filter as set_input_filter,
			is_filtered as input_is_filtered,
			detach as detach_input
		redefine can_disconnect, new_url
		end
	TERMINAL_OUTPUT_STREAM
		rename filter as output_filter,
			set_filter as set_output_filter,
			is_filtered as output_is_filtered,
			detach as detach_output
		redefine can_disconnect, new_url
		end
	FILTERABLE
		redefine
			is_filtered, set_filter
		end

feature {ANY}
	can_disconnect: BOOLEAN is True

	detach is
			-- Detach the input and the ouput
			--
			-- See also `detach_input', `detach_output'.
		do
			detach_output
			detach_input
		end

	is_filtered: BOOLEAN is
			-- Is one of the input or output streams filtered?
			--
			-- See also `is_input_filtered', `is_output_filtered'
		do
			Result := input_is_filtered or else output_is_filtered
		end

	set_filter (a_filter: like filter) is
			-- Don't use (use `set_input_filter' or `set_output_filter')
		do
			check
				False
			end
		end

feature {}
	new_url: URL is
		do
			create Result.from_stream(Current, True, True)
		end

invariant
	filter = Void

end -- class TERMINAL_INPUT_OUTPUT_STREAM
