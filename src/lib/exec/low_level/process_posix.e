-- This file is part of a Liberty Eiffel library.
-- See the full copyright at the end.
--
class PROCESS_POSIX
   --
   -- This class allows one to spawn an external process and make it execute some file.
   --
   -- The standard streams of the process are available: `input', `output' and `error'.
   --
   -- '''Note:''' This class is in a beta stage, there may be resource leaks or other bugs left.
   --

inherit
   PROCESS
      redefine
         group
      end
   DISPOSABLE

create {ANY}
   execute, execute_command_line, make

feature {ANY}
   id: INTEGER
      do
         Result := basic_exec_id(data)
      end

   is_child: BOOLEAN
      do
         Result := basic_exec_is_child(data)
      end

   is_connected: BOOLEAN

   is_finished: BOOLEAN
      do
         Result := basic_exec_is_finished(data)
         if Result then
            do_cleanup
         end
      end

   status: INTEGER
      do
         Result := basic_exec_status(data)
      end

   wait
      do
         basic_exec_wait(data)
         do_cleanup
      end

   kill (signal: INTEGER)
      require
         is_connected
         not is_child
      do
         basic_exec_posix_kill(data, signal)
      end

   input: OUTPUT_STREAM

   output: INPUT_STREAM

   error: INPUT_STREAM

   execute (program: STRING; arguments: TRAVERSABLE[STRING]; keep_environment: BOOLEAN)
      local
         fa_prog_args: FAST_ARRAY[POINTER]; i: INTEGER; prog_args: POINTER
      do
         make
         if arguments = Void then
            create fa_prog_args.with_capacity(2)
            fa_prog_args.add_last(program.to_external)
         else
            from
               create fa_prog_args.with_capacity(arguments.count + 2)
               fa_prog_args.add_last(program.to_external)
               i := arguments.lower
            until
               i > arguments.upper
            loop
               fa_prog_args.add_last(arguments.item(i).to_external)
               i := i + 1
            end
         end
         fa_prog_args.add_last(default_pointer)
         prog_args := fa_prog_args.to_external
         do_execute(program.to_external, prog_args, keep_environment, default_pointer)
      end

   execute_command_line (command_line: STRING; keep_environment: BOOLEAN)
      local
         fa_prog_args: FAST_ARRAY[POINTER]; program, prog_args: POINTER
      do
         make
         program := (once "/bin/sh").to_external
         fa_prog_args := {FAST_ARRAY[POINTER] <<program, (once "-c").to_external, command_line.to_external, default_pointer>>}
         prog_args := fa_prog_args.to_external
         do_execute(program, prog_args, keep_environment, default_pointer)
      end

   duplicate
      do
         do_execute(default_pointer, default_pointer, True, default_pointer)
      end

   group: PROCESS_GROUP_POSIX

feature {PROCESS_GROUP}
   cleanup (stat: INTEGER)
      do
         basic_exec_cleanup(data, stat)
         do_cleanup
      end

feature {}
   dispose
      do
         -- last opportunity to clean up
         if not is_child then
            if is_connected and then not is_finished then
               breakpoint
            end
         end
         basic_exec_free_data(data)
      end

   do_cleanup
      do
         group.unregister(Current)
         cleanup_streams
      end

   make
      local
         process_factory: PROCESS_FACTORY
      do
         if group = Void then
            data := basic_exec_alloc_data
            group ::= process_factory.default_group
         end
      end

   instream: EXEC_OUTPUT_STREAM_POSIX

   outstream, errstream: EXEC_INPUT_STREAM_POSIX

   do_execute (program, program_arguments: POINTER; keep_environment: BOOLEAN; additional_env: POINTER)
      require
         --not program_arguments.is_null
         is_connected implies is_finished
         input /= Void implies not input.is_connected
         output /= Void implies not output.is_connected
         error /= Void implies not error.is_connected
      local
         inpipe, outpipe, errpipe: POINTER
      do
         if not direct_input then
            if instream = Void then
               create instream.make(Current)
            else
               instream.make(Current)
            end
            inpipe := instream.pipe
            input := instream
         else
            input := Void
         end

         if not direct_output then
            if outstream = Void then
               create outstream.make(Current)
            else
               outstream.make(Current)
            end
            outpipe := outstream.pipe
            output := outstream
         else
            output := Void
         end

         if not direct_error then
            if errstream = Void then
               create errstream.make(Current)
            else
               errstream.make(Current)
            end
            errpipe := errstream.pipe
            error := errstream
         else
            error := Void
         end

         is_connected := basic_exec_posix_execute(data, program, program_arguments, keep_environment, additional_env, inpipe, outpipe, errpipe)
         if is_connected and then not is_child then
            check
               id > 0
            end
            group.register(Current)
         else
            input := Void
            output := Void
            error := Void
         end
      end

feature {EXEC_INPUT_STREAM_POSIX, EXEC_OUTPUT_STREAM_POSIX} -- plugin low-level data
   data: POINTER

feature {} -- plugin features
   basic_exec_posix_execute (dat, program, arguments: POINTER; keep_environment: BOOLEAN; add_environment: POINTER; in_fd, out_fd, err_fd: POINTER): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_posix_execute"
         }"
      end

   basic_exec_id (dat: like data): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_id"
         }"
      end

   basic_exec_is_child (dat: like data): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_is_child"
         }"
      end

   basic_exec_alloc_data: like data
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_alloc_data()"
         }"
      end

   basic_exec_free_data (dat: like data)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_free_data"
         }"
      end

   basic_exec_is_finished (dat: like data): BOOLEAN
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_is_finished"
         }"
      end

   basic_exec_status (dat: like data): INTEGER
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_status"
         }"
      end

   basic_exec_wait (dat: like data)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_wait"
         }"
      end

   basic_exec_cleanup (dat: like data; stat: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_cleanup"
         }"
      end

   basic_exec_posix_kill (dat: like data; signal: INTEGER)
      external "plug_in"
      alias "{
         location: "${sys}/plugins"
         module_name: "exec"
         feature_name: "basic_exec_posix_kill"
         }"
      end

invariant
   data.is_not_null

end -- class PROCESS_POSIX
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
