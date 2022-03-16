-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_LAUNCH_INFO

create {ANY}
   execute, execute_command_line

feature {ANY}
   program: STRING
   arguments: TRAVERSABLE[STRING]
   keep_environment: BOOLEAN
   command_line: STRING

   execute (program_: like program; arguments_: like arguments; keep_environment_: like keep_environment)
      require
         program_ /= Void
         arguments_ /= Void
      do
         --|*** Memory leak
         program := program_.twin
         arguments := arguments_.deep_twin
         keep_environment := keep_environment_
         command_line := Void
      ensure
         program.is_equal(program_)
         keep_environment = keep_environment_
      end

   execute_command_line (command_line_: like command_line; keep_environment_: like keep_environment)
      require
         command_line_ /= Void
      do
         --|*** Memory leak
         program := Void
         arguments := Void
         keep_environment := keep_environment_
         command_line := command_line_.twin
      ensure
         command_line.is_equal(command_line_)
         keep_environment = keep_environment_
      end

invariant
   command_line = Void xor program = Void
   command_line = Void xor arguments = Void

end -- class PROCESS_LAUNCH_INFO
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
