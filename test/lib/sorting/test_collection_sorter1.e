-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COLLECTION_SORTER1

create {}
   make

feature {}
   make
      local
         model, resul: ARRAY[CHARACTER]
      do
         create model.make(1, 0)
         resul := model.twin
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'a', 'b' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'b', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'b', 'c', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'c', 'a', 'b' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'c', 'b', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'b', 'c', 'd', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'c', 'd', 'a', 'b' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'c', 'd', 'a', 'b', 'e', 'f' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e', 'f' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'g', 'c', 'd', 'a', 'b', 'e', 'f' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e', 'f', 'g' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'g', 'c', 'd', 'a', 'h', 'b', 'e', 'f' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'g', 'c', 'd', 'a', 'h', 'b', 'e', 'f', 'd' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'd', 'e', 'f', 'g', 'h' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'b', 'c', 'd', 'e', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e' >> }
         test_with(model, resul)
         model := {ARRAY[CHARACTER] 1, << 'b', 'c', 'd', 'e', 'f', 'a' >> }
         resul := {ARRAY[CHARACTER] 1, << 'a', 'b', 'c', 'd', 'e', 'f' >> }
         test_with(model, resul)
      end

   test_with (model, resul: COLLECTION[CHARACTER])
      do
         test_with_array(model, resul)
         test_with_fixed_array(model, resul)
         test_with_link_list(model, resul)
         test_with_link2_list(model, resul)
      end

   test_with_array (model, resul: COLLECTION[CHARACTER])
      local
         m, r: ARRAY[CHARACTER]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_fixed_array (model, resul: COLLECTION[CHARACTER])
      local
         m, r: FAST_ARRAY[CHARACTER]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_link_list (model, resul: COLLECTION[CHARACTER])
      local
         m, r: LINKED_LIST[CHARACTER]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_link2_list (model, resul: COLLECTION[CHARACTER])
      local
         m, r: TWO_WAY_LINKED_LIST[CHARACTER]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   do_test (model, resul: COLLECTION[CHARACTER])
      local
         sorter: COLLECTION_SORTER[CHARACTER]; m: COLLECTION[CHARACTER]
      do
         assert(sorter.is_sorted(resul))
         m := model.twin
         sorter.sort(m)
         assert(sorter.is_sorted(m))
         assert(resul.is_equal(m))
         m := model.twin
         sorter.von_neuman_sort(m)
         assert(sorter.is_sorted(m))
         assert(resul.is_equal(m))
         m := model.twin
         sorter.bubble_sort(m)
         assert(sorter.is_sorted(m))
         assert(resul.is_equal(m))
         m := model.twin
         sorter.heap_sort(m)
         assert(sorter.is_sorted(m))
         assert(resul.is_equal(m))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_COLLECTION_SORTER1: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_COLLECTION_SORTER1
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
