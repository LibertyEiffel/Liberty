-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_VB1
   -- From: Vincent Bousquet
   -- From: "Christel Blossier" <cblossier@netcourrier.com>

create {}
   make

feature {ANY}
   make
      local
         array_a: ARRAY[AUX_VB1A]; array_b: ARRAY[AUX_VB1B]; fixed_array_a: FAST_ARRAY[AUX_VB1A]
         fixed_array_b: FAST_ARRAY[AUX_VB1B]; item_a: AUX_VB1A; item_b: AUX_VB1B; x: INTEGER
      do
         create array_a.make(1, 1)
         create array_b.make(1, 1)
         x := item_a.a_feature
         x := item_b.a_feature
         item_a := array_a.item(1)
         item_b := array_b.item(1)
         create fixed_array_a.make(1)
         create fixed_array_b.make(1)
         item_a := fixed_array_a.item(0)
         item_b := fixed_array_b.item(0)
      end

end -- class TEST_VB1
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
