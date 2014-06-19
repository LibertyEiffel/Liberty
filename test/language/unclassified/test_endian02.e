-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_ENDIAN02

inherit
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   file_tools: FILE_TOOLS
      once
         create Result
      end

   make
      local
         bfw: BINARY_FILE_WRITE; bfr: BINARY_FILE_READ
      do
         create bfw.connect_to("test_endian02.dat")
         assert(bfw.is_connected)
         bfw.put_integer_32_native_endian(1)
         bfw.put_integer_32_native_endian(2)
         bfw.put_integer_32_native_endian(3)
         bfw.put_integer_32_native_endian(4)
         bfw.put_integer_32_big_endian(1)
         bfw.put_integer_32_big_endian(2)
         bfw.put_integer_32_big_endian(3)
         bfw.put_integer_32_big_endian(4)
         bfw.put_integer_32_little_endian(1)
         bfw.put_integer_32_little_endian(2)
         bfw.put_integer_32_little_endian(3)
         bfw.put_integer_32_little_endian(4)
         bfw.disconnect
         assert(not bfw.is_connected)
         create bfr.connect_to("test_endian02.dat")
         assert(bfr.is_connected)
         bfr.read_integer_32_native_endian
         assert(bfr.last_integer_32 = 1)
         bfr.read_integer_32_native_endian
         assert(bfr.last_integer_32 = 2)
         bfr.read_integer_32_native_endian
         assert(bfr.last_integer_32 = 3)
         bfr.read_integer_32_native_endian
         assert(bfr.last_integer_32 = 4)
         bfr.read_integer_32_big_endian
         assert(bfr.last_integer_32 = 1)
         bfr.read_integer_32_big_endian
         assert(bfr.last_integer_32 = 2)
         bfr.read_integer_32_big_endian
         assert(bfr.last_integer_32 = 3)
         bfr.read_integer_32_big_endian
         assert(bfr.last_integer_32 = 4)
         bfr.read_integer_32_little_endian
         assert(bfr.last_integer_32 = 1)
         bfr.read_integer_32_little_endian
         assert(bfr.last_integer_32 = 2)
         bfr.read_integer_32_little_endian
         assert(bfr.last_integer_32 = 3)
         bfr.read_integer_32_little_endian
         assert(bfr.last_integer_32 = 4)
         assert(not bfr.end_of_input)
         bfr.read_byte
         assert(bfr.end_of_input)
         bfr.disconnect
         assert(not bfr.is_connected)
         file_tools.delete("test_endian02.dat")
      end

end -- class TEST_ENDIAN02
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
