-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_BASIC_DIRECTORY

insert
   DIRECTORY_NOTATION_HANDLER
   EIFFELTEST_TOOLS

create {}
   make

feature {}
   bd: BASIC_DIRECTORY

   make
         -- To test BASIC_DIRECTORY.try_to_compute_notation:
      do
         bd.reset_notation_using("SOMEDISK:[SmartEiffel.sys]system.se")
         assert(bd.openvms_notation)
         bd.reset_notation_using("/home/SmartEiffel/sys/system.se")
         assert(bd.unix_notation)
         unix_test
         bd.reset_notation_using("//D/SmartEiffel/sys/system.se")
         assert(bd.cygwin_notation)
         cygwin_test
         bd.reset_notation_using("D:\SmartEiffel\sys\system.se")
         assert(bd.windows_notation)
         windows_test
         open_vms_test
      end

   unix_test
      do
         assert(bd.unix_notation)
         parent_dir("?", "U", "/SmartEiffel/sys/system.se", "/SmartEiffel/sys/")
         parent_dir("?", "U", "/SmartEiffel/sys/", "/SmartEiffel/")
         parent_dir("?", "U", "/SmartEiffel/sys", "/SmartEiffel/")
         parent_dir("?", "U", "/SmartEiffel/", "/")
         parent_dir("?", "U", "/SmartEiffel", "/")
         parent_dir("?", "U", "/", "")
         sub_direct("?", "U", "/", "SmartEiffel", "/SmartEiffel/")
         sub_direct("?", "U", "/SmartEiffel/", "sys", "/SmartEiffel/sys/")
         sub_direct("?", "U", "/SmartEiffel", "sys", "/SmartEiffel/sys/")
         add_filena("U", "U", "SmartEiffel", "system.se", "SmartEiffel/system.se")
         add_filena("?", "U", "SmartEiffel/", "system.se", "SmartEiffel/system.se")
         add_filena("?", "U", "/SmartEiffel", "system.se", "/SmartEiffel/system.se")
         add_filena("?", "U", "/SmartEiffel/", "system.se", "/SmartEiffel/system.se")
         add_filena("?", "U", "/", "system.se", "/system.se")
      end

   windows_test
      do
         set_notation_using_old_implementation_name("W")
         assert(bd.windows_notation)
         parent_dir("?", "W", "C:\SmartEiffel\sys\system.se", "C:\SmartEiffel\sys")
         parent_dir("?", "W", "C:\SmartEiffel\sys\", "C:\SmartEiffel")
         parent_dir("?", "W", "C:\SmartEiffel\sys", "C:\SmartEiffel")
         parent_dir("?", "W", "C:\SmartEiffel\", "C:")
         parent_dir("?", "W", "C:\SmartEiffel", "C:")
         parent_dir("?", "W", "C:", "")
         sub_direct("?", "W", "C:", "SmartEiffel", "C:\SmartEiffel")
         sub_direct("?", "W", "C:\", "SmartEiffel", "C:\SmartEiffel")
         sub_direct("?", "W", "C:\", "SmartEiffel\", "C:\SmartEiffel")
         sub_direct("?", "W", "C:\SmartEiffel", "sys", "C:\SmartEiffel\sys")
         sub_direct("?", "W", "C:\SmartEiffel\", "sys", "C:\SmartEiffel\sys")
         add_filena("?", "W", "C:\SmartEiffel\sys", "system.se", "C:\SmartEiffel\sys\system.se")
         add_filena("?", "W", "C:\SmartEiffel\sys\", "system.se", "C:\SmartEiffel\sys\system.se")
         add_filena("?", "W", "C:", "system.se", "C:\system.se")
         add_filena("?", "W", "C:\", "system.se", "C:\system.se")
      end

   cygwin_test
      do
         bd.reset_notation_using("//D/SmartEiffel/sys/system.se")
         assert(bd.cygwin_notation)
         parent_dir("?", "C", "//D/SmartEiffel/sys/system.se", "//D/SmartEiffel/sys/")
         parent_dir("?", "C", "//D/SmartEiffel/sys/", "//D/SmartEiffel/")
         parent_dir("?", "C", "//D/SmartEiffel/sys", "//D/SmartEiffel/")
         parent_dir("?", "C", "//D/SmartEiffel/", "//D/")
         parent_dir("?", "C", "//D/SmartEiffel", "//D/")
         parent_dir("?", "C", "//D/", "/")
         parent_dir("C", "C", "//D", "/")
         sub_direct("C", "C", "//D/", "SmartEiffel", "//D/SmartEiffel/")
         sub_direct("C", "C", "//D", "SmartEiffel", "//D/SmartEiffel/")
         sub_direct("?", "C", "//D/SmartEiffel/", "sys", "//D/SmartEiffel/sys/")
         sub_direct("?", "C", "//D/SmartEiffel", "sys", "//D/SmartEiffel/sys/")
         add_filena("C", "C", "SmartEiffel", "system.se", "SmartEiffel/system.se")
         add_filena("C", "C", "SmartEiffel/", "system.se", "SmartEiffel/system.se")
         add_filena("?", "C", "//D/SmartEiffel", "system.se", "//D/SmartEiffel/system.se")
         add_filena("?", "C", "//D/SmartEiffel/", "system.se", "//D/SmartEiffel/system.se")
         add_filena("C", "C", "/", "system.se", "/system.se")
         parent_dir("C", "C", "D:/SmartEiffel/sys/system.se", "D:/SmartEiffel/sys/")
         parent_dir("C", "C", "D:/SmartEiffel/sys/", "D:/SmartEiffel/")
         parent_dir("C", "C", "D:/SmartEiffel/sys", "D:/SmartEiffel/")
         parent_dir("C", "C", "D:/SmartEiffel/", "D:/")
         parent_dir("C", "C", "D:/SmartEiffel", "D:/")
         sub_direct("C", "C", "D:/", "SmartEiffel", "D:/SmartEiffel/")
         sub_direct("C", "C", "D:", "SmartEiffel", "D:/SmartEiffel/")
         sub_direct("C", "C", "D:/SmartEiffel/", "sys", "D:/SmartEiffel/sys/")
         sub_direct("C", "C", "D:/SmartEiffel", "sys", "D:/SmartEiffel/sys/")
         add_filena("C", "C", "SmartEiffel", "system.se", "SmartEiffel/system.se")
         add_filena("C", "C", "SmartEiffel/", "system.se", "SmartEiffel/system.se")
         add_filena("C", "C", "D:/SmartEiffel", "system.se", "D:/SmartEiffel/system.se")
         add_filena("C", "C", "D:/SmartEiffel/", "system.se", "D:/SmartEiffel/system.se")
         add_filena("C", "C", "/", "system.se", "/system.se")
      end

   open_vms_test
      do
         set_notation_using_old_implementation_name("V")
         assert(bd.openvms_notation)
         parent_dir("?", "V", "DISK:[SmartEiffel.sys]system.se", "DISK:[SmartEiffel.sys]")
         parent_dir("?", "V", "DISK:[SmartEiffel.sys]", "DISK:[SmartEiffel]")
         parent_dir("?", "V", "DISK:[SmartEiffel]", "DISK:[]")
         sub_direct("V", "V", "DISK:", "SmartEiffel", "DISK:[SmartEiffel]")
         sub_direct("?", "V", "DISK:[]", "SmartEiffel", "DISK:[SmartEiffel]")
         sub_direct("?", "V", "DISK:[SmartEiffel]", "sys", "DISK:[SmartEiffel.sys]")
         add_filena("?", "V", "DISK:[SmartEiffel.sys]", "system.se", "DISK:[SmartEiffel.sys]system.se")
      end

   parent_dir (n1, n2, p1, p2: STRING)
      local
         view: STRING
      do
         set_notation_using_old_implementation_name(n1)
         bd.compute_parent_directory_of(p1)
         view := bd.last_entry
         assert(to_old_implementation_name.is_equal(n2))
         assert(view.is_equal(p2))
      end

   sub_direct (n1, n2, p1, p2, p3: STRING)
      local
         view: STRING
      do
         set_notation_using_old_implementation_name(n1)
         bd.compute_subdirectory_with(p1, p2)
         view := bd.last_entry
         assert(to_old_implementation_name.is_equal(n2))
         assert(view.is_equal(p3))
      end

   add_filena (n1, n2, p1, f, p2: STRING)
      local
         view: STRING
      do
         set_notation_using_old_implementation_name(n1)
         bd.compute_file_path_with(p1, f)
         view := bd.last_entry
         assert(to_old_implementation_name.is_equal(n2))
         assert(view.is_equal(p2))
      end

   to_old_implementation_name: STRING
      do
         if bd.unix_notation then
            Result := once "U"
         elseif bd.windows_notation then
            Result := once "W"
         elseif bd.cygwin_notation then
            Result := once "C"
         elseif bd.macintosh_notation then
            Result := once "M"
         elseif bd.amiga_notation then
            Result := once "A"
         elseif bd.openvms_notation then
            Result := once "V"
         else
            not_yet_implemented
         end
      end

   set_notation_using_old_implementation_name (old_implementation_name: STRING)
      do
         inspect
            old_implementation_name
         when "?" then
            bd.system_notation_buffer.set_item(Void)
         when "U" then
            bd.reset_notation_using("/users/local/tex")
            assert(bd.unix_notation)
         when "C" then
            bd.reset_notation_using("//D/SmartEiffel/sys/system.se")
            assert(bd.cygwin_notation)
         when "W" then
            bd.reset_notation_using("C:\WINNT")
            assert(bd.windows_notation)
         when "V" then
            bd.system_notation_buffer.set_item(create {OPENVMS_DIRECTORY_NOTATION})
            assert(bd.openvms_notation)
         else
            not_yet_implemented
         end
      end

end -- class TEST_BASIC_DIRECTORY
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
