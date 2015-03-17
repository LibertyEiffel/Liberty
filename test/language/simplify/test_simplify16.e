-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SIMPLIFY16
   -- To test simplify of the = /= on real constants.
   -- Actually, this is also a test to check internal normalization of REAL constants.

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         if 0.01230E4 = 123e0 then
            --          ----- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 0.01230E2 = 123e-2 then
            --          ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if {REAL_64 -0.01230} = -123e-4 then
            --                 ------- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if {REAL_64 0.01230} = 123e-4 then
            --                  ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if {REAL_64 0.01230} = 123e-4 then
            --                  ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 0.0123 = 123e-4 then
            --       ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 0.01230 = 123e-4 then
            --        ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if {REAL_EXTENDED 0E0} = 0e0 then
            --                    --- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if {REAL_32 0.0} = 0e0 then
            --              --- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if -0.0 = 0e0 then
            --      --- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 0.0 = 0e0 then
            --    --- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if -1.2 = -12e-1 then
            --      ------ internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 1.2 = 12e-1 then
            --    ----- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if -1.0 = -1e0 then
            --     ---- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 1.0 = 1.0 then
            --    --- internal normalized view.
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 1.1 /= 2.2 then
            assert(True)
         else
            c_inline_c("simplify error #2 in boost_simplify16")
         end
         if 0.1 = 0.1 then
            assert(True)
         else
            c_inline_c("simplify error #1 in boost_simplify16")
         end
         if 0.1 /= 0.1 then
            c_inline_c("simplify error #2 in boost_simplify16")
         else
            assert(True)
         end
         if 0.1 = 0.2 then
            c_inline_c("simplify error #3 in boost_simplify16")
         else
            assert(True)
         end
         if 0.1 /= 0.2 then
            assert(True)
         else
            c_inline_c("simplify error #4 in boost_simplify16")
         end
      end

end -- class TEST_SIMPLIFY16
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
