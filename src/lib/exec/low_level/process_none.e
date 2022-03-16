-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_NONE
   --
   -- This class allows one to spawn an external process and make it execute some file.
   --
   -- The standard streams of the process are available: `input', `output' and `error'.
   --
   -- '''Note:''' This class is in a beta stage. POSIX and Windows versions are available but there may be
   -- resource leaks or other bugs left.
   --

inherit
   PROCESS
      redefine
         group
      end

create {ANY}
   execute, execute_command_line, make

feature {ANY}
   id: INTEGER
      do
         check
            False
         end
      end

   is_child: BOOLEAN False

   is_connected: BOOLEAN False

   is_finished: BOOLEAN
      do
         check
            False
         end
      end

   status: INTEGER
      do
         check
            False
         end
      end

   wait
      do
         check
            False
         end
      end

   input: OUTPUT_STREAM
      do
      end

   output: INPUT_STREAM
      do
      end

   error: INPUT_STREAM
      do
      end

   execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN)
      do
         make
      end

   execute_command_line (command_line: STRING; keep_environment: BOOLEAN)
      do
         make
      end

   duplicate
      do
         make
      end

   group: PROCESS_GROUP_NONE

feature {}
   make
      local
         process_factory: PROCESS_FACTORY
      do
         if group = Void then
            group ::= process_factory.default_group
         end
      end

end -- class PROCESS_NONE
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
