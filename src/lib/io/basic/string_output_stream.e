-- See the Copyright notice at the end of this file.
--
class STRING_OUTPUT_STREAM
	--
	-- An output stream where data is written to a string buffer.
	--

inherit
	TERMINAL_OUTPUT_STREAM

creation {ANY}
	make, connect_to

feature {ANY}
	to_string: STRING is
			-- A copy of the internal buffer. If you don't want memory consumption, see `append_in'.
		do
			Result := string.twin
		end

	append_in (a_string: STRING) is
			-- Append the contents of the internal buffer to the given string.
		require
			a_string /= Void
		do
			a_string.append(string)
		end

	is_connected: BOOLEAN

	disconnect is
		do
			filter := Void
			is_connected := False
		end

	clear is
			-- Remove all stored characters
		do
			string.clear_count
		ensure
			string.is_empty
		end

feature {FILTER_OUTPUT_STREAM}
	filtered_put_character (c: CHARACTER) is
		do
			string.extend(c)
		end

	filtered_flush is
		do
			-- nothing to do
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("STRING_OUTPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("STRING_OUTPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {}
	make is
		do
			string := ""
			is_connected := True
		end

	connect_to (a_string: like string) is
		require
			a_string /= Void
		do
			string := a_string
			is_connected := True
		ensure
			string = a_string
		end

	string: STRING
			-- where the characters go to

invariant
	string /= Void

end -- class STRING_OUTPUT_STREAM
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
