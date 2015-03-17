-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
expanded class AUX_POSITION
   --
   -- To test the True POSITION class of the compiler.
   --

insert
   PLATFORM
   ANY

feature {ANY}
   line: INTEGER
         -- The corresponding `line' number in the source file or 0
         -- when `is_unknown'.
      local
         bit: INTEGER_32
      do
         if mangling.bit_test(0) then
            bit := mangling |>> 1
            bit := bit.bit_and(0x00007fff)
         else
            bit := mangling |>> 8
            bit := bit.bit_and(0x00001fff)
         end
         Result := bit
      ensure
         not is_unknown implies Result >= 0
      end

   column: INTEGER
         -- The `column' number in the source file or 0 when `is_unknown' or
         -- when there is not enough space in `mangling' for the `column'.
      local
         bit: INTEGER_32
      do
         if mangling.bit_test(0) then
            -- Result is 0 because `column' is not memorized.
         else
            bit := mangling |>> 1 -- To drop the flag.
            bit := bit.bit_and(0x0000007f)
            Result := bit
         end
      ensure
         Result >= 0
      end

   is_unknown: BOOLEAN
         -- True when the `eiffel_parser' as called `set'.
      do
         Result := mangling = 0
      end

   set (li, co: INTEGER; class_id: INTEGER_16)
      require
         li >= 1
         co >= 1
         class_id >= 0
      local
         l, c, i: INTEGER
      do
         check
            Integer_bits >= 32
         end
         if class_id <= 2047 and then li <= 8191 and then co <= 127 then
            mangling := class_id.to_integer_32 |<< 21 -- 11 bits for `id'
            mangling := mangling | (li |<< 8) -- 13 bits for `line'
            mangling := mangling | (co |<< 1) -- 7  bits for `column'
         else
            -- The `column' is not memorized.
            mangling := class_id.to_integer_32 |<< 17 -- 15 bits for `id'
            mangling := mangling | (li |<< 1) -- 16 bits for `line'
            mangling := mangling | 1 -- forget `column'.
         end
         l := line
         c := column
         i := id
      ensure
         line = li
         id = class_id
         column = 0 or else column = co
      end

   mangling: INTEGER_32
         -- In order to save memory (there are a lot of objects like `Current'),
         -- the `id' of the class, the `line' and the `column' are saved in this
         -- BIT sequence. Two mangling are used, and the `column' may be
         -- dropped (not memorized, see `set'). This implementation assume
         -- that `Integer_bits' is greater or equal to 32.

   id: INTEGER_16
      do
         if mangling.bit_test(0) then
            Result := (mangling |>>> 17).low_16
         else
            Result := (mangling |>>> 21).low_16
         end
      ensure
         Result >= 0
      end

end -- class AUX_POSITION
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
