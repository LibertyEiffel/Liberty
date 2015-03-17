-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_STRING3
   -- Test from Philippe Ribet
   -- GC fail on this program. A memory debugging tool may help (overflow).
   -- memset in rso_from_store does overflow.

create {}
   make

feature {}
   make
      local
         str: STRING
      do
         from
            create str.make(5)
            fill(str, 30000)
         until
            str.count > 70000
         loop
            fill(str, 100)
            str.remove_suffix(str.substring(str.count - 5, str.count))
         end
      end

   fill (s: STRING; size: INTEGER)
      require
         size > 0
      local
         i: INTEGER
      do
         from
            i := size
         until
            i <= 0
         loop
            rand.next
            s.add_last((rand.last_integer(25) + 65).to_character)
            i := i - 1
         end
      ensure
         s.count = old s.count + size
      end

   rand: MINIMAL_RANDOM_NUMBER_GENERATOR
      once
         create Result.with_seed(57)
      end

end -- class TEST_STRING3
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
