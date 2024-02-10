-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMPILE
   --
   -- The `compile' command.
   --

inherit
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "compile"

   command_line_help_summary: STRING "[
      Usage: compile [options] <RootClass> <RootProcedure> ...
         or: compile [options] <ACEfileName>.ace

      Compile the Eiffel source and create an executable program.

      For information about and examples of ACE files, have a look in the
      tutorial/ace directory.

      Most of the following options are not available when using an ACE file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the compiler is
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

      Message styles:
        -flymake_mode       Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

      Optimization and debugging levels (specify one only; default is -all_check):
        -boost              Enable all optimizations, but disable all run-time
                             checks
        -no_check           Enable Void target and system-level checking
        -require_check      Enable precondition checking (implies -no_check)
        -ensure_check       Enable postcondition checking (implies -require_check)
        -invariant_check    Enable class invariant checking (implies -ensure_check)
        -loop_check         Enable loop variant and invariant checking
                             (implies -invariant_check)
        -all_check          Enable 'check' blocks (implies -loop_check)
        -debug              Enable 'debug' blocks
        -flat_check         Each assertion will be executed in no_check mode. Use
                             with any mode from require_check to all_check.

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

      C compilation and run-time system:
        -cc <command>       Specify the C compiler to use
        -c_mode <C mode>    Specify a C mode to use. This option is incompatible
                             with -cc
        -cecil <file>       Take CECIL information from <file>
                             (may be used more than once)
        -o <file>           Put the executable program into <file>
        -no_main            Don't include a main() in the generated executable
        -no_gc              Disable garbage collection
        -bdw_gc             Use Boehm-Demers-Weiser conservative GC
        -gc_info            Enable status messages from the garbage collector
        -no_strip           Don't run 'strip' on the generated executable
        -no_split           Generate only one C file
        -split <split mode> Select the split mode
                             (either 'no', 'legacy', or 'by_type')
        -sedb               Enable sedb, the Liberty Eiffel debugger
        -profile            Generates profile on Eiffel calls at program exit
        -manifest_string_trace
                            Enable the trace support to track non-once manifest
                             string creation
        -clean              Run the 'clean' command at the end
        -no_rescue          Don't compile rescue sections

      Miscellaneous:
        -high_memory_compiler
                            Allow the compile_to_c to use more memory; if you have
                             enough physical memory, compilation should be faster
                             (note: generated C code is not affected)
        -jobs <num>         Run up to <num> instances of the C compiler in parallel
                             (defaults to the number of jobs in General section of
                             the configuration file)

   ]"

feature {}
   make
      local
         argi: INTEGER; arg: STRING
      do
         if argument_count < 1 then
            fatal_bad_usage
         end
         if search_for_echo_redirect_flag /= Void then
            -- Because we must not overwrite the output of `compile_to_c':
            echo.redirect_output_on_dev_null
         end
         search_for_verbose_flag
         search_for_cc_flag
         set_launcher
         if ini_parser.section_has(fz_conf_general, once "c2c") then
            command.copy(ini_parser.section_item(fz_conf_general, once "c2c"))
         else
            system_tools.append_command_path_to(command, once "compile_to_c")
         end
         max_process_count := system_tools.config.jobs
         if ace_file_mode then
            from
               argi := 1
            until
               argi > argument_count
            loop
               arg := argument(argi)
               if is_clean_flag(arg) then
               elseif is_help_flag(arg) then
               elseif is_version_flag(arg) then
               else
                  compile_to_c_pass_argument(arg)
               end
               argi := argi + 1
            end
         else
            parse_command_line(1)
            ace.set_default_level
            system_tools.add_smarteiffel_c_mode_options
            parse_command_line(2)
            ace.command_line_parsed(command_line_name)
         end

         from
            ace.reset_roots
         until
            not ace.has_root
         loop
            do_compile
         end
         if ace.clean then
            from
               ace.reset_roots
            until
               not ace.has_root
            loop
               do_clean
               ace.next_root
            end
         else
            echo.put_string(once "C code not removed.%N")
         end
         echo.put_string(once "Done.%N")
      end

   do_compile
      local
         make_script_name: STRING; last_system_call_status: INTEGER
      do
         from
            system_tools.reset_paths
            ace.reset_roots
         until
            not ace.has_root or else nb_errors /= 0
         loop
            system_tools.next_path
            make_script_name := system_tools.path_make
            echo.file_removing(make_script_name)
            ace.next_root
         end

         last_system_call_status := echo.system_call(command)
         if last_system_call_status /= exit_success_code then
            echo.w_put_string(once "Error occurs while compiling. Compilation process aborted.%N")
            die_with_code(last_system_call_status)
         end

         from
            system_tools.reset_paths
            ace.reset_roots
         until
            not ace.has_root or else nb_errors /= 0
         loop
            system_tools.next_path
            make_script_name := system_tools.path_make

            system_tools.connect_make_file(make_file, make_script_name)
            if not make_file.is_connected then
               echo.w_put_string(once "Internal error (file %"")
               echo.w_put_string(make_script_name)
               echo.w_put_string("%" not found; error(s) during `compile_to_c').%N")
               die_with_code(exit_failure_code)
            end
            echo.put_string(once "C compiling using %"")
            echo.put_string(make_script_name)
            echo.put_string(once "%" command file")
            if max_process_count > 1 then
               echo.put_string(once " (")
               echo.put_integer(max_process_count)
               echo.put_string(once " jobs at a time)")
            end
            echo.put_new_line
            run_make_file
            make_file.disconnect
            system_tools.remove_make_script_and_other_extra_files

            ace.next_root
         end
      end

   do_clean
      local
         make_script_name: STRING; last_system_call_status: INTEGER
      do
         make_script_name := system_tools.path_make
         command.clear_count
         system_tools.append_command_path_to(command, once "clean")
         if echo.is_verbose then
            command.append(once " -verbose")
         end
         command.extend(' ')
         command.append(make_script_name)
         last_system_call_status := echo.system_call(command)
         if last_system_call_status /= 0 then
            die_with_code(last_system_call_status)
         end
      end

   max_process_count: INTEGER
         -- Number of processes that are created to launch c compilers.

   process_count: INTEGER
         -- Number of c-compiler processes that are currently running

   run_make_file
      do
         if max_process_count > 1 then
            run_make_file_parallel
         else
            run_make_file_serial
         end
      end

   run_make_file_serial
      local
         last_system_call_status: INTEGER
      do
         from
            make_file.read_line
         until
            make_file.last_string.count = 0
         loop
            if make_file.last_string.first /= '#' then
               command.copy(make_file.last_string)
               last_system_call_status := echo.system_call(command)
               if last_system_call_status /= 0 then
                  die_with_code(last_system_call_status)
               end
            end
            make_file.read_line
         end
      end

   run_make_file_parallel
      local
         ps: PROCESS_SCHEDULER
      do
         create ps.make
         ps.register_on_launched(agent print_launched(?))
         ps.register_on_failed(agent die_with_code(exit_failure_code))
         ps.register_on_finished(agent check_status(?))
         ps.set_parallel_process_count(max_process_count)
         ps.set_serial -- Sequentially process the lines before the beginning of the c compiling
         from
            make_file.read_line
         until
            make_file.last_string.is_empty
         loop
            if make_file.last_string.is_equal(fz_begin_c_compile) then
               ps.set_parallel
            elseif make_file.last_string.is_equal(fz_end_c_compile) then
               ps.set_serial
            else
               ps.execute_command_line(make_file.last_string, True)
            end
            make_file.read_line
         end
         ps.wait
      end

   print_launched (command_line: STRING)
      do
         echo.put_string(once "System call %"")
         echo.put_string(command_line)
         echo.put_string(once "%".%N")
      end

   check_status (status: INTEGER)
      do
         if status /= 0 then
            die_with_code(status)
         end
      end

   parse_command_line (pass: INTEGER)
      local
         arg, next_arg: STRING; argi: INTEGER
      do
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if is_help_flag(arg) then
               argi := argi + 1
            elseif is_version_flag(arg) then
               argi := argi + 1
            elseif is_clean_flag(arg) then
               argi := argi + 1
            elseif is_jobs_flag(arg, argi) then
               argi := argi + 2
            elseif is_output_error_warning_on_flag(arg, argi) then
               if pass = 2 then
                  compile_to_c_pass_argument(arg)
                  compile_to_c_pass_argument(argument(argi + 1))
               end
               argi := argi + 2
            elseif one_arg_flag(arg) then
               compile_to_c_pass_argument(arg)
               argi := argi + 1
               if argi <= argument_count then
                  arg := argument(argi)
                  compile_to_c_pass_argument(arg)
                  argi := argi + 1
               end
            elseif flag_match(fz_split, arg) then
               compile_to_c_pass_argument(arg)
               argi := argi + 1
               if argi <= argument_count then
                  compile_to_c_pass_argument(argument(argi))
                  argi := argi + 1
               else
                  echo.w_put_string(command_line_name)
                  echo.w_put_string(": missing split mode after -split flag.%N")
                  die_with_code(exit_failure_code)
               end
            elseif flag_match(once "c2c", arg) then
               if argi = argument_count then
                  echo.w_put_string(once "Argument awaited for -c2c.%N")
                  die_with_code(exit_failure_code)
               else
                  if command.has(' ') then
                     command.remove_head(command.first_index_of(' ') - 1)
                  else
                     command.clear_count
                  end
                  command.prepend(argument(argi + 1))
                  argi := argi + 2
               end
            elseif argi < argument_count then
               if pass = 2 then
                  compile_to_c_pass_argument(arg)
                  next_arg := argument(argi + 1)
                  argi := system_tools.extra_arg(arg, argi, next_arg)
                  if argument(argi - 1) = next_arg then
                     compile_to_c_pass_argument(next_arg)
                  end
               else
                  argi := argi + 1
               end
            else
               if pass = 2 then
                  compile_to_c_pass_argument(arg)
                  argi := system_tools.extra_arg(arg, argi, Void)
               else
                  argi := argi + 1
               end
            end
         end
      end

   compile_to_c_pass_argument (arg: STRING)
      do
         command.extend(' ')
         command.append(arg)
      end

   make_file: TEXT_FILE_READ
      once
         create Result.make
      end

   command: STRING
      once
         create Result.make(256)
      end

   one_arg_flag (flag: STRING): BOOLEAN
      do
         Result := fz_o.is_equal(flag)
            or else flag_match(fz_cc, flag)
            or else flag_match(fz_cecil, flag)
            or else flag_match(fz_loadpath, flag)
            or else flag_match(fz_c_mode, flag)
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         Result := is_version_flag(arg)
            or else is_flymake_mode_flag(arg)
            or else is_style_warning_flag(arg)
            or else is_no_warning_flag(arg)
            or else is_verbose_flag(arg)
            or else is_relax_flag(arg)
            or else is_clean_flag(arg)
      end

   is_jobs_flag (arg: STRING; argi: INTEGER): BOOLEAN
      local
         num: STRING; ok: BOOLEAN
      do
         Result := flag_match(fz_jobs, arg)
         if Result then
            ok := argi < argument_count
            if ok then
               num := argument(argi + 1)
               ok := num.is_integer
            end
            if ok then
               max_process_count := num.to_integer
               ok := max_process_count >= 1
            end
            if not ok then
               echo.w_put_string(command_line_name)
               echo.w_put_string(": expecting a positive integer after the -jobs flag.%N")
               die_with_code(exit_failure_code)
            end
         end
      end

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version, -help, -clean, -relax, and -flymake_mode are%N%
      %allowed in ACE file mode.%N"

end -- class COMPILE
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
