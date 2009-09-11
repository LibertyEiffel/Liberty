-- See the Copyright notice at the end of this file.
--
class DATE_EVENT
	--
	-- Event: a timeout occurred
	--

inherit
	TIME_EVENT

creation {TIME_EVENTS}
	make

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		do
			events.at(expiration)
			set_expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		do
			Result := events.current_time > expiration
		end

feature {TIME_EVENTS}
	expiration: MICROSECOND_TIME

	in_time (timeout_ms: INTEGER) is
			-- `timeout_ms' is the maximum time in milliseconds to wait from now.
		require
			not is_expected
			timeout_ms >= 0
		do
			expiration.update
			expiration.add_second(timeout_ms #// 1000)
			expiration.add_millisecond(timeout_ms #\\ 1000)
		end

	at_date (date: MICROSECOND_TIME) is
			-- `date' is the last moment `wait' can wait.
		require
			not is_expected
		do
			expiration := date
		end

feature {}
	make is
		do
		end

end -- class DATE_EVENT
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
