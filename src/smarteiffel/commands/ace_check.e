-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ACE_CHECK
   --
   -- The `ace_check' command.
   --

inherit
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "ace_check"

   command_line_help_summary: STRING "[
      Usage: ace_check [options] <ACEfileName>.ace

      Check the syntax of an ACE file.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
        -verbose            Display detailed information about what the program is
                             doing

      Configuration:
        -system             Display the system name
        -root_class         Display the root class name
        -root_procedure     Display the root procedure name

   ]"

feature {}
   make
      local
         argi: INTEGER; arg: STRING
      do
         if argument_count = 0 then
            fatal_bad_usage
         end
         search_for_verbose_flag
         if ace_file_mode then
            from
               argi := 1
            until
               argi > argument_count
            loop
               arg := argument(argi)
               if ace.file_path = arg then
               elseif is_system_flag(arg) then
                  std_output.put_line(ace.executable_name)
               elseif is_root_class_flag(arg) then
                  std_output.put_line(ace.root_class_name.to_string)
               elseif is_root_procedure_flag(arg) then
                  std_output.put_line(ace.root_procedure_name)
               elseif is_valid_argument_for_ace_mode(arg) then
               else
                  fatal_bad_usage
               end
               argi := argi + 1
            end
         else
            std_error.put_line("No ACE file name in command line.")
            die_with_code(exit_failure_code)
         end
      end

   is_system_flag (flag: STRING): BOOLEAN
      do
         Result := flag_match(once "system", flag)
      end

   is_root_class_flag (flag: STRING): BOOLEAN
      do
         Result := flag_match(once "root_class", flag)
      end

   is_root_procedure_flag (flag: STRING): BOOLEAN
      do
         Result := flag_match(once "root_procedure", flag)
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         if is_some_flag(arg) then
            Result := is_version_flag(arg)
               or else is_help_flag(arg)
               or else is_verbose_flag(arg)
               or else is_system_flag(arg)
               or else is_root_class_flag(arg)
               or else is_root_procedure_flag(arg)
         else
            Result := True
         end
      end

   valid_argument_for_ace_mode: STRING "Only the -version, -help, -verbose, -system, -root_class, and -root_procedure%N%
      %flags are allowed.%N"

end -- class ACE_CHECK
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
