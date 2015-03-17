-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BINARY_FILE_WRITE

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   file_tools: FILE_TOOLS

   make
      local
         bfw: BINARY_FILE_WRITE; bfr: BINARY_FILE_READ
      do
         create bfw.connect_to("test_binary_file_write.dat")
         assert(bfw.is_connected)
         bfw.put_byte(1)
         bfw.disconnect
         assert(not bfw.is_connected)
         create bfr.connect_to("test_binary_file_write.dat")
         assert(bfr.is_connected)
         bfr.read_byte
         assert(bfr.last_byte = 1)
         assert(not bfr.end_of_input)
         bfr.read_byte
         assert(bfr.end_of_input)
         bfr.disconnect
         assert(not bfr.is_connected)
         file_tools.delete("test_binary_file_write.dat")
      end

end -- class TEST_BINARY_FILE_WRITE
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
