-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_DIABLE4[E]

create {ANY}
   from_model

feature {ANY}
   from_model (model: COLLECTION[COLLECTION[E]])
         -- The `model' is used to fill line by line the COLLECTION2.
         -- Assume all sub-collections of `model' have the same indexing.
      local
         line, column: INTEGER
      do
         make(model.lower, model.upper, model.first.lower, model.first.upper)
         from
            line := model.lower
         until
            line > model.upper
         loop
            from
               column := model.first.lower
            until
               column > model.first.upper
            loop
               put(model.item(line).item(column), line, column)
               column := column + 1
            end
            line := line + 1
         end
      end

   put (element: like item; line, column: INTEGER)
      do
         storage.put(element, (line - lower1) * count2 + column - lower2)
      end

   item (line, column: INTEGER): E
      do
         Result := storage.item((line - lower1) * count2 + column - lower2)
      end

   storage: NATIVE_ARRAY[E]

feature {ANY}
   lower1, lower2, upper1, upper2: INTEGER

   count2: INTEGER
      do
         Result := upper2 - lower2 + 1
      end

   make (line_min, line_max, column_min, column_max: INTEGER)
         -- Reset all bounds `line_minimum' / `line_maximum' / `column_minimum' and
         -- `column_maximum' using arguments as new values.
         -- All elements are set to the default value of type E.
      require
         line_min <= line_max
         column_min <= column_max
      do
         lower1 := line_min
         upper1 := line_max
         lower2 := column_min
         upper2 := column_max
         if capacity >= count then
            storage.clear_all(count - 1)
         else
            capacity := count
            storage := storage.calloc(count)
         end
      end

   capacity: INTEGER

   count: INTEGER
      do
         Result := count1 * count2
      end

   count1: INTEGER
      do
         Result := upper1 - lower1 + 1
      end

end -- class AUX_DIABLE4
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
