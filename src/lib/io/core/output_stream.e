deferred class OUTPUT_STREAM
	--
	-- An output stream is a flow of characters that can be written to some destination (be it an Eiffel object or
	-- an external object)
	--

inherit
	STREAM

insert
	OUTPUT_STREAM_TOOLS
	FILTERABLE
		redefine filter
		end

feature {ANY}
	put_character (c: CHARACTER) is
		do
			filtered_put_character(c)
		end

	flush is
			-- Flushes the pipe. If `is_filtered', calls the filter's
			-- `flush' instead.
		do
			if filter /= Void then
				filter.flush
			else
				filtered_flush
			end
		end

	can_put_character (c: CHARACTER): BOOLEAN is
		deferred
		end

	detach is
		do
			if filter /= Void then
				filter.do_detach
				filter := Void
			end
			filtered_flush
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		require
			is_connected
			can_put_character(c)
		deferred
		end

	filtered_flush is
		require
			is_connected
		deferred
		end

feature {FILTER}
	filter: FILTER_OUTPUT_STREAM

feature {ANY}
	event_can_write: EVENT_DESCRIPTOR is
		do
			Result := can_write
			if Result = Void then
				create can_write.make(Current)
				Result := can_write
			end
		end

feature {}
	can_write: CAN_WRITE_DATA_TO_STREAM

	new_url: URL is
		do
			create Result.from_stream(Current, False, True)
		end

end -- class OUTPUT_STREAM
