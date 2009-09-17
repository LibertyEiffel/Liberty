deferred class FILTER
	--
	-- A filter is something connected to a stream. It allows to add behavior (e.g. compression, encryption
	-- and any other codings).
	--
	-- There are two kinds of filters:
	-- * ''input'' filters (see FILTER_INPUT_STREAM)
	-- * ''output'' filters (see FILTER_OUTPUT_STREAM)
	--

feature {ANY}
	connect_to (a_stream: like stream) is
			-- Connect the filter to some underlying stream.
		require
			not is_connected
			a_stream.is_connected
			not a_stream.is_filtered
		do
			a_stream.set_filter(Current)
			stream := a_stream
		ensure
			is_connected
		end

	is_connected: BOOLEAN is
			-- True if the filter is connected to some underlying stream.
		do
			Result := stream /= Void and then stream.is_connected
		end

	disconnect is
			-- Disconnect from the underlying stream.
		require
			is_connected
			can_disconnect
		deferred
		ensure
			not is_connected
			stream = Void
		end

	can_disconnect: BOOLEAN is
		do
			Result := local_can_disconnect and then stream.can_disconnect
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			Result := stream.filtered_descriptor
		end

	filtered_has_descriptor: BOOLEAN is
		do
			Result := stream.filtered_has_descriptor
		end

	filtered_stream_pointer: POINTER is
		do
			Result := stream.filtered_stream_pointer
		end

	filtered_has_stream_pointer: BOOLEAN is
		do
			Result := stream.filtered_has_stream_pointer
		end

feature {}
	local_can_disconnect: BOOLEAN is
			-- True if this stream can be safely disconnected (without data loss, etc.) without taking into
			-- account the state of the underlying stream.
		deferred
		end

	stream: FILTERABLE
			-- The underlying stream (i.e. the filtered one)

feature {STREAM}
	do_detach is
			-- Used by the underlying stream to require not to be filtered anymore
		deferred
		ensure
			stream = Void
		end

invariant
	stream /= Void implies stream.filter = Current

end -- class FILTER
