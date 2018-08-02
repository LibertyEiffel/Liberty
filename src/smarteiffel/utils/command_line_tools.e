-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class COMMAND_LINE_TOOLS
   --
   -- Some useful tools to handle command line flags. Actually, this class is inherited by all command line
   -- tools of Liberty Eiffel (eg. "compile", "compile_to_c", "finder", "clean", "short",
   -- "pretty", "class_check", etc. and "install" as well).
   --

insert
   ARGUMENTS
   GLOBALS
   FLAG_NAME_LIST
   ACE_HANDLER

feature {ANY}
   command_line_name: STRING
         -- Is supposed to return the name of the command itself (eg. "compile", "compile_to_c", "finder",
         -- "clean", etc.).
      deferred
      end

   command_line_help_summary: STRING
         -- The traditional "-help" flag summary of information about available options.
      deferred
      end

feature {}
   flag_match (flag, arg: STRING): BOOLEAN
         -- Does `arg' smoothly match with the `flag' model?  Where `arg' can be like -`flag' or --`flag' as
         -- well as the classic Windows notation /`flag' too.
         --
         -- GNU-style hyphens are also accepted in place of underscores.
      require
         not flag.is_empty and arg /= Void
      local
         i_flag, i_arg: INTEGER; flag_char, arg_char: CHARACTER
      do
         i_arg := arg.count
         if i_arg >= 2 then
            from
               i_flag := flag.count
               inspect
                  arg.first
               when '-' then
                  if arg.item(2) = '-' then
                     Result := i_flag + 2 = i_arg
                  else
                     Result := i_flag + 1 = i_arg
                  end
               when '/' then
                  Result := i_flag + 1 = i_arg
               else
               end
            until
               not Result or else i_flag = 0
            loop
               flag_char := flag.item(i_flag)
               arg_char := arg.item(i_arg)
               if flag_char.same_as(arg_char) or else (flag_char = '_' and then arg_char = '-') then
                  i_arg := i_arg - 1
                  i_flag := i_flag - 1
               else
                  Result := False
               end
            end
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
         -- Is the `arg' command line argument allowed in ACE file mode ?
      require
         arg /= Void
      deferred
      end

   valid_argument_for_ace_mode: STRING
         -- An explanation to be given to the user when the call to `is_valid_argument_for_ace_mode' returns
         -- False.
      deferred
      end

   is_help_flag (flag: STRING): BOOLEAN
         -- Is it like some traditional help `flag'?
      local
         echo_verbose_status_save: BOOLEAN
      do
         if flag_match(fz_help, flag) or else flag_match(once "h", flag) or else (once "?").is_equal(flag) then
            if not help_flag then
               echo_verbose_status_save := echo.is_verbose
               echo.set_verbose
               echo.put_string(command_line_help_summary)
               echo.set_verbose_with(echo_verbose_status_save)
            end
            inspect
               argument_count
            when 1 then
               die_with_code(exit_success_code)
            when 2 then
               if version_flag then
                  die_with_code(exit_success_code)
               end
            else
            end
            help_flag := True
            Result := True
         end
      end

   help_flag: BOOLEAN
         -- Memory of `is_help_flag'.

   search_for_echo_redirect_flag: STRING
         -- Search for the -output_error_warning_on flag among arguments in order to apply redirection as
         -- early as possible (should be called first when the command accept this flag).
         -- A non Void `Result' indicates the redirection path.
      local
         argi: INTEGER; arg: STRING; file_tools: FILE_TOOLS
      do
         from
            argi := 1
         until
            not valid_arg_index(argi)
         loop
            arg := argument(argi)
            if is_output_error_warning_on_flag(arg, argi) then
               if Result = Void then
                  Result := argument(argi + 1)
                  argi := argi + 2
                  if file_tools.file_exists(Result) then
                     file_tools.delete(Result)
                     if not file_tools.last_delete_succeeded or else file_tools.file_exists(Result) then
                        echo.w_put_string("Unable to remove existing the file %"")
                        echo.w_put_string(Result)
                        echo.w_put_string("%" specified for the -is_output_error_warning_on flag.%N")
                        die_with_code(exit_failure_code)
                     end
                  end
               else
                  echo.w_put_string("Flag -is_output_error_warning_on must be used only once.%NYour command was:%N")
                  from
                     echo.w_put_string(argument(0))
                     argi := 1
                  until
                     not valid_arg_index(argi)
                  loop
                     echo.w_put_character(' ')
                     echo.w_put_string(argument(argi))
                     argi := argi + 1
                  end
                  echo.w_put_character('%N')
                  die_with_code(exit_failure_code)
               end
            else
               argi := argi + 1
            end
         end
      end

   search_for_verbose_flag
         -- Search the -verbose flag among arguments in order to become verbose as soon as possible (should be
         -- called after `search_for_echo_redirect_flag' when the command accept this flag).
      local
         argi: INTEGER; arg: STRING; found: BOOLEAN
      do
         from
            argi := 1
         until
            found or else not valid_arg_index(argi)
         loop
            arg := argument(argi)
            if is_verbose_flag(arg) then
               found := True
            else
               argi := argi + 1
            end
         end
         echo.put_line(smart_eiffel.copyright)
      end

   valid_arg_index (i: INTEGER): BOOLEAN
      do
         Result := i.in_range(1, argument_count)
      end

   search_for_cc_flag
         -- To know about the C compiler as soon as possible.
      local
         i, argc: INTEGER; c_compiler: STRING
      do
         from
            argc := argument_count
            i := 1
         until
            i > argc
         loop
            if flag_match(fz_cc, argument(i)) then
               if i < argc then
                  i := i + 1
                  c_compiler := argument(i)
                  i := argc + 1
               end
            end
            i := i + 1
         end
         system_tools.set_c_compiler(c_compiler)
      end

   ace_file_mode: BOOLEAN
         -- Search for some ACE file name in the command line arguments.  When some argument has the
         -- appropriate suffix (ie. ".ace" or ".ACE"), the `ace' parser is automatically launched in order to
         -- parse this configuration file. The caller is then notified that we are now in ACE mode (the result
         -- is True). When we are in ACE mode, remaining allowed arguments are automatically handled.
      local
         i: INTEGER; arg: STRING
      do
         if system_tools /= Void then
            -- Be sure system_tools is instanciated before reading the ACE file (otherwise we have a buffer
            -- conflict)
         end
         -- First, search for some *.ace or *.ACE file name:
         from
            i := 1
         until
            Result or else i > argument_count
         loop
            arg := argument(i)
            if arg.has_suffix(once ".ace") or else arg.has_suffix(once ".ACE") then
               Result := True
               ace.analyse_ace_file(arg)
            end
            i := i + 1
         end
         if Result then
            -- Second, check that other arguments are allowed in ACE file mode:
            from
               i := 1
            until
               i > argument_count
            loop
               arg := argument(i)
               if arg.is_equal(ace.file_path) then
               elseif is_valid_argument_for_ace_mode(arg) then
               else
                  echo.w_put_string("Flag or argument %"")
                  echo.w_put_string(arg)
                  echo.w_put_string("%" is not allowed when an ACE file (")
                  echo.w_put_string(ace.file_path)
                  echo.w_put_string(") is used.%N")
                  echo.w_put_string(valid_argument_for_ace_mode)
                  fatal_bad_usage
               end
               i := i + 1
            end
         end
      end

   is_some_flag (arg: STRING): BOOLEAN
      do
         if not arg.is_empty then
            Result := arg.first = '-' or else arg.first = '/' or else arg.is_equal(once "?")
         end
      end

   is_relax_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_relax, flag) then
            Result := True
            ace.set_relax
         end
      end

   is_case_insensitive_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_case_insensitive, flag) then
            echo.w_put_string(command_line_name)
            echo.w_put_string(once ": the %"-case_insensitive%" flag is no longer supported.%N")
            Result := True
         end
      end

   is_style_warning_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_style_warning, flag) then
            Result := True
            error_handler.set_style_warning
         end
      end

   is_flymake_mode_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_flymake_mode, flag) then
            Result := True
            error_handler.set_flymake_mode
         end
      end

   is_no_warning_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_no_warning, flag) then
            Result := True
            error_handler.set_no_warning
         end
      end

   is_trace_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_sedb, flag) then
            Result := True
         end
         if flag_match(fz_trace, flag) then
            echo.w_put_string(command_line_name)
            echo.w_put_string(once ": the new name of the %"-trace%" flag is now %"-sedb%".%N")
            Result := True
         end
         if Result then
            ace.set_default_trace
         end
      end

   is_verbose_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_verbose, flag) then
            echo.set_verbose
            Result := True
         end
      end

   is_clean_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_clean, flag) then
            ace.set_clean(True)
            Result := True
         end
      end

   is_version_flag (flag: STRING): BOOLEAN
      do
         Result := is_version_flag_no_exit(flag)
         if Result then
            inspect
               argument_count
            when 1 then
               die_with_code(exit_success_code)
            when 2 then
               if help_flag then
                  die_with_code(exit_success_code)
               end
            else
            end
         end
      end

   is_version_flag_no_exit (flag: STRING): BOOLEAN
      do
         if flag_match(fz_version, flag) or else flag_match(once "v", flag) then
            if not version_flag then
               smart_eiffel.print_version
               version_flag := True
            end
            Result := True
         end
      end

   version_flag: BOOLEAN
         -- Memory of `is_version_flag'.

   is_a_compilation_level_flag (flag: STRING): BOOLEAN
         -- Is the `flag' one of this list: "-boost", "-no_check", "-require_check", "-ensure_check",
         -- "-invariant_check", "-loop_check", "-all_check", or "-debug_check" ?
      do
         if flag_match(fz_boost, flag) then
            Result := True
            ace.set_boost
         elseif flag_match(fz_no_check, flag) then
            Result := True
            ace.set_no_check
         elseif flag_match(fz_conf_require_check, flag) then
            Result := True
            ace.set_require_check
         elseif flag_match(fz_conf_ensure_check, flag) then
            Result := True
            ace.set_ensure_check
         elseif flag_match(fz_conf_invariant_check, flag) then
            Result := True
            ace.set_invariant_check
         elseif flag_match(fz_conf_loop_check, flag) then
            Result := True
            ace.set_loop_check
         elseif flag_match(fz_conf_all_check, flag) then
            Result := True
            ace.set_all_check
         elseif flag_match(fz_conf_debug_check, flag) then
            Result := True
            ace.set_debug_check
         end
         if Result then
            check_for_level(flag)
         end
      end

   is_debug_flag (flag: STRING): BOOLEAN
         -- Is the `flag' "-debug"
      do
         if flag_match(fz_debug, flag) then
            Result := True
            ace.set_command_line_debug
         end
      end

   is_flat_check_flag (flag: STRING): BOOLEAN
         -- Is the `flag' "-flat_check"
      do
         if flag_match(fz_conf_flat_check, flag) then
            Result := True
            ace.set_flat_check
         end
      end

   is_output_error_warning_on_flag (flag: STRING; argi: INTEGER): BOOLEAN
      do
         if flag_match(once "output_error_warning_on", flag) then
            Result := True
            if argi >= argument_count then
               echo.w_put_string(command_line_name)
               echo.w_put_string(": missing file path name after -output_error_warning_on flag.%N")
               die_with_code(exit_failure_code)
            end
         end
      end

   is_cecil_flag (flag: STRING; argi: INTEGER): BOOLEAN
      do
         if flag_match(fz_cecil, flag) then
            Result := True
            if argi < argument_count then
               cecil_pool.add_cecil_file(argument(argi + 1))
            else
               echo.w_put_string(command_line_name)
               echo.w_put_string(": missing file name after -cecil flag.%N")
               die_with_code(exit_failure_code)
            end
         end
      end

   is_o_flag (flag: STRING; argi: INTEGER): BOOLEAN
      local
         executable_name: STRING
      do
         if fz_o.is_equal(flag) then
            Result := True
            if argi < argument_count then
               executable_name := argument(argi + 1)
               if executable_name.has_suffix(eiffel_suffix) then
                  echo.w_put_string("Bad executable name: %"")
                  echo.w_put_string(executable_name)
                  echo.w_put_string("%". Must not use Eiffel source file suffix %
                   %with option %"-o <executable_name>%".")
                  die_with_code(exit_failure_code)
               end
               ace.set_executable_name(executable_name)
            else
               echo.w_put_string(command_line_name)
               echo.w_put_string(": missing output name after -o flag.%N")
               die_with_code(exit_failure_code)
            end
         end
      end

   is_safety_check_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_safety_check, flag) then
            ace.set_safety_check
            Result := True
         end
      end

   is_manifest_string_trace_flag (flag: STRING): BOOLEAN
      do
         if flag_match(fz_manifest_string_trace, flag) then
            ace.set_manifest_string_trace
            Result := True
         end
      end

   is_no_rescue_flag (flag: STRING): BOOLEAN
      do
         if flag_match(once "no_rescue", flag) then
            eiffel_parser.set_no_rescue
            Result := True
         end
      end

   is_high_memory_compiler (flag: STRING): BOOLEAN
      do
         if flag_match(fz_high_memory_compiler, flag) then
            ace.set_high_memory_compiler
            Result := True
         end
      end

   is_profile (flag: STRING): BOOLEAN
      do
         if flag_match(fz_profile, flag) then
            ace.set_profile
            Result := True
         end
      end

   is_run (flag: STRING): BOOLEAN
      do
         if flag_match(fz_flag_run, flag) then
            ace.set_run
            Result := True
         end
      end

   level_flag: STRING

   check_for_level (new_level_flag: STRING)
      do
         if level_flag /= Void then
            if not level_flag.same_as(new_level_flag) then
               echo.w_put_string(command_line_name)
               echo.w_put_string(": level is already set to ")
               echo.w_put_string(level_flag)
               echo.w_put_string(". Bad flag ")
               echo.w_put_string(new_level_flag)
               echo.w_put_string(once "%".%N")
               die_with_code(exit_failure_code)
            end
         else
            level_flag := new_level_flag
         end
      end

   unknown_flag_exit (flag: STRING)
      do
         echo.w_put_string(command_line_name)
         echo.w_put_string(": unknown flag %"")
         echo.w_put_string(flag)
         echo.w_put_string("%".%N")
         fatal_bad_usage
      end

   fatal_bad_usage
      do
         system_tools.bad_use_exit(command_line_name, command_line_help_summary)
      end

end -- class COMMAND_LINE_TOOLS
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
