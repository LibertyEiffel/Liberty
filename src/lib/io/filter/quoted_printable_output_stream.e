-- See the Copyright notice at the end of this file.
--
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
--
-- ------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- This file is part of the SmartEiffel standard library.
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated
-- documentation files (the "Software"), to deal in the Software without restriction, including without
-- limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
-- the Software, and to permit persons to whom the Software is furnished to do so, subject to the following
-- conditions:
--
-- The above copyright notice and this permission notice shall be included in all copies or substantial
-- portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
-- LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO
-- EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
-- AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE
-- OR OTHER DEALINGS IN THE SOFTWARE.
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------
