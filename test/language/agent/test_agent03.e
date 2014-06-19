-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_AGENT03

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         my_collection: COLLECTION[STRING]; agent1: PROCEDURE[TUPLE]; agent2: FUNCTION[TUPLE[APPLE], STRING]
         string: STRING; memo: INTEGER
      do
         my_collection := {ARRAY[STRING] 1, << "Benedicte", "Lucien", "Marie" >> }
         my_collection.for_each(agent print_item1('#', ?))
         number := 0
         my_collection.for_each(agent print_item1('#', ?))
         number := 0
         my_collection.for_each(agent print_item2(?))
         memo := assert_counter.item
         agent1 := agent print3
         assert(memo = assert_counter.item)
         agent1.call([])
         assert(memo = assert_counter.item - 2)
         agent2 := agent function2({APPLE})
         string := agent2.item([ create {APPLE}])
         assert(string.is_equal("APPLE"))
         agent2 := agent function2({APPLE})
         number := 0
         my_collection.for_each(agent (s: STRING) is do assert(s.is_equal(function1(s))) end (?))
         assert(number = 3)
         assert("foo".is_equal((agent function1(?)).item(["foo"])))
      end

   function1 (s: STRING): STRING
      do
         number := number + 1
         Result := s
         inspect
            number
         when 1 then
            assert(Result.is_equal("Benedicte"))
         when 2 then
            assert(Result.is_equal("Lucien"))
         when 3 then
            assert(Result.is_equal("Marie"))
         when 4 then
            assert(Result.is_equal("foo"))
         end
      end

   function2 (f: FRUIT): STRING
      do
         Result := f.generator
         assert(Result.is_equal("APPLE"))
      end

   print3
      do
         assert(True)
      end

   print_item1 (c: CHARACTER; item: STRING)
      require
         c /= '%U'
         item /= Void
      do
         assert(c = '#')
         number := number + 1
         inspect
            number
         when 1 then
            assert(item.is_equal("Benedicte"))
         when 2 then
            assert(item.is_equal("Lucien"))
         when 3 then
            assert(item.is_equal("Marie"))
         end
      end

   print_item2 (item: STRING)
      do
         print_item1('#', item)
      end

   number: INTEGER

end -- class TEST_AGENT03
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
