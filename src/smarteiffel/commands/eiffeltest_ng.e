-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_NG
   --
   -- The `eiffeltest' command, new generation.
   --

insert
   COMMAND_LINE_TOOLS
   LOGGING

create {}
   make

feature {ANY}
   command_line_name: STRING "eiffeltest"

   command_line_help_summary: STRING "[
      Usage: eiffeltest [options] <DirectoryPath>

      Run a suite of tests.

      Option summary:

        -force              To force automatic creation of the eiffeltest directory
                             (useful while creating new test directories)

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information
                             (no test run)
        -verbose            Display detailed information about what the program is
                             doing

   ]"

feature {}
   directory_path: STRING
         -- The uppermost directory. The directory where tests are stored.

   force_flag: BOOLEAN

   jobs: INTEGER

   main
      local
         conductor: EIFFELTEST_CLIENT_CONDUCTOR
      do
         log.info.put_line(once "Starting eiffeltest for directory %"#(1)%"." # directory_path)
         if version_flag or else help_flag then
            -- We just finish here.
         else
            create conductor.make(jobs, force_flag, directory_path)
            conductor.run
            if not conductor.success then
               die_with_code(exit_failure_code)
            end
         end
      end

   make
      local
         log_conf: LOG_CONFIGURATION
         conf: STRING_INPUT_STREAM
         bd: BASIC_DIRECTORY; conf_file_name: STRING
         conf_string: ABSTRACT_STRING
      do
         jobs := (system_tools.config.jobs + 1).to_real_32.sqrt.floor.force_to_integer_32
         parse_arguments
         bd.compute_file_path_with(bd.current_working_directory, "eiffeltest_ng.log")
         conf_file_name := bd.last_entry.twin
         conf_string := "[
         log configuration
         root #(1)
         output
            default is
               file "#(3)"
               rotated each day keeping 5
            end
         logger
            #(1) is
               output default
               level #(2)
            end
         end
         ]" # generating_type # level # conf_file_name
         debug
            io.put_line(conf_string)
         end
         io.put_line(once "Master log: #(1)" # conf_file_name)
         create conf.from_string(conf_string)
      end

   level: STRING

   parse_arguments
      local
         i: INTEGER; arg: STRING
      do
         level := once "warning"
         from
            i := 1
         until
            i > argument_count
         loop
            arg := argument(i)
            if is_verbose_flag(arg) then
               level := once "info"
            elseif flag_match(once "debug", arg) then
               level := once "trace"
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
            elseif flag_match(once "servers", arg) then
               i := i + 1
               if i > argument_count or else not argument(i).is_integer then
                  echo.w_put_string(once "-servers must be followed by the number of servers to start.%N")
                  die_with_code(exit_failure_code)
               else
                  jobs := argument(i).to_integer
               end
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

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         check not Result end
      end

   valid_argument_for_ace_mode: STRING ""

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
