-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LLVMEC
   --
   -- `llvmec'' command, the LLVM-based Eiffel compiler
   --

   -- Mainly copied from RUN.

   -- Todo: replace current argument parsing which relies on side effects to a side-effects free implementation.
inherit
   COMMAND_LINE_TOOLS
      redefine
         valid_arg_index
      end

insert
   LLVM_GLOBALS

create {}
   make

feature {ANY}
   command_line_name: STRING "llvmec"

   command_line_help_summary: STRING "[
      Usage: llvmec [options] <RootClass> <RootProcedure> ...
         or: llvmec [options] <ACEfileName>.ace

      For information about and examples of ACE files, have a look
      in the tutorial/ace directory.

      Most of the following options are not available when using
      an ACE file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display SmartEiffel version information
        -verbose            Display detailed information about what the compiler
                             doing

      Warning and Error levels:
        -style_warning      Do print warnings about style violations
        -no_warning         Don't print any warnings
        -relax              Performs less checks by considering less dead code, hence
                             using less memory and less compilation time. Useful to
                             prototype or to deliver safe code. (Useful too for very
                             small computers.)

      Optimization and debugging levels (specify at most one; default is -all_check):
        -no_check           Enable Void target and system-level checking
        -require_check      Enable precondition checking (implies -no_check)
        -ensure_check       Enable postcondition checking (implies -require_check)
        -invariant_check    Enable class invariant checking (implies -ensure_check)
        -loop_check         Enable loop variant and invariant checking
                             (implies -invariant_check)
        -all_check          Enable 'check' blocks (implies -loop_check)
        -debug              Enable 'debug' blocks
        -flat_check         Each assertion will be executed in no_check mode
                            Use with any mode from require_check to all_check

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

      Miscellaneous:
        -high_memory_compiler
                            Allow the compile_to_c to use more memory; if you
                            have enough physical memory, compilation should
                            be faster (note: generated C code is not affected)

      ]"

feature {}
   make
         -- Command line parsing has two passes: first, options are parsed and then, the extra options are added.
      local
         string_command_line: STRING_COMMAND_LINE; echo_redirect: STRING
      do
         user_args.add_first(Void)
         system_tools.set_plugin_factory(create {LLVM_PLUGIN_FACTORY}.make)
                 eiffel_parser.set_drop_comments
         string_command_line.set_command_line_name(command_line_name)
         if argument_count < 1 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
                 -- require exporting to LLVMEC
         echo_redirect := search_for_echo_redirect_flag
         if echo_redirect /= Void then
             echo.redirect_output_on(echo_redirect)
         end
         search_for_verbose_flag
         if not ace_file_mode then
            -- First pass:
            parse_command_line(1)
            ace.set_default_level
            -- Second pass:
            parse_command_line(2)
            -- Now finish the work.
            ace.command_line_parsed(command_line_name)
         end
         user_args.put(ace.root_class_name.to_string, 0)
         smart_eiffel.compile(llvm_bytecode_emitter)
         --echo.before_exit_close
      end

   parse_command_line (pass: INTEGER)
      local
         argi: INTEGER; arg: STRING; in_user_args: BOOLEAN
      do
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if in_user_args then
               if pass = 1 then
                  user_args.add_last(arg)
                  argi := argi + 1
               else
                  argi := argument_count + 1
               end
            elseif arg.is_equal(once "--") then
               in_user_args := True
               argi := argi + 1
            elseif is_help_flag(arg) then
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
            elseif is_safety_check_flag(arg) then
               argi := argi + 1
            elseif is_manifest_string_trace_flag(arg) then
               argi := argi + 1
            elseif is_trace_flag(arg) then
               argi := argi + 1
            elseif is_high_memory_compiler(arg) then
               argi := argi + 1
            elseif is_profile(arg) then
               argi := argi + 1
            elseif is_output_error_warning_on_flag(arg, argi) then
               argi := argi + 2
            elseif flag_match(fz_loadpath, arg) then
               if pass = 1 then
                  -- loadpath setting is only parsed in pass 1, otherwise there will be double definitions
                  if argi < argument_count then
                     system_tools.add_loadpath_file(argument(argi + 1))
                     argi := argi + 2
                  else
                    --  echo.w_put_string(command_line_name)
                    --  echo.w_put_string(once ": missing loadpath file path after -loadpath flag.%N")
                     die_with_code(exit_failure_code)
                  end
               else
                  argi := argi + 2
               end
            elseif pass = 2 then
               if ace.root_class_name = Void then
                  ace.set_root_class_name_using(arg)
               else
                  ace.set_root_procedure_name(arg)
               end
               argi := argi + 1
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

   valid_argument_for_ace_mode: STRING "Only the flags -verbose, -version, -help and -relax are allowed in ACE%Nfile mode.%N"

   valid_arg_index (i: INTEGER): BOOLEAN
      do
         Result := Precursor(i) and then not argument(i).is_equal(once "--")
      end

end -- class LLVMEC
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
-- Copyright (C) 2012-2017: Paolo Redaelli - Liberty Eiffel
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://libertyeiffel.blogspot.com https://github.com/LibertyEiffel/Liberty
-- ------------------------------------------------------------------------------------------------------------------------------
