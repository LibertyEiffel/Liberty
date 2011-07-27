-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
deferred class C_EXPRESSION_COMPILATION_MIXIN[C_->CODE]
   -- Produce the C code to access the value (user's expanded are no longuer pointer).

inherit
   EXPRESSION_VISITOR
      undefine
         is_equal
      end

insert
   C_COMPILATION_MIXIN
      undefine
         is_equal
      end
   PLATFORM
      undefine
         is_equal
      end
   SINGLETON

feature {ANY}
   compile (code: C_; a_type: like type) is
      require
         smart_eiffel.is_ready
         code /= Void
         a_type.live_type /= Void
         cpp.pending_c_function
      local
         old_type: like type
      do
         old_type := type
         type := a_type

         code.accept(Current)

         type := old_type
      end

feature {}
   type: TYPE

   make is
      do
      end

   compile_arg (arg: EXPRESSION) is
      do
         cpp.arg_mapper.compile(arg, type)
      end

   compile_expression (expression: EXPRESSION) is
      do
         cpp.code_compiler.compile(expression, type)
      end

   compile_code (code: CODE) is
      do
         cpp.code_compiler.compile(code, type)
      end

feature {}
   visit_abstract_current (visited: ABSTRACT_CURRENT) is
      do
         if type.is_user_expanded and then not type.is_empty_expanded then
            function_body.extend('*')
         end
         cpp.print_current
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT) is
      do
         visit_abstract_current(visited)
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT) is
      do
         visit_abstract_current(visited)
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF) is
      do
         if visited.local_name /= Void then
            function_body.append(once "/*$*/(void*)&")
            visited.local_name.accept(Current)
         elseif visited.feature_stamp.anonymous_feature(type).is_attribute then
            function_body.append(once "/*$*/(void*)&")
            cpp.code_compiler.compile(visited.calling_code, visited.target_type)
         else
            function_body.append(once "/*$*/((void*)W")
            visited.target_type.id.append_in(function_body)
            function_body.append(visited.feature_stamp.name.to_string)
            function_body.extend(')')
         end
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION) is
      local
         i: INTEGER; boost: BOOLEAN; closed_operand: CLOSED_OPERAND
      do
         visited.mold_id_in(type, function_body)
         function_body.extend('(')
         boost := ace.boost
         if not boost then
            function_body.append(once "&ds")
         end
         if visited.closed_operand_list /= Void then
            from
               i := visited.closed_operand_list.lower
            until
               i > visited.closed_operand_list.upper
            loop
               closed_operand := visited.closed_operand_list.item(i)
               if visited.stored_closed_operand(type, closed_operand) then
                  if function_body.last /= '(' then
                     function_body.extend(',')
                  end
                  compile_arg(closed_operand)
               end
               i := i + 1
            end
         end
         function_body.extend(')')
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION) is
      do
         if agent_pool.agent_creation_collected_flag then
            compile_agent_definition_call(visited)
         else
            --|*** It would be nice to be able to substitute `Current'
            --| with the corresponding VOID_CALL in a final stage, may
            --| be `adapt' in order to really simplify the back end.
            --| (This should be done before `compile_to_c'...)
            --|*** Dom sept 26th 2004 ***
            compile_agent_void_call(visited, visited.start_position, as_item)
         end
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION) is
      do
         crash -- This one must never be called.
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST) is
      local
         left_type, right_type: TYPE
      do
         if visited.left_type_mark /= Void then
            left_type := visited.left_type_mark.resolve_in(type)
         else
            left_type := visited.left_writable.resolve_in(type)
         end
         right_type := visited.right_side.resolve_in(type)
         assignment_test_pool.function_name_in(function_body, left_type, right_type)
         function_body.append(once "((T0*)(")
         compile_expression(visited.right_side)
         function_body.append(once "))")
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ) is
      local
         left_type, right_type: TYPE
      do
         if visited.right_side.is_void then
            if visited.left_side.is_void then
               if visited.eq_flag then
                  function_body.extend('1')
               else
                  function_body.extend('0')
               end
            else
               left_type := visited.left_side.resolve_in(type)
               if left_type.is_expanded then
                  cmp_expanded_with_void(visited)
               else
                  cmp_reference(visited, left_type, Void)
               end
            end
         elseif visited.left_side.is_void then
            if visited.right_side.is_void then
               if visited.eq_flag then
                  function_body.extend('1')
               else
                  function_body.extend('0')
               end
            else
               right_type := visited.right_side.resolve_in(type)
               if right_type.is_expanded then
                  cmp_expanded_with_void(visited)
               else
                  cmp_reference(visited, Void, right_type)
               end
            end
         else
            left_type := visited.left_side.resolve_in(type)
            right_type:= visited.right_side.resolve_in(type)
            if left_type.is_expanded then
               if left_type.is_user_expanded then
                  cmp_user_expanded(visited, left_type)
               elseif left_type.is_kernel_expanded then
                  cmp_basic_eiffel_expanded(visited, right_type, left_type)
               else
                  check
                     left_type.is_native_array
                  end
                  cmp_reference(visited, left_type, right_type)
               end
            else
               cmp_reference(visited, left_type, right_type)
            end
         end
      end

feature {}
   cmp_expanded_with_void (visited: BUILT_IN_EQ_NEQ) is
      require
         visited.left_side.resolve_in(type).is_expanded
      do
         function_body.extend('(')
         compile_expression(visited.left_side)
         function_body.extend(',')
         if visited.eq_flag then
            function_body.extend('0')
         else
            function_body.extend('1')
         end
         function_body.extend(')')
      end

   cmp_reference (visited: BUILT_IN_EQ_NEQ; left_type, right_type: TYPE) is
      do
         function_body.extend('(')
         compile_expression(visited.left_side)
         function_body.extend(')')
         if visited.eq_flag then
            function_body.append(once "==")
         else
            function_body.append(once "!=")
         end
         function_body.append(once "((void*)(")
         compile_expression(visited.right_side)
         function_body.append(once "))")
      end

   cmp_user_expanded (visited: BUILT_IN_EQ_NEQ; user_expanded_type: TYPE) is
      require
         user_expanded_type.is_user_expanded
      local
         mem_id: INTEGER; icl1, icl2: INTERNAL_C_LOCAL
      do
         if user_expanded_type.is_empty_expanded then
            function_body.extend('(')
            compile_expression(visited.left_side)
            function_body.extend(',')
            compile_expression(visited.right_side)
            function_body.extend(',')
            if visited.eq_flag then
               function_body.extend('1')
            else
               function_body.extend('0')
            end
            function_body.extend(')')
         else
            icl1 := cpp.pending_c_function_lock_local(user_expanded_type, once "se_cmp1")
            icl2 := cpp.pending_c_function_lock_local(user_expanded_type, once "se_cmp2")
            mem_id := user_expanded_type.id
            if visited.eq_flag then
               function_body.extend('!')
            end
            function_body.append(once "se_cmpT")
            mem_id.append_in(function_body)
            function_body.append(once "((")
            icl1.append_in(function_body)
            function_body.extend('=')
            compile_expression(visited.left_side)
            function_body.append(once ", &")
            icl1.append_in(function_body)
            function_body.append(once "),(")
            icl2.append_in(function_body)
            function_body.extend('=')
            compile_expression(visited.right_side)
            function_body.append(once ", &")
            icl2.append_in(function_body)
            function_body.append(once "))")
            icl1.unlock
            icl2.unlock
         end
      end

   cmp_basic_eiffel_expanded (visited: BUILT_IN_EQ_NEQ; t1, t2: TYPE) is
      require
         t1.is_kernel_expanded
         t2.is_kernel_expanded
      local
         cast: STRING; type_mark: TYPE_MARK; real_type_mark_1, real_type_mark_2: REAL_TYPE_MARK
      do
         if t1.is_real or else t2.is_real then
            -- Taking the largest one in real_type_mark_1:
            type_mark := t1.canonical_type_mark
            if real_type_mark_1 ?:= type_mark then
               real_type_mark_1 ::= type_mark
               type_mark := t2.canonical_type_mark
               if real_type_mark_2 ?:= type_mark then
                  real_type_mark_2 ::= type_mark
                  if real_type_mark_2.bit_count > real_type_mark_1.bit_count then
                     real_type_mark_1 := real_type_mark_2
                  end
               end
            else
               real_type_mark_1 ::= t2.canonical_type_mark
            end
            cast := once ".........."
            cast.copy(once "((T")
            real_type_mark_1.id.append_in(cast)
            cast.append(once ")(")
         end
         if cast /= Void then
            function_body.append(cast)
         end
         function_body.extend('(')
         compile_expression(visited.left_side)
         if cast /= Void then
            function_body.append(once "))")
         end
         function_body.extend(')')
         if visited.eq_flag then
            function_body.append(once "==")
         else
            function_body.append(once "!=")
         end
         function_body.extend('(')
         if cast /= Void then
            function_body.append(cast)
         end
         compile_expression(visited.right_side)
         function_body.extend(')')
         if cast /= Void then
            function_body.append(once "))")
         end
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND) is
      do
         if visited.is_static then
            -- No field to store such a static value:
            visited.original_capture.accept(Current)
         elseif visited.inside_agent_launcher_flag then
            closed_operand_name_in(visited, function_body)
         else
            -- Well, outside of the agent:
            visited.capture_memory.reference_at(type).accept(Current)
         end
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION) is
      local
         created_type_memory: TYPE
      do
         created_type_memory := visited.created_type(type)
         if created_type_memory.is_reference then
            function_body.append(once "((T0*)")
         end
         create_expression_support(visited, created_type_memory)
         if created_type_memory.is_reference then
            function_body.extend(')')
         end
      end

   create_expression_support (visited: CREATE_EXPRESSION; created_type_memory: TYPE) is
      require
         created_type_memory = visited.created_type(type)
      local
         boost: BOOLEAN; rf: RUN_FEATURE; args: EFFECTIVE_ARG_LIST; id: INTEGER
      do
         id := created_type_memory.live_type.id
         boost := ace.boost
         function_body.append(once "create")
         id.append_in(function_body)
         if visited.call /= Void then
            args := visited.call.arguments
            rf := visited.call.run_feature_for(type)
            function_body.append(rf.name.to_string)
         end
         function_body.extend('(')
         if ace.profile then
            function_body.append(once "&local_profile")
         end
         if not boost then
            if ace.profile then
               function_body.extend(',')
            end
            function_body.append(once "&ds")
         end
         if args /= Void then
            if not boost or else ace.profile then
               function_body.extend(',')
            end
            args_compile_to_c(args, rf.arguments)
         end
         function_body.extend(')')
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE) is
      do
         visited.writable.accept(Current)
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD) is
      do
         -- Now read the memorized value:
         visited.internal_c_local.append_in(function_body)
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT) is
      do
         visited.expression.accept(Current)
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT) is
      do
         function_body.extend('a')
         visited.rank.append_in(function_body)
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET) is
      do
         cpp.print_current
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE) is
      local
         i: INTEGER
      do
         if visited.list /= Void then
            from
               i := visited.list.lower
            until
               i > visited.list.upper
            loop
               if i > visited.list.lower then
                  function_body.extend(',')
               end
               compile_arg(visited.list.item(i))
               i := i + 1
            end
         end
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS) is
      do
         compile_feature_call(visited)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP) is
      do
         compile_feature_call(visited)
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT) is
      do
         if ace.boost and then visited.target.resolve_in(type).is_boolean then
            function_body.append(once "!(")
            compile_expression(visited.target)
            function_body.extend(')')
         else
            compile_feature_call(visited)
         end
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS) is
      do
         compile_feature_call(visited)
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C) is
      local
         target_type: TYPE; dynamic_feature: RUN_FEATURE
      do
         target_type := visited.target.resolve_in(type)
         dynamic_feature := target_type.live_type.dynamic_feature(visited.feature_stamp.run_feature_for(target_type))
         cpp.put_direct(type, dynamic_feature, visited.target, visited.arguments)
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE) is
      do
         if ace.boost and then visited.target.resolve_in(type).is_character then
            c2c_cast_op(visited, once "unsigned", as_ge)
         else
            compile_feature_call(visited)
         end
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT) is
      do
         if ace.boost and then visited.target.resolve_in(type).is_character then
            c2c_cast_op(visited, once "unsigned", as_gt)
         else
            compile_feature_call(visited)
         end
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE) is
      do
         if ace.boost and then visited.target.resolve_in(type).is_character then
            c2c_cast_op(visited, once "unsigned", as_le)
         else
            compile_feature_call(visited)
         end
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT) is
      do
         if ace.boost and then visited.target.resolve_in(type).is_character then
            c2c_cast_op(visited, once "unsigned", as_lt)
         else
            compile_feature_call(visited)
         end
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES) is
      do
         compile_feature_call(visited)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR) is
      do
         compile_feature_call(visited)
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1) is
      do
         compile_feature_call(visited)
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N) is
      do
         compile_feature_call(visited)
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE) is
      do
         function_body.append(once "(T0*)(")
         function_body.extend(visited.array_name)
         function_body.extend('[')
         visited.target_type.live_type.id.append_in(function_body)
         function_body.append(once "])")
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST) is
      do
         function_body.append(once "/*IC*/(")
         visited.resolved_memory.canonical_type_mark.c_type_for_target_in(function_body)
         function_body.append(once ")(")
         cpp.target_mapper.compile(visited.expression, type, visited.expression_type)
         function_body.extend(')')
      end

feature {ARGUMENT_NAME2}
   visit_argument_name2 (visited: ARGUMENT_NAME2) is
      do
         cpp.print_argument(visited.rank)
      end

feature {LOCAL_NAME2}
   visit_local_name2 (visited: LOCAL_NAME2) is
      do
         cpp.print_local(visited.to_string)
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT) is
      do
         crash -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE) is
      do
         function_body.extend('0')
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE) is
      do
         function_body.extend('1')
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT) is
      do
         compile_character(visited.value)
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT) is
      local
         actual_size: INTEGER
      do
         if visited.pretty_view /= Void then
            function_body.append(once "/*")
            function_body.append(visited.pretty_view)
            function_body.append(once "*/")
         end
         if visited.result_type_memory /= Void then
            actual_size := visited.result_type_memory.bit_count
         else
            actual_size := visited.size
         end
         inspect
            actual_size
         when 8 then
            if visited.value_memory = Minimum_integer_8 then
               function_body.append(once "INT8_MIN")
            else
               function_body.append(once "INT8_C(")
               visited.value_memory.append_in(function_body)
               function_body.extend(')')
            end
         when 16 then
            if visited.value_memory = Minimum_integer_16 then
               function_body.append(once "INT16_MIN")
            else
               function_body.append(once "INT16_C(")
               visited.value_memory.append_in(function_body)
               function_body.extend(')')
            end
         when 32 then
            if visited.value_memory = Minimum_integer_32 then
               function_body.append(once "INT32_MIN")
            else
               function_body.append(once "INT32_C(")
               visited.value_memory.append_in(function_body)
               function_body.extend(')')
            end
         when 64 then
            if visited.value_memory = Minimum_integer_64 then
               function_body.append(once "INT64_MIN")
            else
               function_body.append(once "INT64_C(")
               visited.value_memory.append_in(function_body)
               function_body.extend(')')
            end
         end
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT) is
      local
         real_type_mark: REAL_TYPE_MARK
      do
         function_body.append(once "/*")
         function_body.append(visited.pretty_view)
         function_body.append(once "*/")
         function_body.append(visited.normalized_view)
         real_type_mark ::= visited.declaration_type.canonical_type_mark
         inspect
            real_type_mark.bit_count
         when 32 then
            function_body.extend('F')
         when 64 then
            -- double
         else
            function_body.extend('L')
         end
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID) is
      do
         function_body.append(once "(void*)0")
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING) is
      do
         if visited.once_flag then
            function_body.append(visited.once_variable)
         elseif visited.unicode_flag then
            cpp.se_ums_c_call_in(function_body, visited)
         else
            cpp.se_ms_c_call_in(function_body, visited)
         end
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC) is
      local
         i: INTEGER
      do
         function_body.append(once "se_manifest")
         visited.created_type.id.append_in(function_body)
         function_body.extend('(')
         if not ace.boost then
            function_body.append(once "&ds,")
         end
         if ace.profile then
            function_body.append(once "&local_profile,")
         end
         if visited.optional_arguments /= Void then
            from
               i := visited.optional_arguments.lower
            until
               i > visited.optional_arguments.upper
            loop
               compile_expression(visited.optional_arguments.item(i))
               function_body.extend(',')
               i := i + 1
            end
         end
         visited.item_list.count.append_in(function_body)
         from
            i := visited.item_list.lower
         until
            i > visited.item_list.upper
         loop
            function_body.append(once ",%N")
            compile_expression(visited.item_list.item(i))
            i := i + 1
         end
         function_body.extend(')')
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE) is
      do
         compile_expression(visited.create_expression)
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION) is
      local
         i: INTEGER; stop: BOOLEAN
      do
         function_body.extend('(')
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            if i > visited.list.lower then
               function_body.extend(',')
            end
            function_body.extend('(')
            cpp.code_compiler.compile(visited.list.item(i), type)
            -- Because this item is an INSTRUCTION, we have to remove the trailing semicolon:
            -- *** THIS IS AN UGLY HACK!
            from
               stop := False
            until
               stop
            loop
               inspect
                  function_body.last
               when ';', ' ', '%N' then
                  function_body.remove_last
               else
                  stop := True
               end
            end
            function_body.extend(')')
            i := i + 1
         end
         function_body.extend(')')
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID) is
      do
         check
            visited.dynamic_dispatch_temporary1.side_effect_free(type)
         end
         function_body.append(once "((")
         visited.dynamic_dispatch_temporary1.accept(Current)
         function_body.append(once ")->id)")
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1) is
      do
         if visited.target.is_stored_in_some_local_variable or else visited.target.side_effect_free(type) then
            -- No need to use an extra INTERNAL_C_LOCAL:
            visited.target.accept(Current)
         else
            if visited.internal_c_local = Void or else visited.pending_c_function_counter /= cpp.pending_c_function_counter then
               visited.set_internal_c_local(cpp.pending_c_function_lock_local(visited.resolve_in(type), once "ddt1"))
               visited.set_pending_c_function_counter
               function_body.append(once "(")
               visited.internal_c_local.append_in(function_body)
               function_body.append(once "=(")
               visited.target.accept(Current)
               function_body.append(once "))")
            else
               visited.internal_c_local.append_in(function_body)
            end
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2) is
      do
         visited.dynamic_dispatch_temporary1.accept(Current)
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2) is
      do
         if visited.internal_c_local = Void or else visited.pending_c_function_counter /= cpp.pending_c_function_counter then
            visited.set_pending_c_function_counter
            visited.set_internal_c_local(cpp.pending_c_function_lock_local(visited.resolve_in(type), visited.tag))
         end
         visited.internal_c_local.append_in(function_body)
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH) is
      do
         function_body.append(once "/*ND*/(T0*)(")
         compile_expression(visited.side_effect_free_expression)
         function_body.extend(')')
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH) is
      do
         if visited.external_function /= Void then
            function_body.append(once "/*NVND*/(")
            function_body.append(visited.external_function.names.first.to_string)
            function_body.append(once ")")
         else
            once_routine_pool.unique_result_in(function_body, visited.once_function)
         end
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER) is
      do
         function_body.append(once "NULL/*_POINTER*/")
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL) is
      local
         rt: TYPE
      do
         rt := visited.resolve_in(type)
         cpp.se_evobt(rt.canonical_type_mark, type, create {E_VOID}.make(visited.start_position))
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY) is
      do
         crash -- Because we have already switched to the canonical form
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND) is
      do
         open_operand_name_in(visited, function_body)
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION) is
      do
         compile_precursor(visited)
      end

feature {RESULT}
   visit_result (visited: RESULT) is
      do
         if visited.is_once_result then
            once_routine_pool.unique_result_in(function_body, visited.enclosing_function)
         else
            function_body.extend('R')
         end
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      local
         run_feature_2: RUN_FEATURE_2
      do
         function_body.append(once "/*SFN*/(C->")
         run_feature_2 ::= visited.feature_stamp.run_feature_for(type)
         run_feature_2.put_c_field_name
         function_body.extend(')')
      end

feature {}
   compile_feature_call (visited: FEATURE_CALL) is
      do
         cpp.put_monomorphic_or_void_call(type, visited.feature_stamp, visited.target, visited.arguments)
      end

   compile_precursor (visited: PRECURSOR_CALL) is
      local
         run_feature: RUN_FEATURE
      do
         run_feature := type.live_type.precursor_run_feature(visited.specialized_parent, visited.specialized_anonymous_feature)
         cpp.push_precursor(type, run_feature, visited.arguments)
         cpp.mapper.compile(run_feature)
         cpp.pop
      end

   frozen c2c_cast_op (visited: CALL_INFIX; cast, op: STRING) is
      do
         function_body.append(once "(((")
         function_body.append(cast)
         function_body.append(once ")(")
         compile_expression(visited.target)
         function_body.append(once "))")
         function_body.append(op)
         function_body.append(once "((")
         function_body.append(cast)
         function_body.append(once ")(")
         compile_expression(visited.arg1)
         function_body.append(once ")))")
      end

   compile_agent_void_call (visited: AGENT_LAUNCHER; start_position: POSITION; item_or_call: STRING) is
      require
         not agent_pool.agent_creation_collected_flag
         ;(item_or_call = as_item) or (item_or_call = as_call)
      local
         target_type: TYPE; feature_stamp: FEATURE_STAMP; fn: FEATURE_NAME
         void_call: VOID_CALL; void_proc_call: VOID_PROC_CALL
      do
         target_type := visited.target.resolve_in(type)
         create fn.simple_feature_name(item_or_call, start_position)
         feature_stamp := target_type.lookup(fn)
         if item_or_call = as_item then
            create void_call.make(start_position, feature_stamp, target_type)
            compile_expression(void_call)
         else
            create void_proc_call.make(start_position, feature_stamp, target_type)
            compile_code(void_proc_call)
         end
      end

   compile_agent_definition_call (visited: AGENT_LAUNCHER) is
         -- Generate the C code to launch the execution of the `agent_target'.
      require
         cpp.pending_c_function
         visited.target /= Void
      local
         boost: BOOLEAN
      do
         function_body.append(visited.agent_args.signature)
         function_body.extend('(')
         boost := ace.boost
         if not boost then
            function_body.append(once "&ds,")
         end
         if ace.profile then
            function_body.append(once "&local_profile,")
         end
         if not boost then
            function_body.append(once "vc(")
         end
         compile_expression(visited.target)
         if not boost then
            function_body.extend(',')
            cpp.put_position(visited.target.start_position)
            function_body.extend(')')
         end
         if visited.fake_tuple.count > 0 then
            function_body.extend(',')
            compile_expression(visited.fake_tuple)
         end
         function_body.extend(')')
      end

   compile_character (char: CHARACTER) is
      do
         function_body.append(once "((T3)%'")
         if char.is_letter or else char.is_digit then
            function_body.extend(char)
         elseif char = '%N' then
            function_body.append(once "\n")
         else
            function_body.extend('\')
            char.code.low_8.to_octal_in(function_body)
         end
         function_body.append(once "%')")
      end

   args_compile_to_c (args: EFFECTIVE_ARG_LIST; fal: FORMAL_ARG_LIST) is
         -- Produce C code for all expressions of the list.
      require
         args.count = fal.count
      local
         i, up: INTEGER
      do
         from
            i := 1
            up := args.count
         until
            i > up
         loop
            if i > 1 then
               function_body.extend(',')
            end
            cpp.args_compile_to_c_ith(type, args, fal, i)
            i := i + 1
         end
      end

end -- class C_EXPRESSION_COMPILATION_MIXIN
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
