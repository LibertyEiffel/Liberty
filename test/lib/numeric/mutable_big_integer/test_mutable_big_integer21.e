-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER21
   -- Test of `is_integer', `is_integer_64',`to_integer_32' and `to_integer_64'.

insert
   AUX_MUTABLE_BIG_INTEGER1

create {}
   make

feature {ANY}
   make
      local
         i: INTEGER
      do
         from
            i := numbers1.lower
         until
            i > numbers1.upper
         loop
            assert(numbers1.item(i).is_integer_32 = res_is_int.item(i))
            assert(numbers1.item(i).is_integer_32 implies numbers1.item(i).to_integer_32 = res_to_int.item(i))
            assert(numbers1.item(i).is_integer_64 = res_is_int_64.item(i))
            assert(numbers1.item(i).is_integer_64 implies numbers1.item(i).to_integer_64 = res_to_int_64.item(i))
            i := i + 1
         end
         verify(numbers1)
      end

   res_is_int: FAST_ARRAY[BOOLEAN]
      once
         Result := {FAST_ARRAY[BOOLEAN] << True, True, True, True, True, True, True, True, True, True, True, True, True, False, True, False, False, False, False, False, False, False, False, False, False, False, False, False, False >> }
      end

   res_is_int_64: FAST_ARRAY[BOOLEAN]
      once
         Result := {FAST_ARRAY[BOOLEAN] << True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, True, False, True, True, True, False, False, False, False, False, False, False, False >> }
      end

   res_to_int: FAST_ARRAY[INTEGER]
      once
         Result := {FAST_ARRAY[INTEGER] << 0, 1, -1, 2, -2, 3, -3, 1000, -1000, 1000000000, -1000000000, Maximum_integer, -Maximum_integer, 0, Minimum_integer, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 >> }
      end

   res_to_int_64: FAST_ARRAY[INTEGER_64]
      once
         Result := {FAST_ARRAY[INTEGER_64] << 0, 1, -1, 2, -2, 3, -3, 1000, -1000, 1000000000, -1000000000, Maximum_integer, -Maximum_integer, -Minimum_integer.to_integer_64, Minimum_integer, Maximum_integer_64, -Maximum_integer_64, 0, Minimum_integer_64, 1000000000000000000, -1000000000000000000, 0, 0, 0, 0, 0, 0, 0 >> }
      end

end -- class TEST_MUTABLE_BIG_INTEGER21
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
