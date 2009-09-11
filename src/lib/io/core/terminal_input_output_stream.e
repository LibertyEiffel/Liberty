-- See the Copyright notice at the end of this file.
--
deferred class TERMINAL_INPUT_OUTPUT_STREAM
	--
	-- A stream that is at the same time an input stream and an output stream.
	--

inherit
	TERMINAL_INPUT_STREAM
		rename filter as input_filter,
			set_filter as set_input_filter,
			is_filtered as input_is_filtered,
			detach as detach_input
		redefine can_disconnect, new_url
		end
	TERMINAL_OUTPUT_STREAM
		rename filter as output_filter,
			set_filter as set_output_filter,
			is_filtered as output_is_filtered,
			detach as detach_output
		redefine can_disconnect, new_url
		end
	FILTERABLE
		redefine
			is_filtered, set_filter
		end

feature {ANY}
	can_disconnect: BOOLEAN is True

	detach is
			-- Detach the input and the ouput
			--
			-- See also `detach_input', `detach_output'.
		do
			detach_output
			detach_input
		end

	is_filtered: BOOLEAN is
			-- Is one of the input or output streams filtered?
			--
			-- See also `is_input_filtered', `is_output_filtered'
		do
			Result := input_is_filtered or else output_is_filtered
		end

	set_filter (a_filter: like filter) is
			-- Don't use (use `set_input_filter' or `set_output_filter')
		do
			check
				False
			end
		end

feature {}
	new_url: URL is
		do
			create Result.from_stream(Current, True, True)
		end

invariant
	filter = Void

end -- class TERMINAL_INPUT_OUTPUT_STREAM
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
