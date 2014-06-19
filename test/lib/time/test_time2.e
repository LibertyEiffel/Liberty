-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_TIME2

insert
   EIFFELTEST_TOOLS

create {}
   main

feature {ANY}
   main
      local
         dt: TIME; v: INTEGER
      do
         v := dt.year
         assert(dt.set(1998, 1, 1, 0, 0, 0))
         assert(dt.year = 1998)
         assert(dt.set(2000, 1, 1, 0, 0, 0))
         assert(dt.year = 2000)
         assert(dt.set(1999, 1, 1, 0, 0, 0))
         assert(dt.year = 1999)
         assert(dt.set(2000, 7, 2, 0, 0, 0))
         assert(dt.year = 2000)
         assert(dt.month = 7)
         assert(dt.day = 2)
         assert(dt.year_day = 183)
         assert(dt.hour = 0)
         assert(dt.minute = 0)
         assert(dt.second = 0)
         assert(dt.set(2000, 12, 30, 0, 0, 0))
         assert(dt.year = 2000)
         assert(dt.month = 12)
         assert(dt.day = 30)
         assert(dt.year_day = 364)
         assert(dt.hour = 0)
         assert(dt.minute = 0)
         assert(dt.second = 0)
         assert(dt.set(2000, 12, 31, 0, 0, 0))
         assert(dt.year = 2000)
         assert(dt.month = 12)
         assert(dt.day = 31)
         assert(dt.year_day = 365)
         assert(dt.hour = 0)
         assert(dt.minute = 0)
         assert(dt.second = 0)
      end

end -- class TEST_TIME2
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
