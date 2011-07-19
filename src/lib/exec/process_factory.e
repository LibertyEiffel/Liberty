-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
expanded class PROCESS_FACTORY
   --
   -- This class allows one to spawn an external process and make it execute some file.
   --
   -- The standard streams of the process are available: `input', `output' and `error'.
   --
   -- '''Note:''' This class is in a beta stage. POSIX and Windows versions are available but there may be 
   -- resource leaks or other bugs left.
   --

insert
   ANY
      redefine
         default_create
      end

creation {ANY}
   default_create

feature {ANY}
   execute (program: STRING; arguments: TRAVERSABLE[STRING]): PROCESS is
         -- Execute the given `program' (how the program is discovered is os-dependant), passing to it the
         -- `arguments'. The environment is cleared if `keep_environment' is False.
      require
         program /= Void
      do
         Result := create_process
         Result.execute(program, arguments, keep_environment)
      end

   execute_command_line (command_line: STRING): PROCESS is
         -- Execute the given `program' (how the program is discovered is os-dependant), passing to it the
         -- `arguments'. The environment is cleared if `keep_environment' is False.
      require
         command_line /= Void
         not command_line.is_empty
      do
         Result := create_process
         Result.execute_command_line(command_line, keep_environment)
      end

   create_process: PROCESS is
      do
         if basic_exec_system = basic_exec_system_posix then
            create {PROCESS_POSIX} Result.make
         elseif basic_exec_system = basic_exec_system_win32 then
            create {PROCESS_WIN32} Result.make
         elseif basic_exec_system = basic_exec_system_none then
            create {PROCESS_NONE} Result.make
         else
            not_yet_implemented
         end
         Result.set_direct_input(direct_input)
         Result.set_direct_output(direct_output)
         Result.set_direct_error(direct_error)
         Result.set_group(group)
      end

feature {ANY}
   keep_environment: BOOLEAN

   set_keep_environment (keep_environment_: like keep_environment) is
      do
         keep_environment := keep_environment_
      ensure
         keep_environment = keep_environment_
      end

feature {ANY}
   group: PROCESS_GROUP

   create_group: PROCESS_GROUP is
      do
         if basic_exec_system = basic_exec_system_posix then
            create {PROCESS_GROUP_POSIX} Result.make
         elseif basic_exec_system = basic_exec_system_win32 then
            create {PROCESS_GROUP_WIN32} Result.make
         elseif basic_exec_system = basic_exec_system_none then
            create {PROCESS_GROUP_NONE} Result.make
         else
            not_yet_implemented
         end
      end

   default_group: PROCESS_GROUP is
      once
         Result := create_group
      end

feature {ANY}
   direct_input: BOOLEAN
         -- Is the program's input stream read directly from the
         -- standard input stream rather than from `input'?

   set_direct_input (direct_input_: like direct_input) is
      do
         direct_input := direct_input_
      ensure
         direct_input = direct_input_
      end

   direct_output: BOOLEAN
         -- Is the program's output stream sent directly to the
         -- standard output stream rather than to `output'?

   set_direct_output (direct_output_: like direct_output) is
      do
         direct_output := direct_output_
      ensure
         direct_output = direct_output_
      end

   direct_error: BOOLEAN
         -- Is the program's error stream sent directly to the
         -- standard error stream rather than to `error'?

   set_direct_error (direct_error_: like direct_error) is
      do
         direct_error := direct_error_
      ensure
         direct_error = direct_error_
      end

feature {}
   default_create is
      do
         group := default_group
         keep_environment := True
      end

feature {}
   -- plugin features

   basic_exec_system: INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_system"
         }"
      end

   basic_exec_system_posix: INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_system_posix"
         }"
      end

   basic_exec_system_win32: INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_system_win32"
         }"
      end

   basic_exec_system_none: INTEGER is
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_system_none"
         }"
      end

end -- class PROCESS_FACTORY
--
-- Copyright (c) 2009 by all the people cited in the AUTHORS file.
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
