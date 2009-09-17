class CAN_READ_DATA_FROM_STREAM
	--
	-- Event: some data can be read from `input_stream'
	--

inherit
	EVENT_DESCRIPTOR

creation {INPUT_STREAM}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.when_data(input_stream)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.is_data(input_stream)
		end

feature {}
	input_stream: INPUT_STREAM

	make (a_input_stream: like input_stream) is
		require
			not is_expected
			a_input_stream /= Void
			a_input_stream.is_connected
			a_input_stream.has_descriptor
		do
			input_stream := a_input_stream
		ensure
			input_stream = a_input_stream
		end

end -- class CAN_READ_DATA_FROM_STREAM
