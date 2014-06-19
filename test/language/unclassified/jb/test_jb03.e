-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_JB03
   -- From: Jacques Bouchard <bouchard@mageos.com>

inherit
   AUX_JB03
      rename p as a_p
      redefine x
      end

create {}
   make

create {TEST_JB03}
   default_create

feature {ANY}
   x: TEST_JB03

   p: STRING
      do
         Result := "TEST.p"
      end

   make
      do
         create y
         assert(y.generating_type = generating_type)
         y := Current
         assert(p.is_equal("TEST.p"))
         assert(a_p.is_equal("AUX.p"))
         assert(y.p.is_equal("TEST.p"))
         assert(y.a_p.is_equal("AUX.p"))
      end

   assert (boolean: BOOLEAN)
      do
         cpt := cpt + 1
         if not boolean then
            sedb_breakpoint
            std_output.put_string("TEST_JB03: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

end -- class TEST_JB03
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
