-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY04
   --
   -- All expressions of this test are finally constants.
   --

create {}
   make

feature {ANY}
   make
      local
         bool: BOOLEAN
      do
         assert(True)
         if True then
         else
            c_inline_c("#1 in boost_simplify04.")
         end
         --
         assert(not False)
         if not False then
         else
            c_inline_c("#2  in boost_simplify04.")
         end
         --
         assert(True and True)
         if True and True then
         else
            c_inline_c("#3  in boost_simplify04.")
         end
         --
         assert(not (False and True))
         if not (False and True) then
         else
            c_inline_c("#4  in boost_simplify04.")
         end
         --
         assert(not (True and False))
         if not (True and False) then
         else
            c_inline_c("#5  in boost_simplify04.")
         end
         --
         assert(not (False and then not bool))
         if not (False and then not bool) then
         else
            c_inline_c("#6  in boost_simplify04.")
         end
         --
         assert(True or False)
         if True or False then
         else
            c_inline_c("#7  in boost_simplify04.")
         end
         --
         assert(False or True)
         if False or True then
         else
            c_inline_c("#8  in boost_simplify04.")
         end
         --
         assert(True or True)
         if True or True then
         else
            c_inline_c("#9  in boost_simplify04.")
         end
         --
         assert(True or else bool)
         if True or else bool then
         else
            c_inline_c("#10  in boost_simplify04.")
         end
         --
         assert(False or else True)
         if False or else True then
         else
            c_inline_c("#11  in boost_simplify04.")
         end
         --
         assert(True or not bool)
         if True or not bool then
         else
            c_inline_c("#12  in boost_simplify04.")
         end
         --
         assert(True or else not bool)
         if True or else not bool then
         else
            c_inline_c("#13  in boost_simplify04.")
         end
         --
         assert(not (False and not bool))
         if not (False and not bool) then
         else
            c_inline_c("#14  in boost_simplify04.")
         end
         --
         assert(not (False and then not bool))
         if not (False and then not bool) then
         else
            c_inline_c("#15  in boost_simplify04.")
         end
         --
         assert(4 > 3)
         if 4 > 3 then
         else
            c_inline_c("#16  in boost_simplify04.")
         end
         --
         assert(not (3 > 4))
         if not (3 > 4) then
         else
            c_inline_c("#17  in boost_simplify04.")
         end
         --
         assert(4 >= 4)
         if 4 >= 4 then
         else
            c_inline_c("#18  in boost_simplify04.")
         end
         --
         assert(5 >= 4)
         if 5 >= 4 then
         else
            c_inline_c("#19  in boost_simplify04.")
         end
         --
         assert(not (4 >= 5))
         if not (4 >= 5) then
         else
            c_inline_c("#20  in boost_simplify04.")
         end
         --
         assert(not (4 < 3))
         if not (4 < 3) then
         else
            c_inline_c("#21  in boost_simplify04.")
         end
         --
         assert(3 < 4)
         if 3 < 4 then
         else
            c_inline_c("#22  in boost_simplify04.")
         end
         --
         assert(3 <= 3)
         if 3 <= 3 then
         else
            c_inline_c("#23  in boost_simplify04.")
         end
         --
         assert(3 <= 4)
         if 3 <= 4 then
         else
            c_inline_c("#24  in boost_simplify04.")
         end
         --
         assert(not (4 <= 3))
         if not (4 <= 3) then
         else
            c_inline_c("#25  in boost_simplify04.")
         end
         --
         assert(4 <= 3 + 1)
         if 4 <= 3 + 1 then
         else
            c_inline_c("#26  in boost_simplify04.")
         end
         --
         assert(4 <= 2 * 2)
         if 4 <= 2 * 2 then
         else
            c_inline_c("#27  in boost_simplify04.")
         end
         --
         assert(4 <= 6 - 2)
         if 4 <= 6 - 2 then
         else
            c_inline_c("#28  in boost_simplify04.")
         end
         --
         --***
         -- assert(4 <= (8 // 2))
         -- if      4 <= (8 // 2) then
         -- else
         --   c_inline_c("#29  in boost_simplify04.")
         -- end
         -- *** // is no longuer inlinable (Dom 20th august 2004)
         --
         assert(4 <= 1 + 2 * 2 + 1)
         if 4 <= 1 + 2 * 2 + 1 then
         else
            c_inline_c("#30  in boost_simplify04.")
         end
         --
         assert(2 = 2)
         if 2 = 2 then
         else
            c_inline_c("#31  in boost_simplify04.")
         end
         --
         assert(2 /= 3)
         if 2 /= 3 then
         else
            c_inline_c("#32  in boost_simplify04.")
         end
         --
         assert(2.51111 = 2.51111)
         if 2.51111 = 2.51111 then
         else
            c_inline_c("#33  in boost_simplify04.")
         end
         --
         assert(2.51112 /= 2.51111)
         if 2.51112 /= 2.51112 then
            c_inline_c("#34  in boost_simplify04.")
         end
         --
         -- *** Following simplify should be done as soon as REAL_GENERAL
         -- will be rebuild. (Dom august 20th 2004)
         --***    assert(2 * 3.1415926 = 6.2831852)
         --***    if      2 * 3.1415926 = 6.2831852 then
         --***    else
         --***       c_inline_c("#35  in boost_simplify04.")
         --***    end
         --***    --
         --***    assert(2.00 * 3.1415926 = 6.2831852)
         --***    if      2.00 * 3.1415926 = 6.2831852 then
         --***    else
         --***       c_inline_c("#36  in boost_simplify04.")
         --***    end
         --***    --
         -- Final total count check:
         assert(cpt = 33)
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            sedb_breakpoint
            std_output.put_string("TEST_SIMPLIFY_1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_SIMPLIFY04
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
