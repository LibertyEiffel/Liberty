deferred class FILTER_OUTPUT_STREAM
	--
	-- A filtered output stream.
	--

inherit
	OUTPUT_STREAM
insert
	FILTER
		redefine stream
		end

feature {ANY}
	can_put_character (c: CHARACTER): BOOLEAN is
		do
			Result := is_connected and then stream.can_put_character(c)
		end

	disconnect is
		do
			stream.filtered_flush
			stream.disconnect
			stream := Void
		end

feature {STREAM}
	do_detach is
		do
			if filter /= Void then
				filter.do_detach
				filter := Void
			end
			stream.filtered_flush
			stream := Void
		end

feature {}
	stream: OUTPUT_STREAM

end -- class FILTER_OUTPUT_STREAM
