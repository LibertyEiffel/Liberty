-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY01
   --
   -- To check that the simplify work is actually done (for -boost mode only).
   --

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         b_true, b_false: BOOLEAN
      do
         b_true := True
         b_false := False
         if True then
            always_run
         else
            c_inline_c("*** WrongCcode #1 ***")
         end
         if False then
            c_inline_c("*** WrongCcode #2 ***")
         else
            always_run
         end
         if False then
            c_inline_c("*** WrongCcode #3 ***")
         elseif True then
            always_run
         else
            c_inline_c("*** WrongCcode #4 ***")
         end
         if 3 = 3 then
            always_run
         else
            c_inline_c("*** WrongCcode #5 ***")
         end
         if always_false then
            assert(False)
         end
         if always_true then
            always_run
         end
         if True then
            always_run
         end
         if False then
         else
            always_run
         end
         if False then
            c_inline_c("*** WrongCcode #6 ***")
         elseif False then
            c_inline_c("*** WrongCcode #7 ***")
         elseif True then
            always_run
         elseif True then
            c_inline_c("*** WrongCcode #8 ***")
         else
            c_inline_c("*** WrongCcode #9 ***")
         end
         if False then
            c_inline_c("*** WrongCcode #10 ***")
         elseif False then
            c_inline_c("*** WrongCcode #11 ***")
         elseif True then
            always_run
         elseif b_true then
            c_inline_c("*** WrongCcode #12 ***")
         else
            c_inline_c("*** WrongCcode #13 ***")
         end
         if b_false then
            assert(False)
         elseif False then
            c_inline_c("*** WrongCcode #14 ***")
         elseif True then
            always_run
         elseif b_true then
            c_inline_c("*** WrongCcode #15 ***")
         else
            c_inline_c("*** WrongCcode #16 ***")
         end
         if False then
            c_inline_c("*** WrongCcode #17 ***")
         elseif always_false then
            assert(False)
         else
            always_run
         end
         if b_true then
            always_run
         elseif always_false then
            assert(False)
         elseif always_false then
            assert(False)
         else
            assert(False)
         end
         if 4 #\\ 2 = 0 then
            always_run
         else
            c_inline_c("*** WrongCcode #18 ***")
         end
         if 4 #// 2 = 2 then
            always_run
         else
            c_inline_c("*** WrongCcode #19 ***")
         end
         if 2 = 2 then
            always_run
         else
            c_inline_c("*** WrongCcode #20 ***")
         end
      end

   always_run
      do
         assert(True)
      end

   always_true: BOOLEAN
      do
         Result := True
      end

   always_false: BOOLEAN
      do
      end

end -- class TEST_SIMPLIFY01
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
