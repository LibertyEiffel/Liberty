deferred class FILTERABLE
	--
	-- The ability to be filtered (typically a stream of characters).
	--

insert
	ANY

feature {ANY}
	is_connected: BOOLEAN is
			-- True if the stream is connected. Only in that case can data be transfered via this stream.
		deferred
		end

	disconnect is
			-- Try to disconnect the stream. Note that it *does not* ensure that the stream will effectively be
			-- disconnected (some terminal streams, for instance, are always connected) but the feature can be
			-- used to "shake off" filters.
		require
			is_connected
			can_disconnect
		deferred
		ensure
			not is_filtered
		end

	is_filtered: BOOLEAN is
			-- True if some filter is using this stream as backend. use that filter instead.
		do
			Result := filter /= Void
		end

	detach is
			-- Shake off the filter.
		deferred
		ensure
			not is_filtered
		end

	can_disconnect: BOOLEAN is
			-- True if the stream can be safely disconnected (without data loss, etc.)
		require
			is_connected
		deferred
		end

feature {FILTER}
	set_filter (a_filter: like filter) is
			-- Used by the filter itself to get attached
		require
			a_filter /= Void
		do
			filter := a_filter
		ensure
			filter = a_filter
		end

	filter: FILTER
			-- The filter that uses this stream as backend

	filtered_descriptor: INTEGER is
			-- Find the descriptor of the terminal stream... Filters do not have descriptors of their own
		require
			is_connected
			filtered_has_descriptor
		deferred
		end

	filtered_has_descriptor: BOOLEAN is
			-- True if the underlying terminal stream has a descriptor
		require
			is_connected
		deferred
		end

	filtered_stream_pointer: POINTER is
			-- Find the pointer of the terminal stream... Filters do not have pointers of their own
		require
			is_connected
			filtered_has_stream_pointer
		deferred
		end

	filtered_has_stream_pointer: BOOLEAN is
			-- True if the underlying terminal stream has a pointer
		require
			is_connected
		deferred
		end

end -- class FILTERABLE
