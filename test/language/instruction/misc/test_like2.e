-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_LIKE2

create {}
   make

feature {ANY}
   make
      local
         a: AUX_LIKE2A; b: AUX_LIKE2B; c: AUX_LIKE2C
      do
         create a
         create b
         create c
         assert(a.f(a) = 'A')
         assert(a.f(b) = 'B')
         assert(a.f(c) = 'C')
         --    assert(b.f(a) = 'A');
         assert(b.f(b) = 'B')
         assert(b.f(c) = 'C')
         --    assert(c.f(a) = 'A');
         --    assert(c.f(b) = 'B');
         assert(c.f(c) = 'C')
         assert(a.is_equal(a))
         assert(not a.is_equal(b))
         assert(not a.is_equal(c))
         --    assert(    b.is_equal(a));
         assert(b.is_equal(b))
         assert(not b.is_equal(c))
         --    assert(    c.is_equal(a));
         --    assert(    c.is_equal(b));
         assert(c.is_equal(c))
      end

feature {}
   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_LIKE2: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_LIKE2
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
