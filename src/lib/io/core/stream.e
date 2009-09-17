deferred class STREAM
	--
	-- A stream of characters.
	--
	-- There are two kinds of streams:
	-- + input streams (see INPUT_STREAM)
	-- + output_streams (see OUTPUT_STREAM)
	--
	-- Streams can:
	-- + be connected (e.g. to some system object)
	-- + be used ot read or write characters, only if they are connected
	-- + be filtered (see FILTER)
	--

insert
	RECYCLABLE
	DISPOSABLE

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
		end

	descriptor: INTEGER is
			-- Some OS-dependent descriptor. Mainly used by the sequencer library (see READY_CONDITION).
		require
			is_connected
			has_descriptor
		do
			Result := filtered_descriptor
		end

	has_descriptor: BOOLEAN is
			-- True if that stream can be associated to some OS-meaningful descriptor.
		require
			is_connected
		do
			Result := filtered_has_descriptor
		end

	can_disconnect: BOOLEAN is
			-- True if the stream can be safely disconnected (without data loss, etc.)
		require
			is_connected
		deferred
		end

	frozen url: URL is
			-- The URL to this stream as resource
		do
			Result := url_memory
			if Result = Void then
				Result := new_url
				url_memory := Result
			end
		ensure
			not_void: Result /= Void
			always_the_same: Result = url
		end

feature {}
	url_memory: URL

	new_url: URL is
		deferred
		ensure
			Result /= Void
		end

feature {STREAM_HANDLER}
	stream_pointer: POINTER is
			-- Some Back-end-dependent pointer (FILE* in C, InputStream or OutputStream in Java)
		require
			is_connected
			has_stream_pointer
		do
			Result := filtered_stream_pointer
		end

	has_stream_pointer: BOOLEAN is
			-- True if that stream can be associated to some Back-end-meaningful stream pointer.
		require
			is_connected
		do
			Result := filtered_has_stream_pointer
		end

feature {FILTER}
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

feature {ANY}
	event_exception: EVENT_DESCRIPTOR is
		do
			Result := stream_exception
			if Result = Void then
				create stream_exception.make(Current)
				Result := stream_exception
			end
		end

feature {}
	stream_exception: STREAM_EXCEPTION

feature {RECYCLING_POOL}
	recycle is
		do
			if is_connected then
				disconnect
		      check
					-- Because the previous code is just here to catch
					-- non-clean usage of STREAMs:
					disconnect_file_after_use: False
				end
			end
		end

feature {}
	dispose is
		do
			if is_connected then
		      check
					-- Because the previous code is just here to catch
					-- non-clean usage of STREAMs:
					disconnect_file_after_use: False
				end
				disconnect
			end
		end

feature {}
	sequencer_descriptor (file: POINTER): INTEGER is
		external "plug_in"
		alias "{
         location: "${sys}/plugins"
         module_name: "sequencer"
         feature_name: "sequencer_descriptor"
         }"
		end

end -- class STREAM
