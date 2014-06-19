-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_IRF3
   -- Test inlining of RUN_FEATURE3.

create {}
   make

feature {ANY}
   att: INTEGER

   make
      do
         set_attribute1(1 + 1)
         set_attribute2
         set_attribute3
         set_attribute4
         set_attribute5
         inline1
         inline2
         inline3
         inline4
      end

feature {} -- All those feature are inlined in -boost mode :
   set_attribute1 (a: like att)
      do
         att := a
      end

   set_attribute2
      do
         att := 4
      end

   set_attribute3
      local
         i: INTEGER
      do
         att := i
      end

   set_attribute4
      local
         i: INTEGER
      do
         att := i
      end

   set_attribute5
      local
         i: INTEGER; j: INTEGER
      do
         att := i + j
      end

   inline1
      do
      end

   inline2
      local
         i: INTEGER; j: INTEGER
      do
         i := 1
         j := i + 1
      end

   inline3
      do
         inline1
         inline2
      end

feature {} -- Recursive call is not inlined :-)
   inline4
      local
         i: INTEGER
      do
         i := i + 1
         if i < 0 then
            inline4
         end
      end

feature {}
   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_INTEGER1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N");
         end
      end

   cpt: INTEGER

end -- class TEST_IRF3
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
