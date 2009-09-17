class MONITORED_INPUT_STREAM
	--
	-- An input stream monitor. Monitored data goes to another output stream.
	--
	-- See also MONITOR_OUTPUT_STREAM
	--

inherit
	FILTER_INPUT_STREAM
		rename
			connect_to as reconnect_to
		end

creation {ANY}
	connect_to

feature {ANY}
	monitor: OUTPUT_STREAM

feature {}
	local_can_disconnect: BOOLEAN is True
	unread_count: INTEGER

feature {FILTER_INPUT_STREAM}
	filtered_read_character is
		do
			stream.filtered_read_character
			if unread_count > 0 then
				unread_count := unread_count - 1
			elseif stream.valid_last_character and then monitor.is_connected then
				monitor.put_character(stream.filtered_last_character)
			end
		end

	filtered_unread_character is
		do
			stream.filtered_unread_character
			unread_count := unread_count + 1
		end

	filtered_last_character: CHARACTER is
		do
			Result := stream.filtered_last_character
		end

feature {}
	connect_to (a_stream: like stream; a_monitor: like monitor) is
		require
			a_stream /= Void
			a_monitor /= Void
		do
			stream := a_stream
			monitor := a_monitor
		ensure
			stream = a_stream
			monitor = a_monitor
		end

invariant
	stream /= Void
	monitor /= Void

end -- class MONITORED_INPUT_STREAM
