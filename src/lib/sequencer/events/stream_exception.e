class STREAM_EXCEPTION
	--
	-- Event: some exception occur on the stream
	--

inherit
	EVENT_DESCRIPTOR

creation {STREAM}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.when_exception(stream)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.is_exception(stream)
		end

feature {}
	stream: STREAM

	make (a_stream: like stream) is
		require
			not is_expected
			a_stream /= Void
			a_stream.is_connected
			a_stream.has_descriptor
		do
			stream := a_stream
		ensure
			stream = a_stream
		end

end -- class STREAM_EXCEPTION
