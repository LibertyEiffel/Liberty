class BASE64_OUTPUT_STREAM
	--
	-- A base64 encoder. The underlying stream gets encoded in base64 via this filter.
	--

inherit
	FILTER_OUTPUT_STREAM
		redefine disconnect
		end

creation {ANY}
	connect_to

feature {ANY}
	disconnect is
		local
			k: INTEGER
		do
			-- Before closing the stream, add the padding characters:
			inspect
				state
			when 0 then
				-- nothing to add
			when 1 then
				k := previous_character.code & 3 |<< 4
				stream.filtered_put_character(t2b(k))
				stream.filtered_put_character('=')
				stream.filtered_put_character('=')
			when 2 then
				k := previous_character.code & 15 |<< 2
				stream.filtered_put_character(t2b(k))
				stream.filtered_put_character('=')
			end
			-- To be able to use the object again (via another `connect_to'):
			state := 0 -- Now close the stream:
			Precursor
		end

feature {}
	local_can_disconnect: BOOLEAN is True

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		local
			k: INTEGER
		do
			inspect
				state
			when 0 then
				k := c.code |>> 2
				stream.filtered_put_character(t2b(k))
				state := 1
			when 1 then
				k := previous_character.code & 3 |<< 4 | (c.code |>> 4)
				stream.filtered_put_character(t2b(k))
				state := 2
			when 2 then
				k := previous_character.code & 15 |<< 2 | (c.code |>> 6)
				stream.filtered_put_character(t2b(k))
				k := c.code & 63
				stream.filtered_put_character(t2b(k))
				state := 0
			end
			previous_character := c
		end

	filtered_flush is
		do
			stream.filtered_flush
		end

feature {}
	state: INTEGER

	previous_character: CHARACTER

feature {}
	alphabet: STRING is "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

	t2b (code: INTEGER): CHARACTER is
		require
			code >= 0 and then code < 64
		do
			Result := alphabet.item(code + 1)
		ensure
			alphabet.has(Result)
		end

end -- class BASE64_OUTPUT_STREAM
