-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DICTIONARY7

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   test (d: DICTIONARY[INTEGER, INTEGER])
      do
         buffer.clear_count
         d.key_map_in(buffer)
         assert(buffer.count = 0)
         d.item_map_in(buffer)
         assert(buffer.count = 0)
         d.put(1, 1)
         buffer.clear_count
         d.key_map_in(buffer)
         assert(buffer.count = 1)
         assert(buffer.first = 1)
         buffer.clear_count
         d.item_map_in(buffer)
         assert(buffer.count = 1)
         assert(buffer.first = 1)
         d.put(2, 2)
         buffer.clear_count
         d.key_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1.to_integer_32, 2 >> }))
         buffer.clear_count
         d.item_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 2.to_integer_32 >> }))
         d.put(3, 3)
         buffer.clear_count
         d.key_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 2, 3 >> }))
         buffer.clear_count
         d.item_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 2.to_integer_32, 3 >> }))
         d.put(1, 3)
         buffer.clear_count
         d.key_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 2.to_integer_32, 3 >> }))
         buffer.clear_count
         d.item_map_in(buffer)
         buffer_view
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 1, 2.to_integer_32 >> }))
         d.put(1, 2)
         buffer.clear_count
         d.key_map_in(buffer)
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 2.to_integer_32, 3 >> }))
         buffer.clear_count
         d.item_map_in(buffer)
         buffer_view
         sorter.sort(buffer)
         assert(buffer.is_equal({ARRAY[INTEGER] 1, << 1, 1.to_integer_32, 1 >> }))
      end

   make
      do
         test(create {ARRAY_DICTIONARY[INTEGER, INTEGER]}.make)
         test(create {HASHED_DICTIONARY[INTEGER, INTEGER]}.make)
         test(create {PYTHON_DICTIONARY[INTEGER, INTEGER]}.make)
      end

   buffer: ARRAY[INTEGER]
      once
         create Result.with_capacity(12, 1)
      end

   view: STRING

   buffer_view
      local
         i: INTEGER
      do
         view := ("<<").twin
         from
            i := 1
         until
            i > buffer.count
         loop
            buffer.item(i).append_in(view)
            view.extend(' ')
            i := i + 1
         end
         view.append(">>")
      end

   sorter: COLLECTION_SORTER[INTEGER]
      once
      end

end -- class TEST_DICTIONARY7
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
