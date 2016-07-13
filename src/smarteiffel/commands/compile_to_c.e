-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class COMPILE_TO_C
   --
   -- The `compile_to_c' command.
   --

inherit
   COMMAND_LINE_TOOLS

create {}
   make, make_shrink

feature {ANY}
   command_line_name: STRING "compile_to_c"

   command_line_help_summary: STRING "[
      Usage: compile_to_c [options] <RootClass> <RootProcedure> ...
         or: compile_to_c [options] <ACEfileName>.ace

      Compile the Eiffel source to ANSI C.

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
        -relax              Perform less checks by considering less dead code, hence
                             using less memory and less compilation time. Useful to
                             prototype or to deliver safe code. (Useful too for very
                             small computers.)

      Message styles:
         -flymake_mode      Display messages in a compact format suitable for
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
        -no_rescue          Don't compile rescue sections

      Miscellaneous:
        -high_memory_compiler
                            Allow the compile_to_c to use more memory; if you have
                             enough physical memory, compilation should be faster
                             (note: generated C code is not affected)

   ]"

feature {}
   make_shrink
      do
         shrink_generic_types_memory.set_item(True)
         make
      end

   make
         -- Command line parsing has two passes: first, options are parsed and then, the extra options are added.
      local
         string_command_line: STRING_COMMAND_LINE; echo_redirect: STRING
      do
         string_command_line.set_command_line_name(command_line_name)
         if argument_count < 1 then
            fatal_bad_usage
         end
         echo_redirect := search_for_echo_redirect_flag
         if echo_redirect /= Void then
            echo.redirect_output_on(echo_redirect)
         end
         search_for_verbose_flag
         search_for_cc_flag
         set_cecil_pool
         system_tools.set_plugin_factory(create {C_PLUGIN_FACTORY}.make)
         eiffel_parser.set_drop_comments
         if ace_file_mode then
            system_tools.add_smarteiffel_c_mode_options
         else
            -- First pass:
            parse_command_line(1)
            -- Before the second pass, we set the C mode; it is used later on
            -- to correctly recognize the "extra arguments". Options are
            -- parsed again: that is not very efficient (to say the least),
            -- but it works.
            ace.set_default_level
            system_tools.add_smarteiffel_c_mode_options
            -- Second pass:
            parse_command_line(2)
            -- Now finish the work.
            ace.command_line_parsed(command_line_name)
         end
         cpp.prepare_memory
         smart_eiffel.compile(cpp)
         id_provider.disk_save
         string_aliaser.echo_information
         echo.before_exit_close
      end

   parse_command_line (pass: INTEGER)
      local
         argi: INTEGER; arg: STRING
         mhf: MEMORY_HANDLER_FACTORY
      do
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if is_help_flag(arg) then
               argi := argi + 1
            elseif is_relax_flag(arg) then
               argi := argi + 1
            elseif is_case_insensitive_flag(arg) then
               argi := argi + 1
            elseif is_flymake_mode_flag(arg) then
               argi := argi + 1
            elseif is_style_warning_flag(arg) then
               argi := argi + 1
            elseif is_no_warning_flag(arg) then
               argi := argi + 1
            elseif is_version_flag(arg) then
               argi := argi + 1
            elseif is_verbose_flag(arg) then
               argi := argi + 1
            elseif is_a_compilation_level_flag(arg) then
               argi := argi + 1
            elseif is_debug_flag(arg) then
               argi := argi + 1
            elseif is_flat_check_flag(arg) then
               argi := argi + 1
            elseif is_cecil_flag(arg, argi) then
               argi := argi + 2
            elseif is_o_flag(arg, argi) then
               argi := argi + 2
            elseif flag_match(fz_no_main, arg) then
               ace.set_no_main
               argi := argi + 1
            elseif flag_match(once "no_gc", arg) then
               mhf.set_no_gc
               argi := argi + 1
            elseif flag_match(once "bdw_gc", arg) then
               mhf.set_bdw_gc
               argi := argi + 1
            elseif flag_match(fz_gc_info, arg) then
               mhf.set_info_flag
               argi := argi + 1
            elseif is_safety_check_flag(arg) then
               argi := argi + 1
            elseif is_manifest_string_trace_flag(arg) then
               argi := argi + 1
            elseif is_no_rescue_flag(arg) then
               argi := argi + 1
            elseif flag_match(fz_no_strip, arg) then
               system_tools.set_no_strip
               argi := argi + 1
            elseif flag_match(fz_split, arg) then
               argi := argi + 1
               if argi <= argument_count then
                  ace.set_split(argument(argi))
                  argi := argi + 1
               else
                  echo.w_put_string(command_line_name)
                  echo.w_put_string(": missing split mode after -split flag.%N")
                  die_with_code(exit_failure_code)
               end
            elseif flag_match(fz_no_split, arg) then
               ace.set_no_split(True)
               argi := argi + 1
            elseif is_trace_flag(arg) then
               argi := argi + 1
            elseif is_high_memory_compiler(arg) then
               argi := argi + 1
            elseif is_profile(arg) then
               argi := argi + 1
            elseif is_output_error_warning_on_flag(arg, argi) then
               argi := argi + 2
            elseif flag_match(once "precompile_header", arg) then
               argi := argi + 1
               if pass = 2 then
                  if system_tools.precompile_header_supported then
                     ace.set_precompile_header
                  else
                     echo.w_put_string(once "[
                                             Liberty Eiffel does not (yet) support precompiled headers for
                                             this C compiler. Please drop an e-mail liberty-eiffel@gnu.org%N
                                             ]")
                  end
               end
            elseif flag_match(fz_loadpath, arg) then
               if pass = 1 then
                  -- loadpath setting is only parsed in pass 1, otherwise there will be double definitions
                  if argi < argument_count then
                     system_tools.add_loadpath_file(argument(argi + 1))
                     argi := argi + 2
                  else
                     echo.w_put_string(command_line_name)
                     echo.w_put_string(once ": missing loadpath file path after -loadpath flag.%N")
                     die_with_code(exit_failure_code)
                  end
               else
                  argi := argi + 2
               end
            elseif flag_match(fz_c_mode, arg) then
               if pass = 1 then
                  -- c_mode is only parsed in pass 1
                  if argi < argument_count then
                     system_tools.set_alternate_c_mode(argument(argi + 1))
                     argi := argi + 2
                  else
                     echo.w_put_string(command_line_name)
                     echo.w_put_string(once ": missing C mode name after -c_mode flag.%N")
                     die_with_code(exit_failure_code)
                  end
               else
                  argi := argi + 2
               end
            elseif flag_match(fz_cc, arg) then
               if argi < argument_count or else pass /= 1 then
                  argi := argi + 2
               else
                  echo.w_put_string(command_line_name)
                  echo.w_put_string(": missing compiler name after -cc flag.%N")
                  die_with_code(exit_failure_code)
               end
            elseif pass = 2 then
               -- extra args are only parsed in pass 2
               if argi < argument_count then
                  argi := system_tools.extra_arg(arg, argi, argument(argi + 1))
               else
                  argi := system_tools.extra_arg(arg, argi, Void)
               end
            else
               argi := argi + 1
            end
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         Result := is_version_flag(arg)
            or else is_flymake_mode_flag(arg)
            or else is_style_warning_flag(arg)
            or else is_no_warning_flag(arg)
            or else is_verbose_flag(arg)
            or else is_relax_flag(arg)
      end

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version, -help, -relax, and -flymake_mode are allowed%N%
       %in ACE file mode.%N"

end -- class COMPILE_TO_C
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
