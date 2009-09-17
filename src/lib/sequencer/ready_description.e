class READY_DESCRIPTION
obsolete "Please use EVENTS_SET instead"

inherit
	EVENTS_SET
		export
			{ANY} after, at, when_data, is_data, when_free, is_free, when_connection, is_connection
		end

creation {ANY}
	make

feature {ANY}
	after_from_now (timeout_ms: INTEGER) is
			-- `timeout_ms' is the max time in milliseconds to wait from now.
		require
			timeout_ms >= 0
			not queryable
		local
			t: TIME_EVENTS
		do
			expect(t.in_time(timeout_ms))
		end

	when_binary_data (file: BINARY_FILE_READ) is
		require
			file /= Void
			file.is_connected
			not queryable
		do
			when_data(file)
		end

	is_binary_data (file: BINARY_FILE_READ): BOOLEAN is
		require
			file /= Void
			file.is_connected
			queryable
		do
			Result := is_data(file)
		end

end -- class READY_DESCRIPTION
