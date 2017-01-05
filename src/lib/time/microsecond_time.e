-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class MICROSECOND_TIME
   --
   -- Date and time facilities (like TIME) plus an extra microsecond information.
   --

insert
   HASHABLE
      redefine out
      end
   COMPARABLE
      redefine is_equal, out
      end
   TIME_HANDLER
      redefine is_equal, out
      end

feature {ANY}
   time: TIME
         -- The normal TIME with second accuracy.

   microsecond: INTEGER
         -- Extra information in number of microseconds in range 0 .. 999999.
         -- Note that the accuracy is system dependant.

   update
         -- Update `Current' with the current system clock.
      do
         basic_microsecond_update
         time.set_time_memory(basic_microsecond_time)
         microsecond := basic_microsecond_microsecond
      end

   set_time (t: like time)
      do
         time := t
      ensure
         time = t
      end

   set_microsecond (microsec: INTEGER)
         -- To set `microsecond' in range 0 .. 999 999.
      require
         microsec.in_range(0, 999999)
      do
         microsecond := microsec
      ensure
         microsecond = microsec
      end

   infix "+" (s: REAL): like Current
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

   add_second (s: INTEGER)
         -- Add `s' seconds to `Current'.
      require
         s >= 0
      do
         time.add_second(s)
      ensure
         Current >= old Current
      end

   add_millisecond (millisecond: INTEGER)
         -- Add `millisecond' milliseconds.
      require
         millisecond.in_range(0, 999)
      do
         add_microsecond(millisecond * 1000)
      ensure
         Current >= old Current
      end

   add_microsecond (microsec: INTEGER)
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

   elapsed_seconds (other: like Current): REAL_64
         -- Elapsed time in seconds from `Current' to `other' with sub-second precision.
      do
         Result := time.elapsed_seconds(other.time)
         Result := Result + (other.microsecond - microsecond).to_real_64 / 1000000
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.time = time and then other.microsecond = microsecond
      end

   infix "<" (other: like Current): BOOLEAN
      do
         Result := time < other.time or else time = other.time and then microsecond < other.microsecond
      ensure then
         Result implies elapsed_seconds(other) > 0
      end

   hash_code: INTEGER
      do
         Result := time.hash_code.bit_xor(microsecond)
      end

   out: STRING
      local
         mic: STRING
      do
         Result := time.out
         Result.extend('.')
         mic := once "............"
         mic.copy(once "000000")
         microsecond.append_in(mic)
         Result.append_substring(mic, mic.upper - 5, mic.upper)
      end

feature {ANY}
   timestamp: INTEGER_64
      do
         Result := time.time_memory * 1000000 + microsecond
      end

feature {}
   basic_microsecond_time: INTEGER_64
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "basic_microsecond"
         feature_name: "basic_microsecond_time"
         }"
      end

   basic_microsecond_microsecond: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/runtime"
         module_name: "basic_microsecond"
         feature_name: "basic_microsecond_microsecond"
         }"
      end

   basic_microsecond_update
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
-- Copyright (C) 2009-2017: by all the people cited in the AUTHORS file.
--
-- Permission is hereby granted, free of charge, to any person obtaining a copy
-- of this software and associated documentation files (the "Software"), to deal
-- in the Software without restriction, including without limitation the rights
-- to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the Software is
-- furnished to do so, subject to the following conditions:
--
-- The above copyright notice and this permission notice shall be included in
-- all copies or substantial portions of the Software.
--
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
-- THE SOFTWARE.
