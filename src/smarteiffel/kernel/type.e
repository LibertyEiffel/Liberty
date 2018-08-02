-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class TYPE
   --
   -- For all kinds of TYPEs even when they are not actually created (see also LIVE_TYPE).
   --

inherit
   LOADED_HIERARCHIC_GRAPH_NODE[TYPE, PARENT_EDGE]
      rename make as node_init
      redefine hash_code, add_parent
      end
   VISITABLE

insert
   GLOBALS

create {SMART_EIFFEL}
   make

feature {}
   make (ctm: like canonical_type_mark; allow_raw_class_name: BOOLEAN)
      require
         smart_eiffel.status.is_collecting
         ctm.is_static
      local
         parent_lists: PARENT_LISTS; a_parent_edge: PARENT_EDGE; parent_tm: TYPE_MARK; i: INTEGER
         gl: ARRAY[TYPE_MARK]; generic_type: TYPE; weak_reference_type_mark: WEAK_REFERENCE_TYPE_MARK
         first_inherit_index: INTEGER
      do
         hash_code := ctm.written_name.hash_code
         debug
            debug_info := ctm.written_mark.twin
         end
         create insert_inherit_test_memory_cache.with_capacity(1024)
         node_init(Current)
         class_text := ctm.class_text
         external_type := class_text.external_type
         is_deferred := class_text.is_deferred
         name := ctm.written_name
         canonical_type_mark := ctm
         if ctm.is_generic then
            from
               gl := canonical_type_mark.generic_list
               create private_generic_list.with_capacity(gl.count, 1)
               i := gl.lower
            until
               i > gl.upper
            loop
               private_generic_list.add_last(gl.item(i).type)
               i := i + 1
            end
            if ctm.is_agent and then not ctm.generic_list.first.is_tuple then
               error_handler.add_position(ctm.start_position)
               error_handler.add_position(ctm.generic_list.first.start_position)
               error_handler.append(once "TUPLE type expected for open arguments of agent type.")
               error_handler.print_as_error
            end
         end
         if allow_raw_class_name and then gl = Void then
            gl := class_text.constraints_generic_list
         else
            class_text.formal_generic_list_count_check(canonical_type_mark.start_position, gl)
         end
         smart_eiffel.register_type(Current)
         feature_accumulator.new_incomplete_type
         parent_lists := canonical_type_mark.class_text.parent_lists
         if parent_lists = Void then
            check
               canonical_type_mark.written_mark = as_any
            end
            -- The inherit link to ANY is automatically added by the `eiffel_parser' even when nothing
            -- is written in the original source file. To avoid cycles, ANY is not modified (ANY must
            -- not have an `parent_lists').
         else
            check -- See above, in the "then" part.
               canonical_type_mark.written_mark /= as_any
            end
            -- Parent list is build in reverse order (non conforming first)
            if parent_lists.insert_list /= Void then
               from
                  i := parent_lists.insert_list.lower
               until
                  i > parent_lists.insert_list.upper
               loop
                  a_parent_edge := parent_lists.insert_list.item(i)
                  --        parent_tm := a_parent_edge.type_mark.resolve_in(Current).canonical_type_mark
                  parent_tm := a_parent_edge.type_mark
                  parent_tm.specialize_in(Current)
                  parent_tm := parent_tm.to_static(Current, allow_raw_class_name)
                  check
                     parent_tm.is_static
                  end
                  add_parent(parent_tm.type)
                  parents_edge_load.put(a_parent_edge, parents_edge_load.upper)
                  --|*** attention: info non posee sur edge reverse
                  i := i + 1
               end
            end
            first_inherit_index := parents.upper + 1
            if parent_lists.inherit_list /= Void then
               from
                  i := parent_lists.inherit_list.lower
               until
                  parent_lists.inherit_list = Void or else i > parent_lists.inherit_list.upper
               loop
                  a_parent_edge := parent_lists.inherit_list.item(i)
                  --        parent_tm := a_parent_edge.type_mark.resolve_in(Current).canonical_type_mark
                  parent_tm := a_parent_edge.type_mark
                  parent_tm.specialize_in(Current)
                  parent_tm := parent_tm.to_static(Current, allow_raw_class_name)
                  check
                     parent_tm.is_static
                  end
                  add_parent(parent_tm.type)
                  parents_edge_load.put(a_parent_edge, parents_edge_load.upper)
                  --|*** attention: info non posee sur edge reverse

                  if parent_tm.is_expanded then
                     error_handler.append(once "Expanded classes can be inserted only.")
                     error_handler.add_position(a_parent_edge.start_position)
                     error_handler.print_as_error
                     if parents_edge.upper /= first_inherit_index then
                        parents_edge.swap(parents_edge.upper, first_inherit_index)
                        parents_edge_load.swap(parents_edge_load.upper, first_inherit_index)
                     end
                     first_inherit_index := first_inherit_index + 1
                     parent_lists.set_insert_member(i) -- this changes the `inherit_list', we must not increment `i' otherwise we miss some
                  else
                     i := i + 1
                  end
               end
            end
         end
         if is_generic then
            -- The declaration_type is a parent for the current type, but as there is no inherit
            -- clause for it we force its creation before current type:
            generic_type := ctm.class_text.declaration_type_of_like_current

            -- Performs some extra checks only for the `canonical_type_mark' (i.e. made only once):
            if weak_reference_type_mark ?:= canonical_type_mark then
               weak_reference_type_mark ::= canonical_type_mark
               weak_reference_type_mark.special_weak_reference_extra_check
            end
         end
         feature_accumulator.register(Current)
         class_text.obsolete_warning_check(ctm.start_position)
      ensure
         canonical_type_mark = ctm
         class_text = ctm.class_text
         name = ctm.written_name
         ctm.is_generic implies is_generic
         --Invariant:
         class_text = canonical_type_mark.class_text
         canonical_type_mark.is_static
      end

feature {ANY}
   inherits_from (other: TYPE): BOOLEAN
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      do
         Result := insert_inherit_test(other) = inherits_code
      ensure
         definition: Result = (insert_inherit_test(other) = inherits_code)
         not_done_to_report_errors: error_handler.is_empty
      end

   inserts (other: TYPE): BOOLEAN
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      do
         Result := insert_inherit_test(other) = inserts_code
      ensure
         definition: Result = (insert_inherit_test(other) = inserts_code)
         not_done_to_report_errors: error_handler.is_empty
      end

   insert_inherit_test (other: TYPE): INTEGER_8
         -- Simple predicate (i.e. does not fill the `error_handler').
         -- See also xxx yyy which are supposed to be able to explain the problem.
      require
         other /= Void
         avoid_obvious_questions: other /= Current
         not_done_to_report_errors: error_handler.is_empty
      local
         i: INTEGER; code: INTEGER_8 type, g1, g2: TYPE; a_parent_edge: PARENT_EDGE
         open_argument, other_open_argument: TYPE
      do
         check
            Result = unrelated_code
            unrelated_code < inserts_code
            inserts_code < inherits_code
         end
         if insert_inherit_test_memory_cache.fast_has(other) then
            Result := insert_inherit_test_memory_cache.fast_at(other)
         else
            if class_text = other.class_text then
               check
                  is_generic and then other.is_generic
               end
               if is_agent then
                  open_argument := private_generic_list.first
                  check
                     open_argument.is_tuple
                  end
                  other_open_argument := other.private_generic_list.first
                  check
                     other_open_argument.is_tuple
                  end
                  if other_open_argument = open_argument then
                     Result := inherits_code
                  else
                     Result := other_open_argument.insert_inherit_test(open_argument)
                  end
                  if agent_result /= Void and then agent_result /= other.agent_result then
                     Result := Result.min(agent_result.insert_inherit_test(other.agent_result))
                  end
               else
                  from
                     if is_expanded then
                        Result := inserts_code
                     else
                        Result := inherits_code
                     end
                     i := private_generic_list.lower
                  until
                     Result = unrelated_code or else i > private_generic_list.upper
                  loop
                     g1 := private_generic_list.item(i)
                     g2 := other.private_generic_list.item(i)
                     if g1 /= g2 then
                        Result := Result.min(g1.insert_inherit_test(g2))
                     end
                     i := i + 1
                  end
               end
            else
               -- First, we look only inherit links:
               from
                  i := 1
               until
                  (Result = inherits_code) or else i > parents_count
               loop
                  a_parent_edge := parent_edge_load(i)
                  if a_parent_edge.is_inherit_member then
                     type := a_parent_edge.type_mark.resolve_in(Current)
                     if other = type then
                        Result := inherits_code
                     else
                        code := type.insert_inherit_test(other)
                        if code /= unrelated_code then
                           Result := code
                        end
                     end
                  end
                  i := i + 1
               end
               if Result = unrelated_code then
                  -- Second, we try now only insert links:
                  from
                     i := 1
                  until
                     (Result /= unrelated_code) or else i > parents_count
                  loop
                     a_parent_edge := parent_edge_load(i)
                     if a_parent_edge.is_insert_member then
                        type := a_parent_edge.type_mark.resolve_in(Current)
                        if other = type then
                           Result := inserts_code
                        else
                           Result := type.insert_inherit_test(other)
                           if Result /= unrelated_code then
                              Result := inserts_code
                           end
                        end
                     end
                     i := i + 1
                  end
               end
            end
            insert_inherit_test_memory_cache.add(Result, other)
         end
      ensure
         (Result = unrelated_code) xor (Result = inserts_code) xor (Result = inherits_code)
         not_done_to_report_errors: error_handler.is_empty
      end

feature {SMART_EIFFEL, TYPE}
   closest_to_constraint (constraint: TYPE): TYPE
         -- Find some type this one conforms to, on the inheritance link up to the constraint. If there
         -- more than one possibility, the choice should not matter.
         --
         -- Used to implement type lookup when shrinking the generic types space.
      require
         not_obvious: constraint /= Current and then not Current.inherits_from(constraint)
      local
         i: INTEGER; type, insert_type: TYPE
         a_parent_edge: PARENT_EDGE
      do
         from
            Result := Current
            i := 1
         until
            Result /= Current or else i > parents_count
         loop
            a_parent_edge := parent_edge_load(i)
            if a_parent_edge.is_inherit_member then
               type := a_parent_edge.type_mark.resolve_in(Current)
               if type = constraint then
                  Result := type
               else
                  inspect
                     type.insert_inherit_test(constraint)
                  when inherits_code then
                     Result := type.closest_to_constraint(constraint)
                  when inserts_code then
                     insert_type := type
                  else
                  end
               end
            end
            i := i + 1
         end
         if Result = Current and then insert_type /= Void then
            Result := insert_type
         end
      ensure
         Result /= Void
         Result = Current xor Current.inherits_from(Result)
         Result.inserts(constraint)
      end

feature {OLD_MANIFEST_ARRAY, IFTHENELSE_EXP}
   has_only_one_conformant_parent: like Current
         -- The `Result' is non Void if and only if `Current' has only one conforming parent.
         -- When `Result' is not Void `Result' is the unique parent of `Current'.
      do
         if parents.count = 1 then
            Result := parents.first
            if not Current.can_be_assigned_to(Result) then
               Result := Void
            end
         end
      ensure
         Result /= Void implies Result /= Current
      end

feature {EFFECTIVE_ROUTINE}
   collect_default_rescue (caller: ANONYMOUS_FEATURE)
      require
         smart_eiffel.status.is_collecting
      local
         fs_current: FEATURE_STAMP; af_any, af_current: ANONYMOUS_FEATURE
         effective_routine: EFFECTIVE_ROUTINE; ta: TYPE
      do
         if not default_rescue_collected then
            ta := smart_eiffel.type_any
            if Current /= ta then
               af_any := any_default_rescue_fs.anonymous_feature(ta)
               fs_current := any_default_rescue_fs.resolve_static_binding_for(ta, Current)
               af_current := fs_current.anonymous_feature(Current)
               if af_current /= af_any and then af_current /= caller then
                  -- We have a *real* default_rescue (redefined between ANY and the Current type).
                  effective_routine ?= af_current
                  -- Because the `default_rescue' itself can be deferred:
                  if effective_routine /= Void then
                     default_rescue_compound := effective_routine.routine_body
                     check
                        effective_routine.routine_then = Void
                     end
                     af_current.collect(Current)
                  end
               end
            end
            default_rescue_collected := True
         end
      ensure
         default_rescue_collected
      end

feature {EFFECTIVE_ROUTINE}
   default_rescue_compound: INSTRUCTION
         -- Default "rescue" compound used when a feature does not have its own rescue clause. It
         -- contains a call to the redefined default_rescue routine.
         -- Void when the would-be called feature would be the one defined in ANY.

feature {}
   default_rescue_collected: BOOLEAN

feature {FEATURE_ACCUMULATOR}
   do_collect
      local
         gl: ARRAY[TYPE_MARK]
      do
         debug
            echo.put_string(once "Collecting type: ")
            echo.put_line(name.to_string)
         end
         -- Validity check section done here because the newly created TYPE is now really ready for use:
         if is_generic then
            gl := canonical_type_mark.generic_list
            class_text.formal_generic_list.constraint_genericity_check(Current, gl, canonical_type_mark.start_position)
            -- Checking infinite generic with a brute force idea:
            if canonical_type_mark.written_name.to_string.count > 16384 then
               error_handler.add_position(canonical_type_mark.start_position)
               error_handler.append(once "Probably infinite or too long generic derivation of this type mark (see next warnings %
                          %to find the cause of the problem... and good luck).")
               error_handler.print_as_warning
               error_handler.append(once "The huge generic derivation related to the previous warning is: ")
               error_handler.append(canonical_type_mark.written_name.to_string)
               if error_handler.warning_counter > 10 then
                  error_handler.print_as_error
               else
                  error_handler.print_as_warning
               end
            end
         end
         inheritance_cycle_check
         if external_type /= Void then
            external_type.collect
         end
         collect_features
         if not ace.boost then
            -- Invariant may be inherited in a class who has invariant checking (even if this class does not
            -- check invariants).
            build_actual_invariant
         end
         check
            valid_feature_stamps
         end
         if is_user_expanded then
            class_text.extra_expanded_check(Current)
         else
            -- We trust our own basic classes.
         end
      end

   specialize_and_check
      local
         i: INTEGER
      do
         from
            i := 1
         until
            i > feature_stamps.count
         loop
            feature_stamps.item(i).specialize_and_check(Current)
            i := i + 1
         end
         if class_invariant /= Void and then class_text.invariant_check then
            class_invariant := class_invariant.specialize_and_check(Current)
         end
         class_text.creation_list_check(Current)
         class_text.check_level_2(Current)
      end

feature {COMMAND_LINE_TOOLS, TYPE}
   up_to_any_in (parent_list: FAST_ARRAY[TYPE])
         -- Add in `parent_list', a path to the ANY class, without including the ANY class itself.
         --|*** Wrong comment
      require
         not parent_list.is_empty
      local
         p: TYPE; i: INTEGER
      do
         from
            i := parents.lower
         until
            i > parents.upper
         loop
            p := parents.item(i)
            if not parent_list.fast_has(p) then
               if p.name.to_string = as_any then
                  -- We do not add this class, because everybody knows what comes from ANY.
               else
                  parent_list.add_last(p)
                  p.up_to_any_in(parent_list)
               end
            end
            i := i + 1
         end
      end

feature {ANY}
   live_type: LIVE_TYPE
         -- The corresponding one if already created.

   canonical_type_mark: TYPE_MARK
         -- The one used to create `Current'. (As the `canonical_type_mark' is selected nearly randomly by the compilation
         -- process, the `start_position' of the `canonical_type_mark' itself is not meaningful.)

   name: HASHED_STRING
         -- Because `canonical_type_mark' is static, this is an alias for
         -- `canonical_type_mark.written_name'

   long_name: HASHED_STRING
         -- This name holds cluster info needed to make different types with the same name distinct. Mainly
         -- used for SMART_EIFFEL.`type_dictionary' storage.
      do
         Result := canonical_type_mark.long_name
      ensure
         Result /= Void
      end

   class_text: CLASS_TEXT

   hash_code: INTEGER

   has_local_closure: BOOLEAN
         -- True if some object of this type may be stored in an outside local variable (i.e. visible to some closure)

   add_parent (node: like Current)
      local
         et: like external_type
      do
         Precursor(node)
         et := node.external_type
         if et /= Void then
            if external_type = Void then
               external_type := et
            elseif et.is_equal(external_type) then
               -- Just ignore the duplicate
            else
               error_handler.add_position(external_type.start_position)
               error_handler.add_position(et.start_position)
               error_handler.append(name.to_string)
               error_handler.append(once " has two conflicting external types")
               error_handler.print_as_error
            end
         end
      end

   valid_feature_name (fn: FEATURE_NAME): BOOLEAN
         -- Is `fn' an existing final feature name of `Current'?
      require
         fn /= Void
      do
         Result := feature_stamps.has(fn)
      end

   registered_name (fn: FEATURE_NAME): FEATURE_NAME
         -- Useful for declaration position and frozen status.
      require
         valid_feature_name(fn)
      do
         Result := feature_stamps.internal_key(fn)
      end

   lookup (fn: FEATURE_NAME): FEATURE_STAMP
         -- Get the FEATURE_STAMP relative to `fn'. (As expressed in the require assertion, we assume that `fn' is really a
         -- final name in `Current'.)
      require
         not fn.start_position.is_unknown
         feature_collection_done
         valid_feature_name(fn)
      do
         Result := feature_stamps.reference_at(fn)
      ensure
         Result /= Void
         Result.has_type(Current)
      end

   search (fn: FEATURE_NAME): FEATURE_STAMP
         -- To make in a single step a `valid_feature_name' test which may be followed by a `lookup' call. (The require
         -- assertion of `search' is more relaxed and a Void `Result' indicate that `fn' is not a valid final name in
         -- `Current'.)
      require
         not fn.start_position.is_unknown
         feature_collection_done
      do
         Result := feature_stamps.reference_at(fn)
      ensure
         valid_feature_name(fn) = (Result /= Void)
         valid_feature_name(fn) implies Result.has_type(Current)
         Result /= Void implies Result = lookup(fn)
      end

   get_feature_name (fs: FEATURE_STAMP): FEATURE_NAME
      require
         fs.has_type(Current)
      do
         Result := feature_stamps.fast_key_at(fs)
      ensure
         registered_name(Result) = Result
      end

   has_simple_feature_name (simple_feature_name: HASHED_STRING): BOOLEAN
      require
         simple_feature_name.is_simple_feature_name
      do
         if temporary_simple_feature_name = Void then
            create temporary_simple_feature_name.ordinary_name(simple_feature_name, class_text.name.start_position)
         else
            temporary_simple_feature_name.ordinary_name(simple_feature_name, class_text.name.start_position)
         end
         Result := valid_feature_name(temporary_simple_feature_name)
      end

   feature_stamp_of (simple_feature_name: HASHED_STRING): FEATURE_STAMP
         -- Used to get the good one knowing that `simple_feature_name' is the final existing name.
      require
         simple_feature_name.is_simple_feature_name
         has_simple_feature_name(simple_feature_name)
      do
         if temporary_simple_feature_name = Void then
            create temporary_simple_feature_name.ordinary_name(simple_feature_name, class_text.name.start_position)
         else
            temporary_simple_feature_name.ordinary_name(simple_feature_name, class_text.name.start_position)
         end
         Result := lookup(temporary_simple_feature_name)
      ensure
         Result /= Void
      end

   feature_collection_done: BOOLEAN
      do
         Result := feature_stamps /= Void
      end

   class_invariant: CLASS_INVARIANT

   copy_stamp: FEATURE_STAMP
         -- The one of the `copy' feature (which is magically called inside `twin').
      local
         type_any: like Current; fn: FEATURE_NAME
      do
         -- First, going to ANY in order to get the FEATURE_NAME:
         type_any := smart_eiffel.type_any
         fn := type_any.class_text.any_copy_feature.names.first
         Result := feature_accumulator.feature_stamp_of(fn)
         Result := Result.resolve_static_binding_for(type_any, Current)
      ensure
         Result /= Void
      end

   twin_stamp: FEATURE_STAMP
         -- The one of the `twin' feature (which is magically called by user-expanded assignments).
      local
         type_any: like Current; fn: FEATURE_NAME
      do
         -- First, going to ANY in order to get the FEATURE_NAME:
         type_any := smart_eiffel.type_any
         fn := type_any.class_text.any_twin_feature.names.first
         Result := feature_accumulator.feature_stamp_of(fn)
         Result := Result.resolve_static_binding_for(type_any, Current)
      ensure
         Result /= Void
      end

   is_equal_stamp: FEATURE_STAMP
         -- The one of the `is_equal' feature (which is magically called by user-expanded comparisons).
      local
         type_any: like Current; fn: FEATURE_NAME
      do
         -- First, going to ANY in order to get the FEATURE_NAME:
         type_any := smart_eiffel.type_any
         fn := type_any.class_text.any_is_equal_feature.names.first
         Result := feature_accumulator.feature_stamp_of(fn)
         Result := Result.resolve_static_binding_for(type_any, Current)
      ensure
         Result /= Void
      end

   do_at_exit_stamp: FEATURE_STAMP
         -- The one of the `do_at_exit' feature (which is magically called by user-expanded comparisons).
      local
         type_any: like Current; fn: FEATURE_NAME
      do
         -- First, going to ANY in order to get the FEATURE_NAME:
         type_any := smart_eiffel.type_any
         fn := type_any.class_text.do_at_exit_feature.names.first
         Result := feature_accumulator.feature_stamp_of(fn)
         Result := Result.resolve_static_binding_for(type_any, Current)
      ensure
         Result /= Void
      end

   accept (visitor: TYPE_VISITOR)
      do
         visitor.visit_type(Current)
      end

   id: INTEGER
         -- Id of the receiver to produce C code.
      do
         if live_type /= Void then
            Result := live_type.id
         else
            Result := canonical_type_mark.id
         end
      end

feature {TYPE}
   private_generic_list: ARRAY[TYPE]

feature {C_PRETTY_PRINTER, LOCAL_ARGUMENT_DEF}
   set_local_closure
      do
         has_local_closure := True
      ensure
         has_local_closure
      end

   name_from_string (s: STRING): FEATURE_NAME
      require
         string_aliaser.registered_one(s)
      local
         i: INTEGER
      do
         from
            i := feature_stamps.lower
         until
            Result /= Void
         loop
            if feature_stamps.key(i).to_string = s then
               Result := feature_stamps.key(i)
            end
            i := i + 1
         end
      ensure
         Result /= Void
         registered_name(Result) = Result
      end

feature {ANONYMOUS_FEATURE}
   name_of (af: ANONYMOUS_FEATURE): FEATURE_NAME
         -- Warning: TIME CONSUMING TASK. Try to use `get_feature_name' instead.
         --|*** This may be wrong if synonyms are implemented using shared AF.
         --|*** See ANONYMOUS_FEATURE.add_into_shared.
      local
         i: INTEGER; fs: FEATURE_STAMP
      do
         from
            i := feature_stamps.lower
         until
            Result /= Void or else i > feature_stamps.upper
         loop
            fs := feature_stamps.item(i)
            check
               integrity: fs.has_anonymous_feature_for(Current)
            end
            if fs.anonymous_feature(Current) = af then
               Result := feature_stamps.key(i)
            end
            i := i + 1
         end
      end

feature {ANY} -- some property similar to TYPE_MARK *without* start_position and some other
   is_deferred: BOOLEAN

   is_generic: BOOLEAN
      do
         Result := private_generic_list /= Void
      ensure
         is_generic and then is_array implies Result
      end

   is_expanded: BOOLEAN
      do
         Result := canonical_type_mark.is_expanded
      ensure
         Result = not is_reference
      end

   is_reference: BOOLEAN
      do
         Result := canonical_type_mark.is_reference
      ensure
         Result = not is_expanded
      end

   has_external_type: BOOLEAN
      do
         Result := external_type /= Void
      end

   external_type: EXTERNAL_TYPE
      attribute
      end

   generic_list: ARRAY[TYPE]
      require
         is_generic
      do
         Result := private_generic_list
      ensure
         Result.lower = 1
         not Result.is_empty
      end

   is_kernel_expanded: BOOLEAN
         -- True for BOOLEAN, CHARACTER, INTEGER, REAL, DOUBLE and POINTER.
      do
         Result := canonical_type_mark.is_kernel_expanded
      end

   is_boolean: BOOLEAN
      do
         Result := canonical_type_mark.is_boolean
      ensure
         Result implies is_kernel_expanded
      end

   is_character: BOOLEAN
      do
         Result := canonical_type_mark.is_character
      ensure
         Result implies is_kernel_expanded
      end

   is_integer: BOOLEAN
         -- Is it some INTEGER_* type?
      do
         Result := canonical_type_mark.is_integer
      ensure
         Result implies is_kernel_expanded
      end

   is_natural: BOOLEAN
         -- Is it some NATURAL_* type?
      do
         Result := canonical_type_mark.is_natural
      ensure
         Result implies is_kernel_expanded
      end

   is_real: BOOLEAN
      do
         Result := canonical_type_mark.is_real
      ensure
         Result implies is_kernel_expanded
      end

   is_pointer: BOOLEAN
      do
         Result := canonical_type_mark.is_pointer
      ensure
         Result implies is_kernel_expanded
      end

   is_string: BOOLEAN
      do
         Result := canonical_type_mark.is_string
      end

   is_fixed_string: BOOLEAN
      do
         Result := canonical_type_mark.is_fixed_string
      end

   is_unicode_string: BOOLEAN
      do
         Result := canonical_type_mark.written_mark = as_unicode_string
      end

   is_array: BOOLEAN
      require
         is_generic
      do
         Result := canonical_type_mark.is_array
      ensure
         Result implies generic_list.count = 1
      end

   is_any: BOOLEAN
      do
         Result := canonical_type_mark.is_any
      end

   is_native_array: BOOLEAN
      do
         Result := canonical_type_mark.is_native_array
      end

   is_agent: BOOLEAN
      do
         Result := canonical_type_mark.is_agent
      end

   is_tuple: BOOLEAN
      do
         Result := canonical_type_mark.is_tuple
      end

   is_empty_expanded: BOOLEAN
         -- True when is it a user's expanded type with no attribute.
      require
         smart_eiffel.status.collecting_done
      do
         if is_user_expanded then
            Result := live_type.is_empty_expanded
         end
      ensure
         Result implies is_user_expanded
      end

   is_user_expanded: BOOLEAN
         -- Is it really a user expanded type?
      do
         Result := canonical_type_mark.is_user_expanded
      end

   is_always_void: BOOLEAN
         -- Is an expression of that TYPE always Void?
      require
         avoid_stupid_questions: not is_expanded
         smart_eiffel.status.collecting_done
      do
         Result := (live_type = Void) or else (live_type.run_time_set.count = 0)
      end

   direct_non_void_call_flag: BOOLEAN
      require
         smart_eiffel.status.collecting_done
      local
         run_time_set: RUN_TIME_SET
      do
         if live_type /= Void then
            run_time_set := live_type.run_time_set
            Result := run_time_set.count = 1 and then run_time_set.first = live_type
         end
      end

   can_be_assigned_to (other: TYPE): BOOLEAN
         -- Used to know if `Current' can be assigned into `other'.
         -- (See also `valid_redefinition_of'.)
      require
         not_done_to_report_errors: error_handler.is_empty
      local
         integer_type_mark: INTEGER_TYPE_MARK; real_type_mark: REAL_TYPE_MARK; natural_type_mark: NATURAL_TYPE_MARK
      do
         if Current = other then
            Result := True
         else
            if is_integer then
               integer_type_mark ::= canonical_type_mark
               Result := integer_type_mark.can_be_assigned_to(other.canonical_type_mark)
            elseif is_real then
               real_type_mark ::= canonical_type_mark
               Result := real_type_mark.can_be_assigned_to(other.canonical_type_mark)
            elseif is_natural then
               natural_type_mark ::= canonical_type_mark
               Result := natural_type_mark.can_be_assigned_to(other.canonical_type_mark)
            elseif name.to_string = as_integer_general then
               if other.name.to_string = as_integer_64 then
                  --|*** This extra permission is necessary to share code in INTEGER_GENERAL.
                  --|*** Also note that INTEGER_64 is the largest one, so there is no danger here.
                  Result := True
               elseif other.name.to_string = as_integer_8 then
                  --|*** Caution: INTEGER_8 is not the largest INTEGER_GENERAL ***
                  --| This permission is necessary to compile the actual (wrong) code in INTEGER_GENERAL.
                  --|*** (Dom. Oct 2004) ***
                  Result := True
               end
            elseif name.to_string = as_real_general then
               if other.name.to_string = as_real then
                  --|*** Caution: REAL_64 is not the largest REAL_GENERAL ***
                  --| This permission is necessary to compile the actual (wrong) code in REAL_GENERAL.
                  --|*** (Dom. Oct 2004) ***
                  Result := True
               end
            elseif name.to_string = as_natural_general then
               if other.name.to_string = as_natural_64 then
                  --|*** This extra permission is necessary to share code in NATURAL_GENERAL.
                  --|*** Also note that NATURAL_64 is the largest one, so there is no danger here.
                  Result := True
               elseif other.name.to_string = as_natural_8 then
                  --|*** Caution: NATURAL_8 is not the largest NATURAL_GENERAL ***
                  --| This permission is necessary to compile the actual (wrong) code in NATURAL_GENERAL.
                  --|*** (Dom. Oct 2004) ***
                  Result := True
               end
            else
               Result := Current.inherits_from(other)
            end
         end
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

feature {TYPE, TYPE_VISITOR}
   feature_stamps: HASHED_BIJECTIVE_DICTIONARY[FEATURE_STAMP, FEATURE_NAME]

feature {INTROSPECTION_HANDLER, TYPE_VISITOR}
   writable_attributes: ARRAY[FEATURE_STAMP]
      require
         feature_collection_done
      local
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
      do
         Result := writable_attributes_memory
         if Result = Void then
            create Result.with_capacity(4, 1)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(Current)
               if {WRITABLE_ATTRIBUTE} ?:= af then
                  Result.add_last(fs)
               end
               i := i + 1
            end
            writable_attributes_memory := Result
         end
      end

feature {}
   writable_attributes_memory: ARRAY[FEATURE_STAMP]

feature {ANY}
   open_arguments: ARRAY[TYPE]
         -- (The `Result' can be Void when open arguments is the empty TUPLE.)
      require
         is_generic
         canonical_type_mark.is_agent
      do
         Result := private_generic_list.item(1).private_generic_list
      end

   agent_result: TYPE
      require
         is_generic
         canonical_type_mark.is_agent
      do
         if private_generic_list.upper > 1 then
            Result := private_generic_list.item(2)
         end
      end

feature {LIVE_TYPE}
   forget_previous_collect
         --|*** Do not know yet if this feature must be better called directly by `smart_eiffel'?
         --|*** (Dom july 14th 2004) ***
      do
         default_rescue_collected := False
      end

   adapt_class_invariant
      require
         smart_eiffel.status.is_adapting
      do
         if class_invariant /= Void and then class_text.invariant_check then
            class_invariant := class_invariant.adapt_for(Current)
         end
      end

   set_live_type (lt: like live_type)
      require
         lt /= Void
         must_be_done_once: live_type = Void
      do
         live_type := lt
      ensure
         lt.type = Current
         lt.name = name
         live_type = lt
      end

feature {LIVE_TYPE}
   expanded_default_create_stamp: FEATURE_STAMP
         -- Must be called when we are sure that there is only and only one creation procedure with no argument.
      require
         is_user_expanded
      do
         Result := class_text.user_expanded_default_create_stamp(Current)
      ensure
         Result /= Void
      end

feature {CALL_0}
   find_manifest_expression_for (fs: FEATURE_STAMP; fn: FEATURE_NAME): MANIFEST_EXPRESSION
         -- Used to find some manifest expression in the "when" part of some "inspect" statement.
      require
         fn /= Void
      local
         af: ANONYMOUS_FEATURE; cst_att: CST_ATT
      do
         af := find_anonymous_feature_for(fs, fn)
         cst_att ?= af
         if cst_att = Void then
            error_handler.append(once "This call should be some constant feature call (i.e. a statically computable %
                                 %value). (See the definition found in the next error message.)")
            error_handler.add_position(fn.start_position)
            error_handler.print_as_error
            error_handler.append(once "This is not a constant feature.")
            error_handler.add_position(af.start_position)
            error_handler.print_as_fatal_error
         end
         Result ::= cst_att.value
         check
            Result /= Void
         end
      ensure
         Result /= Void
      end

feature {}
   find_anonymous_feature_for (fs: FEATURE_STAMP; fn: FEATURE_NAME): ANONYMOUS_FEATURE
      require
         fs /= Void
         fn /= Void
      do
         if feature_accumulator.context_type /= Current then
            Result := fs.anonymous_feature(Current)
         else
            Result := feature_accumulator.anonymous_feature_for(fn)
         end
         if Result = Void then
            error_handler.append(once "No feature found for this call.")
            error_handler.add_position(fn.start_position)
            error_handler.print_as_fatal_error
         end
      ensure
         Result /= Void
      end

feature {FEATURE_ACCUMULATOR}
   add_feature (fn: FEATURE_NAME; fs: FEATURE_STAMP)
      require
         fn /= Void
         fs /= Void
         not valid_feature_name(fn)
         class_text.proper_has(fn) implies fn.start_position.class_text = class_text
      do
         debug
            if debug_known_features = Void then
               debug_known_features := "["
            else
               debug_known_features.append(once " [")
            end
            debug_known_features.append(fn.to_string)
            debug_known_features.extend(']')
         end
         feature_stamps.add(fs, fn)
         fs.register_type(Current)
      end

feature {FEATURE_ACCUMULATOR, FEATURE_STAMP}
   add_seeds (final_fs: FEATURE_STAMP; seed_set: SET[ABSOLUTE_FEATURE_NAME]; inherit_link: BOOLEAN)
      require
         final_fs.has_type(Current)
         final_fs /= Void
         seed_set /= Void
      local
         i: INTEGER; a_parent_edge: PARENT_EDGE; type: TYPE; is_not_root: BOOLEAN; afn: ABSOLUTE_FEATURE_NAME
      do
         --|*** This implementation is quite slow. Maybe it is possible to take shortcuts like
         --|*** resolve_static_binding does. <FM-26/03/2006>
         from
            i := 1
         until
            i > parents_count
         loop
            a_parent_edge := parent_edge_load(i)
            if inherit_link implies a_parent_edge.is_inherit_member then
               type := a_parent_edge.type_mark.resolve_in(Current)
               is_not_root := final_fs.add_seeds(type, a_parent_edge, seed_set, inherit_link) or else is_not_root
            end
            i := i + 1
         end
         if not is_not_root then
            create afn.make(class_text.name, final_fs.name)
            seed_set.add(afn)
         end
      end

feature {SMART_EIFFEL}
   collected_feature_count: INTEGER
      do
         if live_type /= Void then
            Result := live_type.feature_count
         end
      end

feature {FEATURE_ACCUMULATOR, FEATURE_STAMP}
   print_feature_hierarchy (final_fs: FEATURE_STAMP; seed: ABSOLUTE_FEATURE_NAME; inherit_link: BOOLEAN): BOOLEAN
         -- Code for printing error message (do not care for speed). All TYPEs and NAMEs for the feature are
         -- printed from seed to current type.
      require
         final_fs.has_type(Current)
         final_fs /= Void
      local
         i: INTEGER; cn: CLASS_NAME; fn: FEATURE_NAME; a_parent_edge: PARENT_EDGE; type: TYPE
      do
         cn := class_text.name
         fn := final_fs.name
         Result := seed.matches(cn, fn)
         if not Result then
            from
               i := 1
            until
               Result or else i > parents_count
            loop
               a_parent_edge := parent_edge_load(i)
               if inherit_link implies a_parent_edge.is_inherit_member then
                  type := a_parent_edge.type_mark.resolve_in(Current)
                  Result := final_fs.print_feature_hierarchy(type, a_parent_edge, seed, inherit_link)
               end
               i := i + 1
            end
            if Result then
               if a_parent_edge.is_inherit_member then
                  error_handler.append(once "%N      inherited as ")
               else
                  error_handler.append(once "%N      inserted as ")
               end
            end
         end
         if Result then
            error_handler.add_feature_name(fn)
            error_handler.append(once " in ")
            error_handler.append(cn.to_string)
         end
      end

feature {TYPE}
   print_graph_cycle (first: TYPE)
      require
         has_parent_cycle
      local
         i: INTEGER
      do
         error_handler.append(name.to_string)
         if Current = first then
            error_handler.append(once ", ...")
            error_handler.print_as_fatal_error
         else
            error_handler.append(once ", ")
            from
               i := parents.lower
            until
               i > parents.upper
            loop
               if parents.item(i).feature_stamps = Void then
                  error_handler.add_position(parents_edge_load.item(i).start_position)
                  parents.item(i).print_graph_cycle(first)
               end
               i := i + 1
            end
         end
      end

feature {}
   inline_dynamic_dispatch_flag: BOOLEAN

   frozen inline_dynamic_dispatch_must_be_done_once: BOOLEAN
      do
         if inline_dynamic_dispatch_flag then
            error_handler.append(once "Internal compiler error (TYPE.inline_dynamic_dispatch called twice.")
            error_handler.print_as_fatal_error
         else
            inline_dynamic_dispatch_flag := True
            Result := True
         end
      end

feature {LIVE_TYPE}
   inline_dynamic_dispatch_for_class_invariant(code_accumulator: CODE_ACCUMULATOR)
      require
         inline_dynamic_dispatch_must_be_done_once
      do
         if class_invariant /= Void and then class_text.invariant_check then
            class_invariant ::= class_invariant.inline_dynamic_dispatch(code_accumulator, Current)
         end
      end

feature {}
   temporary_simple_feature_name: FEATURE_NAME
         -- Used only as a temporary in `feature_stamp_of' and `has_simple_feature_name'.

   inheritance_cycle_check
      local
         i: INTEGER
      do
         from
            i := parents.lower
         until
            i > parents.upper
         loop
            if parents.item(i).feature_stamps = Void then
               check
                  has_parent_cycle
               end
               error_handler.append(once "Cyclic inheritance graph: ")
               error_handler.append(name.to_string)
               error_handler.append(once ", ")
               error_handler.add_position(parents_edge_load.item(i).start_position)
               parents.item(i).print_graph_cycle(Current)
               if not error_handler.is_empty then
                  error_handler.append(once "The following path was misdetected as an inheritance cycle")
                  error_handler.print_as_internal_error
               end
            end
            i := i + 1
         end
      end

   collect_features
      require
         feature_stamps = Void
         not has_parent_cycle
      local
         i, k, feature_stamps_size: INTEGER; a_parent: TYPE; pfs: like feature_stamps
         fn, final_name: FEATURE_NAME; a_parent_edge: PARENT_EDGE; accu: FEATURE_ACCUMULATOR
      do
         accu := feature_accumulator
         accu.start(Current)

         -- Creating `feature_stamps' with an appropriate initial `capacity' (at least, we have as many
         -- FEATURE_STAMPs as in the `parents'):
         from
            feature_stamps_size := 150
            i := parents.lower
         until
            i > parents.upper
         loop
            feature_stamps_size := feature_stamps_size.max(parents.item(i).feature_stamps.count)
            i := i + 1
         end
         feature_stamps_size := feature_stamps_size + class_text.feature_dictionary.count
         create feature_stamps.with_capacity(feature_stamps_size)

         -- Actually the `collect_features' true job:
         from
            --| Don't revert that loop! (see `collect_one_feature' comment for explanations)
            i := parents.upper
         until
            i < parents.lower
         loop
            a_parent := parents.item(i)
            a_parent_edge := parents_edge_load.item(i)
            from
               pfs := a_parent.feature_stamps
               k := pfs.lower
            until
               k > pfs.upper
            loop
               fn := pfs.key(k)
               if a_parent_edge /= Void then
                  final_name := a_parent_edge.do_rename(fn)
               else
                  final_name := fn
               end
               if not accu.is_known(final_name) then
                  if class_text.proper_has(final_name) then
                     final_name := class_text.proper_name_get(final_name)
                  end
                  collect_one_feature(final_name, i)
               end
               k := k + 1
            end
            i := i - 1
         end
         collect_local_features
         accu.finalize
      ensure
         feature_collection_done
      end

   collect_one_feature (final_fn: FEATURE_NAME; inherit_index: INTEGER)
         -- The loop is done in reverse order, so conforming types will be analyzed first.
         -- Types after `inherit_index' are ignored because they have
         -- already been used and we know `final_fn' not to be known into.
      local
         accu: FEATURE_ACCUMULATOR; i, j: INTEGER; a_type: TYPE; old_name, new_name: FEATURE_NAME; a_fs: FEATURE_STAMP
         a_parent_edge: PARENT_EDGE; an_af: ANONYMOUS_FEATURE; renamed: BOOLEAN; a_rename: RENAME_PAIR
      do
         from
            accu := feature_accumulator
            accu.new_feature(final_fn)
            i := 0
         until
            i > inherit_index
         loop
            a_type := parents.item(i)
            a_parent_edge := parents_edge_load.item(i)
            from
               renamed := False
               j := 1
            until
               j > a_parent_edge.rename_count
            loop
               a_rename := a_parent_edge.rename_item(j)
               old_name := a_rename.old_name
               new_name := a_rename.new_name
               renamed := renamed or else old_name.is_equal(final_fn)
               if new_name.is_equal(final_fn) then
                  old_name := a_type.registered_name(old_name)
                  a_fs := a_type.feature_stamps.reference_at(old_name)
                  accu.add_parent_definition(a_type, a_parent_edge, a_fs, old_name)
               end
               j := j + 1
            end
            if (not renamed) and then a_type.valid_feature_name(final_fn) then
               old_name := a_type.registered_name(final_fn)
               a_fs := a_type.feature_stamps.reference_at(old_name)
               accu.add_parent_definition(a_type, a_parent_edge, a_fs, old_name)
            end
            i := i + 1
         end
         an_af := class_text.proper_get(final_fn)
         if an_af /= Void then
            accu.add_local_definition(an_af)
         end
      ensure
         feature_accumulator.is_known(final_fn)
      end

   collect_local_features
      local
         i: INTEGER; d: DICTIONARY[ANONYMOUS_FEATURE, FEATURE_NAME]; fn: FEATURE_NAME
         accu: FEATURE_ACCUMULATOR
      do
         from
            accu := feature_accumulator
            d := class_text.feature_dictionary
            i := d.lower
         until
            i > d.upper
         loop
            fn := d.key(i)
            if not accu.is_known(fn) then
               accu.new_feature(fn)
               accu.add_local_definition(d.item(i))
            end
            i := i + 1
         end
      end

   build_actual_invariant
         -- Called only once per type to gather inherited class invariant and local invariant.
      require
         not ace.boost
      local
         i: INTEGER; a_parent: TYPE; ci: like class_invariant
      do
         class_invariant := class_text.class_invariant
         if class_invariant /= Void then
            class_invariant := class_invariant.specialize_in(Current)
         end
         from
            i := parents.lower
         until
            i > parents.upper
         loop
            a_parent := parents.item(i)
            ci := a_parent.class_invariant
            if ci /= Void then
               ci := ci.specialize_thru(a_parent, parents_edge_load.item(i), Current)
               if class_invariant = Void then
                  class_invariant := ci
               else
                  class_invariant := class_invariant.add_items_from(ci)
               end
            end
            i := i + 1
         end
      end

   valid_feature_stamps: BOOLEAN
         -- All our feature_stamps know us.
      local
         i: INTEGER
      do
         Result := True
         if feature_stamps /= Void then
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               Result := Result and feature_stamps.item(i).has_anonymous_feature_for(Current)
               i := i + 1
            end
         end
      end

   debug_info: STRING

   debug_known_features: STRING

feature {ANY}
   direct_thru_step (parent_type: TYPE; a_parent_edge: PARENT_EDGE): BOOLEAN
         -- Check that we are actually doing an atomic-valid direct step into the inheritance hierarchy (i.e. we are making
         -- a direct move move from `parent_type' using the `a_parent_edge' path to reach `Current'.
      require
         parent_type /= Void
         a_parent_edge /= Void
      local
         parent_type_tm: TYPE_MARK; parent_type_2: TYPE
      do
         -- The `parent_type' must be a direct parent of `Current':
         Result := has_parent(parent_type)
         if not Result then
            -- For easy debug:
            sedb_breakpoint
         else
            -- The `a_parent_edge' is actually a path to `parent_type':
            parent_type_tm := a_parent_edge.type_mark
            if parent_type_tm.is_static then
               -- No need to specialize the type mark, but the True reason is that this `a_parent_edge' can
               -- be an implicit link to ANY.
            else
               parent_type_tm.specialize_in(Current)
            end
            parent_type_2 := parent_type_tm.resolve_in(Current)
            Result := parent_type_2 = parent_type
            if not Result then
               -- For easy debug:
               sedb_breakpoint
            end
         end
      ensure
         assertion_check_only: Result
      end

feature {ADDRESS_OF}
   address_of_register (address_of: ADDRESS_OF)
      require
         address_of.feature_stamp /= Void
      do
         if address_of_memory1 = Void then
            create address_of_memory1.make
            create address_of_memory2.with_capacity(16)
         end
         if not address_of_memory1.has(address_of.feature_stamp) then
            address_of_memory1.add(address_of.feature_stamp)
            address_of_memory2.add_last(address_of)
         end
      end

feature {}
   address_of_memory1: HASHED_SET[FEATURE_STAMP]
   address_of_memory2: FAST_ARRAY[ADDRESS_OF]

feature {ANY}
   do_all_address_of (action: PROCEDURE[TUPLE[ADDRESS_OF]])
      require
         action /= Void
      do
         if address_of_memory2 /= Void then
            address_of_memory2.for_each(action)
         end
      end

feature {}
   insert_inherit_test_memory_cache: HASHED_DICTIONARY[INTEGER_8, TYPE]

invariant
   class_text /= Void

   -- This invariant is correct, but time consuming:
   --      class_text = canonical_type_mark.class_text
   --      canonical_type_mark.is_static

end -- class TYPE
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
-- Copyright (C) 2011-2018: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
