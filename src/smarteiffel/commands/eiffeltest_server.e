-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class EIFFELTEST_SERVER
   --
   -- The eiffeltest server executable
   --
   -- Launches tests in directories, *not* recursively (recursivity
   -- is managed by the eiffeltest client, which scans subdirectories
   -- and dispatches work among n servers)
   --

insert
   COMMAND_LINE_TOOLS
   LOGGING
   PROCESS_WAIT
      rename
         in as waitpid_in,
         job as waitpid_job
      end

create {}
   make

feature {ANY}
   command_line_name: STRING "eiffeltest_server"

   command_line_help_summary: STRING "[
      Usage: eiffeltest_server <port>

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information (no test run)
        -verbose            Display detailed information about what eiffeltest is doing

      ]"

feature {}
   port: INTEGER

   main
      local
         stack: LOOP_STACK
         socket: EIFFELTEST_SERVER_SOCKET
      do
         log.info.put_line(once "Server #(1) starting..." # port.out)
         create stack.make
         stack.add_job(waitpid_job)
         create socket.make(port, agent stack.add_job(?), agent stack.break)
         stack.add_job(socket)
         log.info.put_line(once "Server #(1) started." # port.out)
         stack.run
      end

   make
      local
         log_conf: LOG_CONFIGURATION
         conf: STRING_INPUT_STREAM
         bd: BASIC_DIRECTORY; conf_file_name: STRING
         conf_string: ABSTRACT_STRING
      do
         parse_arguments
         bd.compute_file_path_with(bd.current_working_directory, "eiffeltest_server-#(1).log" # port.out)
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
         io.put_line(once "Slave log: #(1)" # conf_file_name)
         create conf.from_string(conf_string)
         log_conf.load(conf, Void, Void, agent main)
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
            elseif arg.is_integer then
               if port > 0 then
                  echo.w_put_string(once "se test_server (eiffeltest_server): must give only one port as argument.%N")
                  echo.w_put_string(once "Found first port ")
                  echo.w_put_integer(port)
                  echo.w_put_string(once " then port ")
                  echo.w_put_string(arg)
                  echo.w_put_string(once ".%N")
                  die_with_code(exit_failure_code)
               end
               port := arg.to_integer
               if port <= 0 then
                  echo.w_put_string(once "se test_server (eiffeltest_server): must give a positive integer as port argument.%N")
                  echo.w_put_string(once "Found port ")
                  echo.w_put_string(arg)
                  echo.w_put_string(once ".%N")
                  die_with_code(exit_failure_code)
               end
            else
               echo.w_put_string(once "se test_server (eiffeltest_server): %"")
               echo.w_put_string(arg)
               echo.w_put_string(once "%": unknown argument or option.%N")
               die_with_code(exit_failure_code)
            end
            i := i + 1
         end
         if port = 0 then
            echo.w_put_string(once "se test_server (eiffeltest_server): must give a port as argument (the port to listen to).%N")
            die_with_code(exit_failure_code)
         end
      end

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN
      do
         check not Result end
      end

   valid_argument_for_ace_mode: STRING ""

end -- class EIFFELTEST_SERVER
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
-- Copyright (C) 2013-2016: Cyril ADRIAN <cyril.adrian@gmail.com>
--
-- http://www.gnu.org/software/liberty-eiffel/
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
