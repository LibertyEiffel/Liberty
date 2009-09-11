-- See the Copyright notice at the end of this file.
--
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
