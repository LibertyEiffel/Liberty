-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SUBSTITUTE_01
   --
   -- Testing:
   --   prepare_substitution
   --   substitute_for
   --   substitute_all_for

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         aa_matcher: REGULAR_EXPRESSION
      do
         create {AUX_SUBSTITUTE_01} aa_matcher
         aa_matcher.prepare_substitution("\1bc")
         assert(not aa_matcher.match(text1))
         assert(aa_matcher.match(text2))
         aa_matcher.substitute_for(text2)
         assert(aa_matcher.last_substitution.is_equal(sub2))
         assert(aa_matcher.match(text3))
         aa_matcher.substitute_for(text3)
         assert(aa_matcher.last_substitution.is_equal(sub3))
         assert(aa_matcher.match(text4))
         aa_matcher.substitute_for(text4)
         assert(aa_matcher.last_substitution.is_equal(sub4))
         assert(aa_matcher.match(text5))
         aa_matcher.substitute_for(text5)
         assert(aa_matcher.last_substitution.is_equal(sub5))
         assert(aa_matcher.match(text6))
         aa_matcher.substitute_for(text6)
         assert(aa_matcher.last_substitution.is_equal(sub6))
         aa_matcher.substitute_all_for(text1)
         assert(aa_matcher.last_substitution.is_equal(text1))
         aa_matcher.substitute_all_for(text2)
         assert(aa_matcher.last_substitution.is_equal(sub2))
         aa_matcher.substitute_all_for(text3)
         assert(aa_matcher.last_substitution.is_equal(sub3))
         aa_matcher.substitute_all_for(text4)
         assert(aa_matcher.last_substitution.is_equal(sub4))
         aa_matcher.substitute_all_for(text5)
         assert(aa_matcher.last_substitution.is_equal(sub5))
         aa_matcher.substitute_all_for(text6)
         assert(aa_matcher.last_substitution.is_equal(suball6))
         assert(aa_matcher.match_from(text6, 2))
         aa_matcher.substitute_for(text6)
         assert(aa_matcher.last_substitution.is_equal(subfrom6))
      end

   text1: STRING "Little message without the pattern."

   text2: STRING "aa apears one time in the begining."

   text3: STRING "The pattern aa in the middle."

   text4: STRING "Here in the end aa"

   text5: STRING "aa"

   text6: STRING "aa pattern appears many times aa in the string."

   sub2: STRING "abc apears one time in the begining."

   sub3: STRING "The pattern abc in the middle."

   sub4: STRING "Here in the end abc"

   sub5: STRING "abc"

   sub6: STRING "abc pattern appears many times aa in the string."

   suball6: STRING "abc pattern appears many times abc in the string."

   subfrom6: STRING "aa pattern appears many times abc in the string."

end -- class TEST_SUBSTITUTE_01
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
