-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class STRING_COMMAND_LINE
   --
   -- Emulate a command line using a string
   --

insert
   COMMAND_LINE_TOOLS

feature {ANY}
   command_line_name: STRING "string_command_line"
         -- Must be modified by the tools which use the STRING_COMMAND_LINE facility.

   set_command_line_name (c: STRING)
      do
         command_line_name.copy(c)
      end

   parse (command_line: STRING)
         -- Only a very small subset of Liberty Eiffel options are supported
         -- here:
         --    -no_gc
         --    -no_strip
         --    -no_split
         --    -sedb
         --    -profile
      local
         arg: STRING; mhf: MEMORY_HANDLER_FACTORY
      do
         from
            command_line_buffer.copy(command_line)
         until
            command_line_buffer.is_empty
         loop
            next_option
            arg := option_buffer
            if flag_match(once "no_gc", arg) then
               mhf.set_no_gc
            elseif flag_match(once "bdw_gc", arg) then
               mhf.set_bdw_gc
            elseif flag_match(fz_no_strip, arg) then
               system_tools.set_no_strip
            elseif flag_match(fz_no_split, arg) then
               ace.set_no_split(True)
            elseif is_trace_flag(arg) then
            elseif is_profile(arg) then
            else
               echo.w_put_string(command_line_name)
               echo.w_put_string(": unsupported option %"")
               echo.w_put_string(arg)
               echo.w_put_string("%".%N")
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

   command_line_help_summary: STRING
      do
         check
            False
         end
      end

feature {}
   next_option
         -- Finds the next option after having skipped the separators
      local
         low, up, i: INTEGER
      do
         from
            low := 1
         until
            low > command_line_buffer.count or else not command_line_buffer.item(low).is_separator
         loop
            low := low + 1
         end
         from
            up := low
         until
            up > command_line_buffer.count or else command_line_buffer.item(up).is_separator
         loop
            up := up + 1
         end
         option_buffer.clear_count
         if up > command_line_buffer.count then
            from
               i := low
            until
               i > command_line_buffer.count
            loop
               option_buffer.extend(command_line_buffer.item(i))
               i := i + 1
            end
            command_line_buffer.clear_count
         else
            from
               i := low
            until
               i = up
            loop
               option_buffer.extend(command_line_buffer.item(i))
               i := i + 1
            end
            command_line_buffer.shrink(up, command_line_buffer.count)
         end
      end

   command_line_buffer: STRING
      once
         create Result.make(16)
      end

   option_buffer: STRING
      once
         create Result.make(16)
      end

end -- class STRING_COMMAND_LINE
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
