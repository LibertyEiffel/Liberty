-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CLASS_CHECK
   --
   -- The `class_check' command.
   --
   -- Note: actually, from the implementation point of view, doing "class_check my_class"
   -- equivalent to run "short -all_features my_class > /dev/null".
   --

inherit
   CLASS_CHECKER

create {}
   make

feature {ANY}
   command_line_name: STRING "class_check"

   command_line_help_summary: STRING "[
      Usage: class_check [options] <ClassName>
         or: class_check [options] <ACEfileName>.ace <ClassName>

      Check the syntax and semantics of a class file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      Warning levels:
        -style_warning      Print warnings about style violations
        -no_warning         Don't print any warnings

      Message styles:
        -flymake_mode       Display messages in a compact format suitable for
                             processing by tools such as Emacs' Flymake mode

      Class lookup:
        -loadpath <file>    Specify an extra loadpath file to read

   ]"

feature {}
   make
      do
         create {NULL_OUTPUT_STREAM} output
         start
         smart_eiffel.very_last_information
      end

   parse_arguments
      local
         i: INTEGER; arg: STRING
      do
         -- A `short' command is running:
         -- yes, `class_check' is really a "short > /dev/null" command
         smart_eiffel.set_short_or_class_check_flag
         if argument_count = 0 then
            fatal_bad_usage
         end
         if ace_file_mode then
         else
            from
               i := 1
            until
               i > argument_count
            loop
               arg := argument(i)
               if flag_match(fz_loadpath, arg) then
                  if i = argument_count then
                     fatal_bad_usage
                  else
                     system_tools.add_loadpath_file(argument(i + 1))
                     i := i + 1
                  end
               elseif is_valid_argument_for_ace_mode(arg) then
               else
                  fatal_bad_usage
               end
               i := i + 1
            end
            ace.command_line_parsed(command_line_name)
         end
         if help_flag then
            die_with_code(exit_success_code)
         end
         if version_flag then
            die_with_code(exit_success_code)
         end
         from
            ace.reset_roots
         until
            not ace.has_root
         loop
            root_class_names.add_last(ace.root_class_name)
            ace.next_root
         end
         if root_class_names.is_empty then
            fatal_bad_usage
         end
         set_client(Void)
         set_format(once "plain")
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
         -- Because of style options, this function always returns True.
         -- Furthermore, this function is used for non ACE mode too.
      do
         Result := True
         if is_version_flag(arg) then
         elseif is_verbose_flag(arg) then
         elseif is_help_flag(arg) then
         elseif is_case_insensitive_flag(arg) then
         elseif is_no_warning_flag(arg) then
         elseif is_flymake_mode_flag(arg) then
         elseif is_style_warning_flag(arg) then
         elseif arg.item(1) = '-' then
            Result := False
         else
            if arg.has_suffix(eiffel_suffix) then
               arg.remove_suffix(eiffel_suffix)
            end
            ace.set_root_class_name_using(arg)
         end
      end

   valid_argument_for_ace_mode: STRING "Only the flags -version, -help, -no_warning, -style_warning, and -flymake_mode%N%
      %are allowed in ACE file mode.%N"

end -- class CLASS_CHECK
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
