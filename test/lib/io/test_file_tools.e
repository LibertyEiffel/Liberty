-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_FILE_TOOLS

create {}
   make

feature {ANY}
   file_tools: FILE_TOOLS

   make is
      local
         tfw: TEXT_FILE_WRITE; path: STRING; ft: FILE_TOOLS; s: INTEGER; bt1, bt2: TIME; tif: TIME_IN_FRENCH
      do
         path := "tmp657"
         if (create {FILE_TOOLS}).is_readable(path) then
            (create {FILE_TOOLS}).delete(path)
         end
         assert(not (create {FILE_TOOLS}).is_readable(path))
         create tfw.connect_to(path)
         tfw.disconnect
         bt1 := file_tools.last_change_of(path)
         assert((create {FILE_TOOLS}).is_readable(path))
         assert(ft.is_empty(path))
         (create {FILE_TOOLS}).delete(path)
         assert(not (create {FILE_TOOLS}).is_readable(path))
         create tfw.connect_to(path)
         tfw.put_string("Hello")
         tfw.disconnect
         s := file_tools.size_of(path)
         assert(s = 5)
         bt2 := file_tools.last_change_of(path)
         assert(bt1.is_equal(bt2))
         (create {FILE_TOOLS}).delete(path)
         create tif
         tif.set_time(bt1)
      end

feature {}
   assert (b: BOOLEAN) is
      do
         cpt := cpt + 1
         if not b then
            std_output.put_string("TEST_FILE_TOOLS: ERROR Test # ")
            std_output.put_integer(cpt)
            std_output.put_string("%N")
         else
            -- std_output.put_string("Yes%N")
         end
      end

   cpt: INTEGER

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
