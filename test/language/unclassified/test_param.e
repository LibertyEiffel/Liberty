-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_PARAM
   -- From a bug report of Christophe REMY

create {}
   make

feature {}
   table: HASHED_DICTIONARY[INTEGER, INTEGER]

feature {ANY}
   make
      do
         create table.make
         ecrire01(10, 15)
         assert(table @ 10 = 15)
         create table.make
         ecrire02(10, 15)
         assert(table @ 10 = 10)
         create table.make
         ecrire03(10, 15)
         assert(table @ 15 = 11)
         create table.make
         ecrire04(10, 15)
         assert(table @ 15 = 12)
         create table.make
         ecrire05(10, 15)
         assert(table @ -8 = 15)
         create table.make
         ecrire06(10, 15)
         assert(table @ 8 = 16)
         create table.make
         ecrire07(10, 15)
         assert(table @ 15 = -10)
         create table.make
         ecrire08(10, 15)
         assert(table @ 12 = 12)
      end

   ecrire01 (a, b: INTEGER)
      do
         table.put(b, a)
      end

   ecrire02 (a, b: INTEGER)
      do
         table.put(a, a)
      end

   ecrire03 (a, b: INTEGER)
      do
         table.put(a + 1, b)
      end

   ecrire04 (a, b: INTEGER)
      do
         table.put(2 + a, b)
      end

   ecrire05 (a, b: INTEGER)
      do
         table.put(b, 2 - a)
      end

   ecrire06 (a, b: INTEGER)
      do
         table.put(b + 1, a - 2)
      end

   ecrire07 (a, b: INTEGER)
      do
         table.put(-a, +b)
      end

   ecrire08 (a, b: INTEGER)
      do
         table.put(a + (1 + 1), b - (4 - 1))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_PARAM: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_PARAM
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
