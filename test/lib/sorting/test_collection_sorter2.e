-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_COLLECTION_SORTER2

create {}
   make

feature {}
   make
      local
         model, resul: ARRAY[STRING]
      do
         create model.make(1, 0)
         resul := model.twin
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "a" >> }
         resul := {ARRAY[STRING] 1, << "a" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "a", "b" >> }
         resul := {ARRAY[STRING] 1, << "a", "b" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "b", "a" >> }
         resul := {ARRAY[STRING] 1, << "a", "b" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "a", "aa", "c" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "aa", "c", "a" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "c", "a", "aa" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "c", "aa", "a" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "a", "aa", "c", "d" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "aa", "c", "d", "a" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "c", "d", "a", "aa" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "c", "d", "a", "aa", "e", "f" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d", "e", "f" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "g", "c", "d", "a", "aa", "e", "f" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d", "e", "f", "g" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "g", "c", "d", "a", "h", "aa", "e", "f" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d", "e", "f", "g", "h" >> }
         test_with(model, resul)
         model := {ARRAY[STRING] 1, << "g", "c", "d", "a", "h", "aa", "e", "f", "d" >> }
         resul := {ARRAY[STRING] 1, << "a", "aa", "c", "d", "d", "e", "f", "g", "h" >> }
         test_with(model, resul)
      end

   test_with (model, resul: COLLECTION[STRING])
      do
         test_with_array(model, resul)
         test_with_fixed_array(model, resul)
         test_with_link_list(model, resul)
         test_with_link2_list(model, resul)
      end

   test_with_array (model, resul: COLLECTION[STRING])
      local
         m, r: ARRAY[STRING]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_fixed_array (model, resul: COLLECTION[STRING])
      local
         m, r: FAST_ARRAY[STRING]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_link_list (model, resul: COLLECTION[STRING])
      local
         m, r: LINKED_LIST[STRING]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   test_with_link2_list (model, resul: COLLECTION[STRING])
      local
         m, r: TWO_WAY_LINKED_LIST[STRING]
      do
         create m.from_collection(model)
         create r.from_collection(resul)
         do_test(m, r)
      end

   do_test (model, resul: COLLECTION[STRING])
      local
         sorter: COLLECTION_SORTER[STRING]
      do
         assert(sorter.is_sorted(resul))
         sorter.von_neuman_sort(model)
         assert(sorter.is_sorted(model))
         assert(resul.is_equal(model))
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_COLLECTION_SORTER2: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         end
      end

   cpt: INTEGER

end -- class TEST_COLLECTION_SORTER2
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
