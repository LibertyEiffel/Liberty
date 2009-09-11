-- See the Copyright notice at the end of this file.
--
class STRING_INPUT_STREAM
	--
	-- An input stream where the data is read from a string.
	--

inherit
	TERMINAL_INPUT_STREAM
		redefine valid_last_character, dispose
		end

creation {ANY}
	from_string

feature {ANY}
	end_of_input: BOOLEAN is
		do
			Result := offset > string.upper
		end

	is_connected: BOOLEAN

	can_unread_character: BOOLEAN is
		do
			Result := offset >= string.lower
		end

	disconnect is
		do
			filter := Void
			is_connected := False
		end

	valid_last_character: BOOLEAN is
		do
			Result := string.valid_index(offset)
		end

feature {FILTER_INPUT_STREAM}
	filtered_read_character is
		do
			offset := offset + 1
		end

	filtered_unread_character is
		do
			offset := offset - 1
		end

	filtered_last_character: CHARACTER is
		do
			Result := string.item(offset)
		end

feature {FILTER}
	filtered_descriptor: INTEGER is
		do
			std_error.put_string("STRING_INPUT_STREAM.filtered_descriptor has been called!%N")
			crash
		end

	filtered_has_descriptor: BOOLEAN is False

	filtered_stream_pointer: POINTER is
		do
			std_error.put_string("STRING_INPUT_STREAM.filtered_stream_pointer has been called!%N")
			crash
		end

	filtered_has_stream_pointer: BOOLEAN is False

feature {}
	dispose is
		do
			-- No need to force people to disconnect such a STREAM.
		end
	
	from_string (a_string: like string) is
		require
			a_string /= Void
		do
			string := a_string.twin
			offset := string.lower - 1
			is_connected := True
		end

	string: STRING
			-- where the data comes from

	offset: INTEGER

end -- class STRING_INPUT_STREAM
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
