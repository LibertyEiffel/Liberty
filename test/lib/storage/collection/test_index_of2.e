-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_INDEX_OF2

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   make
      local
         collection: COLLECTION[CHARACTER]
      do
         collection := {FAST_ARRAY[CHARACTER] << 'a', 'b', 'a', 'b', 'b' >> }
         assert(collection.index_of('a', 0) = 0)
         assert(collection.index_of('a', 1) = 2)
         assert(collection.index_of('a', 2) = 2)
         assert(collection.index_of('a', 3) = 5)
         assert(collection.fast_index_of('a', 0) = 0)
         assert(collection.fast_index_of('a', 1) = 2)
         assert(collection.fast_index_of('a', 2) = 2)
         assert(collection.fast_index_of('a', 3) = 5)
         assert(collection.fast_last_index_of('b') = 4)
         assert(collection.last_index_of('b') = 4)
         assert(collection.fast_last_index_of('a') = 2)
         assert(collection.last_index_of('a') = 2)
         assert(collection.fast_reverse_index_of('b', 3) = 3)
         assert(collection.reverse_index_of('b', 3) = 3)
         assert(collection.fast_reverse_index_of('a', 0) = 0)
         assert(collection.reverse_index_of('a', 0) = 0)
         assert(collection.fast_last_index_of('c') = -1)
         assert(collection.last_index_of('c') = -1)
         assert(collection.fast_reverse_index_of('c', 0) = -1)
         assert(collection.reverse_index_of('c', 0) = -1)
         --
         collection := {ARRAY[CHARACTER] 0, << 'a', 'b', 'a', 'b', 'b' >> }
         assert(collection.index_of('a', 0) = 0)
         assert(collection.index_of('a', 1) = 2)
         assert(collection.index_of('a', 2) = 2)
         assert(collection.index_of('a', 3) = 5)
         assert(collection.fast_index_of('a', 0) = 0)
         assert(collection.fast_index_of('a', 1) = 2)
         assert(collection.fast_index_of('a', 2) = 2)
         assert(collection.fast_index_of('a', 3) = 5)
         assert(collection.fast_last_index_of('b') = 4)
         assert(collection.last_index_of('b') = 4)
         assert(collection.fast_last_index_of('a') = 2)
         assert(collection.last_index_of('a') = 2)
         assert(collection.fast_reverse_index_of('b', 3) = 3)
         assert(collection.reverse_index_of('b', 3) = 3)
         assert(collection.fast_reverse_index_of('a', 0) = 0)
         assert(collection.reverse_index_of('a', 0) = 0)
         assert(collection.fast_last_index_of('c') = -1)
         assert(collection.last_index_of('c') = -1)
         assert(collection.fast_reverse_index_of('c', 0) = -1)
         assert(collection.reverse_index_of('c', 0) = -1)
         --
         collection := {RING_ARRAY[CHARACTER] 0, << 'a', 'b', 'a', 'b', 'b' >> }
         assert(collection.index_of('a', 0) = 0)
         assert(collection.index_of('a', 1) = 2)
         assert(collection.index_of('a', 2) = 2)
         assert(collection.index_of('a', 3) = 5)
         assert(collection.fast_index_of('a', 0) = 0)
         assert(collection.fast_index_of('a', 1) = 2)
         assert(collection.fast_index_of('a', 2) = 2)
         assert(collection.fast_index_of('a', 3) = 5)
         assert(collection.fast_last_index_of('b') = 4)
         assert(collection.last_index_of('b') = 4)
         assert(collection.fast_last_index_of('a') = 2)
         assert(collection.last_index_of('a') = 2)
         assert(collection.fast_reverse_index_of('b', 3) = 3)
         assert(collection.reverse_index_of('b', 3) = 3)
         assert(collection.fast_reverse_index_of('a', 0) = 0)
         assert(collection.reverse_index_of('a', 0) = 0)
         assert(collection.fast_last_index_of('c') = -1)
         assert(collection.last_index_of('c') = -1)
         assert(collection.fast_reverse_index_of('c', 0) = -1)
         assert(collection.reverse_index_of('c', 0) = -1)
         --
         collection := {LINKED_LIST[CHARACTER] << 'a', 'b', 'a', 'b', 'b' >> }
         assert(collection.index_of('a', 1) = 1)
         assert(collection.index_of('a', 2) = 3)
         assert(collection.index_of('a', 3) = 3)
         assert(collection.index_of('a', 4) = 6)
         assert(collection.fast_index_of('a', 1) = 1)
         assert(collection.fast_index_of('a', 2) = 3)
         assert(collection.fast_index_of('a', 3) = 3)
         assert(collection.fast_index_of('a', 4) = 6)
         assert(collection.fast_last_index_of('b') = 5)
         assert(collection.last_index_of('b') = 5)
         assert(collection.fast_last_index_of('a') = 3)
         assert(collection.last_index_of('a') = 3)
         assert(collection.fast_reverse_index_of('b', 4) = 4)
         assert(collection.reverse_index_of('b', 4) = 4)
         assert(collection.fast_reverse_index_of('a', 1) = 1)
         assert(collection.reverse_index_of('a', 1) = 1)
         assert(collection.fast_last_index_of('c') = 0)
         assert(collection.last_index_of('c') = 0)
         assert(collection.fast_reverse_index_of('c', 1) = 0)
         assert(collection.reverse_index_of('c', 1) = 0)
         --
         collection := {TWO_WAY_LINKED_LIST[CHARACTER] << 'a', 'b', 'a', 'b', 'b' >> }
         assert(collection.index_of('a', 1) = 1)
         assert(collection.index_of('a', 2) = 3)
         assert(collection.index_of('a', 3) = 3)
         assert(collection.index_of('a', 4) = 6)
         assert(collection.fast_index_of('a', 1) = 1)
         assert(collection.fast_index_of('a', 2) = 3)
         assert(collection.fast_index_of('a', 3) = 3)
         assert(collection.fast_index_of('a', 4) = 6)
         assert(collection.fast_last_index_of('b') = 5)
         assert(collection.last_index_of('b') = 5)
         assert(collection.fast_last_index_of('a') = 3)
         assert(collection.last_index_of('a') = 3)
         assert(collection.fast_reverse_index_of('b', 4) = 4)
         assert(collection.reverse_index_of('b', 4) = 4)
         assert(collection.fast_reverse_index_of('a', 1) = 1)
         assert(collection.reverse_index_of('a', 1) = 1)
         assert(collection.fast_last_index_of('c') = 0)
         assert(collection.last_index_of('c') = 0)
         assert(collection.fast_reverse_index_of('c', 1) = 0)
         assert(collection.reverse_index_of('c', 1) = 0)
      end

end -- class TEST_INDEX_OF2
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
