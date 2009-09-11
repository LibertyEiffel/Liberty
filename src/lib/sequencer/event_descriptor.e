-- See the Copyright notice at the end of this file.
--
deferred class EVENT_DESCRIPTOR
	--
	-- An event that can happen, managed by the EVENTS_SET.
	--

feature {ANY}
	expected (events: EVENTS_SET): BOOLEAN is
			-- True if the event is expected by the `events' set
		do
			if expected_array /= Void then
				Result := expected_array.fast_has(events)
			end
		ensure
			Result implies is_expected
		end

	is_expected: BOOLEAN is
			-- True if the event is expected by any EVENTS_SET
		do
			Result := expected_array /= Void and then not expected_array.is_empty
		end

feature {EVENTS_SET}
	expect (events: EVENTS_SET) is
		require
			not expected(events)
			events /= Void
		deferred
		ensure
			expected(events)
		end

	occurred (events: EVENTS_SET): BOOLEAN is
		require
			expected(events)
			events /= Void
		deferred
		end

	reset (events: EVENTS_SET) is
		require
			expected(events)
			action: unset_expected_(events)
		do
			-- done in require (see "action")
		ensure
			not expected(events)
		end

feature {} --| Clever use of assertions to be sure not to create arrays in boost mode
	set_expected (events: EVENTS_SET) is
		require
			not expected(events)
			action: set_expected_(events)
		do
			-- done in require (see "action")
		ensure
			expected(events)
		end

	set_expected_ (events: EVENTS_SET): BOOLEAN is
		require
			not expected(events)
		do
			if expected_array = Void then
				create expected_array.make(0)
			end
			expected_array.add_last(events)
			Result := True
		ensure
			expected(events)
			Result
		end

	unset_expected_ (events: EVENTS_SET): BOOLEAN is
		require
			expected(events)
		local
			i: INTEGER
		do
			i := expected_array.fast_first_index_of(events)
			expected_array.remove(i)
			Result := True
		ensure
			not expected(events)
			Result
		end

	expected_array: FAST_ARRAY[EVENTS_SET]

end -- class EVENT_DESCRIPTOR
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
