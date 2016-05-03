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

      The ace_check command helps you to check the syntax of your ACE file.

      Option summary:
        -help               Display this help information
        -version            Display Liberty Eiffel version information

        ]"

feature {}
   make
      local
         argi: INTEGER; arg, view: STRING; verbose: BOOLEAN; string_command_line: STRING_COMMAND_LINE
      do
         if argument_count = 0 then
            system_tools.bad_use_exit(command_line_name, command_line_help_summary)
         end
         string_command_line.set_command_line_name(command_line_name)
         if ace_file_mode then
         end
         verbose := echo.is_verbose
         echo.unset_verbose
         from
            argi := 1
         until
            argi > argument_count
         loop
            arg := argument(argi)
            if ace.file_path = arg then
            elseif is_valid_argument_for_ace_mode(arg) then
            else
               std_error.put_string("Bad argument: %"")
               std_error.put_string(arg)
               std_error.put_string("%".%N")
               die_with_code(exit_failure_code)
            end
            argi := argi + 1
         end
         if ace.file_path = Void then
            std_error.put_string("No ACE file name in command line.%N")
            die_with_code(exit_failure_code)
         end
         if verbose then
            echo.set_verbose
         end
         create view.make(2048)
         ace.pretty_in(view)
         --*** The view is not a valid ace file, disabling it <FM-11/07/2007>
         --*** std_output.put_string(view)
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         if is_some_flag(arg) then
            if is_version_flag(arg) or else is_help_flag(arg) then
               Result := True
            end
         else
            Result := True
         end
      end

   valid_argument_for_ace_mode: STRING "Only the -version and -help flags are allowed.%N"

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
