-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SERC_DEFAULTS

inherit
   SE_CONFIG
      undefine
         is_equal
      end

insert
   SINGLETON

create {SERC_FACTORY}
   make

feature {ANY}
   bin: STRING
      do
         -- No default, must be provided
      end

   sys: STRING
      do
         -- No default, must be provided
      end

   short: STRING
      do
         -- No default, must be provided
      end

   os: STRING
   flavor: STRING
   jobs: INTEGER

   environment (var: STRING): STRING
      local
         system: SYSTEM
      do
         Result := system.get_environment_variable(var)
      end

   loadpaths_in (loadpaths: DICTIONARY[STRING, STRING])
      do
         -- No default, must be provided
      end

   tools_in (tools: DICTIONARY[STRING, STRING])
      do
         -- No default, must be provided
      end

   environment_in (env: DICTIONARY[STRING, STRING])
      do
         -- No default, must be provided
      end

   c_mode (a_c_mode: STRING): SE_C_MODE
      do
         -- No default, must be provided
      end

   c_modes_in (c_modes: DICTIONARY[SE_C_MODE, STRING])
      do
         -- No default, must be provided
      end

feature {SERC_FACTORY}
   set_os (a_os: like os)
      require
         a_os /= Void
      do
         os := a_os
      ensure
         os = a_os
      end

   set_flavor (a_flavor: like flavor)
      require
         a_flavor /= Void
      do
         flavor := a_flavor
      ensure
         flavor = a_flavor
      end

   set_jobs (a_jobs: like jobs)
      require
         a_jobs > 0
      do
         jobs := a_jobs
      ensure
         jobs = a_jobs
      end

feature {}
   make
      do
         jobs := 1
         flavor := once "generic"
      end

invariant
   jobs > 0

end -- class SERC_DEFAULTS
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
