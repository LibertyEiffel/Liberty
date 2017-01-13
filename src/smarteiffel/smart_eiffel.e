-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class SMART_EIFFEL
   --
   -- Singleton object to handle general purpose information about the
   -- Liberty Eiffel global compilation process. (This singleton is shared via
   -- the GLOBALS.`smart_eiffel' once function.)
   --

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON
   LIBERTY_VERSION
      undefine is_equal
      redefine copyright
      end

feature {ANY}
   liberty_authors: STRING "C.ADRIAN, P.REDAELLI, R.MACK"
   liberty_dates: STRING "2011-2016"

   copyright: ABSTRACT_STRING
      once
         Result := "[
                    #(1)
                    Original SmartEiffel code:
                    Copyright (C), 1994-2002 - INRIA - LORIA - ESIAL UHP Nancy 1 - FRANCE
                    Copyright (C), 2003-2005 - INRIA - LORIA - IUT Charlemagne Nancy 2 - FRANCE
                    D.COLNET, P.RIBET, C.ADRIAN, V.CROIZIER, F.MERIZEN
                        http://smarteiffel.loria.fr

                    ]" # Precursor
      end

   status: STATUS
      once
         create Result.make
      end

   is_ready: BOOLEAN
         -- Is all the live code already gathered
      do
         Result := status.is_safety_checking or else status.is_generating
      end

   short_or_class_check_flag: BOOLEAN
         -- True when command `short' or command `class_check' is running.

   pretty_flag: BOOLEAN
         -- True when command `pretty' is running.

   no_id: BOOLEAN
         -- True when the ids file has not to be read.

   cluster_of (class_name: CLASS_NAME): CLUSTER
         -- Retrieve the cluster of the class name. If more than one class exists with the same name, the
         -- closest to where the class name is written is returned.
      require
         class_name /= Void
      do
         Result := ace.cluster_of(class_name, Void)
      ensure
         Result = Void implies class_name.allow_missing
      end

   cluster_named (cluster_name: STRING): CLUSTER
         -- Retrieve the cluster by its name
      require
         not cluster_name.is_empty
         string_aliaser.registered_one(cluster_name)
      do
         Result := ace.cluster_named(cluster_name)
      ensure
         Result /= Void implies Result.name.is_equal(cluster_name)
      end

   class_text (class_name: CLASS_NAME): CLASS_TEXT
         -- Retrieve the corresponding memorized one or launch the `eiffel_parser' if the `class_name'
         -- class is not yet loaded. When the `class_name.allow_missing' flag is True, no
         -- error occurs even when the class is not found.
         -- (See also `loaded_class_text'.)
      require
         class_name /= Void
      do
         Result := ace.class_text(class_name, True, Void)
      ensure
         Result = Void implies class_name.allow_missing
      end

   loaded_class_text (class_name: CLASS_NAME): CLASS_TEXT
         -- Retrieve the corresponding memorized one if already loaded. Do not launch the `eiffel_parser'
         -- if the `class_name' class is not yet loaded.
         -- (See also `class_text'.)
      require
         class_name /= Void
      do
         Result := ace.class_text(class_name, False, Void)
      end

   class_text_in_cluster (class_name: CLASS_NAME; cluster: CLUSTER): CLASS_TEXT
         -- Retrieve the corresponding memorized one or launch the `eiffel_parser' if the `class_name'
         -- class is not yet loaded. When the `class_name.allow_missing` flag is True, no
         -- error occurs even when the class is not found. `cluster' is the client cluster to start the
         -- search from.
         -- (See also `class_text', `loaded_class_text'.)
      require
         class_name /= Void
      do
         Result := ace.class_text(class_name, True, cluster)
      ensure
         Result = Void implies class_name.allow_missing
      end

   generating_type_used: BOOLEAN
         -- When ANY `generating_type' is used.

   generator_used: BOOLEAN
         -- When ANY `generator' is used.

   deep_features_used: BOOLEAN
         -- When `deep_twin' or `is_deep_equal' support is necessary.

   thread_used: BOOLEAN
         -- When threading support is necessary (i.e. threads are actually started using THREAD_CONTEXT.run).

   accumulating_type: TYPE
         -- Service provided for debugging purpose only
      do
         debug
            Result := feature_accumulator.context_type
         end
      ensure
         debugging_only: Result /= Void
      end

   unknown_feature_fatal_error (target_expression: EXPRESSION; target_type: TYPE; fn: FEATURE_NAME)
         -- (This feature is placed here to standardize all error messages of this kind.)
      require
         target_expression /= Void
         target_type /= Void
         fn /= Void
      do
         error_handler.add_position(fn.start_position)
         if fn.is_infix_name then
            error_handler.append(once "Unknown infix operator %"")
            error_handler.append(fn.to_string)
            error_handler.append(once "%" in type ")
         elseif fn.is_prefix_name then
            error_handler.append(once "Unknown prefix operator %"")
            error_handler.append(fn.to_string)
            error_handler.append(once "%" in type ")
         else
            error_handler.append(once "Unknown feature `")
            error_handler.append(fn.to_string)
            error_handler.append(once "' in type ")
         end
         error_handler.add_type(target_type)
         error_handler.append(once ".")
         if target_expression.is_implicit_current then
            error_handler.append(once " (For this call, the target is the implicit non written `Current' %
                                 %which is of type ")
            error_handler.add_type(target_type)
            error_handler.append(once ".)")
         else
            error_handler.add_position(target_expression.start_position)
            error_handler.append(once " (For this call, the target ")
            error_handler.add_expression(target_expression)
            error_handler.append(once " is of type ")
            error_handler.add_type(target_type)
            error_handler.append(once ".)")
         end
         error_handler.print_as_fatal_error
      end

feature {CLUSTER}
   analyze_class (cn: CLASS_NAME; c: CLUSTER): CLASS_TEXT
      do
         Result := eiffel_parser.analyse_class(cn, c)
      end

feature {}
   free_inline_memo: FAST_ARRAY[INLINE_MEMO]
      once
         create Result.with_capacity(128)
      end

feature {ANY}
   get_inline_memo: INLINE_MEMO
      do
         if free_inline_memo.is_empty then
            create Result.make
         else
            Result := free_inline_memo.last
            free_inline_memo.remove_last
            Result.clear
         end
      ensure
         Result.cleared
      end

   dispose_inline_memo (im: INLINE_MEMO)
      require
         im /= Void
      do
         free_inline_memo.add_last(im)
      end

feature {RESULT, ONCE_FUNCTION}
   vffd7_fatal_error (sp: POSITION)
      do
         error_handler.add_position(sp)
         error_handler.append(once "Result type of a once function must not involve formal generic names nor anchored types (VFFD.8).")
         error_handler.print_as_fatal_error
      end

feature {MEMORY_HANDLER, CODE_PRINTER}
   root_procedure: RUN_FEATURE_3
         -- The root procedure of the system to compile.

feature {PRETTY, PRETTY_PRINTER_HANDLER}
   class_text_for_pretty (file_path: STRING; class_name: CLASS_NAME): CLASS_TEXT
      require
         (create {FILE_TOOLS}).is_readable(file_path)
         class_name /= Void
      local
         c: CLUSTER
      do
         parser_buffer.load_file(file_path)
         create c.for_pretty
         parser_buffer.set_cluster(c)
         Result := eiffel_parser.analyse_class(class_name, c)
      end

   remove_loaded_class (ct: CLASS_TEXT)
         -- Removed the already loaded `ct' in order to allow `pretty' to parse again the generated file to check that the newly
         -- created file is syntactically correct.
      require
         ct /= Void
      do
         ace.remove(ct)
      end

feature {FINDER, EIFFELDOC_SHORTER_CLASSDOC}
   find_paths_for (class_name: HASHED_STRING): FAST_ARRAY[CLASS_TEXT]
         -- Finds the path to any class having the given `class_name'
      require
         class_name /= Void
      do
         Result := ace.all_class_texts(create {CLASS_NAME}.unknown_position(class_name, False))
      ensure
         Result /= Void
      end

feature {CLASS_CHECKER}
   tuple_related_classes_in (parent_list: FAST_ARRAY[TYPE])
         -- Hard-coded ordered list of parent tuples
      require
         parent_list.is_empty
      local
         i, n: INTEGER; stop: BOOLEAN
      do
         from
            i := 0
         until
            stop
         loop
            n := parent_list.count
            ace.for_all_filtered(
               agent (cn: CLASS_NAME): BOOLEAN
               do
                  Result := cn.is_tuple_related
               end (?),

               agent (ct: CLASS_TEXT; tuple_index: INTEGER; pl: FAST_ARRAY[TYPE])
               require
                  ct.name.is_tuple_related
               do
                  if pl.is_empty or else pl.last /= ct.declaration_type_of_like_current then
                     if ct.formal_generic_list = Void then
                        if tuple_index = 0 then
                           pl.add_last(ct.declaration_type_of_like_current)
                        end
                     elseif ct.formal_generic_list.count = tuple_index then
                        pl.add_last(ct.declaration_type_of_like_current)
                     end
                  end
               end (?, i, parent_list)
            )
            stop := n = parent_list.count
            i := i + 1
         end
      end

feature {COMMAND_LINE_TOOLS}
   set_short_or_class_check_flag
      do
         short_or_class_check_flag := True
         set_no_id
      end

feature {PRETTY, PRETTY_PRINTER_HANDLER}
   set_pretty_flag
      do
         pretty_flag := True
         set_no_id
      end

feature {}
   set_no_id
      do
         no_id := True
      end

feature {ANY}
   class_text_count: INTEGER
         -- Total number of class text actually loaded.
      do
         Result := ace.class_text_count
      end

feature {COMMAND_LINE_TOOLS}
   compile (back_end: CODE_PRINTER)
         -- Produce some code for all know pairs of `root_class_name', `root_procedure_name'.
      do
         run_front_end
         if nb_errors = 0 then
            run_collect
            if nb_errors = 0 then
               run_adapt
               if nb_errors = 0 then
                  run_back_end(back_end)
               end
            end
         end
         very_last_information
      end

feature {}
   run_front_end
         -- Code parsing
      require
         nb_errors = 0
      do
         initialize_any_tuple
         if ace.no_check then
            set_generator_used
            set_generating_type_used
         end
         ace.parse_include

         from
            ace.reset_roots
         until
            not ace.has_root or else nb_errors /= 0
         loop
            do_front_end(ace.root_class_name.to_string, ace.root_procedure_name)
            ace.next_root
         end

         if cecil_pool /= Void then
            cecil_pool.parse_cecil_files
         end
      end

   run_collect
         -- Code collect
      require
         nb_errors = 0
      local
         magic: like magic_count
      do
         status.set_collecting

         from
            ace.reset_roots
         until
            not ace.has_root or else nb_errors /= 0
         loop
            do_collect(ace.root_class_name.to_string, ace.root_procedure_name)
            ace.next_root
         end

         if ace.no_check then
            -- Once a TYPED_INTERNALS[xxx] is detected as alive by collect_internals_handler, it stays alive
            -- so we want to do this as late as possible in boost mode.
            from
               introspection_handler.collect_internals_handler
            until
               magic = magic_count
            loop
               magic := magic_count
               echo_magic_count(once "Before collect cycle")
               do_one_collect_cycle
            end
         end

         if deep_features_used then
            collect_deep_features
         end

         status.set_collecting_done
         echo_magic_count(once "Collecting done")
         echo.put_string(once "Live_type_map size=")
         echo.put_integer(live_type_map.count)
         echo.put_new_line
      ensure
         status.collecting_done
      end

   run_adapt
         -- Code simplification and adaptation
      require
         nb_errors = 0
      local
         i: INTEGER; lt: LIVE_TYPE
      do
         if not pretty_flag and then not short_or_class_check_flag then
            from
               ace.reset_roots
            until
               not ace.has_root or else nb_errors /= 0
            loop
               do_adapt(ace.root_class_name.to_string, ace.root_procedure_name)
               ace.next_root
            end
         end

         if nb_errors = 0 then
            status.set_adapting
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               --if lt.at_run_time then
               -- TODO: why is this if commented out? -> cleanup
                  lt.make_run_features
               --end
               i := i + 1
            end
            if nb_errors = 0 then
               from
                  i := live_type_map.lower
               until
                  i > live_type_map.upper
               loop
                  lt := live_type_map.item(i)
                  if lt.at_run_time then
                     lt.adapt_run_features_and_class_invariant
                  end
                  i := i + 1
               end
               if nb_errors = 0 and then cecil_pool /= Void then
                  cecil_pool.adapt
               end
            end
         end

         if nb_errors = 0 then
            safety_check
            echo.print_count(once "Loaded Classes", ace.class_text_count)
         end
      end

   run_back_end (back_end: CODE_PRINTER)
         -- Code simplification and generation
      require
         nb_errors = 0
      do
         from
            ace.reset_roots
         until
            not ace.has_root or else nb_errors /= 0
         loop
            do_back_end(back_end, ace.root_class_name.to_string, ace.root_procedure_name)
            ace.next_root
         end
      end

feature {CODE_PRINTER}
   customize_runtime
      do
         if collected_plug_in /= Void then
            collected_plug_in.for_each(agent {NATIVE_PLUG_IN}.customize_runtime)
         end
      end

   run_features: FAST_ARRAY[RUN_FEATURE]
         -- All the known features just prior the generation itself

   class_invariants: FAST_ARRAY[LIVE_TYPE]
         -- All the known types having an invariant during the generation

   agent_creations: FAST_ARRAY[AGENT_CREATION]
         -- All the known agent creations during the generation

   agent_switches: FAST_ARRAY[TYPE]
         -- All the known agent switches during the generation

   type_dictionary: DICTIONARY[TYPE, HASHED_STRING]
         -- When looking for a TYPE using it's name (ie. FOO[BAR] is stored at key with name "FOO[BAR]").
      once
         create {HASHED_DICTIONARY[TYPE, HASHED_STRING]} Result.with_capacity(1024)
      end

   generic_type_dictionary: DICTIONARY[HASHED_STRING, HASHED_STRING]
         -- Helper dictionary for generic types shrinking
      once
         create {HASHED_DICTIONARY[HASHED_STRING, HASHED_STRING]} Result.with_capacity(1024)
      end

feature {ANY}
   magic_count: INTEGER
         -- Grow each time a new run class is added, each time a new class
         -- loaded, each time a new feature is checked, each time another
         -- expression is optimized, etc. ...
         -- Thus when `magic_count' stops growing, we are really ready :-).

   magic_count_increment
      do
         magic_count := magic_count + 1
      end

feature {ASSIGNMENT_HANDLER}
   simplify_done: BOOLEAN
         -- After optimizations, some code may be turned into invalid eiffel code.
         -- Has to be very uncommon.

feature {ANY}
   live_type_map: TRAVERSABLE[LIVE_TYPE]
      do
         Result := live_type_map_
      end

feature {FEATURE_CALL, WRITABLE_ATTRIBUTE_NAME, MANIFEST_STRING_POOL, CREATION_CLAUSE, ADDRESS_OF, ONCE_FUNCTION, MANIFEST_GENERIC, BUILT_IN_EQ_NEQ, CECIL_ENTRY, NATIVE_BUILT_IN}
   --| **** TODO this client list is ridiculous
   collect (type: TYPE; fs: FEATURE_STAMP; at_run_time: BOOLEAN): TYPE
         -- The `Result' is not Void when `fs' is actually a function (see ensure).
      require
         fs.has_anonymous_feature_for(type)
      local
         lt: LIVE_TYPE; af: ANONYMOUS_FEATURE; tm: TYPE_MARK; tmp_fs: FEATURE_STAMP
      do
         --|*** PH(03/03/04) To be removed
         lt := collect_one_type(type, at_run_time)
         --|*** PH(03/03/04) should be "af := fs.anonymous_feature(type)",
         --|but in order to quickly solve a hard problem I added one
         --|extra resolution.
         --
--         tmp_fs := fs.resolve_dynamic_binding_for(type)
--***
         tmp_fs := fs
-- *** But we must now have two types... *** Dom march 16th 2006 ***
         af := tmp_fs.anonymous_feature(type)
         if af = Void then
            error_handler.add_position(fs.name.start_position)
            error_handler.append("Cannot collect feature {")
            error_handler.append(lt.name.to_string)
            error_handler.append("}.`")
            error_handler.append(fs.name.to_string)
            error_handler.append("': anonymous feature not found")
            error_handler.print_as_internal_error
         end

         tm := af.result_type
         if tm /= Void then
            Result := tm.resolve_in(type)
         end
         lt.collect(tmp_fs)
      ensure
         fs.anonymous_feature(type).result_type /= Void implies Result = fs.anonymous_feature(type).result_type.resolve_in(type)
      end

feature {LOCAL_VAR_LIST, ANONYMOUS_FEATURE}
   collect_local_expanded (type: TYPE)
         -- Make live the given `type'.
      require
         type.is_expanded
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, True)
         --|*** May be we have to launch here the collect on the
         --| corresponding creation procedure without argument ?
         --| (Dom. 8/9/2003)
      ensure
         type.live_type /= Void
      end

feature {BASE_TYPE_CONSTANT}
   collect_constant (type: TYPE)
         -- Make live the given `type' (of a constant)
      require
         type /= Void
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, True)
      ensure
         type.live_type /= Void
      end

feature {EXTERNAL_FUNCTION}
   collect_external (type: TYPE)
         -- Make live the given type (of an external function)
      require
         type /= Void
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, True)
      ensure
         type.live_type /= Void
      end

feature {ASSERTION}
   collect_assertion (type: TYPE)
         -- Make live the given type (of an assertion)
      require
         type.is_boolean
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, True)
      ensure
         type.live_type /= Void
      end

feature {AGENT_CREATION, ADDRESS_OF}
   collect_create (type: TYPE)
      require
         type /= Void
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, True)
      ensure
         type.live_type.at_run_time
      end

feature {LIVE_TYPE}
   collect_generic (type: TYPE)
      require
         type /= Void
      local
         lt: LIVE_TYPE
      do
         lt := collect_one_type(type, False)
      ensure
         type.live_type /= Void
      end

feature {LIVE_TYPE, PROCEDURE_CALL_0}
   collect_se_atexit (type: TYPE)
      require
         type /= Void
         no_extra_computation: se_atexit_stamp = Void
      local
         dummy: TYPE
      do
         se_atexit_stamp := type.feature_stamp_of(se_atexit_name)
         dummy := collect(type, se_atexit_stamp, False)
         se_atexit_id := type.id
      ensure
         se_atexit_stamp /= Void
      end

feature {LIVE_TYPE, PROCEDURE_CALL_0, C_PRETTY_PRINTER}
   se_atexit_stamp: FEATURE_STAMP

   se_atexit_id: INTEGER

feature {}
   collected_external_functions: FAST_ARRAY[NON_VOID_NO_DISPATCH]
      once
         create Result.with_capacity(3)
      end

feature {NON_VOID_NO_DISPATCH}
   collect_external_function (non_void_no_dispatch: NON_VOID_NO_DISPATCH; fs: FEATURE_STAMP; type: TYPE)
      require
         non_void_no_dispatch /= Void
         type /= Void
         fs /= Void
      local
         dummy: TYPE
      do
         if not collected_external_functions.fast_has(non_void_no_dispatch) then
            dummy := collect(type, fs, False)
            collected_external_functions.add_last(non_void_no_dispatch)
         end
      end

feature {ONCE_ROUTINE_POOL}
   collect_precomputable (type: TYPE; fs: FEATURE_STAMP)
      require
         type /= Void
         fs /= Void
      local
         dummy: TYPE
      do
         dummy := collect(type, fs, False)
      end

feature {TYPE_MARK}
   long_type_name (type_name: HASHED_STRING; type_cluster: CLUSTER): HASHED_STRING
      require
         type_name /= Void
         type_cluster /= Void
      local
         ln: STRING
      do
         ln := once ""
         ln.copy(type_cluster.name)
         ln.extend_unless(':')
         ln.append(type_name.to_string)
         Result := string_aliaser.hashed_string(ln)
      ensure
         Result /= Void
      end

feature {AGENT_POOL, CREATE_SUPPORT, ASSIGNMENT, ASSIGNMENT_ATTEMPT, CREATE_WRITABLE, EFFECTIVE_ARG_LIST, CECIL_ENTRY}
   collect_one_type (type: TYPE; at_run_time: BOOLEAN): LIVE_TYPE
         -- Make live the given `type'.
      require
         type /= Void
      local
         rt: BOOLEAN
      do
         Result := type.live_type
         if Result = Void then
            create Result.make(type)
            magic_count_increment
            check
               not type.is_expanded implies not Result.at_run_time
               type_dictionary.reference_at(type.long_name).live_type = Result
            end
         end
         rt := at_run_time or else Result.is_expanded
            and then Result.name.to_string /= as_integer_general
            and then Result.name.to_string /= as_real_general
            and then Result.name.to_string /= as_natural_general
         if rt and then not Result.at_run_time then
            debug
               if not at_run_time then
                  -- sedb_breakpoint -- type will become alive, is it really necessary?
                  --|*** I have noticed that it is often NATIVE_ARRAY here ...
                  --|*** NATIVE_ARRAY must be made alive when {NATIVE_ARRAY}.malloc is collected !!
                  --|*** (Dom. april 22th 2004) ***
               end
            end
            Result.set_at_run_time
            magic_count_increment
         end
      ensure
         definition: Result = type.live_type
         is_alive: type.live_type /= Void
         -- hence: Result /= Void
      end

feature {ANONYMOUS_FEATURE, RUN_FEATURE, ARGUMENT_NAME_REF, LOCAL_NAME_REF, RESULT, E_OLD, INSPECT_STATEMENT, AGENT_CREATION}
   context_feature: ANONYMOUS_FEATURE
      do
         if not context_feature_stack.is_empty then
            Result := context_feature_stack.top
         end
      end

feature {ANONYMOUS_FEATURE, FEATURE_STAMP, RUN_FEATURE, C_LIVE_TYPE_COMPILER}
   push_context (af: ANONYMOUS_FEATURE)
      do
         context_feature_stack.push(af)
      end

   pop_context (af: ANONYMOUS_FEATURE)
      require
         context_feature = af
      do
         context_feature_stack.pop
      end

feature {}
   context_feature_stack: STACK[ANONYMOUS_FEATURE]
         -- We really need a stack. As an example, it is necessary to follow the calling graph during
         -- collect.
      once
         create Result.with_capacity(4)
      end

feature {LIVE_TYPE}
   is_tagged (lt: LIVE_TYPE): BOOLEAN
      require
         is_ready
         lt.at_run_time
         lt.is_reference
         ace.boost
      local
         i: INTEGER; run_time_set: RUN_TIME_SET
      do
         from
            i := live_type_map.lower
         until
            Result or else i > live_type_map.upper
         loop
            run_time_set := live_type_map.item(i).run_time_set
            if run_time_set.count = 0 then
            elseif run_time_set.has(lt) then
               Result := run_time_set.count > 1
            end
            i := i + 1
         end
      end

feature {CODE_PRINTER}
   weak_reference_used: BOOLEAN
         -- Is the WEAK_REFERENCE class used?
         --
         -- This function is conservative: when it returns False, you are guaranteed that no WEAK_REFERENCE
         -- is used. There is no guarantee when it returns True.
      require
         status.collecting_done
--|       local
--|          hs: HASHED_STRING
      do
--|*** The following code can't work because it doesn't look for the right WEAK_REFERENCE class <FM-11/12/2006>
--|          hs := string_aliaser.hashed_string(as_weak_reference)
--|          Result := loaded_class_text(create {CLASS_NAME}.unknown_position(hs)) /= Void
--|          -- Yes, there is a memory leak, but this feature is probably called only once.
         Result := True
      end

feature {LOCAL_ARGUMENT_REF, ANONYMOUS_FEATURE, INTROSPECTION_HANDLER, THREAD_POOL}
   specializing_feature_local_var_list: LOCAL_VAR_LIST
   specializing_closure_local_var_lists: FAST_ARRAY[LOCAL_VAR_LIST]

   specializing_feature_arguments_list: FORMAL_ARG_LIST
   specializing_closure_arguments_lists: FAST_ARRAY[FORMAL_ARG_LIST]

feature {ANONYMOUS_FEATURE, INTROSPECTION_HANDLER, THREAD_POOL}
   set_specializing_feature_variables (lvl: like specializing_feature_local_var_list; clvl: like specializing_closure_local_var_lists)
      do
         specializing_feature_local_var_list := lvl
         specializing_closure_local_var_lists := clvl
      end

   set_specializing_feature_arguments (fal: like specializing_feature_arguments_list; cfal: like specializing_closure_arguments_lists)
      do
         specializing_feature_arguments_list := fal
         specializing_closure_arguments_lists := cfal
      end

feature {}
   type_to_be_created: HASHED_STRING

   create_type (static_type: TYPE_MARK; allow_raw_class_name: BOOLEAN): TYPE
         -- Create a type. Type creation is locked until `register_type' has been called.
      require
         static_type.is_static
         lock_type_creation(static_type.long_name)
         not has_type(static_type)
      do
         debug
            echo.put_string(once "Creating type: ")
            echo.put_line(static_type.long_name.to_string)
         end
         create Result.make(static_type, allow_raw_class_name)
      ensure
         Result /= Void
         has_type(static_type)
      end

   lock_type_creation (t: like type_to_be_created): BOOLEAN
      do
         Result := type_to_be_created = Void
         type_to_be_created := t
      ensure
         Result
      end

feature {}
   type_any_memory: TYPE

   type_boolean_memory: TYPE

   type_character_memory: TYPE

   type_string_memory: TYPE

   type_native_array_character_memory: TYPE

   type_unicode_string_memory: TYPE

   type_pointer_memory: TYPE

   type_integer_8_memory: TYPE

   type_integer_16_memory: TYPE

   type_integer_32_memory: TYPE

   type_integer_64_memory: TYPE

   type_natural_8_memory: TYPE

   type_natural_16_memory: TYPE

   type_natural_32_memory: TYPE

   type_natural_64_memory: TYPE

   type_real_32_memory: TYPE

   type_real_64_memory: TYPE

   type_real_extended_memory: TYPE

feature {ANY} -- To get a TYPE:
   --|*** TYPE creation can be quite recursive, so these cannot be once functions <FM-14/10/2004>

   --|*** Those types are basic types; there is no cluster information in their long name hence no call to `long_type_name'

   type_any: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_any_memory = Void then
            hs := string_aliaser.hashed_string(as_any)
            type_any_memory := type_dictionary.fast_reference_at(hs)
            if type_any_memory = Void then
               type_any_memory := get_type(create {ANY_TYPE_MARK}.make(unknown_position), False)
            end
         end
         Result := type_any_memory
      ensure
         type_any_memory /= Void
         Result /= Void
      end

   type_boolean: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_boolean_memory = Void then
            hs := string_aliaser.hashed_string(as_boolean)
            type_boolean_memory := type_dictionary.fast_reference_at(hs)
            if type_boolean_memory = Void then
               type_boolean_memory := get_type(create {BOOLEAN_TYPE_MARK}.make(unknown_position), False)
            end
         end
         Result := type_boolean_memory
      ensure
         type_boolean_memory /= Void
         Result /= Void
      end

   type_character: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_character_memory = Void then
            hs := string_aliaser.hashed_string(as_character)
            type_character_memory := type_dictionary.fast_reference_at(hs)
            if type_character_memory = Void then
               type_character_memory := get_type(create {CHARACTER_TYPE_MARK}.make(unknown_position), False)
            end
         end
         Result := type_character_memory
      ensure
         type_character_memory /= Void
         Result /= Void
      end

   type_string: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_string_memory = Void then
            hs := string_aliaser.hashed_string(as_string)
            type_string_memory := type_dictionary.fast_reference_at(hs)
            if type_string_memory = Void then
               type_string_memory := get_type(create {STRING_TYPE_MARK}.make(unknown_position), False)
            end
         end
         Result := type_string_memory
      ensure
         type_string_memory /= Void
         Result /= Void
      end

   type_native_array_character: TYPE
      local
         hs: HASHED_STRING
      do
         if type_native_array_character_memory = Void then
            hs := string_aliaser.hashed_string(as_native_array_character)
            type_native_array_character_memory := type_dictionary.fast_reference_at(hs)
            check
               type_native_array_character_memory /= Void
            end
         end
         Result := type_native_array_character_memory
      ensure
         type_native_array_character_memory /= Void
         Result /= Void
      end

   type_unicode_string: TYPE
      require
         not eiffel_parser.is_running
      local
         hs: HASHED_STRING; unknown_position: POSITION
         unicode_class_text: CLASS_TEXT cn: CLASS_NAME
      do
         if type_unicode_string_memory = Void then
            hs := string_aliaser.hashed_string(as_unicode_string)
            type_unicode_string_memory := type_dictionary.fast_reference_at(hs)
            if type_unicode_string_memory = Void then
               create cn.make(hs, unknown_position, False)
               unicode_class_text := class_text(cn)
               check
                  unicode_class_text /= Void
               end
               create cn.make(hs, unicode_class_text.name.start_position, False)
               type_unicode_string_memory := get_type(create {CLASS_TYPE_MARK}.make(cn), False)
            end
         end
         Result := type_unicode_string_memory
      ensure
         type_unicode_string_memory /= Void
         Result /= Void
      end

   type_pointer: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_pointer_memory = Void then
            hs := string_aliaser.hashed_string(as_pointer)
            type_pointer_memory := type_dictionary.fast_reference_at(hs)
            if type_pointer_memory = Void then
               type_pointer_memory := get_type(create {POINTER_TYPE_MARK}.make(unknown_position), False)
            end
         end
         Result := type_pointer_memory
      ensure
         type_pointer_memory /= Void
         Result /= Void
      end

   type_integer_8: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_integer_8_memory = Void then
            hs := string_aliaser.hashed_string(as_integer_8)
            type_integer_8_memory := type_dictionary.fast_reference_at(hs)
            if type_integer_8_memory = Void then
               type_integer_8_memory := get_type(create {INTEGER_TYPE_MARK}.integer_8(unknown_position), False)
            end
         end
         Result := type_integer_8_memory
      ensure
         type_integer_8_memory /= Void
         Result /= Void
      end

   type_integer_16: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_integer_16_memory = Void then
            hs := string_aliaser.hashed_string(as_integer_16)
            type_integer_16_memory := type_dictionary.fast_reference_at(hs)
            if type_integer_16_memory = Void then
               type_integer_16_memory := get_type(create {INTEGER_TYPE_MARK}.integer_16(unknown_position), False)
            end
         end
         Result := type_integer_16_memory
      ensure
         type_integer_16_memory /= Void
         Result /= Void
      end

   type_integer_32: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_integer_32_memory = Void then
            hs := string_aliaser.hashed_string(as_integer_32)
            type_integer_32_memory := type_dictionary.fast_reference_at(hs)
            if type_integer_32_memory = Void then
               type_integer_32_memory := get_type(create {INTEGER_TYPE_MARK}.integer(unknown_position), False)
            end
         end
         Result := type_integer_32_memory
      ensure
         type_integer_32_memory /= Void
         Result /= Void
      end

   type_integer_64: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_integer_64_memory = Void then
            hs := string_aliaser.hashed_string(as_integer_64)
            type_integer_64_memory := type_dictionary.fast_reference_at(hs)
            if type_integer_64_memory = Void then
               type_integer_64_memory := get_type(create {INTEGER_TYPE_MARK}.integer_64(unknown_position), False)
            end
         end
         Result := type_integer_64_memory
      ensure
         type_integer_64_memory /= Void
         Result /= Void
      end

   type_natural_8: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_natural_8_memory = Void then
            hs := string_aliaser.hashed_string(as_natural_8)
            type_natural_8_memory := type_dictionary.fast_reference_at(hs)
            if type_natural_8_memory = Void then
               type_natural_8_memory := get_type(create {NATURAL_TYPE_MARK}.natural_8(unknown_position), False)
            end
         end
         Result := type_natural_8_memory
      ensure
         type_natural_8_memory /= Void
         Result /= Void
      end

   type_natural_16: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_natural_16_memory = Void then
            hs := string_aliaser.hashed_string(as_natural_16)
            type_natural_16_memory := type_dictionary.fast_reference_at(hs)
            if type_natural_16_memory = Void then
               type_natural_16_memory := get_type(create {NATURAL_TYPE_MARK}.natural_16(unknown_position), False)
            end
         end
         Result := type_natural_16_memory
      ensure
         type_natural_16_memory /= Void
         Result /= Void
      end

   type_natural_32: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_natural_32_memory = Void then
            hs := string_aliaser.hashed_string(as_natural_32)
            type_natural_32_memory := type_dictionary.fast_reference_at(hs)
            if type_natural_32_memory = Void then
               type_natural_32_memory := get_type(create {NATURAL_TYPE_MARK}.natural_32(unknown_position), False)
            end
         end
         Result := type_natural_32_memory
      ensure
         type_natural_32_memory /= Void
         Result /= Void
      end

   type_natural_64: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_natural_64_memory = Void then
            hs := string_aliaser.hashed_string(as_natural_64)
            type_natural_64_memory := type_dictionary.fast_reference_at(hs)
            if type_natural_64_memory = Void then
               type_natural_64_memory := get_type(create {NATURAL_TYPE_MARK}.natural_64(unknown_position), False)
            end
         end
         Result := type_natural_64_memory
      ensure
         type_natural_64_memory /= Void
         Result /= Void
      end

   type_internals_handler_if_exists: TYPE
      local
         hs: HASHED_STRING; cn: CLASS_NAME; c: CLUSTER
      do
         hs := string_aliaser.hashed_string(as_internals_handler)
         create cn.unknown_position(hs, False)
         c := cluster_of(cn)
         hs := long_type_name(hs, c)
         Result := type_dictionary.fast_reference_at(hs)
      end

   type_real_32: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_real_32_memory = Void then
            hs := string_aliaser.hashed_string(as_real_32)
            type_real_32_memory := type_dictionary.fast_reference_at(hs)
            if type_real_32_memory = Void then
               type_real_32_memory := get_type(create {REAL_TYPE_MARK}.real_32(unknown_position), False)
            end
         end
         Result := type_real_32_memory
      ensure
         type_real_32_memory /= Void
         Result /= Void
      end

   type_real_64: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_real_64_memory = Void then
            hs := string_aliaser.hashed_string(as_real_64)
            type_real_64_memory := type_dictionary.fast_reference_at(hs)
            if type_real_64_memory = Void then
               type_real_64_memory := get_type(create {REAL_TYPE_MARK}.real(unknown_position), False)
            end
         end
         Result := type_real_64_memory
      ensure
         type_real_64_memory /= Void
         Result /= Void
      end

   type_real_extended: TYPE
      local
         hs: HASHED_STRING; unknown_position: POSITION
      do
         if type_real_extended_memory = Void then
            hs := string_aliaser.hashed_string(as_real_extended)
            type_real_extended_memory := type_dictionary.fast_reference_at(hs)
            if type_real_extended_memory = Void then
               type_real_extended_memory := get_type(create {REAL_TYPE_MARK}.real_extended(unknown_position), False)
            end
         end
         Result := type_real_extended_memory
      ensure
         type_real_extended_memory /= Void
         Result /= Void
      end

   unlock_type_creation (t: like type_to_be_created): BOOLEAN
      do
         Result := type_to_be_created = t
         type_to_be_created := Void
      ensure
         Result
      end

   has_type (static_type: TYPE_MARK): BOOLEAN
      require
         static_type.is_static
      do
         Result := type_dictionary.fast_has(static_type.long_name)
      end

   get_type (static_type: TYPE_MARK; allow_raw_class_name: BOOLEAN): TYPE
      require
         static_type.is_static
      local
         long_name: HASHED_STRING; gl: ARRAY[TYPE_MARK]; i: INTEGER
      do
         long_name := static_type.long_name
         Result := type_dictionary.fast_reference_at(long_name)
         if Result = Void then
            -- Before creating the TYPE of `static_type', we must be sure that its generic
            -- arguments, if any, are created first:
            if static_type.is_generic then
               from
                  gl := static_type.generic_list
                  i := gl.lower
               until
                  i > gl.upper
               loop
                  Result := get_type(gl.item(i), allow_raw_class_name)
                  i := i + 1
               end
            end

            -- Because it is possible that the previous computation actually resulted in
            -- creating the type of `static_type' itself:
            Result := type_dictionary.fast_reference_at(long_name)
            if Result = Void then
               Result := create_type(static_type, allow_raw_class_name)
            end
         end
      ensure
         Result /= Void
         has_type(static_type)
      end

   tuple_class_not_found_fatal_error (class_name: CLASS_NAME)
         -- Because there is a special trick for TUPLE related classes.
      require
         class_name.is_tuple_related
      local
         tuple_file_path: STRING; stop: BOOLEAN; cn: CLASS_NAME; ct: CLASS_TEXT; max_tuple: INTEGER
      do
         from
            check
               max_tuple = 0
            end
         until
            stop
         loop
            create cn.unknown_position(string_aliaser.hashed_string("TUPLE " + (max_tuple + 1).to_string), False)
            ct := ace.class_text(cn, False, Void)
            if ct = Void then
               stop := True
            else
               max_tuple := max_tuple + 1
               if tuple_file_path = Void then
                  tuple_file_path := ct.path
               end
            end
         end
         error_handler.add_position(class_name.start_position)
         if tuple_file_path = Void then
            error_handler.append(once "Unable to load class %"")
            error_handler.append(class_name.to_string)
            error_handler.append(once "%".")
         else
            error_handler.append(once "No such TUPLE definition in file %"")
            error_handler.append(tuple_file_path)
            error_handler.append(once "%".%NToo long TUPLE (the TUPLE you want has ")
            error_handler.append_integer(class_name.tuple_count)
            error_handler.append(once " formal generic arguments while the maximum allowed is ")
            error_handler.append_integer(max_tuple)
            error_handler.append(once ").%N")
         end
         error_handler.print_as_fatal_error
      end

feature {CLASS_TYPE_MARK}
   get_type_for_non_generic (non_generic_static_type: TYPE_MARK; allow_raw_class_name: BOOLEAN): TYPE
         -- Just an optimized version of `get_type'.
      require
         non_generic_static_type.is_static
         not non_generic_static_type.is_generic
      do
         Result := type_dictionary.fast_reference_at(non_generic_static_type.long_name)
         if Result = Void then
            Result := create_type(non_generic_static_type, allow_raw_class_name)
         end
      ensure
         Result = get_type(non_generic_static_type, allow_raw_class_name)
      end

feature {}
   feature_stamp_of (class_name, feature_name: STRING): FEATURE_STAMP
      require
         string_aliaser.registered_one(class_name)
         string_aliaser.registered_one(feature_name)
         string_aliaser.hashed_string(feature_name).is_simple_feature_name
      local
         hs: HASHED_STRING; t: TYPE
      do
         hs := string_aliaser.hashed_string(class_name)
         t := type_dictionary.fast_reference_at(hs)
         Result := feature_stamp(t, feature_name)
      ensure
         Result /= Void
      end

feature {INTROSPECTION_HANDLER}
   feature_stamp (type: TYPE; feature_name: STRING): FEATURE_STAMP
      require
         string_aliaser.registered_one(feature_name)
         string_aliaser.hashed_string(feature_name).is_simple_feature_name
      local
         hs: HASHED_STRING
      do
         hs := string_aliaser.hashed_string(feature_name)
         if type.has_simple_feature_name(hs) then
            Result := type.feature_stamp_of(hs)
         else
            error_handler.append(once "Class ")
            error_handler.append(type.class_text.name.to_string)
            error_handler.append(once " must have a feature named `")
            error_handler.append(feature_name)
            error_handler.append(once "'.")
            error_handler.add_position(type.class_text.name.start_position)
            error_handler.print_as_fatal_error
         end
      ensure
         Result /= Void
      end

feature {LIVE_TYPE}
   memory_dispose_stamp: FEATURE_STAMP
         -- Feature stamp of {DISPOSABLE}.dispose
      require
         status.is_collecting -- Because the call can make DISPOSABLE live
      local
         hs: HASHED_STRING; cn: CLASS_NAME; t: TYPE; c: CLUSTER
      once
         hs := string_aliaser.hashed_string(as_disposable)
         create cn.unknown_position(hs, False)
         c := cluster_of(cn)
         hs := long_type_name(hs, c)
         t := type_dictionary.fast_reference_at(hs)
         if t = Void then
            t := get_type(create {CLASS_TYPE_MARK}.make(cn), False)
            check
               type_dictionary.has(hs)
            end
         end
         Result := feature_stamp(t, as_dispose)
      ensure
         Result /= Void
      end

feature {MANIFEST_GENERIC}
   manifest_creation_name: FEATURE_NAME
         -- Feature name of {ANY}.manifest_creation
      once
         Result := feature_stamp(type_any, as_manifest_creation).anonymous_feature(type_any).first_name
      ensure
         Result /= Void
      end

feature {TYPE}
   register_type (t: TYPE)
      require
         t /= Void
         unlock_type_creation(t.long_name)
      local
         buffer: STRING; i: INTEGER; gl: ARRAY[TYPE]
         long_name, generic_long_name: HASHED_STRING; generic_type: TYPE
      do
         long_name := t.long_name
         if type_dictionary.fast_has(long_name) then
            error_handler.append(once "You seem to have too classes named ")
            error_handler.append(t.canonical_type_mark.class_text_name.to_string)
            error_handler.append(once ". Yours is in the cluster %"")
            error_handler.append(t.class_text.cluster.directory_path)
            error_handler.append(once "%". This is not possible as this class is basically used by Liberty Eiffel internals. Please pick another name.")
            error_handler.print_as_fatal_error
         end

         type_dictionary.add(t, long_name)

         if False and then shrink_generic_types and then t.is_generic then
            buffer := strings.new_twin(long_name.to_string)
            i := buffer.first_index_of('[')
            buffer.keep_head(i)
            from
               gl := t.generic_list
               i := gl.lower
            until
               i > gl.upper
            loop
               generic_type := get_constraint_ancestor(t, i)
               if i > gl.lower then
                  buffer.extend(',')
               end
               buffer.append(generic_type.long_name.to_string)
               i := i + 1
            end
            buffer.extend(']')
            generic_long_name := string_aliaser.hashed_string(buffer)
            strings.recycle(buffer)

            if not generic_type_dictionary.fast_has(generic_long_name) then
               echo.put_string(once "Generic type: ")
               echo.put_line(long_name.to_string)
               echo.put_string(once "           => ")
               echo.put_line(generic_long_name.to_string)
               generic_type_dictionary.add(long_name, generic_long_name)
            end
         end
      end

feature {}
   get_constraint_ancestor (generic_type: TYPE; rank: INTEGER): TYPE
      require
         shrink_generic_types
         generic_type.is_generic
         generic_type.generic_list.valid_index(rank)
      local
         constraint_type: TYPE_MARK; code: INTEGER_8; constraint: TYPE
      do
         Result := generic_type.generic_list.item(rank)

         constraint_type := generic_type.class_text.formal_generic_list.item(rank).constraint
         if constraint_type = Void then
            -- constraint is ANY
            Result := Result.closest_to_constraint(type_any)
         else
            check
               constraint_type.is_static
            end
            constraint := get_type(constraint_type, False)
            if Result /= constraint then
               code := Result.insert_inherit_test(constraint)
               inspect
                  code
               when inherits_code then
                  Result := constraint
               when inserts_code then
                  Result := Result.closest_to_constraint(constraint)
               when unrelated_code then
                  -- error: type not related to constraint (should have been caught earlier)
                  -- **** ???? **** not_yet_implemented
               end
            end
         end
      end

feature {CLASS_CHECK, MOCK}
   very_last_information
      do
         error_handler.print_live_warnings
         assignment_handler.echo_information
         feature_accumulator.echo_information
         eiffel_parser.echo_information
         status.echo_information
         echo.put_string(once "Done.%N")
      end

feature {ID_PROVIDER}
   id_extra_information (tfw: TEXT_FILE_WRITE; name: HASHED_STRING; cluster: CLUSTER)
      require
         cluster /= Void
      local
         ct: CLASS_TEXT; lt: LIVE_TYPE; path: STRING; t: TYPE
      do
         t := type_dictionary.fast_reference_at(long_type_name(name, cluster))
         if t /= Void then
            lt := t.live_type
         end
         if lt /= Void then
            ct := lt.class_text
         else
            ct := ace.class_text(create {CLASS_NAME}.unknown_position(name, True), False, cluster)
         end
         tfw.put_character('%N')
         if ct /= Void then
            tfw.put_string(once "class-path: %"")
            path := ct.path
            tfw.put_string(path)
            tfw.put_character('%"')
            tfw.put_character('%N')
            ct.id_extra_information(tfw)
         end
         if lt /= Void then
            lt.id_extra_information(tfw)
         end
      end

feature {FEATURE_CALL}
   covariance_check (call_site: POSITION; up_rf: RUN_FEATURE; run_time_set: RUN_TIME_SET)
      require
         not call_site.is_unknown
         up_rf.arguments.count >= 1
         not run_time_set.is_empty
      local
         dyn_rf: RUN_FEATURE; up_args, dyn_args: FORMAL_ARG_LIST; r, a: INTEGER
         original_tm, redefined_tm: TYPE_MARK; original, redefined: TYPE
      do
         from
            r := 1
            up_args := up_rf.arguments
         until
            r > run_time_set.count
         loop
            dyn_rf := run_time_set.item(r).dynamic_feature(up_rf)
            from
               a := 1
               dyn_args := dyn_rf.arguments
            until
               a > up_args.count
            loop
               original_tm := up_args.type_mark(a)
               original := original_tm.resolve_in(up_rf.type_of_current)
               redefined_tm := dyn_args.type_mark(a)
               redefined := redefined_tm.resolve_in(dyn_rf.type_of_current)
               if not original.can_be_assigned_to(redefined) and then
                  original.collected_feature_count > 0 and then
                  original.collected_feature_count /= redefined.collected_feature_count
                then
                  error_handler.add_position(call_site)
                  error_handler.append(once "Unsafe call site (see also next warning).")
                  error_handler.print_as_warning
                  error_handler.append(once "Unsafe covariant redefinition of argument number ")
                  error_handler.append_integer(a)
                  error_handler.append(once " (type %"")
                  error_handler.append(original.name.to_string)
                  error_handler.append(once "%" redefined as %"")
                  error_handler.append(redefined.name.to_string)
                  error_handler.append(once "%").")
                  error_handler.add_position(up_rf.base_feature.start_position)
                  error_handler.add_position(dyn_rf.base_feature.start_position)
                  error_handler.print_as_warning
                  status.set_safety_check_failed
               end
               a := a + 1
            end
            r := r + 1
         end
      end

feature {E_OLD}
   register_old (e_old: E_OLD)
      require
         e_old /= Void
      local
         old_list: FAST_ARRAY[E_OLD]
      do
         old_list := old_list_stack.last
         if old_list = Void then
            create old_list.with_capacity(2)
            old_list_stack.put(old_list, old_list_stack.upper)
         end
         old_list.add_last(e_old)
      end

feature {}
   old_list_stack: FAST_ARRAY[FAST_ARRAY[E_OLD]]
         -- Non Void when some E_OLD have been gathered.
      once
         create Result.with_capacity(2)
      end

feature {RUN_FEATURE}
   old_list_stack_push
      do
         old_list_stack.add_last(Void)
      end

   old_list_stack_pop: FAST_ARRAY[E_OLD]
      do
         Result := old_list_stack.last
         old_list_stack.remove_last
      end

feature {}
   collected_plug_in: SET[NATIVE_PLUG_IN]
      once
         create {HASHED_SET[NATIVE_PLUG_IN]} Result.make
      end

feature {NATIVE_PLUG_IN}
   register_plug_in (native_plug_in: NATIVE_PLUG_IN)
      require
         native_plug_in /= Void
      do
         collected_plug_in.add(native_plug_in)
      end

feature {LIVE_TYPE}
   set_deep_features_used
      do
         deep_features_used := True
      end

feature {NATIVE_BUILT_IN}
   set_thread_used
      do
         thread_used := True
      end

feature {RUN_FEATURE_8, EXTERNAL_FUNCTION, GENERATOR_GENERATING_TYPE} --|*** remove RUN_FEATURE_8
   set_generating_type_used
      do
         generating_type_used := True
      end

   set_generator_used
      do
         generator_used := True
      end

feature {CLUSTER}
   parse_include (include_name: STRING)
      require
         include_name /= Void
      local
         ct: CLASS_TEXT
      do
         check
            parser_buffer.is_ready
         end
         echo.put_string(once "Handling include of %"")
         echo.put_string(include_name)
         echo.put_string(once "%" from ACE file. (Parsing %"")
         echo.put_string(parser_buffer.path)
         echo.put_string(once "%".)%N")
         ct := eiffel_parser.analyse_buffer
         check
            ct /= Void implies ace.has(ct.name.hashed_name)
         end
      end

feature {RUN_FEATURE}
   register_run_feature (rf: RUN_FEATURE)
      require
         not_registered: not registered(rf)
      do
         if run_features = Void then
            create run_features.with_capacity(16)
         end
         run_features.add_last(rf)
      ensure
         run_features.last = rf
      end

feature {RUN_FEATURE, LIVE_TYPE}
   registered (rf: RUN_FEATURE): BOOLEAN
      do
         Result := run_features /= Void and then run_features.fast_has(rf)
      end

feature {COMMAND_LINE_TOOLS}
   initialize_any_tuple
         -- Some tools have to call this `initialize_any_tuple' once routine.
         -- Actually, `initialize_any_tuple' forces the creation of ANY and TUPLE first.
         -- Note, this is not in the creation of `smart_eiffel' itself because, not all tools are
         -- supposed to load Eiffel classes.
      local
         hashed_string: HASHED_STRING; ct: CLASS_TEXT
      once
         create live_type_map_.with_capacity(2048)

         -- Forcing first creation of ANY in order to initialize the machinery:
         hashed_string := string_aliaser.hashed_string(as_any)
         ct := class_text(create {CLASS_NAME}.unknown_position(hashed_string, False))

         -- Finally, forcing creation of TUPLE:
         hashed_string := string_aliaser.hashed_string(as_tuple)
         ct := class_text(create {CLASS_NAME}.make(hashed_string, ct.name.start_position, False))

         -- Note: even the simple HELLO_WORLD, normally has to load TUPLE.
      end

feature {CODE_PRINTER}
   register_class_invariant (t: LIVE_TYPE)
      do
         if class_invariants = Void then
            create class_invariants.with_capacity(16)
         end
         if not class_invariants.fast_has(t) then
            class_invariants.add_last(t)
         end
      end

   register_agent_creation (ac: AGENT_CREATION)
      do
         if agent_creations = Void then
            create agent_creations.with_capacity(16)
         end
         if not agent_creations.fast_has(ac) then
            agent_creations.add_last(ac)
         end
      end

   register_agent_switch (t: TYPE)
      do
         if agent_switches = Void then
            create agent_switches.with_capacity(16)
         end
         if not agent_switches.fast_has(t) then
            agent_switches.add_last(t)
         end
      end

feature {E_FUNCTION, CALL_INFIX_POWER}
   simplify_integer_infix_power (call_site: POSITION; target, exponent: EXPRESSION): INTEGER_CONSTANT
         -- Static simplification of {INTEGER_GENERAL}.infix "^" is here to be shared for `static_simplify' and
         -- `simplify'.
      local
         ic1, ic2: INTEGER_CONSTANT; v1, v2, r, i: INTEGER_64; overflow: BOOLEAN
      do
         ic1 ?= target
         if ic1 /= Void then
            ic2 ?= exponent
            if ic2 /= Void then
               v1 := ic1.value_memory
               v2 := ic2.value_memory
               if v2 < 0 then
                  error_handler.append(once "Exponent of infix %"^%" must be a positive INTEGER. %
                                       %Exponent actual value is %"")
                  error_handler.append(v2.to_string)
                  error_handler.append(once "%".")
                  error_handler.add_position(call_site)
                  error_handler.print_as_fatal_error
               end
               -- We now computing the result of `v1^v2' in `r' slowly, but carefully whitout
               -- using infix "^" itself:
               if v2 = 0 then
                  r := 1
               else
                  from
                     r := v1
                     i := v2
                  until
                     overflow or else i = 1
                  loop
                     i := i - 1
                     if ((r #* v1) #// v1) /= r then
                        overflow := True
                     end
                     r := r * v1
                  end
               end
               if overflow then
                  error_handler.append(once "Overflow while computing %"")
                  error_handler.append(v1.to_string)
                  error_handler.append(once "^")
                  error_handler.append(v2.to_string)
                  error_handler.append(once "%"")
                  error_handler.add_position(call_site)
                  error_handler.print_as_fatal_error
               end
               -- Now checking that the result is identical to what's actually in INTEGER_GENERAL:
               if r /= v1 ^ v2 then
                  error_handler.append(once "Internal compiler error. Definition of infix %"^%" of %
                                       %INTEGER_GENERAL is not coherent with compiler builtin %
                                       %simplifications.")
                  error_handler.add_position(call_site)
                  error_handler.print_as_fatal_error
               end
               create {INTEGER_CONSTANT} Result.make(r, call_site)
            end
         end
      end

feature {CODE_PRINTER, MEMORY_HANDLER}
   is_at_run_time (a_class_name: STRING): BOOLEAN
         -- query to know if the type `a_class_name' is used at runtime
         -- The class name must be the one of a basic type because the cluster information is not appended
      require
         is_ready
         string_aliaser.registered_one(a_class_name)
      local
         t: TYPE; hashed_string: HASHED_STRING; lt: LIVE_TYPE
      do
         hashed_string := string_aliaser.hashed_string(a_class_name)
         if hashed_string /= Void then
            t := type_dictionary.fast_reference_at(hashed_string)
            if t /= Void then
               lt := t.live_type
            end
            if lt /= Void then
               Result := lt.at_run_time
            end
         end
      end

feature {}
   agent_creation_error_trap: STACK[AGENT_CREATION]
      once
         create Result.make
      end

feature {AGENT_CREATION}
   set_agent_creation_error_trap (agent_creation: AGENT_CREATION)
      require
         agent_creation /= Void
      do
         agent_creation_error_trap.push(agent_creation)
      end

   clear_agent_creation_error_trap (agent_creation: AGENT_CREATION)
      require
         agent_creation /= Void
      do
         if agent_creation_error_trap.top /= agent_creation then
            error_handler.append(once "Internal compiler error (set_agent_creation_error_trap).")
            error_handler.print_as_fatal_error
         end
         agent_creation_error_trap.pop
      end

feature {FUNCTION_CALL, PROCEDURE_CALL}
   try_agent_creation_error_trap (function_call: FUNCTION_CALL): BOOLEAN
      do
         if not agent_creation_error_trap.is_empty then
            Result := function_call = agent_creation_error_trap.top.code
         end
      end

feature {}
   frozen code_accumulator: CODE_ACCUMULATOR
      once
         create Result.make
      end

feature {ACE}
   root_class_text (root_class_name: STRING): CLASS_TEXT
      local
         hashed_root_class_name: HASHED_STRING; root_name: CLASS_NAME
      do
         hashed_root_class_name := string_aliaser.hashed_string(root_class_name)
         create root_name.unknown_position(hashed_root_class_name, False)
         if cwd_cluster /= Void then
            echo.put_string(once "Looking for ")
            echo.put_string(root_class_name)
            echo.put_string(once " starting from cluster ")
            echo.put_line(cwd_cluster.name)
         end
         Result := ace.class_text(root_name, True, cwd_cluster)
      end

feature {}
   cwd_cluster: CLUSTER
      local
         bd: BASIC_DIRECTORY; cwd_path: STRING
      once
         cwd_path := string_aliaser.string(bd.current_working_directory.out)
         Result := ace.cluster_by_directory_path(cwd_path)
         if Result = Void then
            echo.put_string(once "The current directory ")
            echo.put_string(cwd_path)
            echo.put_line(once " does not belong to any known cluster.")
         end
      end

feature {}
   echo_magic_count (msg: STRING)
      require
         msg /= Void
      do
         echo.put_string(msg)
         echo.put_string(once " (magic_count=")
         echo.put_integer(magic_count)
         echo.put_string(once ").%N")
      end

   do_front_end (root_class_name, root_procedure_name: STRING)
         -- Get started to compile using creation procedure `root_procedure_name' of class text
         -- `root_class_name'.
      require
         not root_class_name.is_empty
         not root_procedure_name.is_empty
      local
         root_fn: FEATURE_NAME; root: CLASS_TEXT; root_type: TYPE
         fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
      do
         root := root_class_text(root_class_name)
         if root = Void then
            error_handler.append(once "Cannot load root class ")
            error_handler.append(root_class_name)
            error_handler.append(once ". ")
            error_handler.print_as_error
         elseif root.is_expanded then
            error_handler.add_position(root.name.start_position)
            error_handler.append(
              "The root class must not be expanded (sorry, but this is a limitation of the compiler).")
            error_handler.print_as_fatal_error
         elseif root.is_generic then
            error_handler.append(root.name.to_string)
            error_handler.append(once " cannot be a root class since it is a generic class.")
            error_handler.print_as_fatal_error
         else
            root_fn := root.root_creation_search(root_procedure_name)
            root_type := root.declaration_type_of_like_current
            if root_type.is_deferred then
               error_handler.append(root.name.to_string)
               error_handler.append(once " cannot be a root class since it is a deferred class.")
               error_handler.print_as_warning
            end
            fs := root_type.lookup(root_fn)
            af := fs.anonymous_feature(root_type)
            if af.arguments /= Void then
               error_handler.add_position(af.start_position)
               error_handler.append(once "The main procedure must not have arguments.")
               error_handler.print_as_fatal_error
            end
         end
      ensure
         nb_errors = 0 implies root_procedure /= Void
      end

   do_collect (root_class_name, root_procedure_name: STRING)
      require
         nb_errors = 0
      local
         root_fn: FEATURE_NAME; root: CLASS_TEXT; root_type: TYPE
      do
         root := root_class_text(root_class_name)
         root_fn := root.root_creation_search(root_procedure_name)
         root_type := root.declaration_type_of_like_current
         collect_from_root(root_type, root_type.lookup(root_fn))
      end

   do_adapt (root_class_name, root_procedure_name: STRING)
      require
         nb_errors = 0
         not pretty_flag and then not short_or_class_check_flag
      local
         root_fn: FEATURE_NAME; root: CLASS_TEXT; root_type: TYPE
      do
         root := root_class_text(root_class_name)
         root_fn := root.root_creation_search(root_procedure_name)
         root_type := root.declaration_type_of_like_current

         -- Well, we are now producing executable code. One pass first of `simplify' to compute what
         -- is obviously static (e.g. 1 + 1 = 2):
         simplify_and_optimize(root_type, root_type.lookup(root_fn))
         -- Now inlining of dynamic dispatch:
         inline_dynamic_dispatch(root_type, root_fn)
         -- Second pass of `simplify' to compute what has been inlined:
         simplify_and_optimize(root_type, root_type.lookup(root_fn))
      end

   do_back_end (back_end: CODE_PRINTER; root_class_name, root_procedure_name: STRING)
      require
         nb_errors = 0
      local
         root_fn: FEATURE_NAME; root: CLASS_TEXT; root_type: TYPE
      do
         root := root_class_text(root_class_name)
         root_fn := root.root_creation_search(root_procedure_name)
         root_type := root.declaration_type_of_like_current
         root_procedure ::= root_type.live_type.at(root_fn)
         if root_procedure = Void then
            error_handler.append(once "Root procedure {")
            error_handler.append(root_class_name)
            error_handler.append(once "}.")
            error_handler.append(root_procedure_name)
            error_handler.append(once " not found!")
            error_handler.print_as_internal_error
         end
         back_end.compile
      end

   collect_from_root (root_type: TYPE; root_feature: FEATURE_STAMP)
      local
         tmp: TYPE; i: INTEGER; magic: like magic_count
      do
         assignment_handler.reset
         manifest_string_pool.reset
         manifest_generic_pool.reset
         once_routine_pool.reset
         agent_pool.reset
         assignment_test_pool.reset
         --|*** (PR 30/05/04) Reset is not yet complete. Should be
         --|*** reseted: manifest [unicode] strings, and maybe some other pools such as tuples, ...
         se_atexit_stamp := Void
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            live_type_map.item(i).forget_previous_collect
            i := i + 1
         end
         echo_magic_count(once "Starting collect")
         -- Collect all the live features:
         if ace.no_check then
            -- STRINGs are needed for runtime support:
            manifest_string_pool.collect_string(type_string)
         end
         from
            magic := -1 -- Iterate at least once
            -- Mark the root procedure as alive:
            tmp := collect(root_type, root_feature, True)
            check
               tmp = Void
            end
            -- Also mark possible -cecil features as alive:
            if cecil_pool /= Void then
               cecil_pool.collect
            end
            -- in case deep features are used collect them
            if deep_features_used then
               collect_deep_features
            end
         until
            magic = magic_count
         loop
            magic := magic_count
            echo_magic_count(once "Before collect cycle")
            do_one_collect_cycle
         end
      end

   do_one_collect_cycle
      local
         i: INTEGER
      do
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            live_type_map.item(i).propagate_features
            i := i + 1
         end
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            live_type_map.item(i).do_collect
            i := i + 1 -- We go this way to collect new incoming live-types
         end
         assignment_handler.recompute_all_run_time_sets
      end

   collect_deep_features
      require
         deep_features_used
      local
         i: INTEGER
      do
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            live_type_map.item(i).do_collect_is_deep_equal
            i := i + 1
         end
      end

   safety_check
         -- Start final whole system analysis to decide whether this
         -- system is safe or not.
      require
         status.is_adapting
      local
         old_magic_count, i: INTEGER; do_it: BOOLEAN; lt: LIVE_TYPE
      do
         debug
            old_magic_count := magic_count
         end
         do_it := ace.safety_check
         status.set_safety_checking
         if do_it then
            echo_magic_count(once "Starting type safety check")
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               if lt.at_run_time then
                  lt.safety_check
               end
               i := i + 1
            end
            status.set_safety_check_ok
         end
         debug
            check
               old_magic_count = magic_count
            end
         end
      ensure
         status.is_safety_checking
         ace.safety_check implies status.safety_check_done
      end

   monomorphic_procedure_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   monomorphic_function_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   expanded_target_procedure_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   expanded_target_function_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   polymorphic_procedure_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   polymorphic_function_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   void_target_procedure_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   void_target_function_call_count: INTEGER
         -- Updated during `inline_dynamic_dispatch'.

   polymorphic_distribution: ARRAY[INTEGER]
         -- About the "inspect" statements used to implement dynamic dispatch.
         -- The index of the ARRAY is used to indicate the number of branches of the inspect.
         -- The corresponding content in the ARRAY indicate the number of call sites. As an
         -- example `polymorphic_distribution.item(50) = 4' indicates that we have 4 polymorphic
         -- call sites implemented with a 50 branches inspect.

   inspect_when_merge_counter: INTEGER
         -- Total number of merged when clauses in "inspect" statements.

   inline_dynamic_dispatch (root_type: TYPE; root_fn: FEATURE_NAME)
      require
         not pretty_flag
         not short_or_class_check_flag
         status.collecting_done
         not status.inlining_dynamic_dispatch_done
      local
         i: INTEGER; score: REAL
      do
         status.set_inlining_dynamic_dispatch
         echo.put_string(once "Now inlining dynamic dispatch (using inspect instructions)%N")
         create polymorphic_distribution.with_capacity(32, 2)
         from
            i := live_type_map.lower
         until
            i > live_type_map.upper
         loop
            live_type_map.item(i).inline_dynamic_dispatch(code_accumulator)
            i := i + 1
         end
         if cecil_pool /= Void then
            cecil_pool.inline_dynamic_dispatch(code_accumulator, type_any)
         end
         echo.put_string(once "Measurements done during inlining of dynamic dispatch:%N")
         echo.print_count(once "Monomorphic Procedure Call", monomorphic_procedure_call_count)
         echo.print_count(once "Monomorphic Function Call", monomorphic_function_call_count)
         echo.print_count(once "Monomorphic Procedure/Function Call",
            monomorphic_procedure_call_count + monomorphic_function_call_count)
         echo.print_count(once "Polymorphic Proceduire Call", polymorphic_procedure_call_count)
         echo.print_count(once "Polymorphic Function Call", polymorphic_function_call_count)
         echo.print_count(once "Polymorphic Proceduire/Function Call",
            polymorphic_procedure_call_count + polymorphic_function_call_count)
         echo.print_count(once "Void target Procedure Call", void_target_procedure_call_count)
         echo.print_count(once "Void target Function Call", void_target_function_call_count)
         echo.print_count(once "Void target Procedure/Function Call",
            void_target_procedure_call_count + void_target_function_call_count)
         echo.put_string(once "Details regarding Monomorphic calls:%N")
         echo.print_count(once "Reference Target Monomorphic Procedure Call",
            monomorphic_procedure_call_count - expanded_target_procedure_call_count)
         echo.print_count(once "Expanded Target Procedure Call", expanded_target_procedure_call_count)
         echo.print_count(once "Reference Target Monomorphic Function Call",
            monomorphic_function_call_count - expanded_target_function_call_count)
         echo.print_count(once "Expanded Target Function Call", expanded_target_function_call_count)
         echo.put_string(once "Target Type Prediction Score: ")
         score := monomorphic_procedure_call_count + monomorphic_function_call_count
         score := score + void_target_procedure_call_count + void_target_function_call_count
         score := score / (score + polymorphic_procedure_call_count + polymorphic_function_call_count) * 100.0
         echo.put_real_format(score, 2)
         echo.put_string(once "%%%N")
         echo_polymorphic_inspect_distribution(once "during inlining of dynamic dispatch")
         code_accumulator.echo_information
         echo.put_string(once "Finished inlining of dynamic dispatch.%N")
         status.set_inlining_dynamic_dispatch_done
         -- We need to recollect just after inlining:
         collect_from_root(root_type, root_type.lookup(root_fn))
      ensure
         status.inlining_dynamic_dispatch_done
      end

   simplify_and_optimize (root_type: TYPE; root_feature: FEATURE_STAMP)
      require
         not pretty_flag
         not short_or_class_check_flag
         status.collecting_done
      local
         prev_magic_count: INTEGER
      do
         if ace.boost then
            status.start_simplifying
            echo.put_string(once "Starting optimization (")
            echo.put_integer(magic_count)
            echo.put_string(once ")%N")
            if ace.boost1 then
               simplify
               collect_from_root(root_type, root_feature)
            elseif ace.boost2 then
               from
               until
                  prev_magic_count = magic_count
               loop
                  simplify
                  prev_magic_count := magic_count
               end
            else
               from
               until
                  prev_magic_count = magic_count
               loop
                  contextual_simplify
                  prev_magic_count := magic_count
               end
            end
            echo.put_string(once "Finished optimization (")
            echo.put_integer(magic_count)
            echo.put_string(once ")%N")
            status.end_simplifying
         end
      end

   set_simplify_done
      do
         simplify_done := True
      ensure
         simplify_done
      end

   simplify
      require
         not pretty_flag
         not short_or_class_check_flag
         status.collecting_done
         ace.boost1 or ace.boost2
      local
         lt: LIVE_TYPE; i: INTEGER; max_loop, prev_magic_count: INTEGER
      do
         echo_magic_count(once "Starting simplify")
         from
            max_loop := 50 -- (Is actually more than necessary, but avoids infinite inlinings.)
         until
            max_loop = 0 or else prev_magic_count = magic_count
         loop
            prev_magic_count := magic_count
            echo_magic_count(once "Before simplify cycle")
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               lt.simplify
               i := i + 1
            end
            max_loop := max_loop - 1
         end
         from
            introspection_handler.collect_internals_handler
            max_loop := max_loop.max(1) -- (Allow to loop at least one more time)
         until
            max_loop = 0 or else prev_magic_count = magic_count
         loop
            prev_magic_count := magic_count
            echo_magic_count(once "Before simplify cycle")
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               lt.simplify
               i := i + 1
            end
            max_loop := max_loop - 1
         end
         if max_loop = 0 then
            echo_magic_count(once "Symplify interrupted (infinite inlining ... or infinite recursion detected.).")
         end
         echo_magic_count(once "Simplify done")
         set_simplify_done
      end

   contextual_simplify
      require
         not pretty_flag
         not short_or_class_check_flag
         status.collecting_done
         ace.boost3
      local
         lt: LIVE_TYPE; i: INTEGER; prev_magic_count: INTEGER
      do
         echo.put_string(once "[Starting context_simplify (")
         echo.put_integer(magic_count)
         echo.put_string(once "): ")
         from
         until
            prev_magic_count = magic_count
         loop
            prev_magic_count := magic_count
            echo.put_character('.')
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               lt.contextual_simplify
               i := i + 1
            end
         end
         from
            introspection_handler.collect_internals_handler
         until
            prev_magic_count = magic_count
         loop
            prev_magic_count := magic_count
            echo.put_character('.')
            from
               i := live_type_map.lower
            until
               i > live_type_map.upper
            loop
               lt := live_type_map.item(i)
               lt.contextual_simplify
               i := i + 1
            end
         end
         echo.put_string(once " finished context_simplify (")
         echo.put_integer(magic_count)
         echo.put_string(once ")]%N")
         set_simplify_done
      end

feature {INSPECT_STATEMENT}
   inspect_when_merge_counter_increment
      do
         magic_count_increment
         inspect_when_merge_counter := inspect_when_merge_counter + 1
      end

feature {C_PRETTY_PRINTER}
   echo_polymorphic_inspect_distribution (step_tag: STRING)
      local
         when_count, inspect_count, cumulated_inspect_count: INTEGER; polymorphic_view: STRING
      do
         echo.put_string(once "Polymorphic Distribution of %"inspect%" Statements. Measurement%Ndone ")
         echo.put_string(step_tag)
         echo.put_string(once ". The number of dots%Ngives the number of %"when%" clauses:%N")
         from
            when_count := polymorphic_distribution.lower
         until
            when_count > polymorphic_distribution.upper
         loop
            inspect_count := polymorphic_distribution.item(when_count)
            if inspect_count > 0 then
               cumulated_inspect_count := cumulated_inspect_count + inspect_count
               polymorphic_view := once ".............. once unique buffer ......................"
               polymorphic_view.clear_count
               inspect_count.append_in(polymorphic_view)
               polymorphic_view.extend_to_count(' ', 5)
               polymorphic_view.extend_multiple('.', when_count)
               polymorphic_view.extend('(')
               when_count.append_in(polymorphic_view)
               polymorphic_view.extend(')')
               polymorphic_view.extend('%N')
               echo.put_string(polymorphic_view)
            end
            when_count := when_count + 1
         end
         if cumulated_inspect_count = 0 then
            echo.put_string(once "No Polymorphic Call Site in the Live Code.%N")
         else
            echo.put_string(once "Total Number of %"inspect%" used for Dynamic dispatch: ")
            echo.put_integer(cumulated_inspect_count)
            echo.put_string(once "%N")
         end
         -- To prepare the next measurement:
         polymorphic_distribution.set_all_with(0)
         echo.put_string(once "Total Number of Merged %"when%" clauses (cumulated): ")
         echo.put_integer(inspect_when_merge_counter)
         echo.put_string(once "%N")
      end

feature {LIVE_TYPE}
   register_live_type (live_type: LIVE_TYPE)
      require
         live_type /= Void
      do
         live_type_map_.add_last(live_type)
      end

feature {PROCEDURE_CALL}
   monomorphic_procedure_call_count_increment
      do
         monomorphic_procedure_call_count := monomorphic_procedure_call_count + 1
      end

   expanded_target_procedure_call_count_increment
      do
         expanded_target_procedure_call_count := expanded_target_procedure_call_count + 1
      end

   polymorphic_procedure_call_count_increment (nb_branches: INTEGER)
      require
         nb_branches >= 2
      do
         update_polymorphic_distribution(nb_branches)
         polymorphic_procedure_call_count := polymorphic_procedure_call_count + 1
      end

   void_target_procedure_call_count_increment
      do
         void_target_procedure_call_count := void_target_procedure_call_count + 1
      end

feature {FUNCTION_CALL}
   monomorphic_function_call_count_increment
      do
         monomorphic_function_call_count := monomorphic_function_call_count + 1
      end

   expanded_target_function_call_count_increment
      do
         expanded_target_function_call_count := expanded_target_function_call_count + 1
      end

   polymorphic_function_call_count_increment (nb_branches: INTEGER)
      require
         nb_branches >= 2
      do
         update_polymorphic_distribution(nb_branches)
         polymorphic_function_call_count := polymorphic_function_call_count + 1
      end

   void_target_function_call_count_increment
      do
         void_target_function_call_count := void_target_function_call_count + 1
      end

feature {C_CODE_COMPILER}
   update_polymorphic_distribution (nb_branches: INTEGER)
      require
         nb_branches >= 2
      local
         count: INTEGER
      do
         if polymorphic_distribution.valid_index(nb_branches) then
            count := polymorphic_distribution.item(nb_branches)
            polymorphic_distribution.put(count + 1, nb_branches)
         else
            polymorphic_distribution.force(1, nb_branches)
         end
      end

feature {C_PRETTY_PRINTER}
   sort_live_type_map
      do
         live_type_sorter.sort(live_type_map_)
      ensure
         is_sorted: live_type_sorter.is_sorted(live_type_map_)
      end

   show_live_types
      local
         i: INTEGER
      do
         if echo.is_verbose then
            from
               i := live_type_map_.lower
            until
               i > live_type_map_.upper
            loop
               if live_type_map_.item(i).at_run_time then
                  echo.put_string(once "Will generate live type: ")
                  echo.put_line(live_type_map_.item(i).name.to_string)
               end
               i := i + 1
            end
         end
      end

feature {}
   live_type_map_: FAST_ARRAY[LIVE_TYPE]
   live_type_sorter: COLLECTION_SORTER[LIVE_TYPE]

end -- class SMART_EIFFEL
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
-- Copyright (C) 2011-2017: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
