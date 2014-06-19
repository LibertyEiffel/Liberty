-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY06
   --
   -- Access to dead attribute.
   --

create {}
   make

feature {ANY}
   dead: AUX_SIMPLIFY06

   make
      do
         check_order(0)
         if dead /= Void then
            c_inline_c("#1 in boost_simplify06")
         end
         if dead = Void then
            check_order(1)
         end
         check_order(2)
         if foo(1) /= Void then
            c_inline_c("#2 in boost_simplify06")
         end
         check_order(3)
         if bar(1, Void) /= Void then
            c_inline_c("#3 in boost_simplify06")
         end
         check_order(4)
      end

   foo (i: INTEGER): like dead
      do
         Result := dead
      end

   bar (i: INTEGER; j: like dead): like dead
      do
         Result := dead
      end

   previous_n: INTEGER
         -- To check that `check_order' call are in the original order.

   check_order (n: INTEGER)
      do
         if n /= previous_n then
            sedb_breakpoint
            std_output.put_string("TEST_SIMPLIFY06: ERROR Test # ")
            std_output.put_integer(previous_n)
            std_output.put_string("%N")
         end
         previous_n := previous_n + 1
      end

end -- class TEST_SIMPLIFY06
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
