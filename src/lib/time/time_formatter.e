-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class TIME_FORMATTER
   --
   -- The polymorphic format class for TIME.
   --

insert
   TIME_HANDLER
      redefine out_in_tagged_out_memory
      end

feature {ANY}
   time: TIME
         -- The corresponding information to display.

   set_time (t: TIME)
      do
         time := t
      ensure
         time = t
      end

   short_mode: BOOLEAN
         -- Is the formatting mode set to the short (abbreviated) mode ?

   set_short_mode (value: BOOLEAN)
      do
         short_mode := value
      ensure
         short_mode = value
      end

   day_in (buffer: STRING)
         -- According to the current `short_mode', append in the `buffer'
         -- the name of the day.
      deferred
      end

   month_in (buffer: STRING)
         -- According to the current `short_mode', append in the `buffer'
         -- the name of the month.
      deferred
      end

   frozen to_string: STRING
      do
         to_string_buffer.clear_count
         append_in(to_string_buffer)
         Result := to_string_buffer.twin
      end

   append_in (buffer: STRING)
      deferred
      end

   frozen out_in_tagged_out_memory
      do
         append_in(tagged_out_memory)
      end

feature {}
   to_string_buffer: STRING
      once
         create Result.make(128)
      end

end -- class TIME_FORMATTER
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
