-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_READ_INTEGER1

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {}
   main
      local
         sfr: TEXT_FILE_READ; i: INTEGER
      do
         create sfr.connect_to("aux_read_integer1.dat")
         assert(sfr.is_connected)
         sfr.read_integer
         i := sfr.last_integer
         assert(i = 1)
         sfr.read_integer
         i := sfr.last_integer
         assert(i = 2)
         sfr.read_character
         assert(sfr.last_character = 'A')
         sfr.read_integer
         i := sfr.last_integer
         assert(i = 3)
         sfr.read_integer
         i := sfr.last_integer
         assert(i = 4)
         assert(sfr.end_of_input)
         sfr.read_integer
         assert(not sfr.valid_last_integer)
         sfr.disconnect
      end

end -- class TEST_READ_INTEGER1
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
