-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT34
   -- SZ:116:

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         my_collection: COLLECTION[STRING]; my_list: LINKED_LIST[STRING]; my_set: HASHED_SET[STRING]
      do
         my_collection := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         create my_list.make
         -- Using an agent to fill `my_list' using `my_collection':
         my_collection.for_each(agent my_list.add_last(?))
         create my_set.make
         -- Using an agent to fill `my_set' with `my_list':
         my_list.for_each(agent my_set.add(?))
         -- Using an agent to print `my_set':
         my_set.for_each(agent print_item(?))
      end

   counter: INTEGER

   print_item (item: STRING)
      do
         counter := counter + 1
         inspect
            counter
         when 1 then
            assert(item.is_equal("Benedicte"))
         when 2 then
            assert(item.is_equal("Marie"))
         when 3 then
            assert(item.is_equal("Lucien"))
         end
      end

end -- class TEST_AGENT34
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
