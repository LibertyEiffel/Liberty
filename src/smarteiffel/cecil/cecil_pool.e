-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
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
   add_cecil_file (path: STRING) is
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
            end
         end
      ensure
         may_report_an_error: error_handler.is_empty
      end

feature {SMART_EIFFEL}
   parse_cecil_files is
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

   collect is
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

   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR; type: TYPE) is
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

feature {ANY}
   state: INTEGER

   State_initial: INTEGER is 0
   State_parsed: INTEGER is 1
   State_collected: INTEGER is 2

feature {C_PRETTY_PRINTER}
   c_define_users is
      local
         i: INTEGER
      do
         if cecil_files /= Void then
            from
               i := cecil_files.lower
            until
               i > cecil_files.upper
            loop
               cecil_files.item(i).c_define_users
               i := i + 1
            end
         end
      end

feature {CECIL_FILE}
   cecil_files: DICTIONARY[CECIL_FILE, STRING]
         -- Non Void if some -cecil option is used.

invariant
   valid_state: state.in_range(State_initial, State_collected)

end -- class CECIL_POOL
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- SmartEiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- SmartEiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with SmartEiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
