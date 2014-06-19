-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MUTABLE_BIG_INTEGER10
   --
   -- Testing feature `add_integer'.
   --

insert
   ANY
   PLATFORM

create {}
   make

feature {ANY}
   make
      local
         mbia: MUTABLE_BIG_INTEGER; ib: INTEGER
      do
         create mbia.from_integer(2)
         ib := 0
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = 2)
         assert(("2").is_equal(mbia.to_string))
         mbia.from_integer(0)
         ib := 2
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = 2)
         assert(("2").is_equal(mbia.to_string))
         mbia.from_integer(3)
         ib := 2
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = 5)
         assert(("5").is_equal(mbia.to_string))
         mbia.from_integer_64(Maximum_integer_64)
         ib := 2
         mbia.add_integer(ib)
         mbia.subtract_integer(ib)
         assert(mbia.to_integer_64 = Maximum_integer_64)
         mbia.add(mbia)
         ib := 4096
         mbia.add_integer(ib)
         mbia.from_integer(3)
         ib := -2
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = 1)
         --|mbia| < |ib|
         mbia.from_integer(2)
         ib := -3
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = -1)
         mbia.from_integer(-3)
         ib := -2
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = -5)
         mbia.from_integer(-3)
         ib := 2
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = -1)
         mbia.from_integer(-2)
         ib := 3
         mbia.add_integer(ib)
         assert(mbia.to_integer_32 = 1)
      end

   count: INTEGER

   assert (b: BOOLEAN)
      do
         count := count + 1
         if not b then
            sedb_breakpoint
            io.put_string("TEST_MUTABLE_BIG_INTEGER10 : ERROR Test # ")
            io.put_integer(count)
            io.put_string("%N")
         end
      end

end -- class TEST_MUTABLE_BIG_INTEGER10
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
