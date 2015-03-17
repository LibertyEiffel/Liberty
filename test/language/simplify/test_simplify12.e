-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY12
   --
   -- To test routine body normalization (extra initialization removal).
   --
   --

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   f_0: BOOLEAN
      local
         a: INTEGER; b: CHARACTER; c: STRING
      do
         a := 0
         b := '%U'
         c := Void
         Result := True
      end

   f_1 (a1: INTEGER): BOOLEAN
      local
         a: INTEGER; b: CHARACTER; c: STRING
      do
         a := 0
         b := '%U'
         c := Void
         Result := True
      end

   f_2 (a1, a2: INTEGER): BOOLEAN
      local
         a: INTEGER; b: CHARACTER; c: STRING
      do
         a := 0
         b := '%U'
         c := Void
         Result := True
      end

   make
      do
         if f_0 then
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify12")
         end
         if f_1(1) then
            assert(True)
         else
            c_inline_c("simplify error #2 in boost_simplify12")
         end
         if f_2(2, 2) then
            assert(True)
         else
            c_inline_c("simplify error #3 in boost_simplify12")
         end
         assert(assert_counter.item = 3)
      end

end -- class TEST_SIMPLIFY12
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
