-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class LOG_CONFIGURATION
--
-- To configure the logging framework.
--

feature {ANY}
   load (a_stream: INPUT_STREAM; when_error: PROCEDURE[TUPLE[STRING]]; path_resolver: FUNCTION[TUPLE[STRING], STRING]; a_load_completion: PROCEDURE[TUPLE])
      require
         a_stream.is_connected
      do
         internal.load(a_stream, when_error, path_resolver, a_load_completion)
      end

feature {LOGGING}
   logger (a_tag: FIXED_STRING): LOGGER
      require
         a_tag /= Void
      do
         Result := internal.conf_logger(a_tag)
      ensure
         Result /= Void
      end

feature {LOGGER}
   generation_id: INTEGER
      do
         Result := internal.generation_id
      end

feature {}
   internal: LOG_INTERNAL_CONF
      once
         create Result.make
      end

end -- class LOG_CONFIGURATION
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
