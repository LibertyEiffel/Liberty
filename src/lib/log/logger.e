-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOGGER
   --
   -- A simple logger.
   --

create {LOG_INTERNAL_CONF}
   make

feature {ANY}
   parent: LOGGER
   level: LOG_LEVEL
   tag: FIXED_STRING

feature {ANY} -- Logging streams
   trace: OUTPUT_STREAM
      do
         Result := levels.trace.stream(Current)
      ensure
         Result /= Void
      end

   info: OUTPUT_STREAM
      do
         Result := levels.info.stream(Current)
      ensure
         Result /= Void
      end

   warning: OUTPUT_STREAM
      do
         Result := levels.warning.stream(Current)
      ensure
         Result /= Void
      end

   error: OUTPUT_STREAM
      do
         Result := levels.error.stream(Current)
      ensure
         Result /= Void
      end

feature {ANY} -- Logging checks
   is_trace: BOOLEAN
      do
         Result := levels.trace.does_log(level)
      end

   is_info: BOOLEAN
      do
         Result := levels.info.does_log(level)
      end

   is_warning: BOOLEAN
      do
         Result := levels.warning.does_log(level)
      end

   is_error: BOOLEAN
      do
         Result := levels.error.does_log(level)
      end

feature {ANY} -- Log level
   set_level (a_level: like level)
      require
         a_level /= Void
      do
         level := a_level
      ensure
         level = a_level
      end

feature {LOG_INTERNAL_CONF} -- Parent logger
   set_parent (a_parent: like parent)
      require
         a_parent /= Void
      do
         parent := a_parent
         set_level(a_parent.level)
      ensure
         parent = a_parent
      end

feature {LOG_INTERNAL_CONF, LOG_LEVEL} -- Log output, internal usage only
   output: LOG_OUTPUT

feature {LOGGING}
   is_valid: BOOLEAN
      local
         conf: LOG_CONFIGURATION
      do
         Result := generation_id = conf.generation_id
      end

feature {}
   make (a_output: LOG_OUTPUT; a_tag: like tag; a_id: like generation_id)
      require
         a_output /= Void
      do
         output := a_output
         tag := a_tag
         generation_id := a_id
         set_level(levels.trace)
      ensure
         output = a_output
         tag = a_tag
         generation_id = a_id
         is_valid
      end

   levels: LOG_LEVELS

feature {LOG_INTERNAL_CONF}
   generation_id: INTEGER

invariant
   tag /= Void
   level /= Void

end -- class LOGGER
--
-- Copyright (C) 2009-2016: by all the people cited in the AUTHORS file.
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
