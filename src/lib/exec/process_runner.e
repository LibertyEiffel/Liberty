-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
deferred class PROCESS_RUNNER

feature {ANY}
   execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN)
         -- Execute the given `program' (how the program is discovered is OS-dependent), passing to it the
         -- `arguments'. The environment is cleared if `keep_environment' is False.
      require
         program /= Void
         is_ready
      deferred
      end

   execute_command_line (command_line: STRING; keep_environment: BOOLEAN)
         -- Execute the `command_line' through the operating system's basic shell. The environment is cleared
         -- if `keep_environment' is False.
         --
         -- See also: SYSTEM.execute_command
      require
         command_line /= Void
         not command_line.is_empty
         is_ready
      deferred
      end

   is_ready: BOOLEAN
      deferred
      end

end -- class PROCESS_RUNNER
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
