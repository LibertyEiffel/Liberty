-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class ACE
   --
   -- Assembly of Classes in Eiffel.
   --
   -- Both an ACE file parser and a facade to the universe (i.e. all the known classes).
   --
   -- This singleton is shared via the GLOBALS.`ace' once function.
   --

inherit
   PARSER
      undefine is_equal
      end

insert
   ASSERTION_LEVEL_NUMBERING
      undefine is_equal
      end
   DEBUG_KEY_SUPPORT
      undefine is_equal
      end
   FLAG_NAME_LIST
      undefine is_equal
      end
   SINGLETON

feature {}
   root_class_names: FAST_ARRAY[HASHED_STRING]
         -- All the class names given on the command line
      once
         create Result.with_capacity(1)
      end

   root_procedure_names: FAST_ARRAY[STRING]
         -- All the procedure names given on the command line
      once
         create Result.with_capacity(1)
      end

   executable_names: FAST_ARRAY[STRING]
         -- All the executable names given on the command line
      once
         create Result.with_capacity(1)
      end

   root_index: INTEGER

   executable_name_memory: STRING

feature {ANY}
   file_path: STRING
         -- Non Void when a ACE file is in use (keep in mind that one can
         -- still launch a compilation without any ACE file, passing all the
         -- information using command arguments only).
         -- Usually, ACE files are suffixed with ".ace" or ".ACE".

   executable_name: STRING
         -- The name of the executable to build (after the "system" keyword
         -- in the ACE file or after the -o flag in the command line).
         -- In command line mode, a Void value means that "a.out" is to be
         -- used for C mode while using gcc for example.
      do
         if has_root then
            Result := executable_names.item(root_index)
         else
            Result := executable_name_memory
         end
      end

   root_class_name: HASHED_STRING
         -- The name of the root class using only upper case letters. This
         -- is actually the generating type of the very first live object at
         -- runtime. This `root_class_name' is after the "root" keyword in
         -- the ACE file or is given as a command line argument.
      require
         has_root
      do
         Result := root_class_names.item(root_index)
      end

   root_procedure_name: STRING
         -- The name of the procedure which is actually the main program.
         -- This procedure is supposed to be member of the creation clause
         -- of `root_class_name'.
      require
         has_root
      local
         bc: CLASS_TEXT
      do
         Result := root_procedure_names.item(root_index)
         if Result = Void then
            bc := smart_eiffel.root_class_text(root_class_name.to_string)
            Result := bc.default_root_procedure_name
            set_root_procedure_name(Result)
         end
      end

   need_path_id: BOOLEAN
         -- True if a path_id is mandatory because the same root class is used more than once

   has_root: BOOLEAN
         -- True if `root_class_name` and `root_procedure_name` are valid
      do
         Result := root_class_names.valid_index(root_index)
      end

   next_root
      require
         has_root
      do
         root_index := root_index + 1
      end

   reset_roots
      do
         root_index := 0
      end

   root_count: INTEGER
      do
         Result := root_class_names.count
      end

   --|*** Boost level for debugging purpose. Should decode boost option
   --|if we decide to keep it.

   boost1: BOOLEAN True

   boost2: BOOLEAN False

   boost3: BOOLEAN False

   boost: BOOLEAN
      do
         Result := highest_encountered_level = level_boost
      end

   no_check: BOOLEAN
         -- The system level value (see also {CLASS_TEXT}.no_check).
      do
         Result := highest_encountered_level >= level_no
      end

   require_check: BOOLEAN
      do
         Result := highest_encountered_level >= level_require
      end

   ensure_check: BOOLEAN
      do
         Result := highest_encountered_level >= level_ensure
      end

   invariant_check: BOOLEAN
      do
         Result := highest_encountered_level >= level_invariant
      end

   loop_check: BOOLEAN
      do
         Result := highest_encountered_level >= level_loop
      end

   all_check: BOOLEAN
      do
         Result := highest_encountered_level >= level_all
      end

   flat_check: BOOLEAN
         -- Each assertion will be executed in no_check mode

   no_main: BOOLEAN
         -- Don't include a main() in the generated executable.

   safety_check: BOOLEAN

   manifest_string_trace: BOOLEAN

   high_memory_compiler: BOOLEAN
         --|*** Is it still used ?? *** Dom feb 7th 2005 ***

   profile: BOOLEAN
         -- Is the -profile flag used?

   relax: BOOLEAN
         -- Is the -relax flag used?

   precompile_header: BOOLEAN
         -- Is the -precompile_header flag used ?
         --|*** ensure Result implies system_tools.precompile_header_supported    (as soon as ensure on attribute is supported)

   sedb: BOOLEAN
         -- The -sedb flag is used or some class of the ACE file
         -- in trace mode. (When `sedb' is set, files sys/runtime/sedb.[ch]
         -- are included.)
      do
         Result := no_check and then sedb_flag
      end

   run: BOOLEAN

   clean_classes: BOOLEAN

   hard_clean: BOOLEAN

feature {CLASS_TEXT}
   trace_of (a_class_text: CLASS_TEXT): BOOLEAN
         -- Is the -sedb trace mode enabled for `a_class_text'.
      local
         cluster: CLUSTER
      do
         cluster := a_class_text.cluster
         if cluster /= Void then
            Result := cluster.trace(a_class_text.name)
         else
            Result := default_trace
         end
         if Result then
            if default_assertion_level = level_boost then
               default_assertion_level := level_no
            end
         end
      end

feature {DEBUG_COMPOUND}
   is_debug_checked (e_debug: DEBUG_COMPOUND; type: TYPE): BOOLEAN
         -- Is this `e_debug' statement is active or not?
         -- Note: during the execution of this routine, the
         -- `default_assertion_level' may be switched from `level_boost' to
         -- `level_no'.
      require
         e_debug /= Void
      local
         ct: CLASS_TEXT; cluster: CLUSTER
      do
         --|*** I think the test belongs in DEBUG_COMPOUND (requires a few
         --|*** exportation changes in CLUSTER) (FM - june 9th 2004)
         ct := type.class_text
         cluster := ct.cluster
         if cluster /= Void then
            Result := cluster.debug_check(ct.name, e_debug)
         else
            Result := default_debug(e_debug)
         end
         if Result then
            --|*** This feels like it is at the right place in ACE (FM - june 9th 2004)
            if default_assertion_level = level_boost then
               default_assertion_level := level_no
            end
         end
      end

feature {CLASS_TEXT}
   assertion_level_of (a_class_text: CLASS_TEXT): INTEGER
      require
         avoid_recomputation: a_class_text.assertion_level_not_yet_computed
      local
         cluster: CLUSTER
      do
         cluster := a_class_text.cluster
         if cluster /= Void then
            Result := cluster.assertion_level_of(a_class_text.name)
         else
            Result := default_assertion_level
         end
      ensure
         Result.in_range(level_boost, level_all)
      end

feature {ACE_HANDLER}
   analyse_ace_file (fp: like file_path)
         -- Parse `fp' which is supposed to be some file containing an ACE description.
      require
         not fp.is_empty
         not string_aliaser.registered_one(fp)
      local
         echo_set_verbose_delayed: BOOLEAN
      do
         if file_path /= Void then
            echo.w_put_string("Multiple ACE files in the command line: %"")
            echo.w_put_string(file_path)
            echo.w_put_string("%" and %"")
            echo.w_put_string(fp)
            echo.w_put_string("%".%N")
            die_with_code(exit_failure_code)
         end
         file_path := string_aliaser.string(fp)
         parser_buffer.load_file(fp)
         if not parser_buffer.is_ready then
            error_handler.append(once "Cannot open %"")
            error_handler.append(file_path)
            error_handler.append(once "%" file.%NACE file not found.")
            error_handler.print_as_fatal_error
         end
         line := 1
         column := 1
         current_line := parser_buffer.item(line)
         set_highest_encountered_level(level_boost)
         if current_line.count = 0 then
            cc := '%N'
         else
            cc := current_line.first
         end
         drop_comments := True
         skip_comments
         if not a_keyword(once "system") then
            error_handler.add_position(current_position)
            error_handler.append(once "Keyword %"system%" expected. Invalid ACE file.")
            error_handler.print_as_fatal_error
         end
         executable_name_memory := string_aliaser.string(a_string)
         if not a_keyword(once "root") then
            error_handler.add_position(current_position)
            error_handler.append(once "Keyword %"root%" expected. Invalid ACE file.")
            error_handler.print_as_fatal_error
         end
         set_root_class_name(string_aliaser.hashed_string(a_identifier))
         a_cluster_mark
         if skip1(':') then
            set_root_procedure_name(a_identifier)
         end
         if a_keyword(fz_default) then
            echo_set_verbose_delayed := a_system_level_defaults
         end
         if a_cluster_clause_list then
         end
         if a_keyword(fz_external) then
            a_external
         end
         if a_keyword(fz_generate) then
            a_generate
         end
         if a_keyword(fz_end) then
         end
         if cc /= end_of_text then
            error_handler.add_position(current_position)
            error_handler.append(once "End of text expected (invalid ACE file).")
            error_handler.print_as_fatal_error
         end
         parser_buffer.release
         get_started
         if echo_set_verbose_delayed then
            echo.set_verbose
         end
         echo.put_string("Just finished parsing of %"")
         echo.put_string(file_path)
         echo.put_string("%" ACE file.%N")
      ensure
         file_path.is_equal(fp)
         default_assertion_level /= level_not_computed
      end

feature {}
   set_default_c_mode
      local
         c_mode: STRING
      do
         if default_debug_keys /= Void then
            c_mode := once "debug_check"
         else
            inspect
               highest_encountered_level
            when level_boost then
               c_mode := once "boost"
            else
               c_mode := once ""
               c_mode.copy(level_name(highest_encountered_level))
               c_mode.append(once "_check")
            end
         end
         system_tools.set_default_c_mode(c_mode)
      end

feature {ACE_HANDLER}
   set_root_class_name_using (command_line_name: STRING)
         -- Compute the `root_class_name' name using the `command_line_name' as a model.
         -- Trailing Eiffel file suffix is removed if any.
         -- Leading path is also removed if any.
         -- Finally, the feature `to_upper' is applied.
      require
         not command_line_name.is_empty
      local
         rcn: HASHED_STRING
      do
         rcn := string_aliaser.hashed_string(class_name_using(command_line_name))
         set_root_class_name(rcn)
      ensure
         root_class_names.count = old root_class_names.count + 1
         not root_class_names.last.to_string.has_suffix(eiffel_suffix)
         root_procedure_names.last = Void
         executable_names.last = executable_name_memory
         root_index = root_class_names.upper
      end

   set_root_class_name (rcn: HASHED_STRING)
      do
         if root_class_names.fast_has(rcn) then
            need_path_id := True
         end

         root_class_names.add_last(rcn)
         root_procedure_names.add_last(Void)
         executable_names.add_last(executable_name_memory)
         root_index := root_class_names.upper

         echo.put_string(once "Root class #")
         echo.put_string(root_class_names.upper.to_string)
         echo.put_string(once ": ")
         echo.put_line(rcn.to_string)
      ensure
         root_class_name = rcn
         root_procedure_names.last = Void
         executable_names.last = executable_name_memory
         root_index = root_class_names.upper
      end

   set_root_procedure_name (rp: STRING)
      require
         not root_class_names.is_empty
         root_procedure_names.last = Void
      do
         root_procedure_names.put(rp, root_index)

         echo.put_string(once "Root procedure #")
         echo.put_string(root_class_names.upper.to_string)
         echo.put_string(once ": ")
         echo.put_line(rp)
      ensure
         root_procedure_name = rp
      end

feature {}
   class_name_using (name: STRING): STRING
         -- Compute some Eiffel class name using the `name' information which can be some complete file path
         -- notation with some Eiffel file suffix. The result is written using the standard Eiffel notation
         -- for class names (upper case letters only).
      require
         not name.is_empty
      local
         i: INTEGER; c: CHARACTER
      do
         Result := once ""
         Result.copy(name)
         -- Removes the ".e" or the ".E" suffix if any:
         i := Result.count
         if i > 2 then
            if Result.item(i - 1) = '.' then
               if Result.item(i).same_as('e') then
                  Result.remove_tail(2)
               end
            end
         end
         from
            i := Result.count
         until
            i = 0
         loop
            c := Result.item(i)
            if c.is_letter then
               i := i - 1
            elseif c = '_' then
               i := i - 1
            elseif c.is_digit then
               i := i - 1
            else
               Result.remove_head(i)
               i := 0
            end
         end
         Result.to_upper
      end

feature {COMPILE}
   clean: BOOLEAN
         -- Should the clean command be launched after compilation?

feature {ACE_HANDLER}
   set_relax
      do
         relax := True
      end

   set_precompile_header
      require
         system_tools.precompile_header_supported
      do
         precompile_header := True
      end

   set_default_level
      do
         if default_assertion_level = level_not_computed then
            default_assertion_level := level_all
         end
         set_highest_encountered_level(default_assertion_level)
         set_default_c_mode
      end

   set_boost
      do
         default_assertion_level := level_boost
      end

   set_no_check
      do
         default_assertion_level := level_no
      end

   set_require_check
      do
         default_assertion_level := level_require
      end

   set_ensure_check
      do
         default_assertion_level := level_ensure
      end

   set_invariant_check
      do
         default_assertion_level := level_invariant
      end

   set_loop_check
      do
         default_assertion_level := level_loop
      end

   set_all_check
      do
         default_assertion_level := level_all
      end

   set_debug_check
      do
         error_handler.append(once "-debug_check is deprecated. Please use -debug and another -*_check assertion level. This defaults to -all_check.")
         error_handler.print_as_warning
         set_all_check
         set_command_line_debug
      end

   set_command_line_debug
      do
         default_debug_keys := {FAST_ARRAY[STRING] << fz_yes >> }
      end

   set_flat_check
      do
         flat_check := True
      end

   command_line_parsed (command_name: STRING)
         -- Should be called the end of command line argument parsing
         -- (i.e. only in command line mode) to check among other things
         -- that the root class was actually given as argument.
      require
         file_path = Void
      do
         if root_class_names.is_empty then
            echo.w_put_string(command_name)
            echo.w_put_string(": error: No <Root-Class> in command line.%N")
            die_with_code(exit_failure_code)
         end
         if sedb and then boost then
            echo.w_put_string(command_name)
            echo.w_put_string(": cannot use -sedb with -boost flag.%N")
            die_with_code(exit_failure_code)
         end
         if not is_launcher then
            system_tools.read_loadpath_files
         end
         get_started
      ensure
         default_assertion_level /= level_not_computed
      end

   set_default_trace
      do
         default_trace := True
         sedb_flag := True
      ensure
         default_trace = True
      end

   set_executable_name (name: STRING)
      do
         if not executable_names.is_empty then
            executable_names.put(name, executable_names.upper)
         end
         executable_name_memory := name
      ensure
         executable_name = name
      end

   set_clean (flag: BOOLEAN)
      do
         clean := flag
      end

   set_safety_check
      do
         safety_check := True
      end

   set_manifest_string_trace
      do
         manifest_string_trace := True
      end

   set_high_memory_compiler
      do
         high_memory_compiler := True
      end

   set_profile
      do
         profile := True
      end

   set_run
      do
         run := True
      end

   set_clean_classes
      do
         clean_classes := True
         set_run
      end

   set_hard_clean
      do
         hard_clean := True
      end

feature {}
   best_cluster_of (origin: CLASSES; class_name: CLASS_NAME; skip: CLASSES): CLUSTER
      local
         c: like clusters_; d: like distances_
      do
         c := clusters_
         d := distances_
         c.clear_count
         d.clear_count
         origin.clusters_of(class_name, skip, c, d, 0)
         inspect
            c.count
         when 0 then
            -- no class found
         when 1 then
            -- cool, only one class found!
            Result := c.first
         else
            if d.item(d.lower + 1) > d.first then
               -- OK, the second one is strictly further; keep the closest
               Result := c.first
            elseif not class_name.allow_missing then
               check
                  d.item(d.lower + 1) = d.first
               end
               error_handler.append(once "More than one class in the system is named ")
               error_handler.append(class_name.to_string)
               error_handler.append(once ". The first one is in the cluster %"")
               error_handler.append(c.first.name)
               error_handler.append(once "%" while the second is in the cluster %"")
               error_handler.append(c.item(c.lower + 1).name)
               error_handler.append(once "%" (and there may be more). Search started from ")
               error_handler.append(origin.to_string)
               error_handler.append(once ".%N")
               error_handler.print_as_error
            end
         end
      end

   clusters_: FAST_ARRAY[CLUSTER]
      once
         create Result.make(0)
      end

   distances_: FAST_ARRAY[INTEGER]
      once
         create Result.make(0)
      end

   clusters_all_: FAST_ARRAY[CLUSTER]
      once
         create Result.make(0)
      end

   distances_all_: FAST_ARRAY[INTEGER]
      once
         create Result.make(0)
      end

feature {SMART_EIFFEL} -- Class loading
   cluster_named (cluster_name: STRING): CLUSTER
      require
         not cluster_name.is_empty
         string_aliaser.registered_one(cluster_name)
      do
         Result := universe.cluster_named(cluster_name)
      ensure
         Result /= Void implies Result.name.is_equal(cluster_name)
      end

   cluster_of (class_name: CLASS_NAME; start_cluster: CLUSTER): CLUSTER
      require
         class_name /= Void
      local
         origin, last_origin: CLUSTERS; ct: CLASS_TEXT
      do
         -- The principle is the following: let's say we try to find the class C, whose `class_name'
         -- given. Usually that `class_name' is written in a class A, somewhere belonging to some cluster. We
         -- try to find C in a cluster which is closest to A's cluster. It means:
         -- * First, look at subclusters of A's cluster. The less deep, the better.
         -- * If not found, try to find C in the closest cluster of the parent cluster A's cluster; go up the
         -- tree if not found, recursively.
         --
         -- Note that we optimize a bit to avoid scanning again and again a growing subtree.
         -- CLASSES.clusters_of knows how to skip a subtree, and in this feature we use `last_origin' to the
         -- same effect.
         if start_cluster /= Void then
            origin := start_cluster.tree
         else
            ct := class_name.start_position.class_text
            if ct /= Void then
               check
                  ct.cluster /= Void
               end
               origin := ct.cluster.tree
            end
         end
         if origin = Void then
            Result := best_cluster_of(universe, class_name, Void)
         else
            -- OK, the class name is written in some other class.
            -- We try to find the closest class to that one in steps getting gradually up the tree.
            from
            until
               Result /= Void or else origin = Void
            loop
               Result := best_cluster_of(origin, class_name, last_origin)
               last_origin := origin
               origin := origin.parent
            end
         end
         if Result = Void and then not class_name.allow_missing then
            error_handler.add_position(class_name.start_position)
            error_handler.append(once "Cannot find the class %"")
            error_handler.append(class_name.to_string)
            error_handler.append(once "%" in any known cluster.")
            error_handler.print_as_fatal_error
         end
      ensure
         Result = Void implies class_name.allow_missing
      end

   all_class_texts (class_name: CLASS_NAME): FAST_ARRAY[CLASS_TEXT]
      local
         i: INTEGER; cluster: CLUSTER; c: like clusters_all_; d: like distances_all_
      do
         c := clusters_all_
         d := distances_all_
         c.clear_count
         d.clear_count
         universe.clusters_of(class_name, Void, c, d, 0)
         create Result.with_capacity(c.count)
         from
            i := c.lower
         until
            i > c.upper
         loop
            cluster := c.item(i)
            Result.add_last(cluster.class_text(class_name, True))
            i := i + 1
         end
      end

   class_text (class_name: CLASS_NAME; load: BOOLEAN; cluster: CLUSTER): CLASS_TEXT
         -- The `load' flag must be True if we want to load the class if it is not already loaded. If False,
         -- we don't load the class and the result may be Void.
         -- If `cluster' is not Void it overrides the information in `class_name'.
      require
         class_name /= Void
      do
         Result := find_class_text(class_name, False, cluster)
         if Result = Void and then load then
            Result := find_class_text(class_name, True, cluster)
            if Result = Void and then not class_name.allow_missing then
               if class_name.is_tuple_related then
                  smart_eiffel.tuple_class_not_found_fatal_error(class_name)
               else
                  error_handler.add_position(class_name.start_position)
                  error_handler.append(once "Unable to load class %"")
                  error_handler.append(class_name.to_string)
                  error_handler.append(once "%".")
                  error_handler.print_as_fatal_error
               end
            end
         end
      ensure
         Result = Void implies class_name.allow_missing
      end

   remove (a_class_text: CLASS_TEXT)
      do
         a_class_text.cluster.remove(a_class_text)
      end

   class_text_count: INTEGER
      do
         Result := universe.loaded_class_count
      end

feature {}
   find_class_text (class_name: CLASS_NAME; load: BOOLEAN; a_cluster: CLUSTER): CLASS_TEXT
      require
         class_name /= Void
      local
         ct: CLASS_TEXT; cluster: CLUSTER; pov: HASHED_DICTIONARY[CLASS_TEXT, HASHED_STRING]
      do
         -- With some result caching depending on the "pov" (Point Of View: client cluster)
         if a_cluster /= Void then
            cluster := a_cluster
         else
            ct := class_name.start_position.class_text
            if ct /= Void then
               cluster := ct.cluster
            end
         end
         if cluster /= Void then
            pov := pov_classes.reference_at(cluster.name)
            if pov /= Void then
               Result := pov.reference_at(class_name.hashed_name)
            else
               create pov.make
               pov_classes.put(pov, cluster.name)
            end
         else
            pov := no_pov_classes
            debug
               echo.put_string(once "*** Looking for ")
               echo.put_string(class_name.to_string)
               echo.put_string(once " without point of view!%N")
            end
            Result := pov.reference_at(class_name.hashed_name)
         end
         if Result = Void then
            cluster := cluster_of(class_name, cluster)
            if cluster /= Void then
               Result := cluster.class_text(class_name, load)
               if Result /= Void then
                  pov.put(Result, class_name.hashed_name)
                  --|*** ???? add should work instead of put!!
               end
            end
         end
      end

   no_pov_classes: HASHED_DICTIONARY[CLASS_TEXT, HASHED_STRING]
      once
         create Result.make
      end

   pov_classes: HASHED_DICTIONARY[HASHED_DICTIONARY[CLASS_TEXT, HASHED_STRING], STRING]
      once
         create Result.make
      end

feature {ANY}
   has (class_name: HASHED_STRING): BOOLEAN
      do
         Result := universe.has_class(class_name)
      end

feature {SMART_EIFFEL}
   parse_include
         -- Look for some class(es) to be loaded first because of some "include" option.
      do
         if file_path /= Void then
            universe.parse_include
         end
      end

   cluster_by_directory_path (path: STRING): CLUSTER
      require
         not path.is_empty
      do
         Result := universe.cluster_by_directory_path(path)
      ensure
         Result /= Void implies Result.directory_path.is_equal(path)
      end

feature {ACE_CHECK}
   pretty_in (txt: STRING)
         -- Performs the `ace_check' and also prepare in `txt' a pretty version of the Ace file as
         -- it is memorized (can be also used to pretty one's ACE file).
      require
         file_path /= Void
      do
         txt.append("system ")
         txt.append(executable_name_memory)
         txt.append("%Nroot ")
         txt.append(root_class_name.to_string)
         if root_procedure_name /= Void then
            txt.append(": %"")
            txt.append(root_procedure_name)
            txt.extend('%"')
         end
         txt.append("%Ndefault%N     assertion (")
         txt.append(level_name(default_assertion_level))
         txt.append(")%N   debug (")
         --|*** txt.append(default_debug_key)
         txt.append(")%N")
         if default_trace then
            txt.append("   trace (yes)%N")
         else
            txt.append("   trace (no)%N")
         end
         cpp.prepare_memory
         cpp.memory.ace_option(txt)
         if error_handler.style_warning then
            txt.append("   style_warning (yes)%N")
         else
            txt.append("   style_warning (no)%N")
         end
         if error_handler.no_warning then
            txt.append("   no_warning (yes)%N")
         else
            txt.append("   no_warning (no)%N")
         end
         if echo.is_verbose then
            txt.append("   verbose (yes)%N")
         else
            txt.append("   verbose (no)%N")
         end
         if manifest_string_trace then
            txt.append("   manifest_string_trace (yes)%N")
         else
            txt.append("   manifest_string_trace (no)%N")
         end
         if eiffel_parser.no_rescue then
            txt.append("   rescue (no)%N")
         else
            txt.append("   rescue (yes)%N")
         end
         if high_memory_compiler then
            txt.append("   high_memory_compiler (yes)%N")
         else
            txt.append("   high_memory_compiler (no)%N")
         end
         if profile then
            txt.append("   profile (yes)%N")
         else
            txt.append("   profile (no)%N")
         end
         if safety_check then
            txt.append("   safety_check (yes)%N")
         else
            txt.append("   safety_check (no)%N")
         end
         txt.append("cluster%N")
         universe.pretty_in(txt)
         txt.append("external%N")
         if not system_tools.external_object_files.is_empty then
            txt.append("   external_object_files: %"")
            txt.append(system_tools.external_object_files)
            txt.append("%"%N")
         end
         if not system_tools.external_c_files.is_empty then
            txt.append("   external_c_files: %"")
            txt.append(system_tools.external_c_files)
            txt.append("%"%N")
         end
         if not system_tools.external_c_plus_plus_files.is_empty then
            txt.append("   external_c_plus_plus_files: %"")
            txt.append(system_tools.external_c_plus_plus_files)
            txt.append("%"%N")
         end
         --|*** cecil_pool.pretty_ace_in(txt)
         --|*** to continue...
         txt.append("generate%N")
         if system_tools.no_strip then
            txt.append("   no_strip (yes)%N")
         else
            txt.append("   no_strip (no)%N")
         end
         splitter.pretty_ace_in(txt)
         if clean then
            txt.append("   clean (yes)%N")
         else
            txt.append("   clean (no)%N")
         end
         --|*** to continue...
         txt.append("end%N")
      end

feature {SYSTEM_TOOLS, CLUSTER}
   view_in (msg: STRING)
         -- Append in `msg' a viewable version of the `cluster_list' as well as
         -- some other informations to help the user to fix the problem.
      require
         msg /= Void
      local
         sed: STRING
      do
         check
         -- Because the `pretty' command do not accept class names as arguments.
            not smart_eiffel.pretty_flag
         end
         if file_path = Void then
            msg.append("%N%
             %You are in command line mode (i.e. no ACE file is used).%N%
             %The load path can be changed using a file called%N%
             %loadpath.se in the current working directory.%N%
             %Usually, this loadpath.se file is a simple list of directories.%N%
             %It is also possible to use system variables or include files. See%N%
             %the documentation for the finder command for more information.%N")
         else
            msg.append("%N%
             %Eiffel class file searching is being done according to the ACE %
             %file %"")
            msg.append(file_path)
            msg.append("%".%N")
         end
         msg.append("Files are being searched for in the following list of clusters (")
         cluster_count.append_in(msg)
         msg.append(" items):%N")
         universe.view_in(msg)
         system_tools.system_name_in(msg)
         msg.append("The value of the environment variable %"LibertyEiffel%" is:%N%"")
         sed := echo.getenv(fz_libertyeiffel, Void)
         if sed /= Void then
            msg.append(sed)
         end
         msg.append("%".%N")
         if file_path /= Void then
            msg.append("Please, also note that you can use the %"ace_check%" command%N%
             %to view all informations stored into your ACE file.%N")
         end
      end

feature {ANY}
   cluster_count: INTEGER
      do
         Result := universe.cluster_count
      end

   cluster_at (i: INTEGER): CLUSTER
      do
         Result := universe.cluster_at(i)
      end

feature {}
   get_started
         -- Should be called to set some default values at the end of
         -- command line parsing or at the end of the ACE file parsing.
      do
         set_default_level
         system_tools.get_started
         if default_debug_keys = Void then
            default_debug_keys := {FAST_ARRAY[STRING] << fz_no >> }
         end
         universe.get_started(highest_encountered_level)
         if echo.is_verbose and then not is_launcher then
            echo.put_string(once "Cluster tree:%N")
            universe.show(0)
         end
      end

   highest_encountered_level: INTEGER
         -- The highest encountered one in the whole ACE file. (Used to compute the C mode to use.)

feature {CLUSTER}
   default_trace: BOOLEAN
         -- Code generated with the -sedb flag way is the default for all
         -- classes of the ACE file (see also `sedb').

   default_assertion_level: INTEGER
         -- The default assertion level mangled using constants and tools from class
         -- ASSERTION_LEVEL_NUMBERING.
         -- This value memorize the command line flag such as (-boost, -no_check,
         -- -require_check, ...). When the ACE file is used, this value memorize the
         -- information after "assertion" tag of the default section.

   default_debug (e_debug: DEBUG_COMPOUND): BOOLEAN
      require
         e_debug /= Void
      do
         check
            default_debug_keys /= Void
         end
         Result := match_debug_keys(e_debug, default_debug_keys)
      end

feature {SYSTEM_TOOLS}
   add_loadpath (name, path: STRING; distance: INTEGER; discard_silently: BOOLEAN)
      require
         name /= Void
         path /= Void
         string_aliaser.registered_one(path)
         ;(create {FILE_TOOLS}).file_exists(path)
         distance > 0
      local
         n: like name; p: like path
      do
         if string_aliaser.registered_one(name) then
            n := name
         else
            n := string_aliaser.string(name)
         end
         if universe.is_system_path(path) then
            p := string_aliaser.string(universe.system_path_to_classes_path(path))
            universe.add_entry(distance, path, p, n, discard_silently)
         else
            universe.add_entry(distance, Void, path, n, discard_silently)
         end
      end

feature {C_PRETTY_PRINTER}
   splitter: C_SPLITTER
         -- The splitter to use
      do
         Result := splitter_memory
         if Result = Void then
            -- Defaults to the legacy splitter
            create {C_SPLITTER_LEGACY} Result.make
            splitter_memory := Result
         end
      ensure
         Result /= Void
      end

feature {}
   splitter_memory: C_SPLITTER

feature {C_PRETTY_PRINTER, COMPILE_TO_C, STRING_COMMAND_LINE, LIVE_TYPE, SYSTEM_TOOLS}
   set_no_split (flag: BOOLEAN)
      do
         if flag then
            create {C_SPLITTER_NO_SPLIT} splitter_memory.make
         elseif splitter_memory = Void then
            create {C_SPLITTER_LEGACY} splitter_memory.make
         end
      ensure
         flag implies ({C_SPLITTER_NO_SPLIT} ?:= splitter)
      end

   set_split (value: STRING)
      do
         if value = Void then
            create {C_SPLITTER_NO_SPLIT} splitter_memory.make
         elseif splitter_memory = Void then
            inspect
               value
            when "by_type" then
               create {C_SPLITTER_BY_LIVE_TYPE} splitter_memory.make
            when "legacy" then
               create {C_SPLITTER_LEGACY} splitter_memory.make
            else
               error_handler.add_position(current_position)
               error_handler.append(once "The valid values for split are either %"legacy%" or %"by_type%".")
               error_handler.print_as_fatal_error
            end
         end
      end

   set_no_main
      do
         no_main := True
      ensure
         no_main
      end

feature {ANY}
   for_all (action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         universe.for_all(action)
      end

   for_all_filtered (name_guard: PREDICATE[TUPLE[CLASS_NAME]]; action: PROCEDURE[TUPLE[CLASS_TEXT]])
      do
         universe.for_all_filtered(name_guard, action)
      end

   for_all_clusters (action: PROCEDURE[TUPLE[CLUSTER]])
      do
         universe.for_all_clusters(action)
      end

   loaded_class_count: INTEGER
      do
         Result := universe.loaded_class_count
      end

feature {CLUSTER}
   new_cluster (a_cluster: CLUSTER)
      do
         new_clusters.add_last(a_cluster)
      end

feature {}
   new_clusters: FAST_ARRAY[CLUSTER]
      once
         create Result.make(0)
      end

   update_last_manifest_string (p: POSITION; once_flag, unicode_flag: BOOLEAN; string, source_view: STRING)
      do
      end

   may_expand_var
      local
         envar, value: STRING; c, l: INTEGER
      do
         from
            l := line
            c := column
            next_char
            if cc = '{' then
               next_char
               create envar.make(12)
            else
               buffer.extend('$')
               go_back_at(l, c)
            end
         until
            envar = Void
         loop
            inspect
               cc
            when '}' then
               value := echo.getenv(envar, file_path)
               if value /= Void then
                  buffer.append(value)
               end
               envar := Void
            when end_of_text then
               error_handler.add_position(pos(l, c))
               error_handler.append(once "Bad Environment variable.%N%
                                    %(Closing %"}%" not found.)")
               error_handler.print_as_fatal_error
            else
               envar.extend(cc)
               next_char
            end
         end
      end

   a_identifier: STRING
         -- Analyse an Eiffel identifier.
      local
         stop: BOOLEAN
      do
         Result := buffer
         if cc = '%"' then
            error_handler.add_position(current_position)
            error_handler.append(once "Quoted identifiers are deprecated. Please remove quotes here.")
            error_handler.print_as_warning
            --|*** Inefficient but since this will eventually go away... <FM-21/08/2004>
            Result := a_string
         else
            from
               Result.clear_count
            until
               stop
            loop
               inspect
                  cc
               when 'a' .. 'z', 'A' .. 'Z', '0' .. '9', '_' then
                  Result.extend(cc)
                  next_char
               else
                  stop := True
               end
            end
            if Result.is_empty then
               error_handler.add_position(current_position)
               error_handler.append(once "Non empty unquoted name expected here.")
               error_handler.print_as_fatal_error
            end
            skip_comments
         end
         Result := string_aliaser.string(Result)
         check
            Result /= buffer
         end
      ensure
         Result /= Void
         string_aliaser.registered_one(Result)
      end

   a_string: STRING
         -- Analyse a notation like the one for manifest strings,
         -- returning only the content of the manifest string and
         -- expanding system environment variables (syntax: ${name})
      do
         Result := buffer
         if not a_manifest_string(True) then
            error_handler.add_position(current_position)
            error_handler.append(once "Unquoted filenames are deprecated. Please add quotes here.")
            error_handler.print_as_warning
            --|*** Inefficient but since this will eventually go away... <FM-21/08/2004>
            Result := a_identifier
            check
               Result.is_equal(buffer)
            end
            Result := buffer
         elseif Result.is_empty then
            error_handler.add_position(current_position)
            error_handler.append(once "Non empty quoted string expected here.")
            error_handler.print_as_fatal_error
         end
      ensure
         Result = buffer
         not Result.is_empty
      end

   a_cluster_mark
      do
         -- At time being, this is just syntactic sugar because
         -- clusters are not handled :-(
         if skip1('(') then
            if a_identifier /= Void then
            end
            if skip1(')') then
            end
         end
      end

   a_system_level_defaults: BOOLEAN
         -- The `Result' is used to delay the `echo.is_verbose' value setting
      local
         stop: BOOLEAN; dummy: like default_assertion_level
      do
         from
         until
            stop
         loop
            if cc = end_of_text then
               stop := True
            elseif a_cluster_clause_list then
               stop := True
            elseif a_keyword(fz_external) then
               a_external
               stop := True
            elseif a_keyword(fz_generate) then
               a_generate
               stop := True
            elseif skip1(';') then
            elseif a_keyword(fz_assertion) then
               if not smart_eiffel.short_or_class_check_flag then
                  default_assertion_level := a_assertion_level
               else
                  dummy := a_assertion_level
               end
            elseif a_keyword(fz_assertion_flat_check) then
               if a_yes_no_all then
                  set_flat_check
               end
            elseif a_keyword(fz_debug) then
               add_default_debug_key(a_debug_key)
            elseif a_keyword(once "collect") then
               a_collect_value
            elseif a_keyword(fz_case_insensitive) then
               error_handler.add_position(current_position)
               error_handler.append(once "The %"case_insensitive%" option is no longer supported.")
               error_handler.print_as_warning
               if a_yes_no_all then
               end
            elseif a_keyword(fz_style_warning) then
               if a_yes_no_all then
                  error_handler.set_style_warning
               end
            elseif a_keyword(fz_no_warning) then
               if a_yes_no_all then
                  error_handler.set_no_warning
               end
            elseif a_keyword(fz_trace) then
               if a_yes_no_all then
                  set_default_trace
               end
            elseif a_keyword(fz_relax) then
               if a_yes_no_all then
                  set_relax
               end
            elseif a_keyword(fz_safety_check) then
               if a_yes_no_all then
                  set_safety_check
               end
            elseif a_keyword(fz_verbose) then
               Result := a_yes_no_all
            elseif a_keyword(fz_manifest_string_trace) then
               manifest_string_trace := a_yes_no_all
            elseif a_keyword(fz_rescue) then
               if not a_yes_no_all then
                  eiffel_parser.set_no_rescue
               end
            elseif a_keyword(fz_high_memory_compiler) then
               high_memory_compiler := a_yes_no_all
            elseif a_keyword(fz_profile) then
               profile := a_yes_no_all
            elseif a_keyword(fz_relax) then
               relax := a_yes_no_all
            else
               stop := True
            end
         end
      end

   a_collect_value
      local
         mhf: MEMORY_HANDLER_FACTORY
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         if a_manifest_string(True) then
            inspect
               buffer
            when "bdw" then
               mhf.set_bdw_gc
            when "yes", "all" then
               -- nothing to do
            when "no" then
               mhf.set_no_gc
            else
               error_handler.add_position(current_position)
               error_handler.append(once "Invalid collect value: must be either yes, no, or %"bdw%"")
               error_handler.print_as_fatal_error
            end
         elseif a_yes_no_all_inside then
            -- nothing to do
         else
            mhf.set_no_gc
         end
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
      end

   a_cluster_clause_list: BOOLEAN
         --++ clusters --> "cluster" { cluster_clause ";" ...}
      local
         stop: BOOLEAN
      do
         if a_keyword(fz_cluster) then
            Result := True
            from
            until
               stop
            loop
               if a_cluster_clause then
                  if skip1(';') then
                  end
                  if a_keyword(fz_end) then
                  end
               else
                  stop := True
               end
            end
         end
      end

   a_cluster_clause: BOOLEAN
         --++ cluster_clause --> [cluster_tag]
         --++                     directory_name
         --++                     directory_name/loadpath.se
         --++                     cluster_properties
      local
         cluster_name: STRING; path: STRING
      do
         if cc = end_of_text then
         elseif a_keyword(fz_external) then
            a_external
         elseif a_keyword(fz_generate) then
            a_generate
         elseif a_keyword(fz_end) then
         elseif cc = '%"' then
            Result := True
            path := a_string
            cluster_name := string_aliaser.string(path)
            system_tools.environment_variable_substitution(file_path, path)
            if universe.is_system_path(path) then
               path := universe.system_path_to_classes_path(path)
            end
            new_universe_entry(1, string_aliaser.string(path), cluster_name)
            a_cluster_properties
         elseif cc.is_letter then
            Result := True
            cluster_name := a_identifier
            if skip1(':') then
               if cc = '%"' then
                  path := a_string
                  system_tools.environment_variable_substitution(file_path, path)
                  if universe.is_system_path(path) then
                     path := universe.system_path_to_classes_path(path)
                  end
                  new_universe_entry(1, string_aliaser.string(path), cluster_name)
               else
                  error_handler.add_position(current_position)
                  error_handler.append(once "Cluster path expected after cluster name.")
                  error_handler.print_as_fatal_error
               end
            else
               path := cluster_name
               if universe.is_system_path(path) then
                  path := universe.system_path_to_classes_path(path)
               end
               new_universe_entry(1, string_aliaser.string(path), cluster_name)
            end
            a_cluster_properties
         else
            fatal_error_in(fz_cluster)
         end
      end

   new_universe_entry (distance: INTEGER; path, name: STRING)
      require
         distance > 0
         path /= Void
         string_aliaser.registered_one(path)
         name /= Void
      do
         -- We want to be able to overwrite some cluster distances (see test_suite/language/ace/ace_002.ace)
         -- se we silently discard clusters already set.
         if universe.is_system_path(path) then
            universe.add_entry(distance, path, path, name, True)
         else
            universe.add_entry(distance, Void, path, name, True)
         end
      end

   a_cluster_properties
         --++ cluster_properties -->
         --++     [use]
         --++     [include]
         --++     [exclude]
         --++     [name_adaptation]
         --++     [default]
         --++     [options]
         --++     [visible]
      local
         stop, yna: BOOLEAN; i, l: INTEGER; n: STRING
      do
         if a_keyword(fz_use) then
            error_handler.add_position(current_position)
            error_handler.append(once "The %"use%" clause is not yet implemented.")
            error_handler.print_as_fatal_error
         end
         if a_keyword(fz_include) then
            from
            until
               cc /= '%"'
            loop
               n := string_aliaser.string(a_string)
               from
                  i := new_clusters.upper
               until
                  i < new_clusters.lower
               loop
                  new_clusters.item(i).include_add_last(n)
                  i := i - 1
               end
               if skip1(';') then
               end
            end
         end
         if a_keyword(fz_exclude) then
            from
            until
               cc /= '%"'
            loop
               n := string_aliaser.string(a_string)
               from
                  i := new_clusters.upper
               until
                  i < new_clusters.lower
               loop
                  new_clusters.item(i).exclude_add_last(n)
                  i := i - 1
               end
               if skip1(';') then
               end
            end
         end
         if a_keyword(fz_adapt) then
            error_handler.add_position(current_position)
            error_handler.append(once "The %"adapt%" clause is not yet implemented.")
            error_handler.print_as_fatal_error
         end
         if a_keyword(fz_default) then
            from
            until
               stop
            loop
               if a_keyword(fz_assertion) then
                  l := a_assertion_level
                  from
                     i := new_clusters.upper
                  until
                     i < new_clusters.lower
                  loop
                     new_clusters.item(i).set_default_assertion_level(l)
                     i := i - 1
                  end
               elseif a_keyword(fz_trace) then
                  yna := a_yes_no_all
                  sedb_flag := sedb_flag or else yna
                  from
                     i := new_clusters.upper
                  until
                     i < new_clusters.lower
                  loop
                     new_clusters.item(i).set_default_trace(yna)
                     i := i - 1
                  end
               elseif a_keyword(fz_debug) then
                  n := a_debug_key
                  from
                     i := new_clusters.upper
                  until
                     i < new_clusters.lower
                  loop
                     new_clusters.item(i).add_default_debug_key(n)
                     i := i - 1
                  end
               else
                  stop := True
               end
               if skip1(';') then
               end
            end
         end
         if a_keyword(fz_option) then
            from
            until
               not a_option_in_cluster_properties
            loop
            end
         end
         new_clusters.clear_count
      end

   a_option_in_cluster_properties: BOOLEAN
         -- Possible option after the keyword "option" in one
         -- `cluster' description.
      local
         level, i: INTEGER; class_name: CLASS_NAME; debug_key: STRING
      do
         if a_keyword(fz_assertion) then
            Result := True
            level := a_assertion_level
            if not skip1(':') then
               error_handler.add_position(current_position)
               error_handler.append(em29)
               error_handler.print_as_warning
            end
            from
            until
               not a_class_name
            loop
               class_name := token_buffer.to_class_name(True)
               from
                  i := new_clusters.upper
               until
                  i < new_clusters.lower
               loop
                  new_clusters.item(i).set_option_assertion_level(class_name, level)
                  i := i - 1
               end
               if skip1(',') then
               end
            end
         elseif a_keyword(fz_trace) then
            sedb_flag := True
            Result := True
            if not skip1(':') then
               error_handler.add_position(current_position)
               error_handler.append(em29)
               error_handler.print_as_warning
            end
            from
            until
               not a_class_name
            loop
               class_name := token_buffer.to_class_name(True)
               from
                  i := new_clusters.upper
               until
                  i < new_clusters.lower
               loop
                  new_clusters.item(i).add_option_trace(class_name)
                  i := i - 1
               end
               if skip1(',') then
               end
            end
         elseif a_keyword(fz_debug) then
            Result := True
            debug_key := a_debug_key
            if not skip1(':') then
               error_handler.add_position(current_position)
               error_handler.append(em29)
               error_handler.print_as_warning
            end
            from
            until
               not a_class_name
            loop
               class_name := token_buffer.to_class_name(True)
               from
                  i := new_clusters.upper
               until
                  i < new_clusters.lower
               loop
                  new_clusters.item(i).add_option_debug_key(class_name, debug_key)
                  i := i - 1
               end
               if skip1(',') then
               end
            end
         end
      end

   a_class_name: BOOLEAN
         -- A single class name strictly written using only uppercase letter
         -- in order to avoid any possible ambiguities. When the `Result'
         -- True, the corresponding class name is stored as usual in the
         -- `token_buffer' buffer.
      do
         if cc.is_upper then
            from
               token_buffer.reset(line, column)
               token_buffer.extend(cc)
            until
               Result
            loop
               next_char
               inspect
                  cc
               when 'A' .. 'Z', '0' .. '9', '_' then
                  token_buffer.extend(cc)
               else
                  Result := True
               end
            end
            skip_comments
         end
      end

   a_external
      local
         stop: BOOLEAN
      do
         from
         until
            stop
         loop
            if cc = end_of_text then
               stop := True
            elseif a_keyword(fz_generate) then
               a_generate
               stop := True
            elseif skip1(';') then
            elseif a_keyword(once "external_c_files") then
               if skip1(':') then
               end
               system_tools.external_c_files.copy(string_aliaser.string(a_string))
            elseif a_keyword(once "external_header_path") then
               if skip1(':') then
               end
               system_tools.set_external_header_path(string_aliaser.string(a_string))
            elseif a_keyword(once "external_c_plus_plus_files") then
               if skip1(':') then
               end
               system_tools.external_c_plus_plus_files.copy(string_aliaser.string(a_string))
            elseif a_keyword(once "external_object_files") then
               if skip1(':') then
               end
               system_tools.external_object_files.copy(string_aliaser.string(a_string))
            elseif a_keyword(fz_cecil) then
               if cecil_pool /= Void then
                  cecil_pool.add_cecil_file(a_cecil_file)
               elseif a_cecil_file = Void then
                  -- Skip the cecil file's name
               end
            elseif a_keyword(once "external_lib_path") then
               if skip1(':') then
               end
               system_tools.set_ace_external_lib_path(string_aliaser.string(a_string))
            elseif a_keyword(once "external_lib") then
               if skip1(':') then
               end
               system_tools.set_ace_external_lib(string_aliaser.string(a_string))
            else
               stop := True
            end
         end
      end

   a_generate
      local
         stop, value: BOOLEAN; mhf: MEMORY_HANDLER_FACTORY
      do
         from
         until
            stop
         loop
            if cc = end_of_text then
               stop := True
            elseif skip1(';') then
            elseif a_keyword(fz_cc) then
               if skip1(':') then
               end
               system_tools.set_c_compiler(string_aliaser.string(a_string))
            elseif a_keyword(fz_gc_info) then
               if a_yes_no_all then
                  mhf.set_info_flag
               end
            elseif a_keyword(fz_no_strip) then
               if a_yes_no_all then
                  system_tools.set_no_strip
               end
            elseif a_keyword(fz_no_main) then
               if a_yes_no_all then
                  set_no_main
               end
            elseif a_keyword(fz_split) then
               set_split(a_split_key)
            elseif a_keyword(fz_no_split) then
               set_no_split(a_yes_no_all)
            elseif a_keyword(fz_clean) then
               value := a_yes_no_all -- Priority to the command line -clean flag:
               if not clean then
                  set_clean(value)
               end
               --|***
            elseif a_keyword(once "wedit") then
               error_handler.add_position(current_position)
               error_handler.append(once "Unused obsolete flag -wedit / option wedit.")
               error_handler.print_as_warning
               value := a_yes_no_all
               --|*** wedit part to be removed one day ***
               --|*** Warning added 1st feb 2005 *** Dom ***
            elseif a_keyword(once "c_compiler_options") then
               if skip1(':') then
               end
               system_tools.set_ace_compiler_options(string_aliaser.string(a_string))
            elseif a_keyword(once "linker_options") then
               if skip1(':') then
               end
               system_tools.set_ace_linker_options(string_aliaser.string(a_string))
            elseif a_keyword(once "c_mode") then
               if skip1(':') then
               end
               system_tools.set_alternate_c_mode(a_identifier)
            else
               stop := True
            end
         end
      end

   a_yes_no_all: BOOLEAN
         -- Return True for a notation like "(yes)" or for a notation
         -- like "(all)". Return False for a notation like "(no)".
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         Result := a_yes_no_all_inside
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
      end

   a_yes_no_all_inside: BOOLEAN
         -- Return True for a notation like "(yes)" or for a notation
         -- like "(all)". Return False for a notation like "(no)".
      do
         if a_keyword(fz_no) then
         elseif a_keyword(fz_all) or else a_keyword(fz_yes) then
            Result := True
         else
            error_handler.add_position(current_position)
            error_handler.append(once "At this point in the ACE file, you are supposed to %
                                 %say %"yes%", %"no%", or %"all%".")
            error_handler.print_as_fatal_error
         end
      end

   a_assertion_level: INTEGER
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         if a_keyword(fz_boost) then
            Result := level_boost
         elseif a_keyword(fz_no) then
            Result := level_no
         elseif a_keyword(fz_require) then
            Result := level_require
         elseif a_keyword(fz_ensure) then
            Result := level_ensure
         elseif a_keyword(fz_invariant) then
            Result := level_invariant
         elseif a_keyword(fz_loop) then
            Result := level_loop
         elseif a_keyword(fz_check) or else a_keyword(fz_all) or else a_keyword(fz_yes) then
            Result := level_all
         elseif a_keyword(fz_debug) then
            error_handler.add_position(current_position)
            error_handler.append(once "The %"debug%" assertion level is deprecated. Please use %"all%" and debug statements.")
            error_handler.print_as_warning
            Result := level_all
         else
            error_handler.add_position(current_position)
            error_handler.append(once "Unknown assertion level tag.")
            error_handler.print_as_error
            error_handler.append(once "You have to fix the problem in your ACE file. Valid %
            %assertion level tags are: %"no%", %"require%", %"ensure%",%
            % %"invariant%", %"loop%", %"check%", %"all%", and %"debug%".")
            error_handler.print_as_fatal_error
         end
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
         set_highest_encountered_level(Result)
      ensure
         Result.in_range(level_boost, level_all)
      end

   a_debug_key: STRING
         -- Return some acceptable notation for a debug key: "yes",
         -- "no" or some user defined key.
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         if a_keyword(fz_no) then
            Result := fz_no
         elseif a_keyword(fz_yes) or else a_keyword(fz_all) then
            set_highest_encountered_level(level_all)
            Result := fz_yes
         else
            set_highest_encountered_level(level_all)
            Result := string_aliaser.string(a_string)
         end
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
      end

   a_split_key: STRING
         -- Return some acceptable notation for a split key: "yes",
         -- "no" or some user defined key.
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         if a_keyword(fz_no) then
            -- Result := Void
         elseif a_keyword(fz_yes) or else a_keyword(fz_all) then
            Result := once "legacy"
         else
            Result := a_string
         end
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
      end

   a_cecil_file: STRING
         -- Return some acceptable notation for a cecil file
      do
         if not skip1('(') then
            error_handler.add_position(current_position)
            error_handler.append(em27)
            error_handler.print_as_warning
         end
         Result := a_string.twin
         if not skip1(')') then
            error_handler.add_position(current_position)
            error_handler.append(em28)
            error_handler.print_as_warning
         end
      end

   pos (l, c: INTEGER): POSITION
      do
         Result.set_in_ace_file(l, c)
      end

   universe: UNIVERSE
      local
         factory: CLASSES_TREE_FACTORY
      once
         Result := factory.universe
      end

   has_cluster (c: CLUSTER): BOOLEAN
      require
         c /= Void
      do
         Result := universe.has_cluster(c)
      end

   fatal_error_in (section_name: STRING)
      do
         error_handler.add_position(current_position)
         error_handler.append(once "Error in the %"")
         error_handler.append(section_name)
         error_handler.append(once "%" section.")
         error_handler.print_as_fatal_error
      end

   set_highest_encountered_level (level: INTEGER)
      do
         if level > highest_encountered_level then
            highest_encountered_level := level
         end
      ensure
         highest_encountered_level >= old highest_encountered_level
      end

   sedb_flag: BOOLEAN

invariant
   file_path /= Void implies string_aliaser.registered_one(file_path)
   root_class_names.count = root_procedure_names.count
   root_class_names.lower = 0
   root_procedure_names.lower = 0

end -- class ACE
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
