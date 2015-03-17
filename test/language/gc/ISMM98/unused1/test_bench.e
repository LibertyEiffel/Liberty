-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BENCH

create {}
   make

feature {}
   tuning: INTEGER 40_000

   make
      local
         a: ARRAY[ANIMAL]; i: INTEGER
      do
         create a.make(1, 1024)
         from
            i := tuning
         until
            i = 0
         loop
            fill(a)
            clear(a)
            i := i - 1
         end
      end

   fill (array: ARRAY[ANIMAL])
      local
         i: INTEGER; animal: ANIMAL
      do
         from
            i := array.upper
         until
            i < array.lower
         loop
            if i \\ 2 = 0 then
               create {CAT} animal.make
            else
               create {DOG} animal.make
            end
            array.put(animal, i)
            i := i - 1
         end
      end

   clear (array: ARRAY[ANIMAL])
      local
         i: INTEGER; animal: ANIMAL
      do
         from
            i := array.upper
         until
            i < array.lower
         loop
            animal := array.item(i)
            array.put(Void, i)
            if animal.is_cat then
               create {CAT} animal.make
               array.put(animal, i)
            end
            i := i - 1
         end
      end

end -- class TEST_BENCH
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
