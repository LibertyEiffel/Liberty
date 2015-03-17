-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TEST_POSIX_PATH
   -- Test for POSIX_PATH_NAME (adapted from a test by Daniel Moisset)

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
         --set_up
         --test_is_file
         --tear_down
         --set_up
         --test_is_directory
         --tear_down
         test_extension_removal
      end

   set_up
      local
         sys: SYSTEM; bd: BASIC_DIRECTORY
      do
         create empty.make_empty
         create single.make_from_string("xyz.png")
         create root.make_root
         create absolute.make_from_string("/xxx.d/y.txt")
         create multi_slash.make_from_string("a////b")
         create final_slash.make_from_string("a.d/b/")
         create simple.make_from_string("a/b/ccc/d.")
         sys.set_environment_variable("HOME", "/home/dmoisset")
         create path_for_tests.make_from_string(bd.current_working_directory)
      end

   path_for_tests: STRING
         -- Path where tests are being run. Used to restore state
         -- between tests, not for the tests themselvesl.

   tear_down
      local
         sys: SYSTEM; bd: BASIC_DIRECTORY
      do
         sys.set_environment_variable("HOME", "/home/dmoisset")
         bd.change_current_working_directory(path_for_tests)
      end

   empty, single, root, absolute, multi_slash, final_slash, simple: POSIX_PATH_NAME

   mkpath (s: STRING): POSIX_PATH_NAME
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
   path: POSIX_PATH_NAME
         --  MISSING exists, same_file, expand_shellouts

   test_count
      do
         assert("empty count", empty.count=0)
         assert("single count", single.count=1)
         assert("root count", root.count=0)
         assert("absolute count", absolute.count=2)
         assert("multi_slash count", multi_slash.count=2)
         assert("final_slash count", final_slash.count=3)
         assert("simple count", simple.count=4)
      end

   test_last
      do
         assert("single last",  "xyz.png".is_equal( single.last))
         assert("absolute last",  "y.txt".is_equal( absolute.last))
         assert("multi_slash last",  "b".is_equal( multi_slash.last))
         assert("final_slash last",  "".is_equal( final_slash.last))
         assert("simple last",  "d.".is_equal( simple.last))
      end

   test_extension
      do
         print("single extention «"+single.extension+"»%N")
         assert("single extention",  ".png".is_equal(single.extension))
         assert("absolute extention",  ".txt".is_equal(absolute.extension))
         assert("multi_slash extention",  "".is_equal(multi_slash.extension))
         assert("final_slash extention",  "".is_equal(final_slash.extension))
         --assert("simple extention",  ".".is_equal(simple.extension))
      end

   test_is_absolute
      do
         assert("empty absolute", not empty.is_absolute)
         assert("single absolute", not single.is_absolute)
         assert("root absolute", root.is_absolute)
         assert("absolute absolute", absolute.is_absolute)
         assert("multi_slash absolute", not multi_slash.is_absolute)
         assert("final_slash absolute", not final_slash.is_absolute)
         assert("simple absolute", not simple.is_absolute)
      end

   test_plus
      do
         assert("empty_empty",  "".is_equal( (empty + empty).to_string))
         assert("empty_simple",  simple.to_string.is_equal( (empty + simple).to_string))
         assert("empty_absolute",  absolute.to_string.is_equal( (empty + absolute).to_string))
         assert("simple_absolute",  absolute.to_string.is_equal( (simple + absolute).to_string))
         assert("simple_simple",  "a/b/ccc/d./a/b/ccc/d.".is_equal( (simple + simple).to_string))
         assert("simple_empty",  "a/b/ccc/d.".is_equal( (simple + empty).to_string))
      end

   test_to_absolute
      local
         bd: BASIC_DIRECTORY
      do
         bd.change_current_working_directory("/usr/bin")
         empty.to_absolute
         assert("empty",  "/usr/bin".is_equal( empty.to_string))
         single.to_absolute
         assert("single",  "/usr/bin/xyz.png".is_equal( single.to_string))
         root.to_absolute
         assert("root",  "/".is_equal( root.to_string))
         absolute.to_absolute
         assert("absolute",  "/xxx.d/y.txt".is_equal( absolute.to_string))
         multi_slash.to_absolute
         assert("multi_slash",  "/usr/bin/a/b".is_equal( multi_slash.to_string))
         final_slash.to_absolute
         assert("final_slash",  "/usr/bin/a.d/b".is_equal( final_slash.to_string))
         simple.to_absolute
         assert("simple",  "/usr/bin/a/b/ccc/d.".is_equal( simple.to_string))
      end

   test_normalize
      local
         p: POSIX_PATH_NAME
      do
         empty.normalize
         assert("empty",  ".".is_equal( empty.to_string))
         multi_slash.normalize
         assert("multi_slash",  "a/b".is_equal( multi_slash.to_string))
         final_slash.normalize
         assert("final_slash",  "a.d/b".is_equal( final_slash.to_string))
         simple.normalize
         assert("simple",  "a/b/ccc/d.".is_equal( simple.to_string))
         p := mkpath("///")
         p.normalize
         assert("triple_root",  "/".is_equal( p.to_string))
         p := mkpath("/../x/y")
         p.normalize
         assert("parent_root",  "/x/y".is_equal( p.to_string))
         p := mkpath("../z/../x/y")
         p.normalize
         assert("parent_after",  "../x/y".is_equal( p.to_string))
         p := mkpath("/x/y/..")
         p.normalize
         assert("parent_last",  "/x".is_equal( p.to_string))
         p := mkpath("./y")
         p.normalize
         assert("this_first",  "y".is_equal( p.to_string))
         p := mkpath(".././../x/y")
         p.normalize
         assert("this_middle",  "../../x/y".is_equal( p.to_string))
         p := mkpath("x/y/.")
         p.normalize
         assert("this_last",  "x/y".is_equal( p.to_string))
         p := mkpath("/.")
         p.normalize
         assert("root_this",  "/".is_equal( p.to_string))
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
         assert("double_root", mkpath("//").is_normalized)
         assert("triple_root", not mkpath("///").is_normalized)
         assert("parent_root", not mkpath("/../x/y").is_normalized)
         assert("parent_first", mkpath("../../x/y").is_normalized)
         assert("parent_after", not mkpath("../z/../x/y").is_normalized)
         assert("parent_only", mkpath("../..").is_normalized)
         assert("parent_last", not mkpath("/x/y/..").is_normalized)
         assert("this_first", not mkpath("./y").is_normalized)
         assert("this_middle", not mkpath(".././../x/y").is_normalized)
         assert("this_last", not mkpath("x/y/.").is_normalized)
         assert("this_only", mkpath(".").is_normalized)
         assert("root_this", not mkpath("/.").is_normalized)
      end

   test_remove_last
      do
         single.remove_last
         assert("single",  "".is_equal( single.to_string))
         absolute.remove_last
         assert("absolute",  "/xxx.d".is_equal( absolute.to_string))
         multi_slash.remove_last
         assert("multi_slash",  "a".is_equal( multi_slash.to_string))
         final_slash.remove_last
         assert("final_slash",  "a.d/b".is_equal( final_slash.to_string))
         simple.remove_last
         assert("simple", "a/b/ccc".is_equal(simple.to_string))
      end

   test_add_last
      do
         assert("empty",  "foo".is_equal( (empty / "foo").to_string))
         assert("single",  "xyz.png/foo".is_equal( (single / "foo").to_string))
         assert("root",  "/foo".is_equal( (root / "foo").to_string))
         assert("absolute",  "/xxx.d/y.txt/foo".is_equal( (absolute / "foo").to_string))
         assert("multi_slash",  "a////b/foo".is_equal( (multi_slash / "foo").to_string))
         assert("final_slash",  "a.d/b/foo".is_equal( (final_slash / "foo").to_string))
         assert("simple",  "a/b/ccc/d./foo".is_equal( (simple / "foo").to_string))
      end

   test_expand_user
      local
         p: POSIX_PATH_NAME; sys: SYSTEM
      do
         p := mkpath("/usr/local/bin~")
         p.expand_user
         assert("non_initial_tilde",  "/usr/local/bin~".is_equal( p.to_string))
         p := mkpath("~/bin")
         p.expand_user
         assert("home_subdir",  "/home/dmoisset/bin".is_equal( p.to_string))
         p := mkpath("~")
         p.expand_user
         assert("home_only",  "/home/dmoisset".is_equal( p.to_string))
         sys.set_environment_variable("HOME", "/boot")
         p := mkpath("~/vmlinuz")
         p.expand_user
         assert("home_from_$HOME",  "/boot/vmlinuz".is_equal( p.to_string))
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
         p1, p2: POSIX_PATH_NAME; sys: SYSTEM
      do
         p1 := mkpath("~/foo")
         p2 := mkpath("$HOME/foo")
         p1.expand_user
         p2.expand_variables
         assert("expand_simple",  p1.to_string.is_equal( p2.to_string))
         p2 := mkpath("${HOME}/foo")
         p2.expand_variables
         assert("expand_bracketed",  p1.to_string.is_equal( p2.to_string))
         p1 := mkpath("~")
         p2 := mkpath("$HOME")
         p1.expand_user
         p2.expand_variables
         assert("expand_alone",  p1.to_string.is_equal( p2.to_string))
         p2 := mkpath("x$foo${bar}y")
         sys.set_environment_variable("foo", "11/11")
         sys.set_environment_variable("bar", "22/22")
         p2.expand_variables
         assert("expand_several",  "x11/1122/22y".is_equal( p2.to_string))
         p2 := mkpath("x$foo${bar}y")
         sys.set_environment_variable("foo", "$bar")
         sys.set_environment_variable("bar", "$foo$bar")
         p2.expand_variables
         assert("expand_nonnrecursive",  "x$bar$foo$bary".is_equal( p2.to_string))
         p2 := mkpath("$doesnotexist${this_variable_is_fake}")
         p2.expand_variables
         assert("non_existant",  "$doesnotexist${this_variable_is_fake}".is_equal( p2.to_string))
         p2 := mkpath("3$.")
         p2.expand_variables
         assert("single_dollar",  "3$.".is_equal( p2.to_string))
         p2 := mkpath("${HOME")
         p2.expand_variables
         assert("incomplete",  "${HOME".is_equal( p2.to_string))
         p2 := mkpath("${")
         p2.expand_variables
         assert("incomplete2",  "${".is_equal( p2.to_string))
      end

   test_is_file
      local
         p: POSIX_PATH_NAME
      do
         assert("empty", not empty.is_file)
         create p.make_from_string("test_posix_path.e")
         assert("existing", p.is_file)
         create p.make_from_string("does_not_exists.foo")
         assert("nonexisting", not p.is_file)
      end

   test_is_directory
      local
         p: POSIX_PATH_NAME
      do
         assert("root", root.is_directory)
         assert("empty", not empty.is_directory)
         create p.make_from_string("TESTGEN")
         assert("existing", p.is_directory)
         create p.make_from_string("does_not_exists.foo")
         assert("nonexisting", not p.is_directory)
      end

   test_extension_removal
      local p: POSIX_PATH_NAME; s,s2,s3: STRING
      do
         create p.make_from_string("/this/string/resemble-a-complete.path")

         s := p.last.twin
         create s2.copy(p.last)
         create s3.make_from_string(p.last)
         assert("twin equals to copy", s.is_equal(s2))
         assert("twin equals make_from_string", s.is_equal(s3))

         s.remove_tail(p.extension.count)
         assert("correct file name", s.is_equal("resemble-a-complete"))
         assert("correct length", s.count=19)
      end

end -- class TEST_POSIX_PATH
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
