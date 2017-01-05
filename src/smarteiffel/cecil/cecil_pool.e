-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CECIL_POOL
   --
   -- Unique global object in charge of CECIL calls.
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

feature {ACE, COMMAND_LINE_TOOLS, C_PLUGIN}
   add_cecil_file (path: STRING)
         -- Add `path' as a new -cecil file to be considered.
      require
         path /= Void
         not string_aliaser.registered_one(path)
         may_report_an_error: error_handler.is_empty
      local
         file: CECIL_FILE
      do
         echo.put_string(once "Adding Cecil file: ")
         echo.put_string(path)
         echo.put_new_line
         if cecil_files = Void then
            create {HASHED_DICTIONARY[CECIL_FILE, STRING]} cecil_files.make
         end
         if not cecil_files.has(path) then
            create file.make(path)
            cecil_files.add(file, path)
            -- because plugins add cecil files only at collect time
            inspect state
            when State_initial then
               -- nothing
            when State_parsed then
               file.parse
            when State_collected then
               file.parse
               file.collect(smart_eiffel.type_any)
            when State_adapted then
               sedb_breakpoint
               check False end
            end
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

feature {SMART_EIFFEL}
   parse_cecil_files
      require
         state = State_initial
         may_report_an_error: error_handler.is_empty
      local
         i: INTEGER
      do
         if cecil_files /= Void then
            from
               i := cecil_files.lower
            until
               i > cecil_files.upper
            loop
               cecil_files.item(i).parse
               i := i + 1
            end
         end
         state := State_parsed
      ensure
         state = State_parsed
         may_report_an_error: error_handler.is_empty
      end

   collect
      require
         (state = State_parsed) xor (state = State_collected)
      local
         i: INTEGER
      do
         if cecil_files /= Void then
            echo.put_string(once "Collecting Cecil features.%N")
            from
               i := cecil_files.lower
            until
               i > cecil_files.upper
            loop
               cecil_files.item(i).collect(smart_eiffel.type_any)
               i := i + 1
            end
         end
         state := State_collected
      ensure
         state = State_collected
      end

   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE)
      local
         i: INTEGER
      do
         if cecil_files /= Void then
            echo.put_string(once "Collecting Cecil features.%N")
            from
               i := cecil_files.lower
            until
               i > cecil_files.upper
            loop
               cecil_files.item(i).inline_dynamic_dispatch(code_accumulator, type)
               i := i + 1
            end
         end
      end

   adapt
      require
         state = State_collected
      local
         i: INTEGER
      do
         if cecil_files /= Void then
            echo.put_string(once "Adapting Cecil features.%N")
            from
               i := cecil_files.lower
            until
               i > cecil_files.upper
            loop
               cecil_files.item(i).adapt_for(smart_eiffel.type_any)
               i := i + 1
            end
         end
         state := State_adapted
      ensure
         state = State_adapted
      end

feature {ANY}
   state: INTEGER

   State_initial: INTEGER 0
   State_parsed: INTEGER 1
   State_collected: INTEGER 2
   State_adapted: INTEGER 3

   for_each (action: PROCEDURE[TUPLE[CECIL_FILE]])
      require
         action /= Void
      do
         if cecil_files /= Void then
            cecil_files.for_each(action)
         end
      end

feature {CECIL_FILE}
   cecil_files: DICTIONARY[CECIL_FILE, STRING]
         -- Non Void if some -cecil option is used.

invariant
   valid_state: state.in_range(State_initial, State_adapted)

end -- class CECIL_POOL
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
