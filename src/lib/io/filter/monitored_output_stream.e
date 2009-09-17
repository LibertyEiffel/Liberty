class MONITORED_OUTPUT_STREAM
	--
	-- An output stream monitor. Monitored data goes to another output stream.
	--
	-- See also MONITORED_INPUT_STREAM
	--

inherit
	FILTER_OUTPUT_STREAM
		rename
			connect_to as reconnect_to
		end

creation {ANY}
	connect_to

feature {ANY}
	monitor: OUTPUT_STREAM

feature {}
	local_can_disconnect: BOOLEAN is True

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			stream.filtered_put_character(c)
			if monitor.is_connected then
				monitor.put_character(c)
			end
		end

	filtered_flush is
		do
			stream.filtered_flush
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

end -- class MONITORED_OUTPUT_STREAM
