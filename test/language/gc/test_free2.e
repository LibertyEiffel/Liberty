-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FREE2
   -- From philippe Coucaud <Philippe.Coucaud@telelogic.com>

insert
   MEMORY

create {}
   make

feature {ANY}
   scale_factor: INTEGER 1
         -- 3
         -- 2
         -- 1 -> 38Mo

   make
      local
         d0, d1, d2: ARRAY[ARRAY[REAL_64]]; a: ARRAY[REAL_64]; i, j: INTEGER
      do
         from
            j := 200
         until
            j < 0
         loop
            -- allocate medium and big size RSOC
            from
               i := 30 * scale_factor
               create d0.make(1, 0)
               create d1.make(1, 0)
            until
               i < 1
            loop
               create a.make(0, 33777)
               -- requires a big chunk
               d0.add_last(a)
               create a.make(0, 2711) -- should fit in a 32K RSOC
               d1.add_last(a)
               i := i - 1
            end
            create d0.make(1, 0)
            -- forget previous d0
            -- allocate small and medium size RSOC
            from
               i := 40 * scale_factor
               create d1.make(1, 0)
               create d2.make(1, 0)
            until
               i < 1
            loop
               create a.make(0, 1971)
               -- should fit in a 32K RSOC
               d1.add_last(a)
               create a.make(0, 357)
               d2.add_last(a)
               i := i - 1
            end
            create d1.make(1, 0) -- forget previous d1
            create d2.make(1, 0)
            -- forget previous d2
            -- allocate big RSOC again
            from
               i := 30 * scale_factor
               create d0.make(1, 0)
            until
               i < 1
            loop
               create a.make(0, 35001)
               -- should fit in a 32K RSOC
               d0.add_last(a)
               i := i - 1
            end
            j := j - 1
         end
      end

end -- class TEST_FREE2
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
