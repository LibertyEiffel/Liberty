-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_SPLITTER_NO_SPLIT
   --
   -- The no_split splitter ;-)
   --

inherit
   C_SPLITTER

create {ACE, CLEAN}
   make

feature {CLEAN}
   should_clean (path_c, file_name: STRING): BOOLEAN
      local
         c: STRING
      do
         c := once ""
         c.copy(path_c)
         c.append(once ".c")
         Result := c.is_equal(file_name)
      end

feature {}
   do_split
      do
      end

   connect_out_c
      do
         c_connect(c_path)
      end

feature {C_PRETTY_PRINTER}
   set_live_type (a_live_type: like live_type)
      do
         live_type := a_live_type
      end

   live_type: LIVE_TYPE

   should_split (functions_count: INTEGER): BOOLEAN
      do
         -- always False
      end

   linker_command (c_file_prefix: STRING): STRING
      local
         o_name: STRING
      do
         o_name := ""
         o_name.copy(c_path)
         o_name.remove_tail(2)
         o_name.append(system_tools.object_suffix)
         Result := system_tools.linker_command(c_file_prefix, {FAST_ARRAY[STRING] << o_name >>})
      end

   write_make_file (out_make: TEXT_FILE_WRITE): BOOLEAN
      do
         out_make.put_line(system_tools.c_compiler_command(c_path))
         Result := True
      end

feature {ACE}
   pretty_ace_in (txt: STRING)
      do
         txt.append("   split (no)%N")
      end

feature {}
   make
      do
         echo.put_string(once "No split enabled.%N")
      end

end -- class C_SPLITTER_NO_SPLIT
--
-- ------------------------------------------------------------------------------------------------------------------------------
-- Copyright notice below. Please read.
--
-- Liberty Eiffel is free software; you can redistribute it and/or modify it under the terms of the GNU General Public License,
-- as published by the Free Software Foundation; either version 2, or (at your option) any later version.
-- Liberty Eiffel is distributed in the hope that it will be useful but WITHOUT ANY WARRANTY; without even the implied warranty
-- of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details. You should have
-- received a copy of the GNU General Public License along with Liberty Eiffel; see the file COPYING. If not, write to the Free
-- Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301, USA.
--
-- Copyright (C) 2011-2022: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
--
-- http://www.gnu.org/software/liberty-eiffel/
--
--
-- Liberty Eiffel is based on SmartEiffel (Copyrights below)
--
-- Copyright(C) 1994-2002: INRIA - LORIA (INRIA Lorraine) - ESIAL U.H.P.       - University of Nancy 1 - FRANCE
-- Copyright(C) 2003-2006: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- ------------------------------------------------------------------------------------------------------------------------------
