-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class AUX_JLP8_MATRIX[E -> NUMERIC]

inherit
   AUX_JLP8_EPEE_ARRAY[E]
      rename item as array_item,
         put as array_put,
         make as array_make
      end

feature {ANY}
   make (nb_r, nb_c: INTEGER)
      do
         array_make(nb_c * nb_r)
      end

   make_unit (nb_r, nb_c: INTEGER)
      local
         index: INTEGER; value: E; max_index: INTEGER
      do
         make(nb_r, nb_c)
         if nb_row > nb_column then
            max_index := nb_column
         else
            max_index := nb_row
         end
         from
            index := 0
         until
            index = max_index
         loop
            put(value.one, index, index)
            index := index + 1
         end
      end

   item (l, c: INTEGER): E
      do
         Result := array_item(translate_indexes(l, c))
      end

   put (v: E; l, c: INTEGER)
      do
         array_put(v, translate_indexes(l, c))
      end

   row (l: INTEGER): AUX_JLP8_ROW_PROVIDER[E]
      do
         create Result.make(Current, l)
      end

   rows: AUX_JLP8_PROVIDER[AUX_JLP8_PROVIDER[E]]
         -- MATRIX_ROWS[E]
      local
         p: AUX_JLP8_MATRIX_ROWS[E]
      do
         create p
         p.make(Current)
         Result := p
      end

   set_row (l: INTEGER; p: AUX_JLP8_PROVIDER[E])
      local
         index: INTEGER
      do
         from
            p.start
            index := 0
         until
            p.exhausted or index >= nb_column
         loop
            put(p.item, l, index)
            p.next
            index := index + incr_column
         end
      end

feature {ANY}
   nb_row: INTEGER

   valid_row (r: INTEGER): BOOLEAN
      do
         Result := r < nb_row
      end

   valid_column (c: INTEGER): BOOLEAN
      do
         Result := c < nb_column
      end

   valid_indexes (l, c: INTEGER): BOOLEAN
      do
         Result := valid_row(l) and valid_column(c)
      end

   nb_column: INTEGER

   incr_row: INTEGER

   incr_column: INTEGER

   translate_indexes (l, c: INTEGER): INTEGER
      deferred
      end

end -- class AUX_JLP8_MATRIX
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
