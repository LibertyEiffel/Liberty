-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_SZ513
   -- For SZ:513: from jose.bollo@tele2.fr (jose bollo)

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {ANY}
   main
      local
         string: STRING; collection: FAST_ARRAY[AUX_SZ513]; integer: INTEGER; aux_sz513: AUX_SZ513
      do
         create collection.make(5)
         from
            integer := collection.upper
         until
            integer < collection.lower
         loop
            aux_sz513.set_value(integer)
            collection.put(aux_sz513, integer)
            integer := integer - 1
         end
         string := ""
         collection.for_each(agent {AUX_SZ513}.append_in(string))
         assert(string.is_equal(" 0  1  2  3  4 "))
      end

end -- class TEST_SZ513
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
