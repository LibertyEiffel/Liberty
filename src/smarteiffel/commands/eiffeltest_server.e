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

create {}
   make

feature {ANY}
   command_line_name: STRING is "eiffeltest_server"

   command_line_help_summary: STRING is "[
      Usage: eiffeltest_server <port>

      Information:
        -help               Display this help information (no test run)
        -version            Display Liberty Eiffel version information (no test run)
        -verbose            Display detailed information about what eiffeltest is doing

      ]"

feature {}
   port: INTEGER

   main is
      local
         stack: LOOP_STACK
         socket: EIFFELTEST_SERVER_SOCKET
      do
         log.info.put_line(once "Server #(1) starting..." # port.out)
         create stack.make
         create socket.make(port, agent stack.add_job, agent stack.break)
         stack.add_job(socket)
         log.info.put_line(once "Server #(1) started." # port.out)
         stack.run
      end

   make is
      local
         log_conf: LOG_CONFIGURATION
         conf: STRING_INPUT_STREAM
      do
         parse_arguments
         create conf.from_string(once "[
         log configuration
         root #(1)
         output
            default is
               file "eiffeltest_server:#(3).log"
               rotated each day keeping 5
            end
         logger
            #(1) is
               output default
               level #(2)
            end
         end
         ]" # generating_type # level # port.out)
         log_conf.load(conf, Void, Void, agent main)
      end

   level: STRING

   parse_arguments is
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

   is_valid_argument_for_ace_mode (arg: STRING): BOOLEAN is
      do
         check not Result end
      end

   valid_argument_for_ace_mode: STRING is ""

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
-- Copyright(C) 2013: Cyril ADRIAN <cyril.adrian@gmail.com>
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
