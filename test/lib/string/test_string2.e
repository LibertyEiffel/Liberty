-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING2

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         s1, s2: STRING
      do
         create s1.copy("kiki")
         assert(s1.is_equal("kiki"))
         create s2.copy(s1)
         assert(s1 /= s2)
         assert(s1.is_equal(s2))
         s1 := s2
         create s2.copy(s2)
         assert(s1 /= s2)
         assert(s1.is_equal(s2))
         create s1.make(25)
         assert(s1.capacity >= 25)
         assert(s1.count = 0)
         create s1.make_filled(' ', 25)
         assert(s1.capacity >= 25)
         assert(s1.occurrences(' ') = 25)
         assert(s1.count = 25)
         create s1.make(1)
         assert(s1.capacity >= 1)
         assert(s1.count = 0)
         s1.extend('x')
         assert(s1.count = 1)
         s1 := "foo.c"
         s1.remove_suffix(".c")
         assert(s1.is_equal("foo"))
         assert(("foo bar").has_prefix("foo"))
         assert(("foo bar").has_prefix(""))
         assert(("foo bar").has_suffix(""))
         assert(not ("foo").has_prefix("foo bar"))
         assert(not ("foo bar").has_prefix(" foo"))
      end

end -- class TEST_STRING2
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
