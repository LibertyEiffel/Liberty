-- See the Copyright notice at the end of this file.
--
expanded class MICROSECOND_TIME
	--
	-- Date and time facilities (like TIME) plus an extra microsecond information.
	--

insert
	HASHABLE
	COMPARABLE
		redefine is_equal
		end
	
feature {ANY}
	time: TIME
			-- The normal TIME with second accuracy.

	microsecond: INTEGER
			-- Extra information in number of microseconds in range 0 .. 999999.
			-- Note that the accuracy is system dependant.

	update is
			-- Update `Current' with the current system clock.
		do
			basic_microsecond_update
			time.set_time_memory(basic_microsecond_time)
			microsecond := basic_microsecond_microsecond
		end

	set_time (t: like time) is
		do
			time := t
		ensure
			time = t
		end

	set_microsecond (microsec: INTEGER) is
			-- To set `microsecond' in range 0 .. 999 999.
		require
			microsec.in_range(0, 999999)
		do
			microsecond := microsec
		ensure
			microsecond = microsec
		end

	infix "+" (s: REAL): like Current is
			-- Add `s' seconds (2.476 is 2 seconds and 476 milliseconds)
		require
			s >= 0.0
		local
			a, b: INTEGER
		do
			a := s.force_to_integer_32
			b := ((s - a) * 1000000).force_to_integer_32
			Result := Current
			Result.add_second(a)
			Result.add_microsecond(b)
		end

	add_second (s: INTEGER) is
			-- Add `s' seconds to `Current'.
		require
			s >= 0
		do
			time.add_second(s)
		ensure
			Current >= old Current
		end

	add_millisecond (millisecond: INTEGER) is
			-- Add `millisecond' milliseconds.
		require
			millisecond.in_range(0, 999)
		do
			add_microsecond(millisecond * 1000)
		ensure
			Current >= old Current
		end

	add_microsecond (microsec: INTEGER) is
			-- Add `microsec' microseconds
		require
			microsec.in_range(0, 999999)
		local
			a: INTEGER
		do
			a := microsec + microsecond
			if a >= 1000000 then
				add_second(1)
				a := a - 1000000
			end
			microsecond := a
		ensure
			Current >= old Current
		end

	elapsed_seconds (other: like Current): REAL is
			-- Elapsed time in seconds from `Current' to `other' with sub-second precision.
		do
			Result := time.elapsed_seconds(other.time)
			Result := Result + (other.microsecond - microsecond) / 1000000
		end

	is_equal (other: like Current): BOOLEAN is
		do
			Result := other.time = time and then other.microsecond = microsecond
		end

	infix "<" (other: like Current): BOOLEAN is
		do
			Result := time < other.time or else time = other.time and then microsecond < other.microsecond
		ensure then
			Result implies elapsed_seconds(other) > 0
		end

	hash_code: INTEGER is
		do
			Result := time.hash_code
		end

feature {}
	basic_microsecond_time: INTEGER_64 is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_microsecond"
			feature_name: "basic_microsecond_time"
			}"
		end

	basic_microsecond_microsecond: INTEGER is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_microsecond"
			feature_name: "basic_microsecond_microsecond"
			}"
		end

	basic_microsecond_update is
		external "plug_in"
		alias "{
			location: "${sys}/runtime"
			module_name: "basic_microsecond"
			feature_name: "basic_microsecond_update"
			}"
		end

invariant
	microsecond.in_range(0, 999999)

end -- class MICROSECOND_TIME
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
