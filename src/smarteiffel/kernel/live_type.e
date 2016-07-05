-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class LIVE_TYPE
   --
   -- Only for class/type with objects at execution time (see also TYPE).
   --

inherit
   HASHABLE
   COMPARABLE
      redefine is_equal
      end
   VISITABLE
      redefine is_equal
      end
   TAGGED
      redefine is_equal
      end

insert
   GLOBALS
      redefine is_equal
      end

create {SMART_EIFFEL}
   make

feature {ANY}
   type: TYPE
         -- The corresponding type object.

   canonical_type_mark: TYPE_MARK
         -- Alias of `type.canonical_type_mark'.

   name: HASHED_STRING
         -- Alias of `type.name'.

   class_text: CLASS_TEXT
         -- Alias `type.class_text'.

   class_text_name: CLASS_NAME
         -- Alias the one of `class_text'.

   id: INTEGER
         -- Id of the receiver to produce C code.

   at_run_time: BOOLEAN
         -- True if `Current' is itself really created (i.e. there are direct instances of
         -- the corresponding `canonical_type_mark' at run time).
         -- *Almost* equivalent to not run_time_set.is_empty

   run_time_set: RUN_TIME_SET
         -- The set of all possible dynamic types (existing types at run-time, i.e. with a
         -- corresponding `at_run_time' object) which may be actually returned by an
         -- expression of the `Current' type. This set, which is empty at the beginning of
         -- the compilation process will grow, following the `smart_eiffel.status' evolution.
         -- Thus, if the type of `Current' is a reference type, the `run_time_set' has only
         -- reference run classes elements. If the type of `Current' is an expanded type, the
         -- `run_time_set' has only `Current' as a single element. Furthermore, the size of the
         -- `run_time_set' depends on live assignments (as well as argument passing and creation
         -- statements) that are found in the live code.

   class_invariant: CLASS_INVARIANT
         -- Collected Runnable invariant if any and only is necessary.
      do
         Result := type.class_invariant
      end

   hash_code: INTEGER
         -- Actually, in order to speed up the compiler, this is a cache
         -- for value `name.to_string'.

   generating_type_used: BOOLEAN
         -- Must the "generating_type" string be generated for this type?
      require
         smart_eiffel.generating_type_used
      do
         Result := at_run_time or else generating_type_level=2
      end

   generator_used: BOOLEAN
         -- Must the "generator" string be generated for this type?
      require
         smart_eiffel.generator_used
      do
         Result := at_run_time or else generating_type_level > 0
      end

   can_be_assigned_to (other: like Current): BOOLEAN
      do
         if Current = other then
            Result := True
         else
            Result := type.can_be_assigned_to(other.type)
         end
      end

   is_equal (other: like Current): BOOLEAN
      do
         Result := Current = other
      end

   infix "<" (other: like Current): BOOLEAN
      do
         Result := id < other.id
      ensure then
         Result = (id < other.id)
      end

   is_generic: BOOLEAN
      do
         Result := type.is_generic
      ensure
         is_generic and then is_array implies Result
      end

   is_reference: BOOLEAN
      do
         Result := canonical_type_mark.is_reference
      ensure
         Result = not is_expanded
      end

   is_array: BOOLEAN
      require
         is_generic
      do
         Result := canonical_type_mark.is_array
      end

   is_native_array: BOOLEAN
      do
         Result := canonical_type_mark.is_native_array
      end

   accept (visitor: LIVE_TYPE_VISITOR)
      do
         visitor.visit_live_type(Current)
      end

feature {SMART_EIFFEL, EXTERNAL_ROUTINE, LIVE_TYPE_EXTRA_COLLECTOR}
   collect (fs: FEATURE_STAMP)
      require
         valid_stamp: fs /= Void
      do
         check
            stamp_has_feature: fs.has_anonymous_feature_for(type)
         end
         if no_dispatch_collect(fs) then
            if smart_eiffel.status.inlining_dynamic_dispatch_done then
               -- No need to collect what's in "when" clauses of "inspect" which are now implementing
               -- dynamic dispatch.
            else
               run_time_set.for_each(agent collect_sub_type(fs, ?))
            end
         end
      ensure
         collected(fs)
      end

feature {}
   collect_sub_type (fs: FEATURE_STAMP; sub_type: LIVE_TYPE)
      require
         valid_stamp: fs /= Void
         valid_sub_type: sub_type /= Void
      local
         is_new: BOOLEAN
      do
         if sub_type /= Current then
            is_new := sub_type.no_dispatch_collect(fs.resolve_static_binding_for(type, sub_type.type))
            -- TODO: lost `is_new', meaningless?
         end
      end

feature {WHEN_CLAUSE}
   forbid_collecting (fs: FEATURE_STAMP)
      do
         if not live_features.fast_has(fs) then
            live_features.fast_put(Void, fs)
         end
      end

   allow_collecting (fs: FEATURE_STAMP)
      do
         if live_features.fast_at(fs) = Void then
            live_features.remove(fs)
         end
      end

feature {ANY}
   collected (fs: FEATURE_STAMP): BOOLEAN
      do
         Result := live_features.fast_has(fs) or else (is_collecting and then new_features.fast_has(fs))
      end

feature {LIVE_TYPE}
   no_dispatch_collect (fs: FEATURE_STAMP): BOOLEAN
         -- Collect `fs' for Current LIVE_TYPE only.
         -- Return `True' if it's a new feature for this LIVE_TYPE.
      require
         valid_stamp: fs /= Void
      local
         af: ANONYMOUS_FEATURE; old_count: INTEGER
      do
         check
            stamp_has_feature: fs.has_anonymous_feature_for(type)
         end
         if not live_features.fast_has(fs) then
            check
               collecting: smart_eiffel.status.is_collecting
            end
            af := fs.anonymous_feature(type)
            if is_collecting then
               old_count := new_features.count
               new_features.fast_put(af, fs)
               Result := new_features.count /= old_count
            else
               live_features.add(af, fs)
               if has_been_collected then
                  af.collect(type)
               end
               Result := True
            end
         end
      ensure
         collected(fs)
      end

feature {ANY}
   precursor_run_feature (ct: CLASS_TEXT; af: ANONYMOUS_FEATURE): RUN_FEATURE
      require
         ct /= Void
         af /= Void
      local
         i: INTEGER; s: STRING; fn: FEATURE_NAME
      do
         if precursor_run_features = Void then
            create precursor_run_features.with_capacity(1)
            create precursor_classes.with_capacity(1)
         end
         from
            i := precursor_run_features.lower
         until
            i > precursor_run_features.upper
               or else (af.feature_text = precursor_run_features.item(i).base_feature.feature_text
                        and then precursor_classes.item(i) = ct)
         loop
            i := i + 1
         end
         if precursor_run_features.valid_index(i) then
            Result := precursor_run_features.item(i)
         else
            s := once ""
            s.copy(once "_P_")
            ct.id.append_in(s)
            s.extend('_')
            af.feature_text.names.first.mapping_c_in(s)
            --|*** bug if there are synonyms
            create fn.unknown_position(string_aliaser.string(s))
            Result := af.brand_new_run_feature_for(type, fn, True)
            precursor_run_features.add_last(Result)
            precursor_classes.add_last(ct)
            --|*** PH: should fn be saved? just use rf.name?
         end
      ensure
         Result /= Void
         Result.base_feature = af --***Not sure it's true. Needed?
      end

feature {TYPE}
   feature_count: INTEGER
      do
         Result := live_features.count
      end

feature {LIVE_TYPE, LIVE_TYPE_VISITOR}
   live_features: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]
         --|*** PH(12/05/04) it's dangerous to keep here the link between FS and AF (if the AF is changed), but it
         --|speed-up search because live_features.has use he hash code.

   precursor_classes: FAST_ARRAY[CLASS_TEXT]

   precursor_run_features: FAST_ARRAY[RUN_FEATURE]

feature {LIVE_TYPE, LIVE_TYPE_VISITOR, C_COMPILATION_MIXIN}
   create_function_list: FAST_ARRAY[FEATURE_STAMP]

feature {}
   is_collecting: BOOLEAN

   has_been_collected: BOOLEAN

   new_features: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]
      require
         is_collecting
      once
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]} Result.with_capacity(50)
      end

   generating_type_level: INTEGER

feature {GENERATOR_GENERATING_TYPE}
   set_generating_type_used
      require
         smart_eiffel.generating_type_used
      do
         generating_type_level := 2
      ensure
         generating_type_used
      end

   set_generator_used
      require
         smart_eiffel.generator_used
      do
         generating_type_level := generating_type_level.max(1)
      ensure
         generator_used
      end

feature {RUN_FEATURE, LIVE_TYPE}
   registered (rf: RUN_FEATURE): BOOLEAN
         -- Assertion purpose only.
      local
         i: INTEGER
      do
         from
            Result := True
            i := live_features.lower
         until
            i > live_features.upper or not Result
         loop
            Result := live_features.key(i).has_run_feature_for(type)
            i := i + 1
         end
      ensure
         Result
      end

feature {}
   smart_eiffel_has_all_run_features: BOOLEAN
         -- Assertion purpose only.
      local
         i: INTEGER
      do
         from
            Result := True
            i := live_features.lower
         until
            i > live_features.upper or else not Result
         loop
            Result := smart_eiffel.registered(live_features.key(i).run_feature_for(type))
            debug
               check
                  Result
               end
            end
            i := i + 1
         end
         if precursor_run_features /= Void then
            from
               i := precursor_run_features.lower
            until
               i > precursor_run_features.upper or else not Result
            loop
               Result := smart_eiffel.registered(precursor_run_features.item(i))
               debug
                  check
                     Result
                  end
               end
               i := i + 1
            end
         end
      ensure
         Result
      end

feature {SMART_EIFFEL} -- Collect:
   forget_previous_collect
         -- This feature allow to forget all previously collected
         -- features, then a new full collect can be done. It's
         -- useful after optimisation has removed some code.
         -- The type is not at_run_time anymore.
      do
         type.forget_previous_collect
         live_features.clear_count
         run_time_set.reset
         at_run_time := False
         create_blank_internals_used := False
         collect_is_deep_equal_status := need_not_collect_status
         --|*** (PH 28/08/04) should writable_attributes_mem be
         --|reset or is it not yet built?
      ensure
         not at_run_time
      end

   propagate_features
         -- This propagates in subtypes alive features detected while previous collect cycle, using
         -- dynamic binding. This means that a newly alive feature will become pending in all sub-types
         -- and then will be collected in the next collect cycle.
      require
         smart_eiffel.status.is_collecting
      local
         i: INTEGER
      do
         --|*** (PH 12/09/04) Propagation order may be improved
         from
            i := 1
         until
            i > run_time_set.count
         loop
            run_time_set.item(i).merge_features_from(Current)
            i := i + 1
         end
         has_been_collected := False
      ensure
         not has_been_collected
      end

   do_collect
         -- Call collect on all alive features.
      require
         not is_collecting
         not has_been_collected
         smart_eiffel.status.is_collecting
      local
         i: INTEGER; fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE; buffer: STRING; dummy: TYPE
      do
         is_collecting := True
         check
            new_features.is_empty
         end
         if at_run_time and then not create_blank_internals_used then
            create_blank_internals_used := introspection_handler.create_blank_internals_used_by(Current)
            if create_blank_internals_used and then create_blank_internals_instruction = Void then
               create_blank_internals_instruction :=
                  introspection_handler.create_blank_internals_instruction_for(Current)
            end
         end
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            debug
               buffer := "Collecting feature "
               buffer.append(name.to_string)
               buffer.extend('.')
               type.get_feature_name(live_features.key(i)).complete_name_in(buffer)
               buffer.extend('%N')
               echo.put_string(buffer)
            end
            live_features.item(i).collect(type)
            i := i + 1
         end

         if class_text.invariant_check and then class_invariant /= Void then
            dummy := class_invariant.collect(type)
         end
         if default_create_stamp = Void and then is_user_expanded then
            debug
               echo.put_string(once "Computing default_create for  ")
               echo.put_string(name.to_string)
               echo.put_new_line
            end
            default_create_stamp := type.expanded_default_create_stamp
         end
         if default_create_stamp /= Void then
            collect(default_create_stamp)
         end

         live_type_extra_collectors.for_each(agent {LIVE_TYPE_EXTRA_COLLECTOR}.collect(Current))

         from
         until
            new_features.is_empty
         loop
            af := new_features.item(new_features.upper)
            fs := new_features.key(new_features.upper)
            new_features.fast_remove(fs)
            live_features.add(af, fs)
            af.collect(type)
         end
         is_collecting := False
         has_been_collected := True
      ensure
         not is_collecting
         has_been_collected
      end

feature {SMART_EIFFEL}
   inline_dynamic_dispatch (code_accumulator: CODE_ACCUMULATOR)
         -- Note: precursor anonymous features are inlined directly by PRECURSOR_CALLs.
      require
         smart_eiffel.status.collecting_done
         smart_eiffel.status.is_inlining_dynamic_dispatch
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; key: FEATURE_STAMP
      do
         -- "Normal" features:
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            af := live_features.item(i).twin
            key := live_features.key(i)
            af.inline_dynamic_dispatch(code_accumulator, type)
            live_features.fast_put(af, key)
            key.update_anonymous_feature(type, af)
            i := i + 1
         end
         type.inline_dynamic_dispatch_for_class_invariant(code_accumulator)
      end

   make_run_features
         -- Actually adapting.
      require
         smart_eiffel.status.is_adapting
      local
         i: INTEGER; fn: FEATURE_NAME; fs: FEATURE_STAMP
      do
         check
            not_done: not live_features.is_empty implies not live_features.key(1).has_run_feature_for(type)
         end
         -- "Normal" features:
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            fs := live_features.key(i)
            fn := type.get_feature_name(fs)
            check
               not fs.has_run_feature_for(type)
            end
            fs.make_run_feature(type, fn)
            check
               smart_eiffel.registered(at(fn))
            end
            i := i + 1
         end
      ensure
         smart_eiffel_has_all_run_features
      end

   adapt_run_features_and_class_invariant
      require
         smart_eiffel.status.is_adapting
      local
         i, n: INTEGER; rf: RUN_FEATURE
      do
         class_text.obsolete_warning_check(canonical_type_mark.start_position)
         if precursor_run_features = Void then
            n := live_features.count
         else
            n := live_features.count + precursor_run_features.count
         end
         echo.put_string(once "Adapting ")
         echo.put_integer(n)
         echo.put_string(once " feature")
         if n > 1 then
            echo.put_character('s')
         end
         echo.put_string(once " from ")
         echo.put_string(canonical_type_mark.written_mark)
         echo.put_string(once " (magic count = ")
         echo.put_integer(smart_eiffel.magic_count)
         echo.put_string(once ")%N")
         from
            i := live_features.lower
         variant
            live_features.count - i -- live_features.count has to be constant.
         until
            i > live_features.upper
         loop
            debug
               echo.put_string(once "    ")
               echo.put_line(live_features.key(i).name.to_string)
            end
            rf := live_features.key(i).run_feature_for(type)
            check
               rf.type_of_current.live_type = Current
               rf.type_of_current = type -- just another way to assess the same thing
            end
            rf.adapt
            i := i + 1
         end
         if precursor_run_features /= Void then
            from
               -- Loop this way because new precursor may be created
               -- while adapting.
               i := precursor_run_features.lower
            until
               i > precursor_run_features.upper
            loop
               rf := precursor_run_features.item(i)
               check
                  rf.type_of_current.live_type = Current
                  rf.type_of_current = type -- just another way to assess the same thing
               end
               rf.adapt
               i := i + 1
            end
         end
         type.adapt_class_invariant
      end

feature {LIVE_TYPE}
   merge_features_from (lt: LIVE_TYPE)
      local
         i: INTEGER; list: like live_features; other_fs: FEATURE_STAMP; af: ANONYMOUS_FEATURE
         parent_type: TYPE
      do
         parent_type := lt.type
         from
            list := lt.live_features
            i := list.lower
         until
            i > list.upper
         loop
            other_fs := list.key(i).resolve_static_binding_for(parent_type, type)
            af := other_fs.anonymous_feature(type)
            live_features.fast_put(af, other_fs)
            i := i + 1
         end
      end

feature {}
   tagged_memory: INTEGER
         -- 0 when not computed, 1 when tagged or -1 when not tagged.

   make (t: like type)
         -- Where `t' is the associated `type'.
      require
         smart_eiffel.status.is_analyzing
         t /= Void
      local
         i: INTEGER; gl: ARRAY[TYPE]
      do
         create {HASHED_DICTIONARY[ANONYMOUS_FEATURE, FEATURE_STAMP]} live_features.with_capacity(50)
         canonical_type_mark := t.canonical_type_mark
         type := t
         name := t.name
         check
            name = canonical_type_mark.written_name
         end
         hash_code := t.name.hash_code
         class_text := t.class_text
         class_text_name := class_text.name
         t.set_live_type(Current)
         smart_eiffel.register_live_type(Current)
         create actual_clients_.with_capacity(16)
         id := id_provider.item(t.name, class_text.cluster)
         create run_time_set.make(Current)
         to_internals_stamp := type.feature_stamp_of(string_aliaser.hashed_string(as_to_internals))
         if t.is_generic then
            from
               gl := t.generic_list
               i := gl.lower
            until
               i > gl.upper
            loop
               -- Force live_types creation for each generic type
               smart_eiffel.collect_generic(gl.item(i))
               i := i + 1
            end
         end
      end

feature {ANY}
   is_tagged: BOOLEAN
         -- Is it a tagged one? In other words, is the `id' field part of the object at run time?
      require
         smart_eiffel.is_ready
      do
         if tagged_memory = 0 then
            if is_expanded then
               tagged_memory := -1
            elseif at_run_time then
               if ace.boost then
                  if smart_eiffel.is_tagged(Current) then
                     tagged_memory := 1
                  else
                     tagged_memory := -1
                  end
               else
                  tagged_memory := 1
               end
            else
               tagged_memory := -1
            end
         end
         Result := tagged_memory = 1
      ensure
         tagged_memory /= 0
         Result implies at_run_time
         Result implies not canonical_type_mark.is_expanded
      end

   is_expanded: BOOLEAN
      do
         Result := type.is_expanded
      end

   is_user_expanded: BOOLEAN
      do
         Result := type.is_user_expanded
      end

   is_empty_expanded: BOOLEAN
      require
         is_user_expanded
         smart_eiffel.status.collecting_done
      local
         i: INTEGER; wa: WRITABLE_ATTRIBUTE
      do
         if writable_attributes_mem /= Void then
            Result := True
            from
               i := writable_attributes_mem.lower
            until
               i > writable_attributes_mem.upper or else not Result
            loop
               Result := writable_attributes_mem.item(i).result_type.is_empty_expanded
               i := i + 1
            end
         elseif type.has_external_type then
            Result := False
         else
            Result := True
            from
               i := live_features.lower
            until
               i > live_features.upper or else not Result
            loop
               check
                  live_features.item(i) /= Void
               end
               if wa ?:= live_features.item(i) then
                  wa ::= live_features.item(i)
                  Result := wa.result_type.is_empty_expanded
               end
               i := i + 1
            end
         end
      end

feature {ANY}
   writable_attributes: ARRAY[RUN_FEATURE_2]
         -- Computed and ordered array of writable attributes. Storage in C
         -- struct is to be done in reverse order (from `upper' to `lower').
         -- Order is done according to the level of attribute definition in
         -- the inheritance graph to allow more stupid switch to be removed.
      require
         smart_eiffel.status.collecting_done
         at_run_time
      local
         fs: FEATURE_STAMP
         rf: RUN_FEATURE; rf2: RUN_FEATURE_2; i: INTEGER
      do
         Result := writable_attributes_mem
         if Result = Void then
            from
               i := live_features.lower
            until
               i > live_features.upper
            loop
               fs := live_features.key(i)
               if fs.has_run_feature_for(type) then
                  rf := fs.run_feature_for(type)
                  if rf2 ?:= rf then
                     rf2 ::= rf
                     if Result = Void then
                        create Result.with_capacity(4, 1)
                        writable_attributes_mem := Result
                     end
                     Result.add_last(rf2)
                  end
               end
               i := i + 1
            end
            if Result /= Void then
               sort_wam(Result)
            end
         end
      ensure
         Result /= Void implies not Result.is_empty
      end

feature {ANY}
   dynamic_feature (up_rf: RUN_FEATURE): RUN_FEATURE
         -- Look for the specialized version of `up_rf' in `Current' type. Assume the `Current' type is a kind of
         -- `up_rf'. The result is the specialized one according to dynamic dispatch rules.
      require
         up_rf.type_of_current.live_type.run_time_set.has(Current) or else up_rf.feature_stamp.has_run_feature_for(type)
      local
         fs: FEATURE_STAMP
      do
         fs := up_rf.feature_stamp.resolve_static_binding_for(up_rf.type_of_current, type)
         Result := fs.run_feature_for(type)
      ensure
         Result.type_of_current.live_type = Current
      end

feature {ANY}
   default_create_stamp: FEATURE_STAMP
         -- If any, the one to be used while creating an object. Actually, this is mostly used
         -- to memorize the default creation procedure to initialize user's expanded types.
         -- (See also `default_create_run_feature'.)

   default_create_run_feature: RUN_FEATURE_3
         -- If any, the corresponding one for `default_create_stamp'.
      do
         if default_create_stamp /= Void then
            if default_create_run_feature_memory = Void then
               default_create_run_feature_memory ::= default_create_stamp.run_feature_for(type)
            end
            if not default_create_run_feature_memory.side_effect_free then
               -- The `default_create_run_feature_memory' is actually doing something.
               Result := default_create_run_feature_memory
            end
         end
      end

feature {LOCAL_VAR_LIST, LOCAL_NAME_DEF}
   side_effect_free_default_create: BOOLEAN
      require
         smart_eiffel.status.collecting_done
         is_user_expanded
      local
         af: ANONYMOUS_FEATURE; e_procedure: E_PROCEDURE
      do
         af := default_create_stamp.anonymous_feature(type)
         e_procedure ?= af
         check
            e_procedure.arguments = Void
            e_procedure.routine_then = Void
         end
         if e_procedure.routine_body = Void then
            Result := e_procedure.local_vars = Void
         end
         --*** (PH 18/08/2008) Should really ensure and rescue part
         --be ignored? compilation mode?
      end

feature {SMART_EIFFEL}
   set_at_run_time
         -- Set Current `at_run_time' and do needed update of other instances of LIVE_TYPE.
      require
         smart_eiffel.status.is_collecting
         not at_run_time
         class_text.name.to_string = as_typed_internals
            implies not type.generic_list.first.is_deferred
      local
         fs: FEATURE_STAMP
      do
         at_run_time := True
         fs := smart_eiffel.memory_dispose_stamp
         if fs.has_anonymous_feature_for(type) then
            memory_dispose_stamp := fs
            collect(memory_dispose_stamp)
         end
         run_time_set.force_add(Current)
         if (name.to_string.is_equal(once "STD_OUTPUT") or else name.to_string.is_equal(once "AT_EXIT")) and then smart_eiffel.se_atexit_stamp = Void then
            smart_eiffel.collect_se_atexit(type)
         end
         smart_eiffel.magic_count_increment
         debug
            echo.put_string(once "Type ")
            echo.put_string(type.name.to_string)
            echo.put_string(once " is alive.%N")
         end
      ensure
         at_run_time
         run_time_set.has(Current)
      end

   safety_check
      require
         for_boost_mode_only_or_asked_for: ace.boost or else ace.safety_check
      local
         rf: RUN_FEATURE; i: INTEGER; rb: INSTRUCTION
      do
         from
            i := live_features.lower
         until
            i > live_features.upper
         loop
            rf := live_features.key(i).run_feature_for(type)
            rb := rf.routine_body
            if rb /= Void then
               rb.safety_check(type)
            end
            i := i + 1
         end
         --|*** PH: loop on precursors?
      end

   simplify
         -- Note: precursor anonymous features are simplified directly by PRECURSOR_CALLs.
      require
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.status.collecting_done
         ace.boost1 or ace.boost2
      local
         i, live_features_count: INTEGER; af1, af2: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         live_features_count := live_features.count
         from
            i := live_features.lower
         invariant
            live_features.count = live_features_count
         variant
            live_features_count - i
         until
            i > live_features.upper
         loop
            af1 := live_features.item(i)
            fs := live_features.key(i)
            af2 := fs.simplify(type)
            check
               af2 /= Void
            end
            if af1 /= af2 then
               live_features.fast_put(af2, fs)
               smart_eiffel.magic_count_increment
            end
            i := i + 1
         end
         if type.class_text.name.to_string = as_thread_context then
            thread_pool.simplify(type)
         end
      end

   contextual_simplify
      require
         not smart_eiffel.pretty_flag
         not smart_eiffel.short_or_class_check_flag
         smart_eiffel.is_ready
         smart_eiffel.status.collecting_done
         ace.boost3
      local
         i, live_features_count: INTEGER; af1, af2: ANONYMOUS_FEATURE; fs: FEATURE_STAMP
      do
         live_features_count := live_features.count
         from
            i := live_features.lower
         invariant
            live_features.count = live_features_count
         variant
            live_features.count - i
         until
            i > live_features.upper
         loop
            af1 := live_features.item(i)
            fs := live_features.key(i)
            af2 := fs.contextual_simplify(type)
            if af1 /= af2 then
               live_features.fast_put(af2, fs)
               smart_eiffel.magic_count_increment
            end
            i := i + 1
         end
      end

feature {}
   memory_dispose_stamp: FEATURE_STAMP
         -- Non Void when feature `dispose' has been collected.

feature {MEMORY_HANDLER}
   get_memory_dispose: RUN_FEATURE_3
      do
         if memory_dispose_stamp /= Void then
            if memory_dispose_stamp.has_run_feature_for(type) then
               Result ?= memory_dispose_stamp.run_feature_for(type)
               Result := Result.memory_dispose
            end
         end
      end

feature {TYPE_MARK}
   weak_ref_attributes: FAST_ARRAY[RUN_FEATURE_2]
         -- Attributes of type WEAK_REFERENCE[...].
         -- Void if none found.
         -- XXX OZ+FM: useful if expanded WEAK_REFERENCEs are possible
         -- (not the case now 2003/07/18; to be removed ?)
      local
         rf2: RUN_FEATURE_2; tm: TYPE_MARK; i: INTEGER
      do
         if writable_attributes /= Void then
            from
               i := writable_attributes.lower
            until
               i > writable_attributes.upper
            loop
               rf2 := writable_attributes.item(i)
               tm := rf2.result_type
               if as_weak_reference = tm.class_text_name.to_string then
                  create Result.with_capacity(writable_attributes.upper - i + 1)
                  check
                     tm.is_expanded
                  end
                  Result.add_last(rf2)
                  from
                     i := i + 1
                  until
                     i > writable_attributes.upper
                  loop
                     rf2 := writable_attributes.item(i)
                     tm := rf2.result_type
                     if as_weak_reference = tm.class_text_name.to_string then
                        check
                           tm.is_expanded
                        end
                        Result.add_last(rf2)
                     end
                     i := i + 1
                  end
               else
                  i := i + 1
               end
            end
         end
      end

feature {SMART_EIFFEL}
   at (fn: FEATURE_NAME): RUN_FEATURE
      require
         type.valid_feature_name(fn)
      do
         Result := type.lookup(fn).run_feature_for(type)
      end

feature {ANY}
   copy_stamp: FEATURE_STAMP
         -- The one of the `copy' feature (which is magically called inside `twin').
      do
         Result := type.copy_stamp
      ensure
         Result /= Void
      end

   copy_run_feature: RUN_FEATURE
         -- The corresponding one for `copy_stamp'.
      do
         Result := copy_stamp.run_feature_for(type)
      ensure
         Result /= Void
      end

feature {SMART_EIFFEL}
   id_extra_information (tfw: TEXT_FILE_WRITE)
      local
         ct: TYPE_MARK
      do
         ct := canonical_type_mark
         tfw.put_string(once "c-type: T")
         tfw.put_integer(id)
         tfw.put_character(' ')
         ct.id_extra_information(tfw)
         if ct.is_reference then
            tfw.put_string(once "ref-status: ")
            if at_run_time then
               tfw.put_string(once "live id-field: ")
               if ct.is_reference and then not is_tagged then
                  tfw.put_string(once "no ")
               else
                  tfw.put_string(once "yes ")
               end
            else
               tfw.put_string(once "dead ")
            end
            tfw.put_new_line
         end
         assignment_handler.id_extra_information(tfw, Current)
         run_time_set.id_extra_information(tfw)
      end

feature {C_LIVE_TYPE_COMPILER}
   actual_clients: TRAVERSABLE[LIVE_TYPE]
      do
         Result := actual_clients_
      end

feature {}
   actual_clients_: HASHED_SET[LIVE_TYPE]

feature {RUN_FEATURE}
   add_client (lt: LIVE_TYPE)
      require
         lt /= Void
      do
         actual_clients_.fast_add(lt)
      end

feature {ANY}
   structure_signature: STRING --| **** TODO remove and use the generation/c cluster's tag "c_struct_signature" instead
         -- Terse description of the C struct. Used for recompilation comments.
      require
         at_run_time
         smart_eiffel.is_ready
      local
         wa: like writable_attributes; i, ref_count: INTEGER; lt: LIVE_TYPE; ketm: KERNEL_EXPANDED_TYPE_MARK
      do
         Result := structure_signature_memory
         if Result = Void then
            create Result.make_empty
            structure_signature_memory := Result
            debug
               Result.extend('{')
               id.append_in(Result)
               Result.extend(':')
               Result.append(canonical_type_mark.written_mark)
               Result.extend(':')
            end
            if canonical_type_mark.is_kernel_expanded then
               ketm ::= canonical_type_mark
               Result.extend(ketm.structure_mark)
            elseif is_native_array then
               Result.extend('n')
            elseif canonical_type_mark.is_agent then
               Result.extend('a')
            elseif writable_attributes = Void then
               Result.extend('0')
            else
               if is_tagged then
                  Result.extend('T')
               end
               from
                  wa := writable_attributes
                  i := wa.lower
               until
                  i > wa.upper
               loop
                  lt := smart_eiffel.get_type(wa.item(i).result_type, False).live_type
                  if lt = Void then
                     -- ignored: not a live type
                  elseif lt.is_reference then
                     debug
                        Result.append(lt.canonical_type_mark.written_mark)
                        Result.extend('|')
                     end
                     ref_count := ref_count + 1
                  else
                     if ref_count = 1 then
                        Result.extend('p')
                     elseif ref_count > 0 then
                        ref_count.append_in(Result)
                        Result.extend('p')
                     end
                     ref_count := 0
                     debug
                        Result.append(lt.canonical_type_mark.written_mark)
                        Result.extend('|')
                     end
                     Result.append(lt.structure_signature)
                  end
                  i := i + 1
               end
               if ref_count = 1 then
                  Result.extend('p')
               elseif ref_count > 0 then
                  ref_count.append_in(Result)
                  Result.extend('p')
               end
            end
            debug
               Result.extend('}')
            end
         end
      end

feature {}
   structure_signature_memory: STRING

feature {LIVE_TYPE, EXTERNAL_FUNCTION}
   collect_deep_twin
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; wa: WRITABLE_ATTRIBUTE; lt: LIVE_TYPE
      do
         if not collecting_deep_twin then
            collecting_deep_twin := True
            smart_eiffel.set_deep_twin_used
            if as_native_array = class_text.name.to_string then
               collect(type.feature_stamp_of(deep_twin_from_name))
               type.generic_list.first.live_type.collect_deep_twin
            else
               collect(any_deep_twin_fs.resolve_static_binding_for(smart_eiffel.type_any, type))
               from
                  i := live_features.lower
               until
                  i > live_features.upper
               loop
                  af := live_features.item(i)
                  if wa ?:= af then
                     wa ::= af
                     lt := wa.result_type.resolve_in(type).live_type
                     if lt /= Void then
                        lt.collect_deep_twin
                     end
                  end
                  i := i + 1
               end
            end
            collecting_deep_twin := False
         end
      end

feature {}
   collecting_deep_twin: BOOLEAN

feature {EXTERNAL_FUNCTION, LIVE_TYPE}
   collect_is_deep_equal
      do
         if collect_is_deep_equal_status = need_not_collect_status then
            collect_is_deep_equal_status := must_collect_status
            smart_eiffel.set_deep_twin_used
         end
      end

feature {SMART_EIFFEL, LIVE_TYPE}
   do_collect_is_deep_equal
      local
         i: INTEGER; af: ANONYMOUS_FEATURE; wa: WRITABLE_ATTRIBUTE; lt: LIVE_TYPE
      do
         if collect_is_deep_equal_status = must_collect_status then
            collect_is_deep_equal_status := already_collected_status
            if as_native_array = class_text.name.to_string then
               collect(type.feature_stamp_of(deep_memcmp_name))
               lt := type.generic_list.first.live_type
               lt.collect_is_deep_equal
               lt.do_collect_is_deep_equal
            else
               collect(any_is_deep_equal_fs.resolve_static_binding_for(smart_eiffel.type_any, type))
               from
                  i := live_features.lower
               until
                  i > live_features.upper
               loop
                  af := live_features.item(i)
                  if wa ?:= af then
                     wa ::= af
                     lt := wa.result_type.resolve_in(type).live_type
                     if lt /= Void then
                        lt.collect_is_deep_equal
                        lt.do_collect_is_deep_equal
                     end
                  end
                  i := i + 1
               end
            end
         end
      end

feature {}
   collect_is_deep_equal_status: INTEGER_8

   need_not_collect_status: INTEGER_8 0

   must_collect_status: INTEGER_8 1

   already_collected_status: INTEGER_8 2

feature {CREATE_EXPRESSION}
   create_function_register (fs: FEATURE_STAMP)
         -- Register that there is a live create expression which creates `Current' type objects at
         -- run-time using `fs' as the creation procedure. Also not that `fs' can be Void in the case of
         -- a create expression with no call.
      require
         smart_eiffel.status.is_adapting
      do
         if fs = Void then
            create_function_list := empty_create_function_list
         else
            if create_function_list = Void then
               create create_function_list.with_capacity(2)
            end
            check
               create_function_list /= empty_create_function_list
            end
            if not create_function_list.fast_has(fs) then
               create_function_list.add_last(fs)
            end
         end
      end

feature {}
   empty_create_function_list: FAST_ARRAY[FEATURE_STAMP]
      once
         create Result.make(0)
      end

feature {INTROSPECTION_HANDLER}
   create_blank_internals_instruction: CREATE_INSTRUCTION

   create_blank_internals_used: BOOLEAN

   to_internals_stamp: FEATURE_STAMP

feature {}
   default_create_run_feature_memory: like default_create_run_feature
         -- To cache `default_create_run_feature' computation.

   tmp_string: STRING
      once
         create Result.make(32)
      end

   c_code_buffer: STRING
      once
         create Result.make(256)
      end

   sort_wam (wam: like writable_attributes)
         -- Sort `wam' to common attribute at the end.
      require
         wam.lower = 1
      local
         min_sort, max_sort, bubble: INTEGER; moved: BOOLEAN
      do
         from
            max_sort := wam.upper
            min_sort := 1
            moved := True
         until
            not moved
         loop
            moved := False
            if max_sort - min_sort > 0 then
               from
                  bubble := min_sort + 1
               until
                  bubble > max_sort
               loop
                  if gt(wam.item(bubble - 1), wam.item(bubble)) then
                     wam.swap(bubble - 1, bubble)
                     moved := True
                  end
                  bubble := bubble + 1
               end
               max_sort := max_sort - 1
            end
            if moved and then max_sort - min_sort > 0 then
               from
                  moved := False
                  bubble := max_sort - 1
               until
                  bubble < min_sort
               loop
                  if gt(wam.item(bubble), wam.item(bubble + 1)) then
                     wam.swap(bubble, bubble + 1)
                     moved := True
                  end
                  bubble := bubble - 1
               end
               min_sort := min_sort + 1
            end
         end
      end

   gt (rf1, rf2: RUN_FEATURE_2): BOOLEAN
         -- True if it is better to set attribute `rf1' before attribute `rf2'.
      local
         bc1, bc2: CLASS_TEXT; bf1, bf2: ANONYMOUS_FEATURE; bcn1, bcn2: CLASS_NAME
      do
         if rf1.order /= rf2.order then
            Result := rf1.order < rf2.order
         else
            bf1 := rf1.base_feature
            bf2 := rf2.base_feature
            bc1 := bf1.class_text
            bc2 := bf2.class_text
            bcn1 := bc1.name
            bcn2 := bc2.name
            if bcn1.to_string = bcn2.to_string then
               Result := bf1.start_position.before(bf2.start_position)
            elseif bcn2.get_export_permission_of(bcn1) then
               Result := True
            elseif bcn1.get_export_permission_of(bcn2) then
               check
                  not Result
               end
            elseif bc1.parent_lists = Void then
               if bc2.parent_lists = Void then
                  Result := bcn1.to_string < bcn2.to_string
               else
                  Result := True
               end
            elseif bc2.parent_lists = Void then
            else
               Result := bc2.parent_lists.inherit_count < bc1.parent_lists.inherit_count
            end
         end
      end

   writable_attributes_mem: like writable_attributes

   unqualified_name_memory: STRING
      once
         create Result.make(32)
      end

   fully_qualified_name_memory: STRING

   fully_qualified_name_memory2: STRING
      once
         create Result.make(256)
      end

invariant
   name /= Void

   type.live_type = Current
   class_text = type.class_text
   canonical_type_mark.is_static

   precursor_run_features = Void = (precursor_classes = Void)
   precursor_run_features /= Void implies precursor_run_features.count = precursor_classes.count
   precursor_run_features /= Void implies not precursor_run_features.is_empty

   run_time_set.owner = Current
   run_time_set.is_empty or else (at_run_time and then run_time_set.has(Current))

end -- class LIVE_TYPE
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
