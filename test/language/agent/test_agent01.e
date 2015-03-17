-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT01

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         my_collection: COLLECTION[STRING]
      do
         my_collection := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         my_collection.for_each(agent print_item('#', ?))
      end

   print_item (c: CHARACTER; item: STRING)
      do
         label_assert("check hash / #(1)" # item, c = '#')
         number := number + 1
         inspect
            number
         when 1 then
            label_assert("check Benedicte", item.is_equal("Benedicte"))
         when 2 then
            label_assert("check Lucien", item.is_equal("Lucien"))
         when 3 then
            label_assert("check Marie", item.is_equal("Marie"))
         end
      end

   number: INTEGER

end -- class TEST_AGENT01
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
