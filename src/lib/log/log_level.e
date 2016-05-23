-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class LOG_LEVEL

create {LOG_LEVELS}
   make

feature {ANY}
   level: INTEGER
   tag: FIXED_STRING

feature {LOGGER}
   stream (a_logger: LOGGER): OUTPUT_STREAM
      require
         a_logger /= Void
      local
         parent_stream: OUTPUT_STREAM
      do
         if does_log(a_logger.level) then
            a_logger.output.set_forward(bottomless_pit)
            if a_logger.parent /= Void then
               parent_stream := stream(a_logger.parent)
               if parent_stream /= a_logger.output then
                  a_logger.output.set_forward(parent_stream)
               end
            end
            a_logger.output.set(tag, a_logger.tag)
            Result := a_logger.output
         else
            Result := bottomless_pit
         end
      ensure
         Result /= Void
      end

   does_log (a_level: like Current): BOOLEAN
      require
         a_level /= Void
      do
         Result := a_level.level >= level
      end

feature {}
   make (a_level: like level; a_tag: like tag)
      require
         a_tag /= Void
      do
         level := a_level
         tag := a_tag
      ensure
         level = a_level
         tag = a_tag
      end

   bottomless_pit: OUTPUT_STREAM
      once
         create {NULL_OUTPUT_STREAM} Result
      end

invariant
   tag /= Void

end -- class LOG_LEVEL
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
