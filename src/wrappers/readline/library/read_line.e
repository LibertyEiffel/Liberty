deferred class READ_LINE
-- Interface to the GNU readline library

-- Insert this class to get access to library interface.

insert
   WRAPPER_HANDLER
   READLINE_EXTERNALS

feature {ANY} -- Read line
   prompt: ABSTRACT_STRING
         -- The prompt presented to the user

   last_line: STRING -- The last line read by `read_line'

   read_line is
         -- Print `prompt' and read a line, put into `last_line'
      local
         p: POINTER
      do
         p := readline(null_or_string(prompt))
         check
            p.is_not_null
         end
         create last_line.from_external(p)
      ensure
         last_line /= Void
      end

   buffer: FIXED_STRING is
      do
         Result.from_external(rl_line_buffer)
      end

   completion: READ_LINE_COMPLETION is
      once
         create Result.make
      end

   history: READ_LINE_HISTORY is
      once
         create Result.using_history
      end

feature {}
   buffer_: FIXED_STRING is
      once
         create Result.make
      end

end -- class READ_LINE

-- Copyright (C) 2010, Paolo Redaelli

-- This library is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- This package is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Readline.  If not, see <http://www.gnu.org/licenses/>.
