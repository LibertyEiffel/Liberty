-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER11
   --
   -- Testing feature `add' when magnitude must grow up.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         mbia, mbib, mbir, mbiq: MUTABLE_BIG_INTEGER; i: INTEGER_64
      do
         create mbia.from_integer_64(Maximum_integer_64)
         create mbib.from_integer_64(Maximum_integer_64)
         create mbiq.from_integer(13)
         create mbir.from_integer(12)
         from
            i := 0
         until
            i = 100
         loop
            mbia.add(mbia)
            i := i + 1
         end
         mbib.shift_left(100)
         assert(mbia.is_equal(mbib))
         mbia.divide_to(mbia, mbiq, mbir)
         assert(mbiq.is_one)
         assert(mbir.is_zero)
         mbia.multiply_to(mbib, mbir)
         assert(mbia.is_equal(mbib))
         mbir.divide_to(mbia, mbiq, mbib)
         assert(mbia.is_equal(mbiq))
         assert(mbib.is_zero)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER11 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER11
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
