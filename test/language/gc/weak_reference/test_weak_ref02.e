-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_WEAK_REF02
   -- Test GC of WEAK_REFERENCE[X] and X.
   -- X is a tagged reference type.

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   wr_count: INTEGER 1000

   make
      local
         mem: MEMORY; aux_wr: AUX_WEAK_REF02; aux_wrb: AUX_WEAK_REF02B; wr: WEAK_REFERENCE[AUX_WEAK_REF02B]
         i, void_count: INTEGER
      do
         assert(mem.collecting)
         -- Test # 1
         create list.make
         create weak_list.make
         from
            i := 1
         until
            i > wr_count
         loop
            create aux_wr.make(Current)
            create wr.set_item(aux_wr)
            list.add_last(aux_wr)
            weak_list.add_last(wr)
            i := i + 1
         end
         create aux_wrb -- not really used
         aux_wrb := polymorph(aux_wr, aux_wrb)
         aux_wrb.do_something
         -- to make AUX_WEAK_REF02B polymorph, hence tagged
         aux_wrb := Void
         aux_wr := Void
         wr := Void
         generate_garbage
         mem.collection_on
         mem.full_collect
         assert(aux_wr_disposed = 0) -- Test # 2
         from
            i := 1
         until
            i > wr_count
         loop
            assert(weak_list.item(i).item = list.item(i))
            -- Tests # 3..2+wr_count
            i := i + 1
         end
         from
            i := 1
         until
            i > wr_count
         loop
            list.put(Void, i)
            i := i + 1
         end
         generate_garbage
         mem.collection_on
         mem.full_collect
         -- Actually, the next test is quite pessimistic
         assert(aux_wr_disposed > wr_count / 2) -- Test # 3+wr_count
         from
            i := 1
         until
            i > wr_count
         loop
            if weak_list.item(i).item = Void then
               void_count := void_count + 1
            end
            i := i + 1
         end
         assert(void_count = aux_wr_disposed) -- Test # 4+wr_count
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
      -- We're using LISTs rather than ARRAYs because we don't want to have NATIVE_ARRAY[WEAK_REFERENCE[...]] in
      -- the first test. (Although they are actually not a special case)

   list: LINKED_LIST[AUX_WEAK_REF02B]

   weak_list: LINKED_LIST[WEAK_REFERENCE[AUX_WEAK_REF02B]]

   aux_wr_disposed: INTEGER

   polymorph (awr: AUX_WEAK_REF02; awrb: AUX_WEAK_REF02B): AUX_WEAK_REF02B
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

feature {AUX_WEAK_REF02}
   set_aux_wr_disposed
      do
         aux_wr_disposed := aux_wr_disposed + 1
      end

end -- class TEST_WEAK_REF02
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
