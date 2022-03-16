-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class BENCHMARK
   --
   -- Benchmarking facilities
   --

insert
   ANY
   PLATFORM

create {ANY}
   make

feature {ANY}
   make (n: like name)
      require
         n /= Void
      do
         name := n
         in_progress := False
         counter := 0
         total_time := 0
         min_time := Maximum_real
         max_time := 0
         last_print := 0
      ensure
         not in_progress
         counter = 0
      end

   start
      require
         not in_progress
      do
         start_time.update
         in_progress := True
      ensure
         in_progress
      end

   next
      require
         in_progress
      local
         end_time: MICROSECOND_TIME; exec_time: REAL
      do
         end_time.update
         exec_time := start_time.elapsed_seconds(end_time)
         start_time := end_time
         total_time := total_time + exec_time
         if exec_time < min_time then
            min_time := exec_time
         end
         if exec_time > max_time then
            max_time := exec_time
         end
         counter := counter + 1
         smart_print
      ensure
         counter = old counter + 1
         in_progress
      end

   stop
      require
         in_progress
      do
         next
         in_progress := False
      ensure
         counter = old counter + 1
         not in_progress
      end

   break
         -- useful for loop termination
      require
         in_progress
      do
         in_progress := False
      ensure
         counter = old counter
         not in_progress
      end

   name: STRING

   in_progress: BOOLEAN

   counter: INTEGER --|*** PH (14/06/2005) INTEGER_64?

   min_time: REAL -- in seconds

   max_time: REAL -- in seconds

   total_time: REAL -- in seconds

   mean_time: REAL
         -- in seconds
      require
         counter > 0
      do
         Result := total_time / counter
      end

   set_custom_print (cp: like custom_print)
      do
         custom_print := cp
      end

   print_now
      do
         if custom_print /= Void then
            custom_print.call([Current])
         else
            default_print
         end
         last_print := total_time
      end

   smart_print
      do
         if total_time - last_print > total_time / 10 + 1 then
            print_now
         end
      end

feature {}
   start_time: MICROSECOND_TIME

   last_print: REAL -- total_time value when last print occurred

   custom_print: PROCEDURE[TUPLE[BENCHMARK]] -- Used if non Void. See also default_print

   default_print
         -- Used if custom_print is Void
      require
         counter > 0
      local
         speed: REAL
      do
         speed := mean_time
         if speed < 0.1 then
            std_output.put_real(1.0 / speed)
            std_output.put_character(' ')
            std_output.put_string(name)
            std_output.put_string(once "/s")
         else
            std_output.put_real(speed)
            std_output.put_character(' ')
            std_output.put_string(once "s/")
            std_output.put_string(name)
         end
         std_output.put_string(once ", min: ")
         std_output.put_real(min_time)
         std_output.put_string(once "s, max: ")
         std_output.put_real(max_time)
         std_output.put_string(once "s, counter: ")
         std_output.put_integer(counter)
         std_output.put_new_line
      end

end -- class BENCHMARK
--
-- Copyright (C) 2009-2022: by all the people cited in the AUTHORS file.
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
