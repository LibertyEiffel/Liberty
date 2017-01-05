-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class CLOCK

feature {ANY}
   value: INTEGER
         -- Get the CPU clock periods if available (-1 if not).
      do
         Result := basic_clock
      end

   periods_per_second: INTEGER
         -- The number of clock periods per seconds.
      require
         value >= 0
      do
         Result := basic_clock_per_sec
      end

feature {}
   basic_clock: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time/clock"
         feature_name: "basic_clock"
         }"
      end

   basic_clock_per_sec: INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time/clock"
         feature_name: "basic_clock_per_sec"
         }"
      end

end -- class CLOCK
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
