-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class AUX_JLP8_EPEE_ARRAY[E]

inherit
   AUX_JLP8_COMP_ARRAY[E]
      redefine make, put
      end

insert
   AUX_JLP8_EPEE_COLLECTION[E]
   AUX_JLP8_COMP_ARRAY[E]
      rename make as comp_make,
         put as comp_put
      end

create {ANY}
   make

feature {ANY}
   remove_item (e: E)
      do
      end

   make (nb: INTEGER)
      do
         comp_make(nb)
         count := 0
      end

   count: INTEGER

   lower: INTEGER 0

   upper: INTEGER
      do
         Result := count - 1
      end

   empty: BOOLEAN
      do
         Result := count = 0
      end

   full: BOOLEAN False

   add_item (elem: E)
      do
         if count = capacity then
            resize(count + 10)
         end
         comp_put(elem, count)
         count := count + 1
      end

   put (elem: E; i: INTEGER)
      do
         if i >= count then
            count := i + 1
         end
         comp_put(elem, i)
      end

end -- class AUX_JLP8_EPEE_ARRAY
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
