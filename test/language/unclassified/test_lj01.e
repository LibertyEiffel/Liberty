-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_LJ01
   -- From a bug report of Loryn Jenkins.

create {}
   make

feature {ANY}
   make
      local
         v: INTEGER
      do
         create board
         create board2
         board.set_max_board_members(3)
         v := board.max
         assert(v = 3)
         board2.set_max_board_members(3)
         board2.set_min_board_members(1)
         v := board2.max
         assert(v = 3)
         v := board2.min
         assert(v = 1)
      end

   board: AUX_LJ01B

   board2: AUX_LJ01B2

feature {}
   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_LJ01: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            --std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_LJ01
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
