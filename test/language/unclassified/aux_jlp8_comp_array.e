-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_JLP8_COMP_ARRAY[E]

inherit
   AUX_JLP8_BASIC_ARRAY[E]

feature {ANY}
   capacity: INTEGER

   make (nb: INTEGER)
      do
         storage := storage.realloc(capacity, nb)
         -- For NATIVE_ARRAY
         capacity := nb
         init(0, nb - 1)
      end

   put (elem: E; i: INTEGER)
      do
         storage.put(elem, i)
      end

   item (i: INTEGER): E
      do
         Result := storage.item(i)
      end

   resize (new_size: INTEGER)
      do
         if new_size > capacity then
            storage := storage.realloc(capacity, new_size)
            -- For NATIVE_ARRAY
            -- storage.resize(new_size)
            capacity := new_size
         end
      end

   storage: NATIVE_ARRAY[E]

end -- class AUX_JLP8_COMP_ARRAY
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
