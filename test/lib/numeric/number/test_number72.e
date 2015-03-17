-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER72
   -- tests on "append_in"

insert
   EIFFELTEST_TOOLS
   PLATFORM
   NUMBER_TOOLS

create {}
   make

feature {ANY}
   s: STRING "hello"

   make
      local
         s1, s2, s3: STRING; n: NUMBER
      do
         n := from_integer(1)
         s1 := s.twin
         n.append_in(s1)
         assert(s1.is_equal("hello1"))
         n := from_integer(-1)
         s1 := s.twin
         n.append_in(s1)
         assert(s1.is_equal("hello-1"))
         n := from_integer(0)
         s1 := s.twin
         n.append_in(s1)
         assert(s1.is_equal("hello0"))
         n := from_integer(Maximum_integer)
         n := n @* 10
         s1 := s.twin
         n.append_in(s1)
         s2 := s.twin
         Maximum_integer.append_in(s2)
         s3 := "0"
         s2.append(s3)
         assert(s1.is_equal(s2))
         n := from_integer(Minimum_integer)
         n := n @* 10
         s1 := s.twin
         n.append_in(s1)
         s2 := s.twin
         Minimum_integer.append_in(s2)
         s3 := "0"
         s2.append(s3)
         assert(s1.is_equal(s2))
         n := from_string("60/50")
         s1 := s.twin
         n.append_in(s1)
         assert(s1.is_equal("hello6/5"))
         n := from_string("-60/50")
         s1 := s.twin
         n.append_in(s1)
         assert(s1.is_equal("hello-6/5"))
      end



end -- class TEST_NUMBER72
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
