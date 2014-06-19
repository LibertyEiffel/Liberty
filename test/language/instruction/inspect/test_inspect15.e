-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INSPECT15

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      do
         assert(test("a") = 1)
         assert(test("ab") = 2)
         assert(test("c") = 3)
         assert(test("") = 0)
         assert(test("abcd") = 0)
         assert(test("bab") = 0)
         assert(test("ca") = 0)
         assert(test("d") = 0)
         assert(test("ww") = 0)
         assert(test(".") = 4)
         assert(test(".a") = 0)
         assert(test("A") = 0)
         assert(test("ac") = 2)
         assert(test("acd") = 0)
      end

   test (s: STRING): INTEGER
      do
         inspect
            s
         when "a" then
            Result := 1
         when "ab", "ac" then
            Result := 2
         when "c" then
            Result := 3
         when "." then
            Result := 4
         else
            Result := 0
         end
      end

end -- class TEST_INSPECT15
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
