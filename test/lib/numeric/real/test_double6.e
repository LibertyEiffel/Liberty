-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_DOUBLE6
   --
   -- To test sprintf_double Java compatibility.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         pi: REAL_64; s: STRING
      do
         if Minimum_real_32 < 0.0 then
            assert(True)
         else
            assert(False)
         end
         if Minimum_real_64 < 0.0 then
            assert(True)
         else
            assert(False)
         end
         if Maximum_real_32 < 0.0 then
            assert(False)
         else
            assert(True)
         end
         if Maximum_real_64 < 0.0 then
            assert(False)
         else
            assert(True)
         end
         pi := 3.14157
         s := pi.to_string_format(2)
         assert(("3.14").is_equal(s))
         s := pi.to_string_format(1)
         assert(("3.1").is_equal(s))
         s := pi.to_string_format(0)
         assert(("3").is_equal(s))
         s := Maximum_real_32.to_string_format(3)
         assert(s.item(s.count - 3) = '.')
         s := Maximum_real_32.to_string_format(1)
         assert(s.item(s.count - 1) = '.')
         s := Maximum_real_32.to_string_format(0)
         assert(s.item(s.count) /= '.')
         s := Minimum_real_32.to_string_format(3)
         assert(s.item(s.count - 3) = '.')
         s := Minimum_real_32.to_string_format(1)
         assert(s.item(s.count - 1) = '.')
         s := Minimum_real_32.to_string_format(0)
         assert(s.item(s.count) /= '.')
         s := Maximum_real_64.to_string_format(3)
         assert(s.item(s.count - 3) = '.')
         s := Maximum_real_64.to_string_format(1)
         assert(s.item(s.count - 1) = '.')
         s := Maximum_real_64.to_string_format(0)
         assert(s.item(s.count) /= '.')
         s := Minimum_real_64.to_string_format(3)
         assert(s.item(s.count - 3) = '.')
         s := Minimum_real_64.to_string_format(1)
         assert(s.item(s.count - 1) = '.')
         s := Minimum_real_64.to_string_format(0)
         assert(s.item(s.count) /= '.')
      end

   assert (b: BOOLEAN)
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_DOUBLE6: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
            crash
         end
      end

   cpt: INTEGER

end -- class TEST_DOUBLE6
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
