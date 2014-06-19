-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NATIVE_ARRAY_COLLECTOR02

insert
   EIFFELTEST_TOOLS
   NATIVE_ARRAY_COLLECTOR[STRING]

create {}
   make

feature {ANY}
   make
      do
         capacity := 1
         honeypot := honeypot.calloc(capacity)
         full_collect
         assert(flag)
         assert(not reentering)
      end

   mark_native_arrays
      do
         reentering := reentering or else in_mark
         if not in_mark then
            -- To avoid screwing up the test suite
            in_mark := True
            full_collect -- This is evil, eh?
            flag := True
            in_mark := False
         end
      end

   flag, reentering, in_mark: BOOLEAN

   capacity: INTEGER

   honeypot: NATIVE_ARRAY[STRING]

   full_collect
      local
         m: MEMORY
      do
         m.full_collect
      end

end -- class TEST_NATIVE_ARRAY_COLLECTOR02
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
