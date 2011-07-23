-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class FLAG_NAME_LIST
   --
   -- Shared Frozen String list for command flags.
   --
feature {} -- Most of them are command flag names:
   fz_case_insensitive: STRING is "case_insensitive"

   fz_cc: STRING is "cc"

   fz_cecil: STRING is "cecil"

   fz_clean: STRING is "clean"

   fz_c_mode: STRING is "c_mode"

   fz_gc_info: STRING is "gc_info"

   fz_help: STRING is "help"

   fz_high_memory_compiler: STRING is "high_memory_compiler"

   fz_loadpath: STRING is "loadpath"

   fz_manifest_string_trace: STRING is "manifest_string_trace"

   fz_no_main: STRING is "no_main"

   fz_no_split: STRING is "no_split"

   fz_no_strip: STRING is "no_strip"

   fz_no_style_warning: STRING is "no_style_warning"

   fz_no_warning: STRING is "no_warning"

   fz_o: STRING is "-o"

   fz_profile: STRING is "profile"

   fz_relax: STRING is "relax"

   fz_safety_check: STRING is "safety_check"

   fz_sedb: STRING is "sedb"

   fz_split: STRING is "split"

   fz_verbose: STRING is "verbose"

   fz_version: STRING is "version"

   fz_flag_jar: STRING is "jar"

   fz_flag_run: STRING is "run"

   fz_flag_use_jar: STRING is "use_jar"

   fz_flag_use_jvm: STRING is "use_jvm"

   fz_flag_java_compiler: STRING is "java_compiler"

   fz_flag_ss: STRING is "ss" -- *** NOT A GOOD FLAG NAME. *** Dom. Nov 29th 2006 ***

   fz_flag_mx: STRING is "mx" -- *** NOT A GOOD FLAG NAME. *** Dom. Nov 29th 2006 ***

   fz_flag_ms: STRING is "ms" -- *** NOT A GOOD FLAG NAME. *** Dom. Nov 29th 2006 ***

   fz_flag_classpath: STRING is "classpath"

   fz_flag_clean_classes: STRING is "clean_classes"

   fz_flag_hard_clean: STRING is "hard_clean"

end -- class FLAG_NAME_LIST
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
-- Copyright(C) 2003-2004: INRIA - LORIA (INRIA Lorraine) - I.U.T. Charlemagne - University of Nancy 2 - FRANCE
--
-- Authors: Dominique COLNET, Philippe RIBET, Cyril ADRIAN, Vincent CROIZIER, Frederic MERIZEN
--
-- http://SmartEiffel.loria.fr - SmartEiffel@loria.fr
-- ------------------------------------------------------------------------------------------------------------------------------
