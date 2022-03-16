-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class FROZEN_STRING_LIST
   --
   -- Shared Frozen String list.
   --

feature {} -- The keywords section:
   fz_adapt: STRING "adapt"

   fz_alias: STRING "alias"

   fz_all: STRING "all"

   fz_as: STRING "as"

   fz_assertion: STRING "assertion"

   fz_assertion_flat_check: STRING "assertion_flat_check"

   fz_assign: STRING "assign"

   fz_begin_c_compile: STRING "# Beginning of parallelizable section"

   fz_boost: STRING "boost"

   fz_check: STRING "check"

   fz_class: STRING "class"

   fz_cluster: STRING "cluster"

   fz_convert: STRING "convert"

   fz_create: STRING "create"

   fz_creation: STRING "creation"

   fz_debug: STRING "debug"

   fz_default: STRING "default"

   fz_deferred: STRING "deferred"

   fz_do: STRING "do"

   fz_else: STRING "else"

   fz_elseif: STRING "elseif"

   fz_end: STRING "end"

   fz_end_c_compile: STRING "# End of parallelizable section"

   fz_ensure: STRING "ensure"

   fz_exclude: STRING "exclude"

   fz_expanded: STRING "expanded"

   fz_export: STRING "export"

   fz_external: STRING "external"

   fz_false: STRING "False"

   fz_feature: STRING "feature"

   fz_from: STRING "from"

   fz_frozen: STRING "frozen"

   fz_generate: STRING "generate"

   fz_if: STRING "if"

   fz_include: STRING "include"

   fz_indexing: STRING "indexing"

   fz_infix: STRING "infix"

   fz_inherit: STRING "inherit"

   fz_insert: STRING "insert"

   fz_inline: STRING "inline"

   fz_inspect: STRING "inspect"

   fz_invariant: STRING "invariant"

   fz_is: STRING "is"

   fz_like: STRING "like"

   fz_local: STRING "local"

   fz_loop: STRING "loop"

   fz_no: STRING "no"

   fz_note: STRING "note"

   fz_obsolete: STRING "obsolete"

   fz_old: STRING "old"

   fz_once: STRING "once"

   fz_option: STRING "option"

   fz_prefix: STRING "prefix"

   fz_redefine: STRING "redefine"

   fz_rename: STRING "rename"

   fz_require: STRING "require"

   fz_rescue: STRING "rescue"

   fz_retry: STRING "retry"

   fz_runtime: STRING "runtime"

   fz_separate: STRING "separate"

   fz_reference: STRING "reference"

   fz_then: STRING "then"

   fz_trace: STRING "trace"

   fz_true: STRING "True"

   fz_undefine: STRING "undefine"

   fz_unique: STRING "unique"

   fz_until: STRING "until"

   fz_use: STRING "use"

   fz_variant: STRING "variant"

   fz_when: STRING "when"

   fz_yes: STRING "yes"

feature {} -- Most of them are message parts:
   fz_cad: STRING "Cyclic anchored definition."

   fz_dtideena: STRING " has no compiler-defined `deep_twin' or `is_deep_equal' %
   %because the corresponding allocated size is not part of the %
   %NATIVE_ARRAY object. The client class of this NATIVE_ARRAY %
   %type is supposed to use a `capacity' attribute which contains %
   %the corresponding number of allocated items (see STRING or %
   %ARRAY for example)."

   fz_error_stars: STRING "****** "

   fz_vuar4: STRING "The $ operator must be followed by the final name of a feature which is not a %
               %constant attribute or by the name of some local variable as well."

feature {} -- Some other names:
   fz_bin: STRING "bin"

   fz_c_shift_left: STRING "<<"

   fz_c_shift_right: STRING ">>"

   fz_install: STRING "install"

   fz_jobs: STRING "jobs"

   fz_no_check: STRING "no_check"

   fz_none: STRING "none"

   fz_libertyeiffel: STRING "LibertyEiffel"

   fz_seconf: STRING "LIBERTY_CONF"
         -- The environment name pointing to the config file.

feature {} -- The known keys of the INI file:
   fz_conf_general: STRING "General"

   fz_conf_loadpath: STRING "Loadpath"

   fz_conf_environment: STRING "Environment"
         -- since version 2

   fz_conf_se_tools: STRING "Tools"
         -- since version 3

   fz_conf_bin: STRING "bin"

   fz_conf_lib: STRING "lib"

   fz_conf_sys: STRING "sys"

   fz_conf_short: STRING "short"

   fz_conf_tools: STRING "tools"

   fz_conf_os: STRING "os"

   fz_conf_flavor: STRING "flavor"

   fz_conf_jobs: STRING "jobs"

   fz_conf_boost: STRING "boost"

   fz_conf_no_check: STRING "no_check"

   fz_conf_require_check: STRING "require_check"

   fz_conf_ensure_check: STRING "ensure_check"

   fz_conf_invariant_check: STRING "invariant_check"

   fz_conf_loop_check: STRING "loop_check"

   fz_conf_all_check: STRING "all_check"

   fz_conf_debug_check: STRING "debug_check"

   fz_conf_flat_check: STRING "flat_check"

   fz_conf_smarteiffel_options: STRING "smarteiffel_options"

   fz_conf_undefined: STRING "undefined"

   fz_conf_tag: STRING "tag"

   fz_conf_compiler_type: STRING "c_compiler_type"

   fz_conf_compiler_path: STRING "c_compiler_path"

   fz_conf_linker_path: STRING "c_linker_path"

   fz_conf_strip_path: STRING "c_strip_path"

   fz_conf_compiler_options: STRING "c_compiler_options"

   fz_conf_linker_options: STRING "c_linker_options"

   fz_conf_cpp_compiler_type: STRING "cpp_compiler_type"

   fz_conf_cpp_compiler_path: STRING "cpp_compiler_path"

   fz_conf_cpp_compiler_options: STRING "cpp_compiler_options"

   fz_conf_cpp_linker_path: STRING "cpp_linker_path"

   fz_conf_cpp_strip_path: STRING "cpp_strip_path"

   fz_conf_cpp_linker_options: STRING "cpp_linker_options"

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
