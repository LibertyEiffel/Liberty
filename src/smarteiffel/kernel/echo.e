-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ECHO
   --
   -- Unique Global Object in charge of ECHOing some information messages during compilation for example.
   -- This object is used to implement the "-verbose" flag as well as the "-output_error_warning_on" flag.
   --

insert
   GLOBALS

creation {ANY}
   make

feature {ANY}
   is_verbose: BOOLEAN
         -- Is the `echo' in -verbose mode (default is False).

   is_redirected: BOOLEAN is
         -- Is the `echo' redirected (when -output_error_warning_on flag is used).
      do
         Result := output_state /= state_on_output
      end

   before_exit_close is
         -- Must be called just before exit in order to remove a possibly empty `redirect_output_on'
         -- file.
      local
         file_tools: FILE_TOOLS
      do
         output_stream.flush
         error_stream.flush
         if is_redirected_on_file then
            output_stream.disconnect
            output_stream := std_output
            if file_tools.is_empty(output_path) then
               file_tools.delete(output_path)
            end
            output_state := state_on_output
            output_stream := std_output
            error_stream := std_error
         end
      ensure
         not is_redirected
      end

feature {}
   make is
      do
         -- Setting the default `output_stream':
         output_stream := std_output
         error_stream := std_error
      end

feature {ANY} -- To echo some additional information (echo is only done when `is_verbose' is True).
   put_string (msg: STRING) is
      do
         if is_verbose then
            output_stream.put_string(msg)
            output_stream.flush
         end
      end

   put_character (c: CHARACTER) is
      do
         if is_verbose then
            output_stream.put_character(c)
            output_stream.flush
         end
      end

   put_new_line is
      do
         if is_verbose then
            output_stream.put_new_line
            output_stream.flush
         end
      end

   put_integer (i: INTEGER) is
      do
         if is_verbose then
            output_stream.put_integer(i)
            output_stream.flush
         end
      end

   put_real_format (real: REAL; format: INTEGER) is
      do
         if is_verbose then
            output_stream.put_real_format(real, format)
            output_stream.flush
         end
      end

   put_position (position: POSITION) is
         -- Echo the `position' inside brakets.
      do
         if position.is_unknown then
            put_string(once "(unknown position)")
         else
            put_string(once "(line:")
            put_integer(position.line)
            put_string(once " column:")
            put_integer(position.column)
            put_string(once " of %"")
            put_string(position.path)
            put_string(once "%")")
         end
      end

   put_spaces (n: INTEGER) is
      require
         n >= 0
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            put_character(' ')
            i := i - 1
         end
      end

   file_removing (path: STRING) is
         -- If `path' is an existing file, echo a message on `output_stream'
         -- while removing the file. Otherwise, do nothing.
      require
         path /= Void
      do
         if (create {FILE_TOOLS}).is_readable(path) then
            put_string(once "Removing %"")
            put_string(path)
            put_string(once "%".%N")
            (create {FILE_TOOLS}).delete(path)
         end
      ensure
         may_fail: True or not (create {FILE_TOOLS}).is_readable(path)
      end

   file_renaming (old_path, new_path: STRING) is
      require
         old_path /= Void
         new_path /= Void
      do
         put_string(once "Renaming %"")
         put_string(old_path)
         put_string(once "%" as %"")
         put_string(new_path)
         put_string(once "%".%N")
         (create {FILE_TOOLS}).rename_to(old_path, new_path)
      end

   tfw_connect (tfw: TEXT_FILE_WRITE; path: STRING) is
      require
         not tfw.is_connected
         path /= Void
      do
         tfw.connect_to(path)
         if tfw.is_connected then
            put_string(once "Writing %"")
            put_string(path)
            put_string(once "%" file.%N")
         else
            w_put_string(once "Cannot write file %"")
            w_put_string(path)
            w_put_string(once "%".%N")
            die_with_code(exit_failure_code)
         end
      ensure
         tfw.is_connected
      end

   tfr_connect (tfr: TEXT_FILE_READ; path: STRING) is
      require
         not tfr.is_connected
         path /= Void
      do
         put_string(once "Trying to read file %"")
         put_string(path)
         put_string(once "%".%N")
         tfr.connect_to(path)
      end

   tfr_connect_or_exit (tfr: TEXT_FILE_READ; path: STRING) is
      require
         not tfr.is_connected
         path /= Void
      do
         tfr_connect(tfr, path)
         if not tfr.is_connected then
            w_put_string(once "File %"")
            w_put_string(path)
            w_put_string("%" not found.%N")
            die_with_code(exit_failure_code)
         end
      ensure
         tfr.is_connected
      end

   read_word_in (tfr: TEXT_FILE_READ): STRING is
      require
         tfr.is_connected
      do
         put_string(once "Reading one word in %"")
         put_string(tfr.path)
         put_string(once "%".%N")
         if tfr.end_of_input then
            w_put_string(once "Unexpected end_of_input while reading %"")
            w_put_string(tfr.path)
            w_put_string(once "%".%N")
            die_with_code(exit_failure_code)
         else
            tfr.read_word
            Result := tfr.last_string.twin
         end
      ensure
         tfr.is_connected
      end

   system_call (cmd: STRING): INTEGER is
         -- To trace `SYSTEM.execute' calls. When the `cmd' is composed of
         -- more than one line, each line is treated separately with one
         -- `execute' call.
      require
         cmd.count > 0
      local
         i: INTEGER; cmd2: STRING; s: SYSTEM
      do
         if cmd.last = '%N' then
            cmd.remove_last
            Result := system_call(cmd)
         elseif cmd.has('%N') then
            i := cmd.first_index_of('%N')
            cmd2 := cmd.substring(i + 1, cmd.count)
            cmd.remove_tail(cmd.count - i + 1)
            Result := system_call(cmd)
            if Result = 0 then
               Result := system_call(cmd2)
            else
               put_string(once "Command ")
               put_string(cmd2)
               put_string(once " not executed.%N")
            end
         elseif cmd.first = '#' then
            -- forget it
         else
            put_string(once "System call %"")
            put_string(cmd)
            put_string(once "%".%N")
            Result := s.execute_command(cmd)
         end
      end

   print_count (msg: STRING; count: INTEGER) is
      require
         count >= 0
      do
         if is_verbose then
            if count > 0 then
               put_string(once "Total ")
               put_string(msg)
               if count /= 1 then
                  put_character('s')
               end
               put_string(once ": ")
               put_integer(count)
               put_string(once ".%N")
            else
               put_string(once "No ")
               put_string(msg)
               put_string(once ".%N")
            end
         end
      end

   getenv (variable, file: STRING): STRING is
         -- To echo every `{SYSTEM}.get_environment_variable' for all tools of
         -- SmartEiffel (because of magic variables and for SmallEiffel
         -- backward compatibility). When the `file' is not Void, it means
         -- that the `variable' has been found in this `file'. So, this function
         -- compute automatically the `SmartEiffelDirectory' magic variable using
         -- the `SmartEiffel' variable. For compatibility with SmallEiffel,
         -- when the `SmartEiffel' variable is not bound, the value of the
         -- obsolete `SmallEiffel' variable is used (and hence an obsolete
         -- warning is printed).
      require
         variable /= Void
      local
         s: SYSTEM
      do
         if fz_smalleiffel.same_as(variable) or else fz_smalleiffeldirectory.same_as(variable) then
            w_put_string(once "Obsolete %"")
            w_put_string(variable)
            w_put_string(once "%" variable used")
            if file /= Void then
               w_put_string(once " in file %"")
               w_put_string(file)
               w_put_character('%"')
            else
               w_put_character('.')
            end
            w_put_character('%N')
         end
         Result := s.get_environment_variable(variable)
         if Result = Void and then fz_smarteiffeldirectory.same_as(variable) then
            Result := getenv(fz_smarteiffel, file)
            if Result /= Void and then Result.count > 9 then
               system_tools.parent_directory(Result)
               -- for "system.se".
               if Result.count > 3 then
                  -- for the "sys" directory.
                  system_tools.parent_directory(Result)
               end
            end
            debug
               io.put_string(once "SmartEiffelDirectory=")
               io.put_string(Result)
               io.put_new_line
            end
         end
         if Result = Void then
            if fz_smalleiffel.same_as(variable) then
               Result := s.get_environment_variable(fz_smalleiffel)
               if Result /= Void then
                  w_put_string("The old %"SmallEiffel%" variable %
                %is not valid anymore. Please use SmartEiffel.%N")
               end
            elseif fz_smalleiffeldirectory.same_as(variable) then
               Result := getenv(fz_smalleiffel, file)
               if Result /= Void then
                  w_put_string("The old %"SmallEiffelDirectory%" variable %
                %is not valid anymore. Please use SmartEiffelDirectory or,%N%
                               %better still, don't use it at all.%N")
                  if Result.count > 9 then
                     system_tools.parent_directory(Result)
                     -- for "system.se".
                     if Result.count > 3 then
                        -- for the "sys" directory.
                        system_tools.parent_directory(Result)
                     end
                  end
               end
            end
         end
         if Result = Void then
            Result := system_tools.environment(variable)
         end
         if Result = Void then
            w_put_string(once "Environment variable ${")
            w_put_string(variable)
            w_put_character('}')
            if file /= Void then
               w_put_string(once " used in file %"")
               w_put_string(file)
               w_put_character('%"')
            end
            w_put_string(once " is not set.%N")
         end
      end

feature {ANY} -- To echo warnings or error messages (echoing whatever `is_verbose' status).
   w_put_string (msg: STRING) is
      do
         error_stream.put_string(msg)
         error_stream.flush
      end

   w_put_character (c: CHARACTER) is
      do
         error_stream.put_character(c)
         error_stream.flush
      end

   w_put_integer (i: INTEGER) is
      do
         error_stream.put_integer(i)
         error_stream.flush
      end

   w_put_spaces (n: INTEGER) is
      require
         n >= 0
      local
         i: INTEGER
      do
         from
            i := n
         until
            i = 0
         loop
            error_stream.put_character(' ')
            i := i - 1
         end
         error_stream.flush
      end

   w_put_new_line is
      do
         error_stream.put_new_line
         error_stream.flush
      end

feature {NEW_ECHO}
   output_state: INTEGER
         -- See states at the end of the class to know how `echo' is redirected.

   output_stream: OUTPUT_STREAM
         -- Usually `std_output', but may be something else in case of redirection of `echo'.
         -- Note that this stream is always kept flushed.

   error_stream: OUTPUT_STREAM
         -- Usually `std_error', but may be something else in case of redirection of `echo'.
         -- Note that, as `output_stream', this stream is always kept flushed.

   output_path: STRING

feature {COMPILE_TO_C, COMPILE_TO_JVM}
   redirect_output_on (new_output_path: like output_path) is
         -- -output_error_warning_on
      require
         not new_output_path.is_empty
         is_redirected_on_std_output
      local
         text_file_write: TEXT_FILE_WRITE
      do
         create text_file_write.connect_to(new_output_path)
         if text_file_write.is_connected then
            -- We can now safely apply the redirection:
            output_state := state_on_file
            output_stream := text_file_write
            error_stream := text_file_write
            output_path := new_output_path
         else
            w_put_string(once "Unable to write error(s)/warning(s) redirection output file %"")
            w_put_string(new_output_path)
            w_put_string(once "%".%NCommand aborted.%N")
            die_with_code(exit_failure_code)
         end
      ensure
         is_redirected_on_file
      end

feature {COMPILE, SE}
   redirect_output_on_dev_null is
      require
         is_redirected_on_std_output
      do
         create {NULL_OUTPUT_STREAM} output_stream
         error_stream := output_stream
      ensure
         is_redirected_on_dev_null
      end

feature {ANY}
   redirect_output_to (new_output_stream: like output_stream; new_error_stream: like error_stream) is
      require
         new_output_stream.is_connected
         new_error_stream.is_connected
         is_redirected_on_std_output
      do
         output_stream := new_output_stream
         error_stream := new_error_stream
         output_state := state_on_other
      ensure
         is_redirected_on_other
      end

feature {ANY}
   is_redirected_on_std_output: BOOLEAN is
      do
         Result := output_state = state_on_output
      end

   is_redirected_on_dev_null: BOOLEAN is
      do
         Result := output_state = state_on_null
      end

   is_redirected_on_file: BOOLEAN is
      do
         Result := output_state = state_on_file
      end

   is_redirected_on_other: BOOLEAN is
      do
         Result := output_state = state_on_other
      end

feature {ACE, ACE_HANDLER}
   set_verbose is
      do
         is_verbose := True
      ensure
         is_verbose
      end

feature {COMMAND_LINE_TOOLS}
   set_verbose_with (v: BOOLEAN) is
      do
         is_verbose := v
      ensure
         is_verbose = v
      end

feature {ACE_CHECK, COMMAND_LINE_TOOLS}
   unset_verbose is
      do
         is_verbose := False
      ensure
         not is_verbose
      end

feature {}
   fz_smalleiffel: STRING is "SmallEiffel"

   fz_smalleiffeldirectory: STRING is "SmallEiffelDirectory"

   fz_smarteiffeldirectory: STRING is "SmartEiffelDirectory"

feature {}
   state_on_output: INTEGER is 0

   state_on_null: INTEGER is 1

   state_on_file: INTEGER is 2

   state_on_other: INTEGER is 3

invariant
   output_stream.is_connected
   error_stream.is_connected
   is_redirected_on_file = (output_path /= Void and then not output_path.is_empty)

end -- class ECHO
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
