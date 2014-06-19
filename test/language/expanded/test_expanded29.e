-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_EXPANDED29
   -- From: Eric Bezault <ericb@gobosoft.com>

insert
   EIFFELTEST_TOOLS

create {ANY}
   make

feature {ANY}
   make
      local
         l: AUX_EXPANDED29BAR
      do
         -- Original:
         -- l: expanded AUX_EXPANDED29BAR
         create foo
         assert(foo.toto.x = 0)
         assert(foo.tata.x = 0)
         assert(l.x = 0)
         foo.toto.set_x(1)
         assert(foo.toto.x = 0)
         assert(foo.tata.x = 0)
         foo.tata.set_x(2)
         assert(foo.tata.x = 0)
         assert(foo.toto.x = 0)
         l := foo.toto
         l.set_x(3)
         assert(l.x = 3)
         assert(foo.toto.x = 0)
      end

   foo: AUX_EXPANDED29FOO

end -- class TEST_EXPANDED29
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
