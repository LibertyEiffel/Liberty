-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COLLECTION_SORTER5
   --SZ:76: lte(x, y) and gte(x, y) does not implies is_equal(x, y)
   --This is the case when lt() is defined using non-uniq key (for
   --database entries for example)

insert
   ABSTRACT_SORTER[STRING]
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         c: COLLECTION[STRING]
      do
         c := {ARRAY[STRING] 1, << "dd", "bb", "aa", "cc", "azer", "arthur" >> }
         by_first_char := True
         sort(c)
         add(c, "asdf")
         assert(index_of(c, "azer") = 2)
         by_first_char := False
         c.swap(c.lower, c.upper)
         sort(c)
         add(c, "acvb")
         assert(index_of(c, "azer") = 5)
         by_first_char := True
         c.swap(c.lower, c.upper)
         sort(c)
         add(c, "btyu")
         assert(index_of(c, "azer") = 1)
      end

   by_first_char: BOOLEAN

   lt (x, y: STRING): BOOLEAN
      do
         if by_first_char then
            Result := x.item(1) < y.item(1)
         else
            Result := x < y
         end
      end

feature {}
   print_collection (c: COLLECTION[STRING])
      local
         i: INTEGER
      do
         from
            i := c.lower
         until
            i > c.upper
         loop
            io.put_string(c.item(i))
            io.put_character(' ')
            i := i + 1
         end
         io.put_character('%N')
      end

end -- class TEST_COLLECTION_SORTER5
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
