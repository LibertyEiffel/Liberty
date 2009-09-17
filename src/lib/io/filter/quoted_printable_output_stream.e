class QUOTED_PRINTABLE_OUTPUT_STREAM
	--
	-- A quoted-printable encoder. The underlying stream gets encoded in quoted-printable via this filter.
	--

inherit
	FILTER_OUTPUT_STREAM

creation {ANY}
	connect_to

feature {}
	local_can_disconnect: BOOLEAN is True

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			inspect
				c.code
			when 0 .. 9, 11 .. 31, 128 .. 255 then
				put_quoted_character(c)
			else
				stream.filtered_put_character(c)
			end
		end

	filtered_flush is
		do
			stream.filtered_flush
		end

feature {}
	put_quoted_character (c: CHARACTER) is
		local
			s: STRING
		do
			s := once ""
			s.clear_count
			c.code.to_hexadecimal_in(s)
			stream.filtered_put_character('=')
			stream.filtered_put_character(s.item(s.upper - 1))
			stream.filtered_put_character(s.last)
		end

end -- class QUOTED_PRINTABLE_OUTPUT_STREAM
