-- See the Copyright notice at the end of this file.
--
class NULL_INPUT_STREAM
	--
	-- This "null" stream provides an unbroken sequence of '%U'
	-- (like /dev/zero does on Unix)
	--

inherit
	TERMINAL_INPUT_STREAM
		redefine filtered_read_line_in
		end

feature {ANY}
	end_of_input: BOOLEAN is False

	is_connected: BOOLEAN is True

	can_unread_character: BOOLEAN is True

	disconnect is
		do
			filter := Void
		end

feature {FILTER_INPUT_STREAM}
	filtered_read_character is
		do
		end

	filtered_unread_character is
		do
		end

	filtered_last_character: CHARACTER is '%U'

	filtered_read_line_in (buffer: STRING) is
		do
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("NULL_INPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("NULL_INPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

end -- class NULL_INPUT_STREAM
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
