-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class FROZEN_STRING_LIST
   --
   -- Shared Frozen String list.
   --

feature {} -- The keywords section:
   fz_adapt: STRING is "adapt"

   fz_alias: STRING is "alias"

   fz_all: STRING is "all"

   fz_as: STRING is "as"

   fz_assertion: STRING is "assertion"

   fz_assertion_flat_check: STRING is "assertion_flat_check"

   fz_assign: STRING is "assign"

   fz_begin_c_compile: STRING is "# Beginning of parallelizable section"

   fz_boost: STRING is "boost"

   fz_check: STRING is "check"

   fz_class: STRING is "class"

   fz_cluster: STRING is "cluster"

   fz_create: STRING is "create"

   fz_creation: STRING is "creation"

   fz_debug: STRING is "debug"

   fz_default: STRING is "default"

   fz_deferred: STRING is "deferred"

   fz_do: STRING is "do"

   fz_else: STRING is "else"

   fz_elseif: STRING is "elseif"

   fz_end: STRING is "end"

   fz_end_c_compile: STRING is "# End of parallelizable section"

   fz_ensure: STRING is "ensure"

   fz_exclude: STRING is "exclude"

   fz_expanded: STRING is "expanded"

   fz_export: STRING is "export"

   fz_external: STRING is "external"

   fz_false: STRING is "False"

   fz_feature: STRING is "feature"

   fz_from: STRING is "from"

   fz_frozen: STRING is "frozen"

   fz_generate: STRING is "generate"

   fz_if: STRING is "if"

   fz_include: STRING is "include"

   fz_indexing: STRING is "indexing"

   fz_infix: STRING is "infix"

   fz_inherit: STRING is "inherit"

   fz_insert: STRING is "insert"

   fz_inline: STRING is "inline"

   fz_inspect: STRING is "inspect"

   fz_invariant: STRING is "invariant"

   fz_is: STRING is "is"

   fz_like: STRING is "like"

   fz_local: STRING is "local"

   fz_loop: STRING is "loop"

   fz_no: STRING is "no"

   fz_obsolete: STRING is "obsolete"

   fz_old: STRING is "old"

   fz_once: STRING is "once"

   fz_option: STRING is "option"

   fz_prefix: STRING is "prefix"

   fz_redefine: STRING is "redefine"

   fz_rename: STRING is "rename"

   fz_require: STRING is "require"

   fz_rescue: STRING is "rescue"

   fz_retry: STRING is "retry"

   fz_runtime: STRING is "runtime"

   fz_separate: STRING is "separate"

   fz_reference: STRING is "reference"

   fz_then: STRING is "then"

   fz_trace: STRING is "trace"

   fz_true: STRING is "True"

   fz_undefine: STRING is "undefine"

   fz_unique: STRING is "unique"

   fz_until: STRING is "until"

   fz_use: STRING is "use"

   fz_variant: STRING is "variant"

   fz_when: STRING is "when"

   fz_yes: STRING is "yes"

feature {} -- Most of them are message parts:
   fz_cad: STRING is "Cyclic anchored definition."

   fz_dtideena: STRING is " has no compiler-defined `deep_twin' or `is_deep_equal' %
   %because the corresponding allocated size is not part of the %
   %NATIVE_ARRAY object. The client class of this NATIVE_ARRAY %
   %type is supposed to use a `capacity' attribute which contains %
   %the corresponding number of allocated items (see STRING or %
   %ARRAY for example)."

   fz_error_stars: STRING is "****** "

   fz_vuar4: STRING is "The $ operator must be followed by the final name of a feature which is not a %
               %constant attribute or by the name of some local variable as well."

feature {} -- Some other names:
   fz_bin: STRING is "bin"

   fz_c_shift_left: STRING is "<<"

   fz_c_shift_right: STRING is ">>"

   fz_install: STRING is "install"

   fz_jobs: STRING is "jobs"

   fz_no_check: STRING is "no_check"

   fz_none: STRING is "none"

   fz_smarteiffel: STRING is "SmartEiffel"

   fz_seconf: STRING is "SmartEiffel"
         -- the environment name pointing on the config file

   fz_se_runtime: STRING is "SmartEiffelRuntime"

   fz_system_se: STRING is "system.se"

feature {} -- The known keys of the INI file:
   fz_conf_general: STRING is "General"

   fz_conf_loadpath: STRING is "Loadpath"

   fz_conf_environment: STRING is "Environment"
         -- since version 2

   fz_conf_se_tools: STRING is "Tools"
         -- since version 3

   fz_conf_bin: STRING is "bin"

   fz_conf_lib: STRING is "lib"

   fz_conf_sys: STRING is "sys"

   fz_conf_short: STRING is "short"

   fz_conf_tools: STRING is "tools"

   fz_conf_os: STRING is "os"

   fz_conf_flavor: STRING is "flavor"

   fz_conf_jobs: STRING is "jobs"

   fz_conf_boost: STRING is "boost"

   fz_conf_no_check: STRING is "no_check"

   fz_conf_require_check: STRING is "require_check"

   fz_conf_ensure_check: STRING is "ensure_check"

   fz_conf_invariant_check: STRING is "invariant_check"

   fz_conf_loop_check: STRING is "loop_check"

   fz_conf_all_check: STRING is "all_check"

   fz_conf_debug_check: STRING is "debug_check"

   fz_conf_flat_check: STRING is "flat_check"

   fz_conf_smarteiffel_options: STRING is "smarteiffel_options"

   fz_conf_undefined: STRING is "undefined"

   fz_conf_tag: STRING is "tag"

   fz_conf_compiler_type: STRING is "c_compiler_type"

   fz_conf_compiler_path: STRING is "c_compiler_path"

   fz_conf_linker_path: STRING is "c_linker_path"

   fz_conf_strip_path: STRING is "c_strip_path"

   fz_conf_compiler_options: STRING is "c_compiler_options"

   fz_conf_linker_options: STRING is "c_linker_options"

   fz_conf_cpp_compiler_type: STRING is "cpp_compiler_type"

   fz_conf_cpp_compiler_path: STRING is "cpp_compiler_path"

   fz_conf_cpp_compiler_options: STRING is "cpp_compiler_options"

   fz_conf_cpp_linker_path: STRING is "cpp_linker_path"

   fz_conf_cpp_strip_path: STRING is "cpp_strip_path"

   fz_conf_cpp_linker_options: STRING is "cpp_linker_options"

end -- class FROZEN_STRING_LIST
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
