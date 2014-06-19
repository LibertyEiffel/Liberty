-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_NUMBER07
   -- simple tests of comparaisons between small_integer number and integer

insert
   NUMBER_TOOLS
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   make
      local
         text_file_read: TEXT_FILE_READ; text_file_write: TEXT_FILE_WRITE; n: NUMBER
      do
         create text_file_read.connect_to("test_number07.in")
         n := from_input_stream(text_file_read)
         text_file_read.disconnect
         assert(n @= 1000)
         create text_file_write.connect_to("test_number07.new")
         n := from_integer(1)
         text_file_write.put_string("%"")
         text_file_write.put_number(n)
         text_file_write.put_string("%"")
         assert(n @= 1)
         text_file_write.disconnect
         assert(file_tools.same_files("test_number07.new", "test_number07.ref"))
      end

   file_tools: FILE_TOOLS

end -- class TEST_NUMBER07
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
