-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_NG
   --
   -- The `eiffeltest' command, new generation.
   --

insert
   COMMAND_LINE_TOOLS

creation {}
   main

feature {ANY}
   command_line_name: STRING is "eiffeltest"

   command_line_help_summary: STRING is "[
      Usage: eiffeltest [options] <DirectoryPath>

      Option summary:

        -force              To force automatic creation of the eiffeltest directory
                            (useful while creating new test directories)

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information (no test run)
        -verbose            Display detailed information about what eiffeltest is doing

      ]"

feature {}
   directory_path: STRING
         -- The uppermost directory. The directory where tests are stored.

   force_flag: BOOLEAN

   main is
      local
         conductor: EIFFELTEST_CLIENT_CONDUCTOR
      do
         parse_arguments
         echo.put_string(once "Starting eiffeltest for directory %"")
         echo.put_string(directory_path)
         echo.put_string(once "%".%N")

         if version_flag or else help_flag then
            -- We just finish here.
         else
            create conductor.make(system_tools.config.jobs, force_flag, directory_path.intern)
            conductor.run
            die_with_code(conductor.status)
         end
      end

   parse_arguments is
      local
         i: INTEGER; arg: STRING
      do
         search_for_verbose_flag
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_verbose_flag(arg) then
               check
                  already_done: echo.is_verbose
               end
            elseif is_version_flag(arg) then
               check
                  version_flag
               end
            elseif is_help_flag(arg) then
               check
                  help_flag
               end
            elseif flag_match(once "force", arg) then
               force_flag := True
            elseif file_tools.is_directory(arg) then
               if directory_path /= Void then
                  echo.w_put_string(once "se test (eiffeltest): must give only one directory as argument.%N")
                  echo.w_put_string(once "Found first directory %"")
                  echo.w_put_string(arg)
                  echo.w_put_string(once "%" then directory %"")
                  echo.w_put_string(directory_path)
                  echo.w_put_string(once "%".%N")
                  die_with_code(exit_failure_code)
               end
               directory_path := arg
            else
               echo.w_put_string(once "se test (eiffeltest): %"")
               echo.w_put_string(arg)
               echo.w_put_string(once "%": unknown argument or option.%N")
               die_with_code(exit_failure_code)
            end
            i := i + 1
         end
         if directory_path = Void then
            echo.w_put_string(once "se test (eiffeltest): must give a directory as argument (where tests are stored).%N")
            die_with_code(exit_failure_code)
         end
      end

   file_tools: FILE_TOOLS

end -- class EIFFELTEST_NG
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
