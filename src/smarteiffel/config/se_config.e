-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class SE_CONFIG

insert
   GLOBALS

feature {ANY}
   bin: STRING
      deferred
      end

   sys: STRING
      deferred
      end

   short: STRING
      deferred
      end

   os: STRING
      deferred
      end

   flavor: STRING
      deferred
      end

   jobs: INTEGER
      deferred
      end

   environment (var: STRING): STRING
      deferred
      end

   loadpaths_in (loadpaths: DICTIONARY[STRING, STRING])
      require
         loadpaths /= Void
      deferred
      end

   tools_in (tools: DICTIONARY[STRING, STRING])
      require
         tools /= Void
      deferred
      end

   environment_in (env: DICTIONARY[STRING, STRING])
      require
         env /= Void
      deferred
      end

   c_mode (a_c_mode: STRING): SE_C_MODE
      require
         not a_c_mode.is_empty
      deferred
      end

   c_modes_in (c_modes: DICTIONARY[SE_C_MODE, STRING])
      require
         c_modes /= Void
      deferred
      end

end -- class SE_CONFIG
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
