class CAN_WRITE_DATA_TO_STREAM
	--
	-- Event: some data can be written to `output_stream'
	--

inherit
	EVENT_DESCRIPTOR

creation {OUTPUT_STREAM}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.when_free(output_stream)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.is_free(output_stream)
		end

feature {}
	output_stream: OUTPUT_STREAM

	make (a_output_stream: like output_stream) is
		require
			not is_expected
			a_output_stream /= Void
			a_output_stream.is_connected
			a_output_stream.has_descriptor
		do
			output_stream := a_output_stream
		ensure
			output_stream = a_output_stream
		end

end -- class CAN_WRITE_DATA_TO_STREAM
