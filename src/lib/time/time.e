-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class TIME
--
-- Time and date facilities: year, month, day, hour and seconds.
--

insert
   HASHABLE
      redefine
         out
      end
   COMPARABLE
      redefine
         is_equal, out
      end
   TIME_HANDLER
      redefine
         is_equal, out
      end

feature {ANY}
   out: STRING
      do
         create Result.with_capacity(21)
         year.append_in(Result); Result.extend('/')
         if month < 10 then Result.extend('0') end
         month.append_in(Result); Result.extend('/')
         if day < 10 then Result.extend('0') end
         day.append_in(Result); Result.extend(' ')
         if hour < 10 then Result.extend('0') end
         hour.append_in(Result); Result.extend(':')
         if minute < 10 then Result.extend('0') end
         minute.append_in(Result); Result.extend(':')
         if second < 10 then Result.extend('0') end
         second.append_in(Result)
      end

feature {ANY}
   is_local_time: BOOLEAN
         -- Is the local time in use? This information applies to all objects
         -- of class TIME and MICROSECOND_TIME.
      do
         Result := time_mode = 0
      ensure
         Result implies not is_universal_time
      end

   is_universal_time: BOOLEAN
         -- Is Universal Time in use?  This information applies to all objects
         -- of class TIME and MICROSECOND_TIME.
      do
         Result := time_mode /= 0
      ensure
         Result implies not is_local_time
      end

   year: INTEGER
         -- Number of the year.
      do
         Result := time_getyear(time_memory, time_mode)
      end

   month: INTEGER
         -- Number of the month (1 for January, 2 for February, ...
         -- 12 for December).
      do
         Result := time_getmonth(time_memory, time_mode)
      ensure
         Result.in_range(1, 12)
      end

   day: INTEGER
         -- Day of the `month' in range 1 .. 31.
      do
         Result := time_getday(time_memory, time_mode)
      ensure
         Result.in_range(1, 31)
      end

   hour: INTEGER
         -- Hour in range 0..23.
      do
         Result := time_gethour(time_memory, time_mode)
      ensure
         Result.in_range(0, 23)
      end

   minute: INTEGER
         -- Minute in range 0 .. 59.
      do
         Result := time_getminute(time_memory, time_mode)
      ensure
         Result.in_range(0, 59)
      end

   second: INTEGER
         -- Second in range 0 .. 59.
      do
         Result := time_getsecond(time_memory, time_mode)
      ensure
         Result.in_range(0, 59)
      end

   week_day: INTEGER
         -- Number of the day in the week (Sunday is 0, Monday is 1, etc.).
      do
         Result := time_getwday(time_memory, time_mode)
      ensure
         Result.in_range(0, 6)
      end

   year_day: INTEGER
         -- Number of the day in the year in range 0 .. 365.
      do
         Result := time_getyday(time_memory, time_mode)
      end

   is_summer_time_used: BOOLEAN
         -- Is summer time in effect?
      do
         Result := time_is_summer_time_used(time_memory)
      end

   to_microsecond_time: MICROSECOND_TIME
      do
         Result.set_time(Current)
      ensure
         Result.time = Current
         Result.microsecond = 0
      end

feature {ANY} -- Setting:
   update
         -- Update `Current' with the current system clock.
      do
         time_memory := basic_time
      end

   set (a_year, a_month, a_day, a_hour, a_min, sec: INTEGER): BOOLEAN
         -- Try to set `Current' using the given information. If this input
         -- is not a valid date, the `Result' is False and `Current' is not updated.
      require
         valid_month: a_month.in_range(1, 12)
         valid_day: a_day.in_range(1, 31)
         valid_hour: a_hour.in_range(0, 23)
         valid_minute: a_min.in_range(0, 59)
         valid_second: sec.in_range(0, 59)
      local
         tm: like time_memory
      do
         tm := time_mktime(a_year, a_month, a_day, a_hour, a_min, sec)
         if tm /= -1 then
            time_memory := tm
            Result := True
         end
      end

   add_second (s: INTEGER)
         -- Add `s' seconds to `Current'.
      require
         s >= 0
      do
         time_add_second($time_memory, s)
      ensure
         Current >= old Current
      end

   add_minute (m: INTEGER)
         -- Add `m' minutes to `Current'.
      require
         m >= 0
      do
         time_add_second($time_memory, m * 60)
      ensure
         Current >= old Current
      end

   add_hour (h: INTEGER)
         -- Add `h' hours to `Current'.
      require
         h >= 0
      do
         time_add_second($time_memory, h * 3600)
      ensure
         Current >= old Current
      end

   add_day (d: INTEGER)
         -- Add `d' days to `Current'.
      require
         d >= 0
      do
         time_add_second($time_memory, d * 86400)
      ensure
         Current >= old Current
      end

feature {ANY}
   elapsed_seconds (other: like Current): REAL
         -- Elapsed time in seconds from `Current' to `other'.
      require
         Current <= other
      do
         Result := time_difftime(other.time_memory, time_memory)
      ensure
         Result >= 0
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := other.time_memory = time_memory
      end

   infix "<" (other: like Current): BOOLEAN
      do
         Result := time_difftime(other.time_memory, time_memory) > 0
      end

feature {ANY} -- Setting common time mode (local or universal):
   set_universal_time
      do
         time_mode_memo.set_item(1)
      ensure
         is_universal_time
      end

   set_local_time
      do
         time_mode_memo.set_item(0)
      ensure
         is_local_time
      end

feature {ANY} -- Hashing:
   hash_code: INTEGER
      do
         Result := time_memory.hash_code
      end

feature {TIME, FILE_TOOLS, TIME_FORMATTER, MICROSECOND_TIME}
   set_time_memory (tm: like time_memory)
      do
         time_memory := tm
      ensure
         time_memory = tm
      end

feature {TIME_HANDLER}
   time_memory: INTEGER_64
         -- The current time value of `Current'. As far as we know, this
         -- kind of information should always fit into an INTEGER_64.

feature {}
   time_mode_memo: REFERENCE[INTEGER]
         -- The global default `time_mode' memory.
      once
         create Result
      end

   time_mode: INTEGER
      do
         Result := time_mode_memo.item
      ensure
         Result = 0 or Result = 1
      end

   basic_time: INTEGER_64
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "basic_time"
         }"
      end

   time_difftime (time2, time1: INTEGER_64): REAL
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_difftime"
         }"
      end

   time_getyear (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getyear"
         }"
      end

   time_getmonth (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getmonth"
         }"
      end

   time_getday (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getday"
         }"
      end

   time_gethour (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_gethour"
         }"
      end

   time_getminute (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getminute"
         }"
      end

   time_getsecond (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getsecond"
         }"
      end

   time_is_summer_time_used (tm: INTEGER_64): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_is_summer_time_used"
         }"
      end

   time_getyday (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getyday"
         }"
      end

   time_getwday (tm: INTEGER_64; mode: INTEGER): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_getwday"
         }"
      end

   time_mktime (a_year, a_mon, a_day, a_hour, a_min, a_sec: INTEGER): INTEGER_64
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_mktime"
         }"
      end

   time_add_second (time: POINTER; s: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "time"
         feature_name: "time_add_second"
         }"
      end

end -- class TIME
--
-- Copyright (C) 2009-2018: by all the people cited in the AUTHORS file.
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
