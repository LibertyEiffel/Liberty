-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY07
   --
   -- To check that infix calls are inlined too (attempt to fix SZ:209:).
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         string1, string2: STRING; r: BOOLEAN; aux1, aux2: AUX_SIMPLIFY07
      do
         string1 := "hello"
         string2 := "hi"
         r := string1 <= string2
         create aux1
         create aux2
         if aux1 <= aux2 then
            assert(assert_counter.item = 0)
         else
            c_inline_c("#1 in boost_simplify07")
         end
         assert(assert_counter.item = 1)
         if aux1.direct_call(aux2) then
            assert(assert_counter.item = 2)
         else
            c_inline_c("#2 in boost_simplify07")
         end
         assert(assert_counter.item = 3)
      end

end -- class TEST_SIMPLIFY07
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
