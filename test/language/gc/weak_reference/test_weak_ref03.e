-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_WEAK_REF03
   -- Test GC of NATIVE_ARRAY[WEAK_REFERENCE[X]], WEAK_REFERENCE[X] and X.

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         mem: MEMORY; i, wr_voided: INTEGER; na_aux: NATIVE_ARRAY[AUX_WEAK_REF03]
         na_wr: NATIVE_ARRAY[WEAK_REFERENCE[AUX_WEAK_REF03]]; aux_wr: AUX_WEAK_REF03
         wr: WEAK_REFERENCE[AUX_WEAK_REF03]
      do
         assert(mem.collecting)
         -- Test # 1
         from
            na_aux := na_aux.calloc(Nb_items)
            na_wr := na_wr.calloc(Nb_items)
            i := Nb_items - 1
         until
            i < 0
         loop
            create aux_wr.make(Current)
            create wr.set_item(aux_wr)
            na_wr.put(wr, i)
            assert(na_wr.item(i).item = aux_wr) -- Test # 2 4 6 8 10 12 14 16 18 20 22 24 26
            na_aux.put(aux_wr, i)
            assert(na_aux.item(i) = aux_wr) -- Test # 3 5 7 9 11 13 15 17 19 21 25 27
            i := i - 1
         end
         aux_wr := Void
         generate_garbage
         mem.collection_off
         mem.full_collect
         assert(aux_wr_nb_disposed = 0) -- Test # 28
         from
            i := Nb_items - 1
         until
            i < 0
         loop
            assert(na_wr.item(i).item = na_aux.item(i))
            -- Test # 29 30 31 32 33 34 35 36 37 38 39 40 41
            na_aux.put(Void, i)
            i := i - 1
         end
         generate_garbage
         mem.collection_on
         mem.full_collect
         assert(aux_wr_nb_disposed > Nb_items / 2) -- Test # 42
         from
            i := Nb_items - 1
         until
            i < 0
         loop
            if na_wr.item(i).item = Void then
               wr_voided := wr_voided + 1
            end
            i := i - 1
         end
         assert(aux_wr_nb_disposed <= wr_voided) -- Test # 43
      end

   Nb_items: INTEGER 13

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

   aux_wr_nb_disposed: INTEGER

feature {AUX_WEAK_REF03}
   increment_aux_wr_nb_disposed
      do
         aux_wr_nb_disposed := aux_wr_nb_disposed + 1
      end

end -- class TEST_WEAK_REF03
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
