-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BYSL1
   -- From: Benjamin Yin-Sun Lynn <blynn@Stanford.EDU>

create {}
   make

feature {ANY}
   array: ARRAY[STRING]
      once
         Result := {ARRAY[STRING] 1, << "one", once "two", "three", "four" >> }
      end

   show
      local
         i: INTEGER
      do
         from
            i := array.lower
         until
            i > array.upper
         loop
            io.put_string("%"" + array.item(i) + "%"%N")
            i := i + 1
         end
      end

   make
      local
         i, j: INTEGER; s: STRING
      do
         from
            j := 1
         until
            j > 3
         loop
            from
               i := 1
            until
               i > 100000
            loop
               create s.make(5)
               i := i + 1
            end
            if not array.item(1).is_equal("one") then
               io.put_string("BUG!%N")
               show
               die_with_code(1)
            end
            j := j + 1
         end
      end

end -- class TEST_BYSL1
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
