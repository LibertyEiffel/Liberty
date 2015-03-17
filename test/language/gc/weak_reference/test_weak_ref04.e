-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_WEAK_REF04
   -- Test GC of WEAK_REFERENCE[X] with various types of X (anchored...).

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   wr_count: INTEGER 1000

   make
      local
         mem: MEMORY; aux_wr: AUX_WEAK_REF04; a_aux_wr1, a_aux_wr2, a_aux_wr3: FAST_ARRAY[AUX_WEAK_REF04]
         i, void_count_1, void_count_2, void_count_3: INTEGER
      do
         assert(mem.collecting)
         -- Test # 1
         create aux_wrb -- not really used
         create aux_wr.make(Current)
         aux_wrb := polymorph(aux_wr, aux_wrb)
         aux_wrb.do_something
         -- to make AUX_WEAK_REF02B polymorphic, hence tagged
         aux_wrb := Void
         create a_aux_wr1.with_capacity(wr_count)
         create a_aux_wr2.with_capacity(wr_count)
         create a_aux_wr3.with_capacity(wr_count)
         create a_wr1.with_capacity(wr_count)
         create a_wr2.with_capacity(wr_count)
         create a_wr3.with_capacity(wr_count)
         from
            i := wr_count - 1
         until
            i < 0
         loop
            a_aux_wr1.add_last(create {AUX_WEAK_REF04}.make(Current))
            a_wr1.add_last(create {WEAK_REFERENCE[AUX_WEAK_REF02B]}.set_item(a_aux_wr1.last))
            a_aux_wr2.add_last(create {AUX_WEAK_REF04}.make(Current))
            a_wr2.add_last(create {WEAK_REFERENCE[AUX_WEAK_REF02B]}.set_item(a_aux_wr2.last))
            a_aux_wr3.add_last(create {AUX_WEAK_REF04}.make(Current))
            a_wr3.add_last(create {WEAK_REFERENCE[AUX_WEAK_REF02B]}.set_item(a_aux_wr3.last))
            i := i - 1
         end
         generate_garbage
         mem.collection_on
         mem.full_collect
         assert(aux_wr_nb_disposed = 0) -- Test # 2
         from
            i := wr_count - 1
         until
            i < 0
         loop
            assert(a_wr1.item(i).item = a_aux_wr1.item(i))
            a_aux_wr1.put(Void, i)
            assert(a_wr2.item(i).item = a_aux_wr2.item(i))
            a_aux_wr2.put(Void, i)
            assert(a_wr3.item(i).item = a_aux_wr3.item(i))
            a_aux_wr3.put(Void, i)
            i := i - 1
         end
         generate_garbage
         mem.collection_on
         mem.full_collect
         from
            i := wr_count - 1
         until
            i < 0
         loop
            if a_wr1.item(i).item = Void then
               void_count_1 := void_count_1 + 1
            end
            if a_wr2.item(i).item = Void then
               void_count_2 := void_count_2 + 1
            end
            if a_wr3.item(i).item = Void then
               void_count_3 := void_count_3 + 1
            end
            i := i - 1
         end
         -- Actually, the next test is quite pessimistic
         assert(void_count_1 > wr_count / 2)
         assert(void_count_2 > wr_count / 2)
         assert(void_count_3 > wr_count / 2)
         assert(aux_wr_nb_disposed = void_count_1 + void_count_2 + void_count_3)
         assert(aux_wr /= Void) -- To prevent gcc's optimizer from recycling aux_wr
      end

   generate_garbage
      local
         i: INTEGER; s: STRING
      do
         from
            i := 1
         until
            i = 10000
         loop
            create s.make_from_string("quark           ends here")
            i := i + 1
         end
      end

   aux_wrb: AUX_WEAK_REF02B

   wr: WEAK_REFERENCE[AUX_WEAK_REF02B]

   a_wr1: FAST_ARRAY[WEAK_REFERENCE[AUX_WEAK_REF02B]]

   a_wr2: FAST_ARRAY[like wr]

   a_wr3: FAST_ARRAY[WEAK_REFERENCE[like aux_wrb]]

   aux_wr_nb_disposed: INTEGER

   polymorph (awr: AUX_WEAK_REF04; awrb: AUX_WEAK_REF02B): AUX_WEAK_REF02B
      local
         rnd: MINIMAL_RANDOM_NUMBER_GENERATOR
      do
         create rnd.make
         if rnd.last_integer(100).is_odd then
            Result := awr
         else
            Result := awrb
         end
      end

feature {AUX_WEAK_REF04}
   increment_aux_wr_nb_disposed
      do
         aux_wr_nb_disposed := aux_wr_nb_disposed + 1
      end

end -- class TEST_WEAK_REF04
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
