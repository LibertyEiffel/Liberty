-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_JMJ3TS[T]

inherit
   AUX_JMJ3A2D[T]
      rename make as array2d_make
      redefine dimension
      end

create {ANY}
   array2d_make, dimension

feature {ANY}
   dimension (first_dim, second_dim, tile_width: INTEGER)
      do
         tile := tile_width
         array2d_make(0, first_dim - 1 + 2 * tile_width, 0, second_dim - 1 + 2 * tile_width)
         create column_buffer.make(lower1, upper1)
      end

feature {ANY}
   tile: INTEGER

feature {ANY}
   row (i: INTEGER): T
      do
         Result := storage.item(i)
      end

   column (j: INTEGER): ARRAY[T]
      local
         i: INTEGER
      do
         from
            i := lower1
         until
            i > upper1
         loop
            column_buffer.put(item(i, j), i)
            i := i + 1
         end
         Result := column_buffer
      end

feature {ANY}
   --PH: this function is wrong and unused, so I commented it out.
   --    set_row(new_row: like row; i: INTEGER)
   --       require
   --     same_width: new_row.count = dim2
   --       do
   --     storage.put(new_row,i)
   --       end
   set_column (new_col: like column; j: INTEGER)
      require
         same_width: new_col.count = dim1
      local
         i: INTEGER
      do
         from
            i := lower1
         until
            i > upper1
         loop
            put(new_col.item(i), i, j)
            i := i + 1
         end
      end

feature {ANY}
   column_buffer: like column

end -- class AUX_JMJ3TS
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
