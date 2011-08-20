-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SERC_CHAIN
   --
   -- The ''Chain of Responsibility'' design pattern
   --

inherit
   SE_CONFIG

creation {SERC_FACTORY}
   make

feature {ANY}
   bin: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).bin
            i := i + 1
         end
      end

   sys: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).sys
            i := i + 1
         end
      end

   short: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).short
            i := i + 1
         end
      end

   os: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).os
            i := i + 1
         end
      end

   flavor: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).flavor
            i := i + 1
         end
      end

   jobs: INTEGER is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= 0 or else i > config.upper
         loop
            Result := config.item(i).jobs
            i := i + 1
         end
      end

   jar: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).jar
            i := i + 1
         end
      end

   java_virtual_machine: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).java_virtual_machine
            i := i + 1
         end
      end

   java_compiler: STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).java_compiler
            i := i + 1
         end
      end

   environment (var: STRING): STRING is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).environment(var)
            i := i + 1
         end
      end

   loadpaths_in (loadpaths: DICTIONARY[STRING, STRING]) is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            i > config.upper
         loop
            config.item(i).loadpaths_in(loadpaths)
            i := i + 1
         end
      end

   tools_in (tools: DICTIONARY[STRING, STRING]) is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            i > config.upper
         loop
            config.item(i).tools_in(tools)
            i := i + 1
         end
      end

   environment_in (env: DICTIONARY[STRING, STRING]) is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            i > config.upper
         loop
            config.item(i).environment_in(env)
            i := i + 1
         end
      end

   c_mode (a_c_mode: STRING): SE_C_MODE is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            Result /= Void or else i > config.upper
         loop
            Result := config.item(i).c_mode(a_c_mode)
            i := i + 1
         end
      end

   c_modes_in (c_modes: DICTIONARY[SE_C_MODE, STRING]) is
      local
         i: INTEGER
      do
         from
            i := config.lower
         until
            i > config.upper
         loop
            config.item(i).c_modes_in(c_modes)
            i := i + 1
         end
      end

feature {SERC_FACTORY}
   add (a_config: SE_CONFIG) is
      do
         config.add_last(a_config)
      end

   is_empty: BOOLEAN is
      do
         Result := config.is_empty
      end

feature {}
   config: FAST_ARRAY[SE_CONFIG]

   make is
      do
         create config.make(0)
      end

invariant
   config /= Void

end -- class SERC_CHAIN
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
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
