-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FILE_TOOLS

insert
   EIFFELTEST_TOOLS

create {}
   make

feature {ANY}
   file_tools: FILE_TOOLS

   make
      local
         tfw: TEXT_FILE_WRITE; path: STRING; ft: FILE_TOOLS; s: INTEGER; bt1, bt2: TIME; tif: TIME_IN_FRENCH
      do
         path := "tmp657"
         if (create {FILE_TOOLS}).is_readable(path) then
            ft.delete(path)
            assert(ft.last_delete_succeeded)
         end
         assert(not (create {FILE_TOOLS}).is_readable(path))
         create tfw.connect_to(path)
         tfw.disconnect
         bt1 := file_tools.last_change_of(path)
         assert((create {FILE_TOOLS}).is_readable(path))
         assert(ft.is_empty(path))
         ft.delete(path)
         assert(ft.last_delete_succeeded)
         assert(not (create {FILE_TOOLS}).is_readable(path))
         create tfw.connect_to(path)
         tfw.put_string("Hello")
         tfw.disconnect
         s := file_tools.size_of(path)
         assert(s = 5)
         bt2 := file_tools.last_change_of(path)
         assert(bt1.is_equal(bt2))
         ft.delete(path)
         assert(ft.last_delete_succeeded)
         create tif
         tif.set_time(bt1)
      end

end -- class TEST_FILE_TOOLS
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
