-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_IS_EQUAL

create {}
   make

feature {ANY}
   make
      local
         animal1, animal2: ANIMAL; p1, p2: LIB_TEST_POINT; any1, any2: ANY; cp1, cp2: COLORED_POINT
      do
         assert(("foo").is_equal("foo"))
         assert(not ("bar").is_equal("foo"))
         assert(not ("foo").is_equal(""))
         create {DOG} animal1
         create {CAT} animal1
         create {CAT} animal2
         assert(animal1.is_equal(animal2))
         create p1.make(1.5, 2.5)
         create p2.make(1.5, 2.5)
         assert(p1.is_equal(p2))
         assert(p2.is_equal(p1))
         any1 := p1
         any2 := p2
         assert(any1.is_equal(any2))
         assert(any2.is_equal(any1))
         create cp1.make(1.5, 2.5, "red")
         create cp2.make(1.5, 2.5, "red")
         assert(not cp1.is_equal(cp2))
         any1 := cp1
         any2 := cp1
         assert(any1.is_equal(any2))
         any2 := cp2
         assert(not any1.is_equal(any2))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_IS_EQUAL: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes %N");
         end
      end

   cpt: INTEGER

end -- class TEST_IS_EQUAL
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
