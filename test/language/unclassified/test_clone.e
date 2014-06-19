-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_CLONE

inherit
   ANY
      redefine copy, is_equal
      end

insert
   EIFFELTEST_TOOLS
      undefine copy, is_equal
      end

create {}
   main

feature {ANY}
   s1, s2: STRING

   a1, a2: ANIMAL

   ai1, ai2: ARRAY[INTEGER_8]

   p1, p2: LIB_TEST_POINT

   t1, t2: TRIANGLE

   main
      local
         test_clone: like Current
      do
         s1 := "foo"
         s2 := s1.twin
         assert(s1 /= s2)
         assert(s1.is_equal(s2))
         assert(s2.capacity >= s2.count)
         s1.put('b', 2)
         assert(not s1.is_equal(s2))
         create {CAT} a1
         a2 := a1.twin
         assert(a1 /= a2)
         assert(a1.is_equal(a2))
         ai1 := {ARRAY[INTEGER_8] 1, << 1, 2, 3 >> }
         ai2 := ai1.twin
         assert(ai1.is_equal(ai2))
         assert(ai1 /= ai2)
         create p1.make(1, 2)
         p2 := p1.twin
         assert(p1 /= p2)
         assert(p1.x = p2.x)
         assert(p1.y = p2.y)
         assert(p1.same_dynamic_type(p2))
         create t1.make(p1, p2, p2)
         t2 := t1.twin
         assert(t1 /= t2)
         assert(t1.same_dynamic_type(t2))
         assert(t1.p1 = t2.p1)
         assert(t1.p2 = t2.p2)
         assert(t1.p3 = t2.p3)
         assert(t2.p2 = t2.p3)
         test_clone := Current.twin
         assert(test_clone /= Current)
         assert(test_clone.same_dynamic_type(Current))
         assert(test_clone.is_equal(Current))
         assert(test_clone.s1 = Void)
         assert(test_clone.s2 = Void)
         assert(test_clone.ai1 = Void)
         assert(test_clone.t1 = Void)
         assert(test_clone.t2 = Void)
      end

   copy (other: like Current)
      do
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := True
      end

end -- class TEST_CLONE
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
