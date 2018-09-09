-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ASSERTION_LEVEL_NUMBERING
   --
   -- To mangle assertion level information on a single value.
   --

inherit
   ANY
insert
   GLOBALS

feature {ANY}
   level_name (level: INTEGER): STRING
      do
         inspect
            level
         when level_not_computed then
            Result := once "not_computed"
         when level_boost then
            Result := fz_boost
         when level_no then
            Result := fz_no
         when level_require then
            Result := fz_require
         when level_ensure then
            Result := fz_ensure
         when level_invariant then
            Result := fz_invariant
         when level_loop then
            Result := fz_loop
         when level_all then
            Result := fz_all
         end
      end

   level_not_computed: INTEGER 0
         -- To memorize the fact that the assertion level is not yet known.

   level_boost: INTEGER 1
         -- The -boost hight speed level. Do not check for Void target. Do
         -- not check system level validity. Optimize generated code.

   level_no: INTEGER 2
         -- No assertion checking of any kind.

   level_require: INTEGER 3
         -- Evaluate the preconditions.

   level_ensure: INTEGER 4
         -- Also evaluate postconditions.

   level_invariant: INTEGER 5
         -- Also evaluate the class invariant on entry to and return from.

   level_loop: INTEGER 6
         -- Also evaluate the loop variant and the loop invariant.

   level_all: INTEGER 7
         -- Also evaluate the check instruction. The default value.

end -- class ASSERTION_LEVEL_NUMBERING
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
