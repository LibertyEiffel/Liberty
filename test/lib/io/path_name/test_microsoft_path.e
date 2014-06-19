-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_MICROSOFT_PATH
   -- Test for MICROSOFT_PATH_NAME (adapted from a test by Daniel Moisset)

insert
   EIFFELTEST_TOOLS
      rename assert as et_assert,
         label_assert as assert
      end

create {}
   make

feature {}
   make
      do
         set_up
         test_count
         tear_down
         set_up
         test_last
         tear_down
         set_up
         test_extension
         tear_down
         set_up
         test_is_absolute
         tear_down
         set_up
         test_plus
         tear_down
         set_up
         test_to_absolute
         tear_down
         set_up
         test_normalize
         tear_down
         set_up
         test_is_normalized
         tear_down
         set_up
         test_remove_last
         tear_down
         set_up
         test_add_last
         tear_down
         set_up
         test_expand_user
         tear_down
         --set_up
         --test_expand_explicit_user
         --tear_down
         --set_up
         --test_common_prefix
         --tear_down
         set_up
         test_expand_variables
         tear_down
         set_up
         test_join_invalidates_cache
         tear_down
      end

   set_up
      local
         sys: SYSTEM; bd: BASIC_DIRECTORY
      do
         create empty.make_empty
         create single.make_from_string("xyz.png")
         create root.make_root
         create absolute.make_from_string("\xxx.d\y.txt")
         create multi_slash.make_from_string("a\\\\b")
         create final_slash.make_from_string("a.d\b\")
         create simple.make_from_string("a\b\ccc\d.")
         create drive.make_from_string("c:")
         create drive_root.make_from_string("c:\")
         create drive_path.make_from_string("c:\path")
         create drive2_root.make_from_string("d:\")
         sys.set_environment_variable("HOME", "\home\dmoisset")
         path_for_tests := bd.current_working_directory.out
      end

   path_for_tests: STRING
         -- Path where tests are being run. Used to restore state
         -- between tests, not for the tests themselvesl.

   tear_down
      local
         sys: SYSTEM; bd: BASIC_DIRECTORY
      do
         sys.set_environment_variable("HOME", "\home\dmoisset")
         bd.change_current_working_directory(path_for_tests)
      end

   empty, single, root, absolute, multi_slash, final_slash, simple, drive, drive_root, drive_path, drive2_root: MICROSOFT_PATH_NAME

   mkpath (s: STRING): MICROSOFT_PATH_NAME
      do
         create Result.make_from_string(s)
      end

feature {}
   assert_integers_equal (name: STRING; i1, i2: INTEGER)
      do
         assert(name, i1 = i2)
      end

   assert_equal (name: STRING; o1, o2: STRING)
      do
         assert(name, o1.is_equal(o2))
      end

feature {} -- Tests
   path: MICROSOFT_PATH_NAME
         --  MISSING exists, same_file, expand_shellouts

   test_count
      do
         assert_integers_equal("empty", 0, empty.count)
         assert_integers_equal("single", 1, single.count)
         assert_integers_equal("root", 0, root.count)
         assert_integers_equal("absolute", 2, absolute.count)
         assert_integers_equal("multi_slash", 2, multi_slash.count)
         assert_integers_equal("final_slash", 3, final_slash.count)
         assert_integers_equal("simple", 4, simple.count)
      end

   test_last
      do
         assert_equal("single", "xyz.png", single.last)
         assert_equal("absolute", "y.txt", absolute.last)
         assert_equal("multi_slash", "b", multi_slash.last)
         assert_equal("final_slash", "", final_slash.last)
         assert_equal("simple", "d.", simple.last)
      end

   test_extension
      do
         assert_equal("single", ".png", single.extension)
         assert_equal("absolute", ".txt", absolute.extension)
         assert_equal("multi_slash", "", multi_slash.extension)
         assert_equal("final_slash", "", final_slash.extension)
         assert_equal("simple", ".", simple.extension)
      end

   test_is_absolute
      do
         assert("empty", not empty.is_absolute)
         assert("single", not single.is_absolute)
         assert("root", root.is_absolute)
         assert("absolute", absolute.is_absolute)
         assert("multi_slash", not multi_slash.is_absolute)
         assert("final_slash", not final_slash.is_absolute)
         assert("simple", not simple.is_absolute)
      end

   test_plus
      do
         assert_equal("empty_empty", "", (empty + empty).to_string)
         assert_equal("empty_simple", simple.to_string, (empty + simple).to_string)
         assert_equal("empty_absolute", absolute.to_string, (empty + absolute).to_string)
         assert_equal("simple_absolute", absolute.to_string, (simple + absolute).to_string)
         assert_equal("simple_simple", "a\b\ccc\d.\a\b\ccc\d.", (simple + simple).to_string)
         assert_equal("simple_empty", "a\b\ccc\d.", (simple + empty).to_string)
         -- Interesting cases of join with drives
         assert_equal("drive_absolute", "c:\xxx.d\y.txt", (drive + absolute).to_string)
         assert_equal("driveroot_absolute", "c:\xxx.d\y.txt", (drive_root + absolute).to_string)
         assert_equal("drivepath_absolute", absolute.to_string, (drive_path + absolute).to_string)
         assert_equal("drive_drive2", drive2_root.to_string, (drive + drive2_root).to_string)
         assert_equal("driveroot_drive2", drive2_root.to_string, (drive_root + drive2_root).to_string)
         -- Simpler cases of drive+something
         assert_equal("drivepath_single", "c:\path\xyz.png", (drive_path + single).to_string)
      end

   test_to_absolute
      local
         bd: BASIC_DIRECTORY
      do
         bd.change_current_working_directory("/usr/bin")
         empty.to_absolute
         assert_equal("empty", "\usr\bin", empty.to_string)
         single.to_absolute
         assert_equal("single", "\usr\bin\xyz.png", single.to_string)
         root.to_absolute
         assert_equal("root", "\", root.to_string)
         absolute.to_absolute
         assert_equal("absolute", "\xxx.d\y.txt", absolute.to_string)
         multi_slash.to_absolute
         assert_equal("multi_slash", "\usr\bin\a\b", multi_slash.to_string)
         final_slash.to_absolute
         assert_equal("final_slash", "\usr\bin\a.d\b", final_slash.to_string)
         simple.to_absolute
         assert_equal("simple", "\usr\bin\a\b\ccc\d.", simple.to_string)
      end

   test_normalize
      local
         p: MICROSOFT_PATH_NAME
      do
         empty.normalize
         assert_equal("empty", ".", empty.to_string)
         multi_slash.normalize
         assert_equal("multi_slash", "a\b", multi_slash.to_string)
         final_slash.normalize
         assert_equal("final_slash", "a.d\b", final_slash.to_string)
         simple.normalize
         assert_equal("simple", "a\b\ccc\d.", simple.to_string)
         p := mkpath("\\server\share")
         p.normalize
         assert_equal("unc_path", "\\server\share", p.to_string)
         p := mkpath("\..\x\y")
         p.normalize
         assert_equal("parent_root", "\x\y", p.to_string)
         p := mkpath("..\z\..\x\y")
         p.normalize
         assert_equal("parent_after", "..\x\y", p.to_string)
         p := mkpath("\x\y\..")
         p.normalize
         assert_equal("parent_last", "\x", p.to_string)
         p := mkpath(".\y")
         p.normalize
         assert_equal("this_first", "y", p.to_string)
         p := mkpath("..\.\..\x\y")
         p.normalize
         assert_equal("this_middle", "..\..\x\y", p.to_string)
         p := mkpath("x\y\.")
         p.normalize
         assert_equal("this_last", "x\y", p.to_string)
         p := mkpath("\.")
         p.normalize
         assert_equal("root_this", "\", p.to_string)
         p := mkpath("c:")
         p.normalize
         assert_equal("drive_only", "c:.", p.to_string)
      end

   test_is_normalized
      do
         assert("empty", not empty.is_normalized)
         assert("single", single.is_normalized)
         assert("root", root.is_normalized)
         assert("absolute", absolute.is_normalized)
         assert("multi_slash", not multi_slash.is_normalized)
         assert("final_slash", not final_slash.is_normalized)
         assert("simple", simple.is_normalized)
         assert("unix_slash", not mkpath("/usr/bin").is_normalized)
         assert("double_root", mkpath("\\").is_normalized)
         assert("triple_root", mkpath("\\\").is_normalized)
         assert("drive_double_root", not mkpath("c:\\").is_normalized)
         assert("parent_root", not mkpath("\..\x/y").is_normalized)
         assert("parent_first", mkpath("..\..\x\y").is_normalized)
         assert("parent_after", not mkpath("..\z\..\x\y").is_normalized)
         assert("parent_only", mkpath("..\..").is_normalized)
         assert("parent_last", not mkpath("\x\y\..").is_normalized)
         assert("this_first", not mkpath("./y").is_normalized)
         assert("this_middle", not mkpath("..\.\..\x\y").is_normalized)
         assert("this_last", not mkpath("x\y\.").is_normalized)
         assert("this_only", mkpath(".").is_normalized)
         assert("root_this", not mkpath("\.").is_normalized)
      end

   test_remove_last
      do
         single.remove_last
         assert_equal("single", "", single.to_string)
         absolute.remove_last
         assert_equal("absolute", "\xxx.d", absolute.to_string)
         multi_slash.remove_last
         assert_equal("multi_slash", "a", multi_slash.to_string)
         final_slash.remove_last
         assert_equal("final_slash", "a.d\b", final_slash.to_string)
         simple.remove_last
         assert_equal("simple", "a\b\ccc", simple.to_string)
         drive_path.remove_last
         assert_equal("drive_path", "c:\", drive_path.to_string)
      end

   test_add_last
      do
         assert_equal("empty", "foo", (empty / "foo").to_string)
         assert_equal("single", "xyz.png\foo", (single / "foo").to_string)
         assert_equal("root", "\foo", (root / "foo").to_string)
         assert_equal("absolute", "\xxx.d\y.txt\foo", (absolute / "foo").to_string)
         assert_equal("multi_slash", "a\\\\b\foo", (multi_slash / "foo").to_string)
         assert_equal("final_slash", "a.d\b\foo", (final_slash / "foo").to_string)
         assert_equal("simple", "a\b\ccc\d.\foo", (simple / "foo").to_string)
      end

   test_expand_user
      local
         p: MICROSOFT_PATH_NAME; sys: SYSTEM
      do
         p := mkpath("\usr\local\bin~")
         p.expand_user
         assert_equal("non_initial_tilde", "\usr\local\bin~", p.to_string)
         p := mkpath("~\bin")
         p.expand_user
         assert_equal("home_subdir", "\home\dmoisset\bin", p.to_string)
         p := mkpath("~")
         p.expand_user
         assert_equal("home_only", "\home\dmoisset", p.to_string)
         sys.set_environment_variable("HOME", "\boot")
         p := mkpath("~\vmlinuz")
         p.expand_user
         assert_equal("home_from_$HOME", "\boot\vmlinuz", p.to_string)
      end
   --   test_expand_explicit_user
   --           do
   --                   crash -- not done yet
   --           end
   --   test_common_prefix
   --           do
   --                   assert_equal ("empty", "", (mkpath("").common_prefix(mkpath(""))).to_string)
   --                   assert_equal ("root", "/", (mkpath("/bin").common_prefix(mkpath("/usr/bin"))).to_string)
   --                   assert_equal ("partial", "/b", (mkpath("/bin").common_prefix(mkpath("/boot"))).to_string)
   --                   assert_equal ("substring", "/usr/bin", (mkpath("/usr/bin/X11R6").common_prefix(mkpath("/usr/bin"))).to_string)
   --                   assert_equal ("complete", "/usr/bin/", (mkpath("/usr/bin/X11R6").common_prefix(mkpath("/usr/bin/foo"))).to_string)
   --           end

   test_expand_variables
      local
         p1, p2: MICROSOFT_PATH_NAME; sys: SYSTEM
      do
         p1 := mkpath("~\foo")
         p2 := mkpath("$HOME\foo")
         p1.expand_user
         p2.expand_variables
         assert_equal("expand_simple", p1.to_string, p2.to_string)
         p2 := mkpath("${HOME}\foo")
         p2.expand_variables
         assert_equal("expand_bracketed", p1.to_string, p2.to_string)
         p1 := mkpath("~")
         p2 := mkpath("$HOME")
         p1.expand_user
         p2.expand_variables
         assert_equal("expand_alone", p1.to_string, p2.to_string)
         p2 := mkpath("x$foo${bar}y")
         sys.set_environment_variable("foo", "11\11")
         sys.set_environment_variable("bar", "22\22")
         p2.expand_variables
         assert_equal("expand_several", "x11\1122\22y", p2.to_string)
         p2 := mkpath("x$foo${bar}y")
         sys.set_environment_variable("foo", "$bar")
         sys.set_environment_variable("bar", "$foo$bar")
         p2.expand_variables
         assert_equal("expand_nonnrecursive", "x$bar$foo$bary", p2.to_string)
         p2 := mkpath("$doesnotexist${this_variable_is_fake}")
         p2.expand_variables
         assert_equal("non_existant", "$doesnotexist${this_variable_is_fake}", p2.to_string)
         p2 := mkpath("3$.")
         p2.expand_variables
         assert_equal("single_dollar", "3$.", p2.to_string)
         p2 := mkpath("${HOME")
         p2.expand_variables
         assert_equal("incomplete", "${HOME", p2.to_string)
         p2 := mkpath("${")
         p2.expand_variables
         assert_equal("incomplete2", "${", p2.to_string)
      end

feature {ANY} -- Bugfix tests
   test_join_invalidates_cache
      local
         p1, p2: MICROSOFT_PATH_NAME
      do
         create p1.make_from_string("c:\x")
         create p2.make_from_string("y")
         p1.join(p2)
         assert_equal("ok", "c:\x\y", p1.to_string)
      end

end -- class TEST_MICROSOFT_PATH
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
