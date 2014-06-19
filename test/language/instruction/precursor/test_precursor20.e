-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PRECURSOR20
   --
   -- Written by Cyril Adrian
   -- This bug shows a bad compilation when using both inspect and 
   -- Precursor at the same time
   --
   -- test_precursor201.c: In function 'r25_P_26_find_string':
   -- test_precursor201.c:1769: error: '_2' undeclared (first use in this function)
   -- test_precursor201.c:1769: error: (Each undeclared identifier is reported only once
   -- test_precursor201.c:1769: error: for each function it appears in.)
   -- test_precursor201.c:1778: error: '_3' undeclared (first use in this function)
   --

inherit
   AUX_PRECURSOR20
      redefine
         find_string
      end

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   find_string (string: STRING): BOOLEAN
      do
         inspect string
         when "dummy" then
            Result := True
         else
            Result := Precursor(string)
         end
      end

   make
      do
         assert(find_string("dummy"))
      end

end -- class TEST_PRECURSOR19
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
