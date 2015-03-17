-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_JVM25

inherit
   ANY

create {}
   make

feature {ANY}
   make
      local
         a: ARRAY[ANY]
      do
         create a.make(1, 1)
         if a.lower /= 1 then
            io.put_string("TEST_JVM25: ERROR Test #1%N")
         end
         if a.upper /= 1 then
            io.put_string("TEST_JVM25: ERROR Test #2%N")
         end
         if a.count /= 1 then
            io.put_string("TEST_JVM25: ERROR Test #3%N")
         end
         if a.capacity < 1 then
            io.put_string("TEST_JVM25: ERROR Test #4%N")
         end
         check
            a.item(1) = Void
         end
         a.put(Current, 1)
         check
            a.item(1) = Current
         end
      end

end -- class TEST_JVM25
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
