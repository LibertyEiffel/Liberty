-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SE_DEBUG
   --
   -- The `sedb' command. Used to debug programs compiled with
   --   -sedb -DSEDB_NAMED_PIPES -DSEDB_NAMED_PIPES_DIRECTORY="/my/sedb/directory"
   --

insert
   GLOBALS
   COMMAND_LINE_TOOLS

create {}
   make

feature {ANY}
   command_line_name: STRING "sedb"

   command_line_help_summary: STRING "[
      Usage: sedb [options] <DirectoryPath>

      sedb is used to talk to SmartEiffel's debugger when it is used with named
      pipes. That is especially useful when debugging multi-process programs.

      Option summary:

      Information:
        -help               Display this help information
        -version            Display Liberty Eiffel version information
   ]"

feature {}
   make
      local
         arg: STRING; runner: SEDB_RUNNER
      do
         set_launcher
         search_for_verbose_flag
         if argument_count /= 1 then
            system_tools.bad_use_exit(argument(0), command_line_help_summary)
         else
            arg := argument(1)
            if is_help_flag(arg) then
            elseif is_version_flag(arg) then
            else
               if not arg.is_empty then
                  create runner.run(arg)
               else
                  echo.w_put_string(once "Directory name expected.%N")
                  die_with_code(exit_failure_code)
               end
            end
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         check
            False
         end
      end

   valid_argument_for_ace_mode: STRING
      do
         check
            False
         end
      end

end -- class SE_DEBUG
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
