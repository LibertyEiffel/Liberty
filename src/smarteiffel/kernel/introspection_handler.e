-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class INTROSPECTION_HANDLER

inherit
   VISITOR
      undefine is_equal
      end

insert
   GLOBALS
      undefine is_equal
      end
   DECLARATION_LIST_VISITOR     -- To get `flat_list'
      undefine is_equal
      end
   WHEN_CLAUSE_VISITOR           -- To get `list'
      undefine is_equal
      end
   PLATFORM
      undefine is_equal
      end
   SINGLETON

create {ANY}
   make

feature {ANY}
   is_internals_from_generating_type_used: BOOLEAN
      do
         Result := not internals_from_generating_type_position.is_unknown
      end

   is_native_array_internals_from_generating_type_used: BOOLEAN
      do
         Result := native_array_internals_from_generating_type_args /= Void
         check
            Result = not native_array_internals_from_generating_type_position.is_unknown
         end
      end

   is_introspected (tm: TYPE_MARK): BOOLEAN
      local
         typed_internals: TYPE_MARK; lt: LIVE_TYPE; unknown_position: POSITION
      do
         typed_internals := tm.typed_internals_type_mark(unknown_position)
         lt := typed_internals.type.live_type
         Result := lt /= Void and then lt.at_run_time
      end

feature {EXTERNAL_FUNCTION}
   collect_internals_from_generating_type (insp: OTHER_INSPECT_STATEMENT;
                                           sp: like internals_from_generating_type_position; nt: TYPE)
      local
         live_types: TRAVERSABLE[LIVE_TYPE]; dummy: TYPE
         i: INTEGER
         live_type: LIVE_TYPE
      do
         if not is_internals_from_generating_type_used then
            internals_from_generating_type_position := sp
            smart_eiffel.magic_count_increment
         else
            live_types := smart_eiffel.live_type_map
            from
               i := live_types.lower
            until
               i > live_types.upper
            loop
               live_type := live_types.item(i)
               if live_type.at_run_time and then not live_type.is_native_array
                  and then live_type.create_blank_internals_used then
                  dummy := live_type.create_blank_internals_instruction.collect(nt)
               end
               i := i + 1
            end
         end
      ensure
         is_internals_from_generating_type_used
      end

   collect_native_array_internals_from_generating_type (insp: OTHER_INSPECT_STATEMENT;
                                                        sp: like native_array_internals_from_generating_type_position;
                                                        args: FORMAL_ARG_LIST; nt: TYPE)
      local
         arg: ARGUMENT_NAME_REF; arg_type, dummy: TYPE
         live_types: TRAVERSABLE[LIVE_TYPE]; i: INTEGER; live_type: LIVE_TYPE
      do
         if not is_native_array_internals_from_generating_type_used then
            native_array_internals_from_generating_type_position := sp
            create arg.refer_to(sp, args, 2, 0)
            arg_type := args.type_mark(2).declaration_type.type
            arg.set_declaration_type(arg_type)
            create native_array_internals_from_generating_type_args.make_1(start_position, arg)
            smart_eiffel.magic_count_increment
         else
            live_types := smart_eiffel.live_type_map
            from
               i := live_types.lower
            until
               i > live_types.upper
            loop
               live_type := live_types.item(i)
               if live_type.at_run_time and then live_type.is_native_array
                  and then live_type.create_blank_internals_used then
                  dummy := live_type.create_blank_internals_instruction.collect(nt)
               end
               i := i + 1
            end
         end
      ensure
         is_native_array_internals_from_generating_type_used
      end

   finalized_body_for_internals_handler (er: EXTERNAL_FUNCTION; nt: like new_type; fn: STRING): INSTRUCTION
      do
         start_new_body_for(er, nt, True)
         if fn = as_internals_from_generating_type then
            Result := simplify_and_wrap(finalized_body_for_internals_from_generating_type)
         elseif fn = as_valid_generating_type_for_internals then
            Result := simplify_and_wrap(finalized_body_for_valid_generating_type_for_internals)
         elseif fn = as_native_array_internals_from_generating_type then
            Result := simplify_and_wrap(finalized_body_for_na_internals_from_generating_type)
         elseif fn = as_valid_generating_type_for_native_array_internals then
            Result := simplify_and_wrap(finalized_body_for_valid_generating_type_for_na_internals)
         else
            check
               False
            end
         end
         if Result = Void then
            Result := er.routine_body
         end
      end

feature {LIVE_TYPE}
   create_blank_internals_instruction_for (live_type: LIVE_TYPE): CREATE_INSTRUCTION
      require
         live_type.at_run_time
         create_blank_internals_used_by(live_type)
      local
         tm, typed_internals: TYPE_MARK
         pos: POSITION
         make_blank_fn: FEATURE_NAME
         cn: CLASS_NAME
         internals: CLASS_TYPE_MARK
         result_variable: RESULT
         make_blank: PROCEDURE_CALL
      do
         tm := live_type.canonical_type_mark
         if tm.is_native_array then
            pos := native_array_internals_from_generating_type_position
         else
            pos := internals_from_generating_type_position
         end
         typed_internals := tm.typed_internals_type_mark(pos)
         smart_eiffel.magic_count_increment
         create make_blank_fn.simple_feature_name(as_make_blank, pos)
         create result_variable.make(pos)
         create cn.unknown_position(string_aliaser.hashed_string(as_internals), False)
         create internals.make(cn)
         result_variable.set_type_mark_memory(internals)
         if tm.is_native_array then
            check
               is_native_array_internals_from_generating_type_used
            end
            create {PROCEDURE_CALL_1} make_blank.make(result_variable, make_blank_fn,
                                                 native_array_internals_from_generating_type_args)
         else
            check
               is_internals_from_generating_type_used
            end
            create {PROCEDURE_CALL_0} make_blank.make(result_variable, make_blank_fn)
         end
         create Result.make_specialized(pos, typed_internals, result_variable, make_blank)
      end

   create_blank_internals_used_by (live_type: LIVE_TYPE): BOOLEAN
      require
         live_type.at_run_time
      local
         tm, typed_internals: TYPE_MARK
         pos: POSITION
         lt: LIVE_TYPE
      do
         tm := live_type.canonical_type_mark
         if is_introspectable_dynamic_type(tm) then
            if tm.is_native_array then
               pos := native_array_internals_from_generating_type_position
            else
               pos := internals_from_generating_type_position
            end
            if not pos.is_unknown then
               typed_internals := tm.typed_internals_type_mark(pos)
               lt := typed_internals.type.live_type
               Result := lt /= Void and then lt.at_run_time
            end
         end
      end

feature {EXTERNAL_ROUTINE}
   specialize_body_for_typed_internals (er: EXTERNAL_ROUTINE; nt: like new_type; ct: BOOLEAN): EXTERNAL_ROUTINE
      require
         er /= Void
         nt.class_text.name.to_string = as_typed_internals
         nt.generic_list.count = 1
      local
         n: STRING
      do
         start_new_body_for(er, nt, ct)
         n := er.first_name.to_string
         if not is_introspectable_dynamic_type(target_type.canonical_type_mark) then
            set_and_specialize_body(Void, Void)
         else
            if n = as_type_attribute_name then
               specialize_body_for_type_attribute_name
            elseif n = as_object_attribute then
               specialize_body_for_object_attribute
            elseif n = as_set_object_attribute then
               specialize_body_for_set_object_attribute
            elseif n = as_type_is_expanded then
               specialize_body_for_type_is_expanded
            elseif n = as_type_attribute_is_expanded then
               specialize_body_for_type_attribute_is_expanded
            elseif n = as_type_can_be_assigned_to_attribute then
               specialize_body_for_type_can_be_assigned_to_attribute
            elseif n = as_make_blank then
               specialize_body_for_make_blank
            elseif n = as_type_generating_type then
               specialize_body_for_type_generating_type
            elseif n = as_type_generator then
               specialize_body_for_type_generator
            elseif n = as_is_equal then
               specialize_body_for_is_equal
            elseif n = as_object_as_pointer then
               specialize_body_for_object_as_pointer
            elseif n = as_type_attribute_generator then
               specialize_body_for_type_attribute_generator
            elseif n = as_type_attribute_generating_type then
               specialize_body_for_type_attribute_generating_type
            elseif n = as_type_attribute_count then
               specialize_body_for_type_attribute_count
            else
               check
                  False
               end
            end
         end
         Result := external_routine
      ensure
         Result.same_dynamic_type(er)
      end

   specialize_body_for_native_array_internals (er: EXTERNAL_ROUTINE; nt: like new_type; ct: BOOLEAN): EXTERNAL_ROUTINE
      require
         er /= Void
         nt.class_text.name.to_string = as_native_array_internals
         nt.generic_list.count = 1
      local
         n: STRING
      do
         start_new_body_for(er, nt, ct)
         n := er.first_name.to_string
         check
            not target_type.is_deferred
            is_introspectable_dynamic_type(target_type.canonical_type_mark)
         end
         if native_array_element_type.is_native_array then
            --|*** This message is pretty unhelpful. Where can I get useful start_positions? <FM-29/01/2007>
            error_handler.append(once "NATIVE_ARRAY[NATIVE_ARRAY[...]] is not currently supported by the introspection system.")
            error_handler.print_as_fatal_error
         end
         if n = as_type_attribute_count then
            specialize_body_for_na_attribute_count
         elseif n = as_object_attribute then
            specialize_body_for_na_object_attribute
         elseif n = as_set_object_attribute then
            specialize_body_for_na_set_object_attribute
         elseif n = as_type_item_is_expanded then
            specialize_body_for_na_type_item_is_expanded
         elseif n = as_type_can_be_assigned_to_item then
            specialize_body_for_na_type_can_be_assigned_to_item
         elseif n = as_make_blank then
            specialize_body_for_na_make_blank
         elseif n = as_type_item_generator then
            specialize_body_for_na_type_item_generator
         elseif n = as_type_item_generating_type then
            specialize_body_for_na_type_item_generating_type
         else
            check
               False
            end
         end
         Result := external_routine
      ensure
         Result.same_dynamic_type(er)
      end

   specialize_body_for_internals_handler (er: EXTERNAL_ROUTINE; nt: like new_type; ct: BOOLEAN): EXTERNAL_ROUTINE
      require
         er /= Void
         nt.class_text.name.to_string = as_internals_handler
      local
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         manifest_string: MANIFEST_STRING
         when_clause: WHEN_CLAUSE
      do
         start_new_body_for(er, nt, ct)
         check
            er.first_name.to_string = as_internals_from_generating_type
               or er.first_name.to_string = as_valid_generating_type_for_internals
               or er.first_name.to_string = as_native_array_internals_from_generating_type
               or er.first_name.to_string = as_valid_generating_type_for_native_array_internals
         end
         create arg.refer_to(start_position, arguments, 1, 0)
         create inspect_statement.make(start_position, arg)
         create when_clause.make(inspect_statement, start_position, Void)
         create manifest_string.from_identifier(start_position, string_aliaser.hashed_string(as_string))
         when_clause.add_value(manifest_string)
         -- The when_clause will get `twin'ned and completed during the adapt phase
         set_and_specialize_body(Void, inspect_statement)
         Result := external_routine
      ensure
         Result.same_dynamic_type(er)
      end

   specialize_body_for_any_to_internals (er: EXTERNAL_ROUTINE; nt: like new_type; ct: BOOLEAN): EXTERNAL_ROUTINE
      require
         er.first_name.to_string = as_to_internals
         nt.class_text.name.to_string = as_any
      local
         create_instruction: CREATE_INSTRUCTION
      do
         start_new_body_for(er, nt, ct)
         create create_instruction.typed_internals(start_position, new_type)
         set_and_specialize_body(Void, create_instruction)
         Result := external_routine
      ensure
         Result.same_dynamic_type(er)
      end

   finalized_body_for_to_internals (er: EXTERNAL_ROUTINE; nt: like new_type): INSTRUCTION
      do
         if is_introspectable_dynamic_type(nt.canonical_type_mark) then
            start_new_body_for(er, nt, True)
            Result := wrap(er.routine_body)
         end
      end

   finalized_body_for_typed_internals (er: EXTERNAL_ROUTINE; nt: like new_type): INSTRUCTION
      local
         fn: STRING
      do
         start_new_body_for(er, nt, True)
         fn := er.first_name.to_string
         if not target_type.live_type.at_run_time then
         elseif fn = as_type_attribute_count then
            Result := wrap(finalized_body_for_type_attribute_count)
         else
            Result := wrap(external_routine.routine_body)
         end
      end

   finalized_body_for_native_array_internals (er: EXTERNAL_ROUTINE; nt: like new_type): INSTRUCTION
      local
         fn: STRING
      do
         start_new_body_for(er, nt, True)
         fn := er.first_name.to_string
         if not target_type.live_type.at_run_time then
         else
            Result := wrap(external_routine.routine_body)
         end
      end

feature {SMART_EIFFEL}
   collect_internals_handler
      local
         i: INTEGER; t: TYPE
      do
         --*** TODO: lock creation of new TYPED_INTERNALS
         if type_internals_handler = Void then
            type_internals_handler := smart_eiffel.type_internals_handler_if_exists
         end
         if type_internals_handler /= Void then
            from
               i := smart_eiffel.live_type_map.lower
            until
               i > smart_eiffel.live_type_map.upper
            loop
               t := smart_eiffel.live_type_map.item(i).type
               if t.insert_inherit_test(type_internals_handler) /= unrelated_code then
                  collect_internals_handler_for(t, as_internals_from_generating_type)
                  collect_internals_handler_for(t, as_valid_generating_type_for_internals)
                  collect_internals_handler_for(t, as_native_array_internals_from_generating_type)
                  collect_internals_handler_for(t, as_valid_generating_type_for_native_array_internals)
               end
               i := i + 1
            end
         end
      end

feature {}
   type_internals_handler: TYPE

   collect_internals_handler_for (type: TYPE; feature_name: STRING)
      require
         smart_eiffel.status.is_collecting
         type.insert_inherit_test(type_internals_handler) /= unrelated_code
      local
         fs: FEATURE_STAMP; ef: EXTERNAL_FUNCTION
      do
         fs := smart_eiffel.feature_stamp(type_internals_handler, feature_name)
         fs := fs.resolve_static_binding_for(type_internals_handler, type)
         ef ::= fs.anonymous_feature(type)
         ef.collect_internals_handler(type, feature_name)
      end

   wrap (wrapped: CODE): NO_INVARIANT_WRAPPER
      do
         if wrapped /= Void then
            create Result.make(wrapped)
         end
      ensure
         (wrapped = Void) = (Result = Void)
      end

   simplify_and_wrap (wrapped: OTHER_INSPECT_STATEMENT): NO_INVARIANT_WRAPPER
      do
         if wrapped /= Void then
            create Result.make(wrapped)
         else
            Result ?= external_routine.routine_body
         end
      end

   internals_of (target: EXPRESSION; target_tm: TYPE_MARK; container: EXPRESSION; result_variable: RESULT): INSTRUCTION
      require
         target /= Void
         -- target_tm is "the" type_mark of target
         container /= Void
      local
         for_object_fn, capacity_fn: FEATURE_NAME
         native_array_internals_type_mark: TYPE_MARK
         capacity: FUNCTION_CALL_0
         args: EFFECTIVE_ARG_LIST_N
         internals_creation_call: PROCEDURE_CALL_N
         internals_creation: CREATE_INSTRUCTION
         to_internals_fn: FEATURE_NAME
         internals: FUNCTION_CALL_0
         assignment: ASSIGNMENT
         e_void: E_VOID
         neq: BUILT_IN_EQ_NEQ
         if_then: IFTHEN
      do
         if target_tm.is_native_array then
            create for_object_fn.simple_feature_name(as_for_object, start_position)
            create capacity_fn.simple_feature_name(as_capacity, start_position)
            create capacity.make(container, capacity_fn)
            native_array_internals_type_mark := target_tm.typed_internals_type_mark(start_position)
            create args.make_2(start_position, target, capacity)
            create internals_creation_call.make(result_variable, for_object_fn, args)
            create internals_creation.make(start_position, native_array_internals_type_mark,
                                           result_variable, internals_creation_call)
            Result := internals_creation
         else
            create to_internals_fn.simple_feature_name(as_to_internals, start_position)
            create internals.make(target, to_internals_fn)
            create assignment.make(result_variable, internals)
            if target_tm.is_expanded then
               Result := assignment
            else
               create e_void.make(start_position)
               create neq.make_neq(target, start_position, e_void)
               create if_then.make(start_position, neq, assignment)
               Result := if_then
            end
         end
      end

   set_and_specialize_body (lv: LOCAL_VAR_LIST; rb: INSTRUCTION)
      local
         local_vars, lv_memory: LOCAL_VAR_LIST; clv_memory: FAST_ARRAY[LOCAL_VAR_LIST]
         routine_body: INSTRUCTION
      do
         if lv /= Void then
            local_vars := lv.specialize_in(new_type)
         end
         lv_memory := smart_eiffel.specializing_feature_local_var_list
         clv_memory := smart_eiffel.specializing_closure_local_var_lists
         smart_eiffel.set_specializing_feature_variables(local_vars, Void)
         if rb /= Void then
            routine_body := rb.specialize_in(new_type)
         end
         external_routine := external_routine.current_or_twin_init(local_vars, Void, Void, routine_body, True,
                                                                   external_routine.ensure_assertion,
                                                                   external_routine.require_assertion,
                                                                   can_twin)
         check
            smart_eiffel.specializing_feature_local_var_list = local_vars
            smart_eiffel.specializing_closure_local_var_lists = Void
         end
         smart_eiffel.set_specializing_feature_variables(lv_memory, clv_memory)
      end

   start_new_body_for (er: EXTERNAL_ROUTINE; nt: like new_type; ct: like can_twin)
      local
         capacity_hs: HASHED_STRING
         capacity_fs: FEATURE_STAMP
         capacity_af: ANONYMOUS_FEATURE
         native_array_type_mark: NATIVE_ARRAY_TYPE_MARK
      do
         external_routine := er
         new_type := nt
         can_twin := ct
         native_array_element_type := Void
         if nt.class_text.name.to_string = as_typed_internals then
            target_type := nt.generic_list.first
         elseif nt.class_text.name.to_string = as_native_array_internals then
            native_array_element_type := nt.generic_list.first
            create native_array_type_mark.make(start_position, native_array_element_type.canonical_type_mark)
            target_type := smart_eiffel.get_type(native_array_type_mark, False)
         else
            check
               er.class_text.name.to_string = as_internals_handler
                  or er.first_name.to_string = as_to_internals
            end
            target_type := Void
         end
         has_capacity := False
         if target_type /= Void then
            capacity_hs := string_aliaser.hashed_string(as_capacity)
            if target_type.has_simple_feature_name(capacity_hs) then
               capacity_fs := target_type.feature_stamp_of(capacity_hs)
               capacity_af := capacity_fs.anonymous_feature(target_type)
               has_capacity := capacity_af.arguments = Void and then capacity_af.result_type.is_integer
            end
         end
      ensure
         external_routine = er
         new_type = nt
         can_twin = ct
      end

   is_introspectable_attribute_type (tm: TYPE_MARK): BOOLEAN
      require
         target_type /= Void
         tm.is_static
      do
         Result := is_introspectable_static_type(tm)
            and then (tm.is_native_array implies has_capacity)
      end

   is_introspectable_static_type (tm: TYPE_MARK): BOOLEAN
      require
         tm.is_static
      do
         Result := not (tm.is_agent or else tm.written_mark = as_typed_internals
                        or else tm.written_mark = as_native_array_internals)
      end

   is_introspectable_dynamic_type (tm: TYPE_MARK): BOOLEAN
      require
         tm.is_static
      do
         Result := is_introspectable_static_type(tm) and then not tm.type.is_deferred
      end

   external_routine: EXTERNAL_ROUTINE

   new_type: TYPE

   target_type: TYPE

   native_array_element_type: TYPE

   can_twin: BOOLEAN

   has_capacity: BOOLEAN

   start_position: POSITION
      do
         Result := external_routine.start_position
      ensure
         Result = external_routine.start_position
      end

   arguments: FORMAL_ARG_LIST
      do
         Result := external_routine.arguments
      ensure
         Result = external_routine.arguments
      end

   internals_from_generating_type_position: POSITION

   native_array_internals_from_generating_type_position: POSITION

   native_array_internals_from_generating_type_args: EFFECTIVE_ARG_LIST_N

feature {}
   -- Generate code for all writable attributes. Dead attributes will be sorted out during the adapt phase.
   specialize_body_for_type_attribute_name
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         result_variable: RESULT
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         manifest_string: MANIFEST_STRING
         assignment: ASSIGNMENT
         when_clause: WHEN_CLAUSE
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 1, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create result_variable.make(start_position)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               if is_introspectable_attribute_type(af.result_type.to_static(target_type, False)) then
                  create when_clause.make_strippable(inspect_statement, fs)
                  create manifest_string.from_identifier(start_position, target_type.get_feature_name(fs).name)
                  create assignment.make(result_variable, manifest_string)
                  when_clause.set_compound(assignment)
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_object_attribute
      require
         new_type.class_text.name.to_string = as_typed_internals
         new_type.generic_list.count = 1
         target_type = new_type.generic_list.first
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         result_variable: RESULT
         implicit_current: IMPLICIT_CURRENT
         fn: FEATURE_NAME
         object_memory: FUNCTION_CALL_0
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         tm: TYPE_MARK
         an_attribute: FUNCTION_CALL_0
         compound: INSTRUCTION
         when_clause: WHEN_CLAUSE
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 1, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create result_variable.make(start_position)
            create implicit_current.make(start_position)
            implicit_current.force_declaration_type(new_type)
            create fn.simple_feature_name(as_object_memory, start_position)
            create object_memory.make(implicit_current, fn)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               tm := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(tm) then
                  create fn.ordinary_name(target_type.get_feature_name(fs).name, start_position)
                  create an_attribute.make(object_memory, fn)
                  compound := internals_of(an_attribute, tm, object_memory, result_variable)
                  create when_clause.make_strippable(inspect_statement, fs)
                  when_clause.set_compound(compound)
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_set_object_attribute
      require
         new_type.class_text.name.to_string = as_typed_internals
         new_type.generic_list.count = 1
         target_type = new_type.generic_list.first
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         implicit_current: IMPLICIT_CURRENT
         e_void: E_VOID
         object_memory_fn: FEATURE_NAME
         object_memory: FUNCTION_CALL_0
         declarations: ARRAY[DECLARATION]
         i, j: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         attribute_type_mark: TYPE_MARK
         var_name: STRING
         local_var1: LOCAL_NAME_DEF
         tm: TYPE_MARK
         declaration: DECLARATION_1
         lv: LOCAL_VAR_LIST
         when_clause: WHEN_CLAUSE
         local_var2: LOCAL_NAME_REF
         assignment_attempt: ASSIGNMENT_ATTEMPT
         arg_object_memory, arg_capacity: FUNCTION_CALL_0
         fn: FEATURE_NAME
         an_attribute, capacity: STATIC_CALL_0_C
         assignment, assignment2: ASSIGNMENT
         compound: COMPOUND
         neq: BUILT_IN_EQ_NEQ
         if_then_else: IFTHENELSE
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 2, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create implicit_current.make(start_position)
            implicit_current.force_declaration_type(new_type)
            create e_void.make(start_position)
            create object_memory_fn.simple_feature_name(as_object_memory, start_position)
            create object_memory.make(implicit_current, object_memory_fn)
            create arg.refer_to(start_position, arguments, 1, 0)
            create declarations.with_capacity(feature_stamps.count, 1)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               attribute_type_mark := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(attribute_type_mark) then
                  var_name := once ""
                  var_name.copy(once "ti_")
                  var_name.append(target_type.get_feature_name(fs).to_string)
                  create local_var1.make(start_position, var_name)
                  tm := attribute_type_mark.typed_internals_type_mark(start_position)
                  create declaration.make(local_var1, tm)
                  declarations.add_last(declaration)
               end
               i := i + 1
            end
            if not declarations.is_empty then
               check
                  feature_stamps.lower = declarations.lower
                  feature_stamps.upper >= declarations.upper
               end
               create lv.make(start_position, declarations)
               from
                  i := feature_stamps.lower
                  j := i
               until
                  i > feature_stamps.upper
               loop
                  fs := feature_stamps.item(i)
                  af := fs.anonymous_feature(target_type)
                  attribute_type_mark := af.result_type.to_static(target_type, False)
                  if is_introspectable_attribute_type(attribute_type_mark) then
                     create when_clause.make_strippable(inspect_statement, fs)
                     create local_var2.refer_to(start_position, lv, j, 0)
                     create assignment_attempt.make(local_var2, arg, True)
                     create arg_object_memory.make(local_var2, object_memory_fn)
                     create fn.ordinary_name(target_type.get_feature_name(fs).name, start_position)
                     create an_attribute.make(object_memory, fn)
                     create assignment.inline_make(an_attribute, arg_object_memory)
                     if attribute_type_mark.is_native_array then
                        create fn.simple_feature_name(as_capacity, start_position)
                        create capacity.make(object_memory, fn)
                        create arg_capacity.make(local_var2, fn)
                        create assignment2.inline_make(capacity, arg_capacity)
                        create compound.make_3(assignment_attempt, assignment, assignment2)
                     else
                        create compound.make_2(assignment_attempt, assignment)
                     end
                     if attribute_type_mark.is_expanded then
                        when_clause.set_compound(compound)
                     else
                        create neq.make_neq(arg, start_position, e_void)
                        create assignment2.inline_make(an_attribute, e_void)
                        create if_then_else.with_else(start_position, neq, compound, assignment2)
                        when_clause.set_compound(if_then_else)
                     end
                     j := j + 1
                  end
                  i := i + 1
               end
            end
         end
         if inspect_statement /= Void then
            set_and_specialize_body(lv, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_type_is_expanded
      local
         result_variable: RESULT
         bool: E_TRUE
         assignment: ASSIGNMENT
      do
         if target_type.is_expanded then
            create result_variable.make(start_position)
            create bool.make(start_position)
            create assignment.make(result_variable, bool)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_type_attribute_is_expanded
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         attribute_type_mark: TYPE_MARK
         when_clause: WHEN_CLAUSE
         result_variable: RESULT
         bool: E_TRUE
         assignment: ASSIGNMENT
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 1, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               attribute_type_mark := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(attribute_type_mark) then
                  create when_clause.make_strippable(inspect_statement, fs)
                  if attribute_type_mark.is_expanded then
                     if assignment = Void then
                        create result_variable.make(start_position)
                        create bool.make(start_position)
                        create assignment.make(result_variable, bool)
                     end
                     when_clause.set_compound(assignment)
                  end
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_type_can_be_assigned_to_attribute
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         attribute_type_mark: TYPE_MARK
         tm: TYPE_MARK
         when_clause: WHEN_CLAUSE
         assignment_test: ASSIGNMENT_TEST
         e_void: E_VOID
         neq: BUILT_IN_EQ_NEQ
         and_then: CALL_INFIX_AND_THEN
         assignment: ASSIGNMENT
         result_variable: RESULT
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 2, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create arg.refer_to(start_position, arguments, 1, 0)
            create result_variable.make(start_position)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               attribute_type_mark := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(attribute_type_mark) then
                  tm := attribute_type_mark.typed_internals_type_mark(start_position)
                  create when_clause.make_strippable(inspect_statement, fs)
                  create assignment_test.with_type_mark(tm, arg)
                  if attribute_type_mark.is_expanded then
                     if e_void = Void then
                        create e_void.make(start_position)
                     end
                     create neq.make_neq(arg, start_position, e_void)
                     create and_then.make(neq, start_position, assignment_test)
                     create assignment.make(result_variable, and_then)
                  else
                     create assignment.make(result_variable, assignment_test)
                  end
                  when_clause.set_compound(assignment)
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_make_blank
      local
         object_memory: WRITABLE_ATTRIBUTE_NAME
         create_instruction: RAW_CREATE_INSTRUCTION
      do
         create object_memory.make(string_aliaser.hashed_string(as_object_memory), start_position)
         create create_instruction.make(start_position, Void, object_memory)
         set_and_specialize_body(Void, create_instruction)
      end

   specialize_body_for_type_generating_type
      local
         static_generating_type: GENERATOR_GENERATING_TYPE
         result_variable: RESULT
         assignment: ASSIGNMENT
      do
         create static_generating_type.make_generating_type(start_position, target_type)
         create result_variable.make(start_position)
         create assignment.make(result_variable, static_generating_type)
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_type_generator
      local
         static_generator: GENERATOR_GENERATING_TYPE
         result_variable: RESULT
         assignment: ASSIGNMENT
      do
         create static_generator.make_generator(start_position, target_type)
         create result_variable.make(start_position)
         create assignment.make(result_variable, static_generator)
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_is_equal
      local
         implicit_current: IMPLICIT_CURRENT
         object_memory_fn: FEATURE_NAME
         object_memory: FUNCTION_CALL_0
         arg: ARGUMENT_NAME_REF
         arg_object_memory: FUNCTION_CALL_0
         eq: BUILT_IN_EQ_NEQ
         result_variable: RESULT
         assignment: ASSIGNMENT
      do
         create implicit_current.make(start_position)
         create object_memory_fn.simple_feature_name(as_object_memory, start_position)
         create object_memory.make(implicit_current, object_memory_fn)
         create arg.refer_to(start_position, arguments, 1, 0)
         create arg_object_memory.make(arg, object_memory_fn)
         create eq.make_eq(object_memory, start_position, arg_object_memory)
         create result_variable.make(start_position)
         create assignment.make(result_variable, eq)
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_object_as_pointer
      require
         new_type.class_text.name.to_string = as_typed_internals
         new_type.generic_list.count = 1
         target_type = new_type.generic_list.first
      local
         implicit_current: IMPLICIT_CURRENT
         object_memory_fn: FEATURE_NAME
         object_memory: FUNCTION_CALL_0
         to_pointer_fn: FEATURE_NAME
         object_memory_to_pointer: FUNCTION_CALL_0
         result_variable: RESULT
         assignment: ASSIGNMENT
      do
         if target_type.is_expanded implies target_type.is_native_array then
            create implicit_current.make(start_position)
            create object_memory_fn.simple_feature_name(as_object_memory, start_position)
            create object_memory.make(implicit_current, object_memory_fn)
            create to_pointer_fn.simple_feature_name(as_to_pointer, start_position)
            create object_memory_to_pointer.make(object_memory, to_pointer_fn)
            create result_variable.make(start_position)
            create assignment.make(result_variable, object_memory_to_pointer)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_type_attribute_generating_type
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         result_variable: RESULT
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         type_mark: TYPE_MARK
         static_generating_type: GENERATOR_GENERATING_TYPE
         assignment: ASSIGNMENT
         when_clause: WHEN_CLAUSE
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 1, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create result_variable.make(start_position)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               type_mark := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(type_mark) then
                  create when_clause.make_strippable(inspect_statement, fs)
                  create static_generating_type.make_generating_type(start_position, type_mark.type)
                  create assignment.make(result_variable, static_generating_type)
                  when_clause.set_compound(assignment)
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_type_attribute_generator
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         arg: ARGUMENT_NAME_REF
         inspect_statement: OTHER_INSPECT_STATEMENT
         result_variable: RESULT
         i: INTEGER
         fs: FEATURE_STAMP
         af: ANONYMOUS_FEATURE
         type_mark: TYPE_MARK
         static_generator: GENERATOR_GENERATING_TYPE
         assignment: ASSIGNMENT
         when_clause: WHEN_CLAUSE
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create arg.refer_to(start_position, arguments, 1, 0)
            create inspect_statement.make_strippable(start_position, arg, target_type)
            create result_variable.make(start_position)
            from
               i := feature_stamps.lower
            until
               i > feature_stamps.upper
            loop
               fs := feature_stamps.item(i)
               af := fs.anonymous_feature(target_type)
               type_mark := af.result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(type_mark) then
                  create when_clause.make_strippable(inspect_statement, fs)
                  create static_generator.make_generator(start_position, type_mark.type)
                  create assignment.make(result_variable, static_generator)
                  when_clause.set_compound(assignment)
               end
               i := i + 1
            end
         end
         if inspect_statement /= Void and then inspect_statement.when_list /= Void then
            set_and_specialize_body(Void, inspect_statement)
         else
            set_and_specialize_body(Void, Void)
         end
      end

   specialize_body_for_type_attribute_count
      local
         feature_stamps: ARRAY[FEATURE_STAMP]
         result_variable: RESULT
         count: INTEGER_CONSTANT
         assignment: ASSIGNMENT
      do
         feature_stamps := target_type.writable_attributes
         if not feature_stamps.is_empty then
            create result_variable.make(start_position)
            create count.make(Maximum_integer, start_position)
            create assignment.make(result_variable, count)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_attribute_count
      local
         result_variable: RESULT
         implicit_current: IMPLICIT_CURRENT
         fn: FEATURE_NAME
         capacity: FUNCTION_CALL_0
         assignment: ASSIGNMENT
      do
         if is_introspectable_attribute_type(native_array_element_type.canonical_type_mark) then
            create result_variable.make(start_position)
            create implicit_current.make(start_position)
            create fn.simple_feature_name(as_capacity, start_position)
            create capacity.make(implicit_current, fn)
            create assignment.make(result_variable, capacity)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_object_attribute
      local
         element_type_mark: TYPE_MARK
         result_variable: RESULT
         implicit_current: IMPLICIT_CURRENT
         fn: FEATURE_NAME
         object: FUNCTION_CALL_0
         arg: ARGUMENT_NAME_REF
         one: INTEGER_CONSTANT
         i: CALL_INFIX_MINUS
         args: EFFECTIVE_ARG_LIST_N
         item: FUNCTION_CALL_1
         assignment: INSTRUCTION
      do
         element_type_mark := native_array_element_type.canonical_type_mark
         if is_introspectable_attribute_type(element_type_mark) then
            create result_variable.make(start_position)
            create implicit_current.make(start_position)
            create fn.simple_feature_name(as_object_memory, start_position)
            create object.make(implicit_current, fn)
            create fn.simple_feature_name(as_item, start_position)
            create arg.refer_to(start_position, arguments, 1, 0)
            create one.make(1, start_position)
            create i.make(arg, start_position, one)
            create args.make_1(start_position, i)
            create item.make(object, fn, args)
            assignment := internals_of(item, element_type_mark, object, result_variable)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_set_object_attribute
      local
         item_type_mark: TYPE_MARK
         var_name: STRING
         local_var1: LOCAL_NAME_DEF
         tm: TYPE_MARK
         declaration: DECLARATION_1
         declarations: ARRAY[DECLARATION]
         lv: LOCAL_VAR_LIST
         local_var2: LOCAL_NAME_REF
         arg1, arg2: ARGUMENT_NAME_REF
         assignment_attempt: ASSIGNMENT_ATTEMPT
         fn: FEATURE_NAME
         one: INTEGER_CONSTANT
         object: FUNCTION_CALL_0
         i: CALL_INFIX_MINUS
         args: EFFECTIVE_ARG_LIST_N
         implicit_current: IMPLICIT_CURRENT
         set_item: PROCEDURE_CALL_N
         compound: COMPOUND
         new_body: INSTRUCTION
         e_void: E_VOID
         neq: BUILT_IN_EQ_NEQ
         if_then_else: IFTHENELSE
      do
         item_type_mark := native_array_element_type.canonical_type_mark
         if is_introspectable_attribute_type(item_type_mark) then
            var_name := once "ti"
            create local_var1.make(start_position, var_name)
            tm := item_type_mark.typed_internals_type_mark(start_position)
            create declaration.make(local_var1, tm)
            declarations := {ARRAY[DECLARATION]1, <<declaration>>}
            create lv.make(start_position, declarations)
            create local_var2.refer_to(start_position, lv, 1, 0)
            create arg1.refer_to(start_position, arguments, 1, 0)
            create arg2.refer_to(start_position, arguments, 2, 0)
            create assignment_attempt.make(local_var2, arg1, True)
            create fn.simple_feature_name(as_object_memory, start_position)
            create object.make(local_var2, fn)
            create one.make(1, start_position)
            create i.make(arg2, start_position, one)
            create args.make_2(start_position, object, i)
            create implicit_current.make(start_position)
            create object.make(implicit_current, fn)
            create fn.simple_feature_name(as_put, start_position)
            create set_item.make(object, fn, args)
            create compound.make_2(assignment_attempt, set_item)
            if item_type_mark.is_expanded then
               check
                  not item_type_mark.is_native_array
               end
               new_body := compound
            else
               create e_void.make(start_position)
               create neq.make_neq(arg1, start_position, e_void)
               create args.make_2(start_position, e_void, i)
               create set_item.make(object, fn, args)
               create if_then_else.with_else(start_position, neq, compound, set_item)
               new_body := if_then_else
            end
         end
         set_and_specialize_body(lv, new_body)
      end

   specialize_body_for_na_type_item_is_expanded
      local
         result_variable: RESULT
         bool: E_TRUE
         assignment: ASSIGNMENT
      do
         if native_array_element_type.is_expanded then
            create result_variable.make(start_position)
            create bool.make(start_position)
            create assignment.make(result_variable, bool)
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_type_can_be_assigned_to_item
      local
         item_type_mark: TYPE_MARK
         arg: ARGUMENT_NAME_REF
         tm: TYPE_MARK
         assignment_test: ASSIGNMENT_TEST
         e_void: E_VOID
         neq: BUILT_IN_EQ_NEQ
         and_then: CALL_INFIX_AND_THEN
         assignment: ASSIGNMENT
         result_variable: RESULT
      do
         item_type_mark := native_array_element_type.canonical_type_mark
         if is_introspectable_attribute_type(item_type_mark) then
            create arg.refer_to(start_position, arguments, 1, 0)
            tm := item_type_mark.typed_internals_type_mark(start_position)
            create assignment_test.with_type_mark(tm, arg)
            create result_variable.make(start_position)
            if item_type_mark.is_expanded then
               create e_void.make(start_position)
               create neq.make_neq(arg, start_position, e_void)
               create and_then.make(neq, start_position, assignment_test)
               create assignment.make(result_variable, and_then)
            else
               create assignment.make(result_variable, assignment_test)
            end
         end
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_make_blank
      local
         object_memory: WRITABLE_ATTRIBUTE_NAME
         implicit_current: IMPLICIT_CURRENT
         object_memory_target: FUNCTION_CALL_0
         fn: FEATURE_NAME
         arg: ARGUMENT_NAME_REF
         args: EFFECTIVE_ARG_LIST_N
         call: FUNCTION_CALL_1
         assignemnt_1: ASSIGNMENT
         capacity: WRITABLE_ATTRIBUTE_NAME
         assignemnt_2: ASSIGNMENT
         compound: COMPOUND
      do
         create object_memory.make(string_aliaser.hashed_string(as_object_memory), start_position)
         create implicit_current.make(start_position)
         create fn.simple_feature_name(as_object_memory, start_position)
         create object_memory_target.make(implicit_current, fn)
         create fn.simple_feature_name(as_calloc, start_position)
         create arg.refer_to(start_position, arguments, 1, 0)
         create args.make_1(start_position, arg)
         create call.make(object_memory_target, fn, args)
         create assignemnt_1.make(object_memory, call)
         create capacity.make(string_aliaser.hashed_string(as_capacity), start_position)
         create assignemnt_2.make(capacity, arg)
         create compound.make_2(assignemnt_1, assignemnt_2)
         set_and_specialize_body(Void, compound)
      end

   specialize_body_for_na_type_item_generator
      local
         result_variable: RESULT
         static_generator: GENERATOR_GENERATING_TYPE
         assignment: ASSIGNMENT
      do
         create result_variable.make(start_position)
         create static_generator.make_generator(start_position, native_array_element_type)
         create assignment.make(result_variable, static_generator)
         set_and_specialize_body(Void, assignment)
      end

   specialize_body_for_na_type_item_generating_type
      local
         result_variable: RESULT
         static_generating_type: GENERATOR_GENERATING_TYPE
         assignment: ASSIGNMENT
      do
         create result_variable.make(start_position)
         create static_generating_type.make_generating_type(start_position, native_array_element_type)
         create assignment.make(result_variable, static_generating_type)
         set_and_specialize_body(Void, assignment)
      end

feature {}
   specialize_and_check_body (body: INSTRUCTION): INSTRUCTION
      local
         old_lvl: LOCAL_VAR_LIST; old_clvl: FAST_ARRAY[LOCAL_VAR_LIST]
         old_fal: FORMAL_ARG_LIST; old_cfal: FAST_ARRAY[FORMAL_ARG_LIST]
      do
         old_lvl := smart_eiffel.specializing_feature_local_var_list
         old_clvl := smart_eiffel.specializing_closure_local_var_lists
         old_fal := smart_eiffel.specializing_feature_arguments_list
         old_cfal := smart_eiffel.specializing_closure_arguments_lists
         smart_eiffel.set_specializing_feature_variables(Void, Void)
         smart_eiffel.set_specializing_feature_arguments(arguments, Void)
         Result := body.specialize_and_check(new_type)
         smart_eiffel.set_specializing_feature_variables(old_lvl, old_clvl)
         smart_eiffel.set_specializing_feature_arguments(old_fal, old_cfal)
      end

   finalized_body_for_internals_from_generating_type: OTHER_INSPECT_STATEMENT
      local
         when_list: FAST_ARRAY[WHEN_CLAUSE]
         original_when_clause, when_clause: WHEN_CLAUSE
         original_when_item, when_item: WHEN_ITEM_1
         original_manifest_string, manifest_string: MANIFEST_STRING
         original_type_name: STRING
         live_types: TRAVERSABLE[LIVE_TYPE]
         i: INTEGER
         live_type: LIVE_TYPE
         type_name: HASHED_STRING
         create_instruction: INSTRUCTION
         when_item_list: FAST_ARRAY[WHEN_ITEM]
      do
         Result ?= external_routine.routine_body
         if Result /= Void then
            when_list := Result.when_list
            original_when_clause := when_list.first
            if original_when_clause.compound = Void then
               smart_eiffel.magic_count_increment
               when_list.clear_count
               original_when_item ::= original_when_clause.list.first
               original_manifest_string ::= original_when_item.expression
               original_type_name := original_manifest_string.to_string
               live_types := smart_eiffel.live_type_map
               from
                  i := live_types.lower
               until
                  i > live_types.upper
               loop
                  live_type := live_types.item(i)
                  create_instruction := live_type.create_blank_internals_instruction
                  if create_instruction /= Void and then not live_type.is_native_array then
                     check
                        live_type.at_run_time
--                        is_introspectable_attribute_type(live_type.canonical_type_mark)
                     end
                     type_name := live_type.name
                     if original_type_name = type_name.to_string then
                        original_when_clause.set_compound(create_instruction)
                        when_list.add_last(original_when_clause)
                     else
                        when_clause := original_when_clause.twin
                        create when_item_list.with_capacity(1)
                        when_clause.init(create_instruction, when_item_list)
                        create manifest_string.from_identifier(start_position, type_name)
                        when_item := original_when_item.twin
                        when_item.init(manifest_string)
                        when_item_list.add_last(when_item)
                        when_list.add_last(when_clause)
                     end
                  end
                  i := i + 1
               end
               if when_list.is_empty then
                  Result := Void
               else
                  Result ::= specialize_and_check_body(Result)
               end
            end
         end
      end

   finalized_body_for_valid_generating_type_for_internals: OTHER_INSPECT_STATEMENT
      local
         when_list: FAST_ARRAY[WHEN_CLAUSE]
         original_when_clause, when_clause: WHEN_CLAUSE
         original_when_item, when_item: WHEN_ITEM_1
         original_manifest_string, manifest_string: MANIFEST_STRING
         original_type_name: STRING
         live_types: TRAVERSABLE[LIVE_TYPE]
         i: INTEGER
         live_type: LIVE_TYPE
         type_name: HASHED_STRING
         boolean_type_mark: BOOLEAN_TYPE_MARK
         e_result: RESULT
         bool: E_TRUE
         assignment: ASSIGNMENT
         when_item_list: FAST_ARRAY[WHEN_ITEM]
      do
         Result ?= external_routine.routine_body
         if Result /= Void then
            when_list := Result.when_list
            original_when_clause := when_list.first
            if original_when_clause.compound /= Void then
               --echo.put_line(once ">>>> valid_generating_type_for_internals: original clause already exists, skipping code customization")
            else
               smart_eiffel.magic_count_increment
               when_list.clear_count
               original_when_item ::= original_when_clause.list.first
               original_manifest_string ::= original_when_item.expression
               original_type_name := original_manifest_string.to_string
               create e_result.make(start_position)
               create boolean_type_mark.make(start_position)
               e_result.set_type_mark_memory(boolean_type_mark)
               create bool.make(start_position)
               create assignment.make(e_result, bool)
               live_types := smart_eiffel.live_type_map
               from
                  i := live_types.lower
               until
                  i > live_types.upper
               loop
                  live_type := live_types.item(i)
                  if not live_type.create_blank_internals_used then
                     --echo.put_line(once ">>>> valid_generating_type_for_internals: #(1) does NOT create blank_internals" # live_type.name.to_string)
                  elseif live_type.is_native_array then
                     --echo.put_line(once ">>>> valid_generating_type_for_internals: #(1) is a native array" # live_type.name.to_string)
                  else
                     --echo.put_line(once ">>>> valid_generating_type_for_internals: #(1) does create blank_internals" # live_type.name.to_string)
                     check
                        live_type.at_run_time
                        live_type.create_blank_internals_instruction /= Void
--                        is_introspectable_attribute_type(live_type.canonical_type_mark)
                     end
                     type_name := live_type.name
                     if original_type_name = type_name.to_string then
                        --echo.put_line(once "     => name is original, setting original when clause")
                        original_when_clause.set_compound(assignment)
                        when_list.add_last(original_when_clause)
                     else
                        --echo.put_line(once "     => new name, adding new when clause")
                        when_clause := original_when_clause.twin
                        create when_item_list.with_capacity(1)
                        when_clause.init(assignment, when_item_list)
                        create manifest_string.from_identifier(start_position, type_name)
                        when_item := original_when_item.twin
                        when_item.init(manifest_string)
                        when_item_list.add_last(when_item)
                        when_list.add_last(when_clause)
                     end
                  end
                  i := i + 1
               end
               if not when_list.is_empty then
                  Result.set_else_compound(start_position, Void)
                  Result ::= specialize_and_check_body(Result)
               else
                  Result := Void
               end
            end
         end
      end

   finalized_body_for_na_internals_from_generating_type: OTHER_INSPECT_STATEMENT
      local
         when_list: FAST_ARRAY[WHEN_CLAUSE]
         original_when_clause, when_clause: WHEN_CLAUSE
         original_when_item, when_item: WHEN_ITEM_1
         original_manifest_string, manifest_string: MANIFEST_STRING
         original_type_name: STRING
         live_types: TRAVERSABLE[LIVE_TYPE]
         i: INTEGER
         live_type: LIVE_TYPE
         type_name: HASHED_STRING
         create_instruction: INSTRUCTION
         when_item_list: FAST_ARRAY[WHEN_ITEM]
      do
         Result ?= external_routine.routine_body
         if Result /= Void then
            when_list := Result.when_list
            original_when_clause := when_list.first
            if original_when_clause.compound = Void then
               smart_eiffel.magic_count_increment
               when_list.clear_count
               original_when_item ::= original_when_clause.list.first
               original_manifest_string ::= original_when_item.expression
               original_type_name := original_manifest_string.to_string
               live_types := smart_eiffel.live_type_map
               from
                  i := live_types.lower
               until
                  i > live_types.upper
               loop
                  live_type := live_types.item(i)
                  create_instruction := live_type.create_blank_internals_instruction
                  if create_instruction /= Void and then live_type.is_native_array then
                     check
                        live_type.at_run_time
--                        is_introspectable_attribute_type(live_type.canonical_type_mark)
                     end
                     type_name := live_type.name
                     if original_type_name = type_name.to_string then
                        original_when_clause.set_compound(create_instruction)
                        when_list.add_last(original_when_clause)
                     else
                        when_clause := original_when_clause.twin
                        create when_item_list.with_capacity(1)
                        when_clause.init(create_instruction, when_item_list)
                        create manifest_string.from_identifier(start_position, type_name)
                        when_item := original_when_item.twin
                        when_item.init(manifest_string)
                        when_item_list.add_last(when_item)
                        when_list.add_last(when_clause)
                     end
                  end
                  i := i + 1
               end
               if not when_list.is_empty then
                  Result ::= specialize_and_check_body(Result)
               else
                  Result := Void
               end
            end
         end
      end

   finalized_body_for_valid_generating_type_for_na_internals: OTHER_INSPECT_STATEMENT
      local
         when_list: FAST_ARRAY[WHEN_CLAUSE]
         original_when_clause, when_clause: WHEN_CLAUSE
         original_when_item, when_item: WHEN_ITEM_1
         original_manifest_string, manifest_string: MANIFEST_STRING
         original_type_name: STRING
         live_types: TRAVERSABLE[LIVE_TYPE]
         i: INTEGER
         live_type: LIVE_TYPE
         type_name: HASHED_STRING
         boolean_type_mark: BOOLEAN_TYPE_MARK
         e_result: RESULT
         bool: E_TRUE
         assignment: ASSIGNMENT
         when_item_list: FAST_ARRAY[WHEN_ITEM]
      do
         Result ?= external_routine.routine_body
         if Result /= Void then
            when_list := Result.when_list
            original_when_clause := when_list.first
            if original_when_clause.compound = Void then
               smart_eiffel.magic_count_increment
               when_list.clear_count
               original_when_item ::= original_when_clause.list.first
               original_manifest_string ::= original_when_item.expression
               original_type_name := original_manifest_string.to_string
               create e_result.make(start_position)
               create boolean_type_mark.make(start_position)
               e_result.set_type_mark_memory(boolean_type_mark)
               create bool.make(start_position)
               create assignment.make(e_result, bool)
               live_types := smart_eiffel.live_type_map
               from
                  i := live_types.lower
               until
                  i > live_types.upper
               loop
                  live_type := live_types.item(i)
                  if live_type.create_blank_internals_instruction /= Void and then live_type.is_native_array then
                     check
                        live_type.at_run_time
                        is_introspectable_attribute_type(live_type.canonical_type_mark)
                     end
                     type_name := live_type.name
                     if original_type_name = type_name.to_string then
                        original_when_clause.set_compound(assignment)
                        when_list.add_last(original_when_clause)
                     else
                        when_clause := original_when_clause.twin
                        create when_item_list.with_capacity(1)
                        when_clause.init(assignment, when_item_list)
                        create manifest_string.from_identifier(start_position, type_name)
                        when_item := original_when_item.twin
                        when_item.init(manifest_string)
                        when_item_list.add_last(when_item)
                        when_list.add_last(when_clause)
                     end
                  end
                  i := i + 1
               end
               if not when_list.is_empty then
                  Result.set_else_compound(start_position, Void)
                  Result ::= specialize_and_check_body(Result)
               else
                  Result := Void
               end
            end
         end
      end

   finalized_body_for_type_attribute_count: INSTRUCTION
      require
         new_type.class_text.name.to_string = as_typed_internals
         new_type.generic_list.count = 1
      local
         live_type: LIVE_TYPE
         writable_attributes: ARRAY[RUN_FEATURE_2]
         i, count: INTEGER
         tm: TYPE_MARK
         integer_type_mark: INTEGER_TYPE_MARK
         assignment: ASSIGNMENT; compound: COMPOUND
         integer_constant: INTEGER_CONSTANT
      do
         live_type := target_type.live_type
         writable_attributes := live_type.writable_attributes
         if writable_attributes /= Void then
            from
               i := writable_attributes.lower
            until
               i > writable_attributes.upper
            loop
               tm := writable_attributes.item(i).result_type.to_static(target_type, False)
               if is_introspectable_attribute_type(tm) then
                  count := count + 1
               end
               i := i + 1
            end
         end
         if count > 0 then
            if compound ?:= external_routine.routine_body then
               compound ::= external_routine.routine_body
               if assignment ?:= compound.first then
                  assignment ::= compound.first
                  check
                     {SEDB} ?:= compound.item(1)
                  end
               else
                  assignment ::= compound.item(1)
                  check
                     {SEDB} ?:= compound.first
                  end
               end
            else
               assignment ::= external_routine.routine_body
            end
            integer_constant ::= assignment.right_side.twin
            integer_constant.set_value(count)
            create integer_type_mark.integer(start_position)
            integer_constant.set_result_type(integer_type_mark)
            create assignment.make(assignment.left_side, integer_constant)
            Result := specialize_and_check_body(assignment)
         end
      end

feature {LOCAL_VAR_LIST}
   visit_local_var_list (visited: LOCAL_VAR_LIST)
      do
         check
            False
         end
      end

feature {FORMAL_ARG_LIST}
   visit_formal_arg_list (visited: FORMAL_ARG_LIST)
      do
         check
            False
         end
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      do
         check
            False
         end
      end

feature {}
   make
      do
      end

end -- class INTROSPECTION_HANDLER
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
