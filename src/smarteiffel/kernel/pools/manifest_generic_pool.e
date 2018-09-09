-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class MANIFEST_GENERIC_POOL
   --
   -- Unique global object in charge of MANIFEST_GENERIC used.
   --

insert
   GLOBALS

feature {}
   collected_manifest_generic: HASHED_SET[MANIFEST_GENERIC]
      once
         create Result.make
      end

feature {MANIFEST_GENERIC}
   collect (manifest_generic: MANIFEST_GENERIC)
      require
         manifest_generic /= Void
      do
         collected_manifest_generic.add(manifest_generic)
      end

feature {SMART_EIFFEL}
   reset
         -- Called before a re-collect cycle.
      do
         collected_manifest_generic.clear_count
      end

feature {ANY}
   for_each (action: PROCEDURE[TUPLE[MANIFEST_GENERIC]])
      require
         action /= Void
      do
         collected_manifest_generic.for_each(action)
      end

end -- class MANIFEST_GENERIC_POOL
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
