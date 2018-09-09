-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_CODE_COMPILER
   -- For an INSTRUCTION, produce the corresponding C code. For an EXPRESSION the C code to access
   -- the value (user's expanded are no longer pointer).

inherit
   CODE_VISITOR
      undefine
         is_equal
      end

insert
   C_EXPRESSION_COMPILATION_MIXIN[CODE]
      redefine
         compile_expression, compile_code
      end

create {C_PRETTY_PRINTER}
   make

feature {}
   compile_expression (expression: EXPRESSION)
      do
         expression.accept(Current)
      end

   compile_code (code: CODE)
      do
         code.accept(Current)
      end

feature {CECIL_ENTRY}
   visit_cecil_entry (visited: CECIL_ENTRY)
      do
         crash
      end

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION)
      do
         if agent_pool.agent_creation_collected_flag then
            compile_agent_definition_call(visited)
            function_body.append(once ";%N")
         else
            --|*** It would be nice to be able to substitute `Current'
            --| with the corresponding VOID_PROC_CALL in a final stage, may
            --| be `adapt' in order to really simplify the back end.
            --| (This should be done before `compile_to_c'...)
            --|*** Dom sept 26th 2004 ***
            compile_agent_void_call(visited, visited.start_position, as_call)
         end
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION)
      do
         if not visited.is_always_true(type) then
            cpp.stop_recursive_assertion_opening(True)
            visited.list.for_each(agent compile_assertion_as_ensure(?))
            cpp.stop_recursive_assertion_closing(True)
         end
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT)
      do
         visit_assertion_list(visited)
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT)
      do
         if not visited.is_always_true(type) then
            if ace.profile then
               cpp.start_profile_class_invariant(type.live_type)
            end
            cpp.stop_recursive_assertion_opening(False)
            visited.list.for_each(agent compile_assertion_as_class_invariant(?))
            cpp.stop_recursive_assertion_closing(False)
            if ace.profile then
               cpp.stop_profile
            end
         end
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST)
      do
         crash -- This one must never be called.
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT)
      local
         left_type, right_type: TYPE; left_run_time_set, right_run_time_set: RUN_TIME_SET
         counter1, counter2, i: INTEGER; left_live_type: LIVE_TYPE
      do
         left_type := visited.left_side.resolve_in(type)
         right_type := visited.right_side.resolve_in(type)
         function_body.append(once "/*")
         function_body.append(left_type.name.to_string)
         if visited.forced_flag then
            check
               not ace.boost -- Always replaced with an assignment in boost mode.
            end
            function_body.append(once " ::= ")
         else
            function_body.append(once " ?= ")
         end
         function_body.append(right_type.name.to_string)
         function_body.append(once "*/")
         if left_type.live_type = Void or else left_type.live_type.run_time_set.count = 0 then
            -- Left-hand side is always Void:
            if not visited.right_side.side_effect_free(type) then
               function_body.append(once "((void)")
               compile_expression(visited.right_side)
               function_body.append(once ");")
            end
         elseif right_type.live_type = Void or else right_type.live_type.run_time_set.count = 0 then
            -- Right-hand side is always Void:
            if not visited.right_side.side_effect_free(type) then
               function_body.append(once "(void)")
               compile_expression(visited.right_side)
               function_body.extend(';')
            end
            compile_expression(visited.left_side)
            function_body.append(once "=NULL;")
         elseif visited.right_side.non_void_no_dispatch_type(type) /= Void then
            -- We are sure of the right-hand side:
            if right_type.can_be_assigned_to(left_type) then
               cpp.start_assignment(visited, type)
               compile_expression(visited.left_side)
               if cpp.check_assignment then
                  function_body.append(once "=((void*)")
                  compile_expression(visited.right_side)
                  function_body.append(once ");%N")
               else
                  function_body.append(once ";%N")
               end
               cpp.end_assignment(visited, type)
            elseif visited.forced_flag then
               function_body.append(once "error1(%"Invalid ::= assignment (inserted type).%",")
               cpp.put_position(visited.start_position)
               function_body.append(once ");%N")
            else
               cpp.start_assignment(visited, type)
               compile_expression(visited.left_side)
               if cpp.check_assignment then
                  function_body.append(once "=NULL;")
               else
                  function_body.append(once ";%N")
               end
               cpp.end_assignment(visited, type)
            end
         else
            from
               right_run_time_set := right_type.live_type.run_time_set
               left_run_time_set := left_type.live_type.run_time_set
               i := 1
            until
               i > right_run_time_set.count
            loop
               if left_run_time_set.has(right_run_time_set.item(i)) then
                  counter1 := counter1 + 1
                  if counter2 > 0 then
                     i := Maximum_integer
                  else
                     i := i + 1
                  end
               else
                  counter2 := counter2 + 1
                  if counter1 > 0 then
                     i := Maximum_integer
                  else
                     i := i + 1
                  end
               end
            end
            if right_run_time_set.count = counter1 then
               -- They can be all assigned into `left_side':
               cpp.start_assignment(visited, type)
               compile_expression(visited.left_side)
               if cpp.check_assignment then
                  function_body.append(once "=((void*)")
                  compile_expression(visited.right_side)
                  function_body.append(once ");%N")
               else
                  function_body.append(once ";%N")
               end
               cpp.end_assignment(visited, type)
            elseif right_run_time_set.count = counter2 then
               -- Conversely, all possibilities of the right-hand side are all non-assignable into
               -- the left-hand side. We must still take care of the fact that the right-hand can be
               -- non Void:
               if visited.forced_flag then
                  cpp.start_assignment(visited, type)
                  compile_expression(visited.left_side)
                  if cpp.check_assignment then
                     function_body.append(once "=((void*)")
                     compile_expression(visited.right_side)
                     function_body.append(once ");%Nif (")
                     compile_expression(visited.left_side)
                     function_body.append(once "!=NULL){error1(%"Invalid ::= assignment (inserted type).%",")
                     cpp.put_position(visited.start_position)
                     function_body.append(once ");}%N")
                  else
                     function_body.append(once ";%N")
                  end
                  cpp.end_assignment(visited, type)
               else
                  if not visited.right_side.side_effect_free(type) then
                     compile_expression(visited.right_side)
                     function_body.append(once ";%N")
                  end
                  cpp.start_assignment(visited, type)
                  compile_expression(visited.left_side)
                  if cpp.check_assignment then
                     function_body.append(once "=NULL;%N")
                  else
                     function_body.append(once ";%N")
                  end
                  cpp.end_assignment(visited, type)
               end
            else
               -- General translation scheme:
               cpp.start_assignment(visited, type)
               compile_expression(visited.left_side)
               if cpp.check_assignment then
                  function_body.append(once "=((void*)")
                  compile_expression(visited.right_side)
                  function_body.append(once ");%Nif(NULL!=(")
                  compile_expression(visited.left_side)
                  function_body.append(once ")){switch(((T0*)")
                  compile_expression(visited.left_side)
                  function_body.append(once ")->id){%N")
                  from
                     i := 1
                  until
                     i > left_run_time_set.count
                  loop
                     left_live_type := left_run_time_set.item(i)
                     check
                        left_live_type.is_tagged
                     end
                     function_body.append(once "case ")
                     left_live_type.id.append_in(function_body)
                     function_body.append(once ":/*")
                     function_body.append(left_live_type.name.to_string)
                     function_body.append(once "*/%N")
                     i := i + 1
                  end
                  function_body.append(once "break;%N")
                  if visited.forced_flag then
                     function_body.append(once "default: error1(%"Invalid ::= assignment (inserted type).%",")
                     cpp.put_position(visited.start_position)
                     function_body.append(once ");%N")
                  else
                     function_body.append(once "default:%N")
                     compile_expression(visited.left_side)
                     function_body.append(once "=NULL;%N")
                  end
                  function_body.append(once "}}%N")
               else
                  function_body.append(once ";%N")
               end
               cpp.end_assignment(visited, type)
            end
         end
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT)
      local
         cast_t0: BOOLEAN; right_type: TYPE
      do
         cpp.start_assignment(visited, type)
         compile_expression(visited.left_side)
         if visited.right_side.is_void then
            if cpp.check_assignment then
               function_body.extend('=')
               compile_expression(visited.right_side)
            end
         else
            if cpp.check_assignment then
               right_type := visited.right_side.resolve_in(type)
               if visited.right_side.is_current then
                  if visited.left_side.resolve_in(type).is_reference then
                     cast_t0 := right_type.is_reference
                  end
               end
               function_body.extend('=')
               if cast_t0 then
                  function_body.append(once "((T0*)(")
               elseif right_type.is_boolean then
                  function_body.append(once "((T6)(")
               end
               compile_expression(visited.right_side)
               if cast_t0 or else right_type.is_boolean then
                  function_body.append(once "))")
               end
            end
         end
         function_body.append(once ";%N")
         if right_type /= Void and then right_type.is_native_array then
            cpp.memory.assigned_native_array(visited, type) --| **** TODO: BDW specific => move in end_assignment
         end
         cpp.end_assignment(visited, type)
      end

feature {ASSIGNMENT_CALL_ASSIGNER}
   visit_assignment_call_assigner (visited: ASSIGNMENT_CALL_ASSIGNER)
      do
         -- The assigner call will have been replaced by the actual procedure call.
         check
            never_reached: False
         end
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND)
      do
         if visited.must_be_generated(type) then
            compile_as_check_compound(visited.assertion_list)
         end
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE)
      do
         if visited.is_c_inline_c then
            function_body.append(visited.c_code)
         else
            cpp.put_c_inline_h(visited.c_code)
         end
      end

feature {COMMENT}
   visit_comment (visited: COMMENT)
      do
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND)
      local
         i: INTEGER; instruction: INSTRUCTION; stamp: INTEGER
      do
         from
            i := visited.list.lower
         until
            i > visited.list.upper
         loop
            instruction := visited.list.item(i)
            if ace.boost then
               -- Following lines are only useful to debug the compiler (this slow down
               -- the recompilation mechanism):
               --                  cpp.put_position_comment(instruction.start_position)
               --                  function_body.extend('%N')
            end
            stamp := instruction.eiffel_parser_stamp
            if stamp > 0 then
               cpp.eiffel_parser_stamp_push(stamp)
            end
            compile_code(instruction)
            if stamp > 0 then
               cpp.eiffel_parser_stamp_pop
            end
            i := i + 1
         end
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION)
      local
         created_type_memory: TYPE; rf: RUN_FEATURE; args: EFFECTIVE_ARG_LIST;
         id, class_invariant_flag: INTEGER; internal_c_local: INTERNAL_C_LOCAL
      do
         created_type_memory := visited.created_type(type)
         if created_type_memory.is_reference then
            internal_c_local := cpp.pending_c_function_lock_local(created_type_memory, once "new")
            cpp.memory.allocation_of(internal_c_local, created_type_memory.live_type)
            if visited.call /= Void then
               rf := visited.call.run_feature_for(type)
               cpp.push_create_instruction(type, rf, visited.arguments, internal_c_local)
               cpp.mapper.compile(rf)
               cpp.pop
            end
            compile_expression(visited.writable)
            function_body.extend('=')
            internal_c_local.append_in(function_body)
            function_body.append(once ";%N")
            internal_c_local.unlock
         else
            if visited.call = Void then
               rf := created_type_memory.live_type.default_create_run_feature
            else
               rf := visited.call.run_feature_for(type)
               args := visited.arguments
            end
            id := created_type_memory.live_type.id
            if rf = Void then
               compile_expression(visited.writable)
               function_body.append(once "=M")
               id.append_in(function_body)
               function_body.append(once ";%N")
            else
               internal_c_local := cpp.pending_c_function_lock_local(created_type_memory, once "creatinstexp")
               internal_c_local.append_in(function_body)
               function_body.append(once "=M")
               id.append_in(function_body)
               function_body.append(once ";%N")
               cpp.push_create_instruction(type, rf, args, internal_c_local)
               cpp.mapper.compile(rf)
               cpp.pop
               compile_expression(visited.writable)
               function_body.extend('=')
               internal_c_local.append_in(function_body)
               function_body.append(once ";%N")
               internal_c_local.unlock
            end
         end
         -- For all kind of newly created object, we may call the class invariant:
         class_invariant_flag := cpp.class_invariant_call_opening(created_type_memory, True)
         if class_invariant_flag > 0 then
            if created_type_memory.is_expanded and then cpp.need_struct.for(created_type_memory.canonical_type_mark) then
               function_body.extend('&')
               function_body.extend('(')
               compile_expression(visited.writable)
               function_body.extend(')')
            else
               compile_expression(visited.writable)
            end
            cpp.class_invariant_call_closing(class_invariant_flag, True)
         end
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION)
      local
         created_type_memory: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         created_type_memory := visited.created_type(type)
         if created_type_memory.is_reference then
            internal_c_local := cpp.pending_c_function_lock_local(created_type_memory, once "rawci")
            cpp.memory.allocation_of(internal_c_local, created_type_memory.live_type)
            compile_expression(visited.writable)
            function_body.append(once "=((T0*)")
            internal_c_local.append_in(cpp.pending_c_function_body)
            function_body.append(once ");%N")
            internal_c_local.unlock
         elseif created_type_memory.is_kernel_expanded then
            compile_expression(visited.writable)
            function_body.extend('=')
            compile_expression(created_type_memory.canonical_type_mark.default_expression(visited.start_position)) -- ouch object creation
            function_body.append(once ";%N")
         else
            compile_expression(visited.writable)
            function_body.append(once "=M")
            created_type_memory.live_type.id.append_in(cpp.pending_c_function_body)
            function_body.append(once ";%N")
         end
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND)
      do
         if visited.must_be_generated(type) and then visited.compound /= Void then
            compile_code(visited.compound)
         end
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE)
      local
         i: INTEGER
      do
         function_body.append(once "if(")
         compile_expression(visited.expression)
         function_body.append(once "){%N")
         if visited.then_compound /= Void then
            compile_code(visited.then_compound)
         end
         function_body.append(once "}%N")
         if visited.elseif_list /= Void then
            from
               i := visited.elseif_list.lower
            until
               i > visited.elseif_list.upper
            loop
               function_body.append(once "else ")
               compile_code(visited.elseif_list.item(i))
               i := i + 1
            end
         end
         if visited.else_compound /= Void then
            function_body.append(once "else{%N")
            compile_code(visited.else_compound)
            function_body.append(once "}%N")
         end
      end

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN)
      do
         function_body.append(once "if(")
         compile_expression(visited.expression)
         function_body.append(once "){%N")
         if visited.then_compound /= Void then
            compile_code(visited.then_compound)
         end
         function_body.append(once "}%N")
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT)
      do
         compile_inspect_statement(visited)
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT)
      do
         compile_inspect_statement(visited)
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION)
      local
         loop_check_flag, variant_flag: BOOLEAN
      do
         loop_check_flag := type.class_text.loop_check
         if loop_check_flag and then visited.loop_variant /= Void then
            function_body.append(once "{int c=0;int v=0;%N")
            variant_flag := True
         end
         if visited.initialize /= Void then
            compile_code(visited.initialize)
         end
         function_body.append(once "while(1){%N")
         if loop_check_flag and then visited.loop_invariant /= Void then
            compile_as_loop_invariant(visited.loop_invariant)
         end
         cpp.compound_expression_compiler.compile(once "/*until*/if(", visited.until_expression, once ") break;%N", type)
         if variant_flag then
            cpp.variant_check(type, visited.loop_variant)
         end
         cpp.memory.checkpoint
         if visited.loop_body /= Void then
            compile_code(visited.loop_body)
         end
         function_body.append(once "}%N")
         if variant_flag then
            function_body.append(once "}%N")
         end
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER)
      local
         old_invariant_check_disabled: BOOLEAN
      do
         old_invariant_check_disabled := cpp.assertion_checks_disabled
         cpp.set_assertion_checks_disabled(True)
         if ace.no_check then
            -- Insert a frame with a NULL descriptor to convince se_rci that the invariant should not be checked.
            function_body.append(once "{%Nse_dump_stack *caller=&ds;%N%
                                      %{%Nse_dump_stack ds={NULL,NULL,caller->p,caller,NULL,NULL};%N")
         end
         compile_code(visited.compound)
         if ace.no_check then
            function_body.append(once "}}%N")
         end
         cpp.set_assertion_checks_disabled(old_invariant_check_disabled)
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION)
      do
         if ace.no_check then
            if exceptions_handler.used then
               function_body.append(once "internal_exception_handler(")
               function_body.append(visited.error_name)
               function_body.append(once ");%N")
            else
               function_body.append(once "error1(")
               cpp.string_to_c_code(visited.error_message, function_body)
               function_body.extend(',')
               cpp.put_position(visited.start_position)
               function_body.append(once ");%N")
            end
         else
            not_yet_implemented
         end
      end

feature {SEDB}
   visit_sedb (visited: SEDB)
      do
         if visited.start_position.sedb_trace then
            function_body.append(once "sedb(&ds,")
            put_start_position(visited)
            function_body.append(once ",'")
            function_body.extend(visited.info_code)
            function_body.append(once "')")
         else
            function_body.append(once "ds.p=")
            put_start_position(visited)
         end
         function_body.append(once ";%N")
      end

feature {}
   put_start_position (sedb: SEDB)
      do
         function_body.append(once "0x")
         sedb.start_position.mangling.to_hexadecimal_in(function_body)
         cpp.put_position_comment_in(function_body, sedb.start_position)
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION)
      do
         function_body.append(once "/*UNUSED_EXPRESSION:*/(void)(")
         compile_expression(visited.expression)
         function_body.append(once ");%N")
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL)
      do
         cpp.se_evobt(Void, type, create {E_VOID}.make(visited.start_position), True)
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION)
      do
         compile_precursor(visited)
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0)
      do
         compile_feature_call(visited)
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1)
      do
         compile_feature_call(visited)
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N)
      do
         compile_feature_call(visited)
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION)
      do
         if not visited.is_always_true(type) then
            cpp.stop_recursive_assertion_opening(True)
            compile_as_require(visited)
            cpp.stop_recursive_assertion_closing(True)
         end
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION)
      do
         if ace.no_check then
            if ace.flat_check then
               --|*** PH (17/04/2005) it's wrong but very hard to do better here
               function_body.append(once "assertion_depth=1;%Nfree_exception_frames();%N")
            else
               function_body.append(once "fd.assertion_flag=1;%Nfree_exception_frames();%N")
            end
         end
         function_body.append(once "goto retry_tag;%N")
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      local
         bi: INTEGER
      do
         function_body.append(once "%Nif(")
         from
            bi := visited.values.lower
         until
            bi > visited.values.upper
         loop
            function_body.extend('(')
            if visited.values.item(bi) = visited.values.item(bi + 1) then
               visited.values.item(bi).append_in(function_body)
               function_body.append(once "==")
               cpp.inspect_local_compile_to_c(type)
            else
               function_body.extend('(')
               visited.values.item(bi).append_in(function_body)
               function_body.append(once "<=")
               cpp.inspect_local_compile_to_c(type)
               function_body.append(once ")&&(")
               cpp.inspect_local_compile_to_c(type)
               function_body.append(once "<=")
               visited.values.item(bi + 1).append_in(function_body)
               function_body.extend(')')
            end
            function_body.extend(')')
            --
            bi := bi + 2
            if bi < visited.values.upper then
               function_body.append(once "||")
            end
         end
         function_body.append(once "){%N")
         if visited.compound /= Void then
            compile_code(visited.compound)
         end
         function_body.append(once "}%N")
      end

feature {}
   compile_inspect_statement (visited: INSPECT_STATEMENT)
      local
         no_check: BOOLEAN; i: INTEGER
      do
         if visited.when_list /= Void and then visited.else_position.is_unknown and then ace.boost then
            -- Moving the most complicated "when" clause at the end (because the last one won't be tested in
            -- -boost mode):
            from
               i := visited.when_list.lower
            until
               i >= visited.when_list.upper
            loop
               if visited.when_list.item(i).is_more_complex_than(visited.when_list.item(i + 1)) then
                  visited.when_list.swap(i, i + 1)
               end
               i := i + 1
            end
         end
         cpp.inspect_local_push(visited.expression)
         if visited.manifest_string_inspector /= Void then
            compile_manifest_string_inspector(visited)
         else
            no_check := ace.no_check
            function_body.append(once "/*[inspect")
            if visited.dynamic_dispatch_flag then
               function_body.append(once "DynamicDispatch")
            end
            function_body.append(once "*/%N")
            if visited.when_list = Void then
               if visited.else_position.is_unknown then
                  if no_check then
                     exceptions_handler.bad_inspect_value(visited.start_position)
                  end
               elseif visited.else_compound /= Void then
                  compile_code(visited.else_compound)
               end
            elseif visited.use_c_switch_statement then
               function_body.append(once "switch(")
               cpp.inspect_local_compile_to_c(type)
               function_body.append(once "){%N")
               compile_inspect_as_switch(visited)
               if visited.else_position.is_unknown then
                  if no_check then
                     function_body.append(once "default:;%N")
                     exceptions_handler.bad_inspect_value(visited.start_position)
                  end
               elseif visited.else_compound /= Void then
                  function_body.append(once "default:;%N")
                  compile_code(visited.else_compound)
               end
               function_body.append(once "}%N")
            else
               compile_inspect_as_ifthenelse(visited)
               if visited.else_position.is_unknown then
                  if no_check then
                     function_body.append(once " else{")
                     exceptions_handler.bad_inspect_value(visited.start_position)
                     function_body.extend('}')
                  end
               elseif visited.else_compound /= Void then
                  function_body.append(once " else{")
                  compile_code(visited.else_compound)
                  function_body.extend('}')
               end
            end
            function_body.append(once "/*inspect]*/%N")
            if visited.dynamic_dispatch_temporary1 /= Void then
               unlock_internal_c_local_tag(visited.dynamic_dispatch_temporary1)
               if visited.when_list /= Void then
                  smart_eiffel.update_polymorphic_distribution(visited.when_list.count)
               end
            end
         end
         cpp.inspect_local_pop
      end

   compile_inspect_as_switch (visited: INSPECT_STATEMENT)
      local
         i: INTEGER; last_compound: INSTRUCTION
      do
         from
            i := visited.when_list.lower
         until
            i = visited.when_list.upper
         loop
            compile_when_clause_as_switch(visited.when_list.item(i))
            i := i + 1
         end
         if visited.else_position.is_unknown and then ace.boost then
            function_body.append(once "default:;%N")
            last_compound := visited.when_list.item(i).compound
            if last_compound /= Void then
               compile_code(last_compound)
            end
         else
            compile_when_clause_as_switch(visited.when_list.item(i))
         end
      end

   compile_when_clause_as_switch (visited: WHEN_CLAUSE)
      local
         bi, v: INTEGER
      do
         from
            bi := visited.values.lower
         until
            bi > visited.values.upper
         loop
            from
               v := visited.values.item(bi)
            until
               v > visited.values.item(bi + 1)
            loop
               function_body.append(once "case ")
               v.append_in(function_body)
               function_body.append(once ":%N")
               v := v + 1
            end
            bi := bi + 2
         end
         if visited.compound /= Void then
            compile_code(visited.compound)
         end
         function_body.append(once "break;%N")
      end

   compile_inspect_as_ifthenelse (visited: INSPECT_STATEMENT)
      local
         i: INTEGER; last_compound: INSTRUCTION
      do
         from
            i := visited.when_list.lower
         until
            i = visited.when_list.upper
         loop
            if i > visited.when_list.lower then
               function_body.append(once " else ")
            end
            compile_code(visited.when_list.item(i))
            i := i + 1
         end
         if i > visited.when_list.lower then
            function_body.append(once " else ")
         end
         if visited.else_position.is_unknown and then ace.boost then
            function_body.extend('{')
            last_compound := visited.when_list.item(i).compound
            if last_compound /= Void then
               compile_code(last_compound)
            end
            function_body.extend('}')
         else
            compile_code(visited.when_list.item(i))
         end
      end

   compile_manifest_string_inspector (inspect_statement: INSPECT_STATEMENT)
      require
         cpp.pending_c_function
      local
         i, cur_state, new_state, ext_state: INTEGER; cur_char: CHARACTER
         no_check, all_check: BOOLEAN; transition: LINKED_LIST[TUPLE[CHARACTER, INTEGER]]
         storage_internal_c_local, count_internal_c_local, state_internal_c_local, i_internal_c_local: INTERNAL_C_LOCAL
         inspector: MANIFEST_STRING_INSPECTOR
      do
         inspector := inspect_statement.manifest_string_inspector
         no_check := ace.no_check
         all_check := ace.all_check
         function_body.append(once "/*[manifest INSPECT*/%N")

         function_body.append(once "if (NULL==(")
         cpp.inspect_local_compile_to_c(type)
         function_body.append(once ")){%N")
         exceptions_handler.bad_inspect_value(inspect_statement.start_position)
         function_body.append(once "}else{%N")

         storage_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_native_array_character, once "storage")
         storage_internal_c_local.append_in(function_body)
         function_body.append(once "/*storage*/=((")
         cpp.inspect_local_type(type)
         function_body.append(once ")")
         cpp.inspect_local_compile_to_c(type)
         function_body.append(once ")->_storage + ((")
         cpp.inspect_local_type(type)
         function_body.append(once ")")
         cpp.inspect_local_compile_to_c(type)
         function_body.append(once ")->_storage_lower;%N")

         count_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "count")
         count_internal_c_local.append_in(function_body)
         function_body.append(once "/*count*/=((")
         cpp.inspect_local_type(type)
         function_body.append(once ")")
         cpp.inspect_local_compile_to_c(type)
         function_body.append(once ")->_count;%N")

         -- Walk through the string to have the final state:
         state_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "state")
         state_internal_c_local.append_in(function_body)
         function_body.append(once "/*state*/=")
         inspector.string_pool.unknown_state.append_in(function_body)
         function_body.append(once ";%N")
         i_internal_c_local := cpp.pending_c_function_lock_local(smart_eiffel.type_integer_32, once "i")
         i_internal_c_local.append_in(function_body)
         function_body.append(once "/*i*/=0;%N")
         if inspector.has_empty then
            function_body.append(once " /* has_empty */ if (")
            count_internal_c_local.append_in(function_body)
            function_body.append(once "==0) ")
            state_internal_c_local.append_in(function_body)
            function_body.append(once "=")
            inspector.string_pool.external_state(inspector.string_pool.state_empty).append_in(function_body)
            function_body.append(once ";%Nelse")
         end
         function_body.append(once " while (")
         i_internal_c_local.append_in(function_body)
         function_body.append(once "<")
         count_internal_c_local.append_in(function_body)
         function_body.append(once " && (")
         i_internal_c_local.append_in(function_body)
         function_body.append(once "==0 || ")
         state_internal_c_local.append_in(function_body)
         function_body.append(once "!=")
         inspector.string_pool.unknown_state.append_in(function_body)
         function_body.append(once ")) {switch(")
         state_internal_c_local.append_in(function_body)
         function_body.append(once ") {%N")
         from
            cur_state := inspector.string_pool.unknown_state
         until
            cur_state > inspector.string_pool.maxstate
         loop
            function_body.append(once "case ")
            cur_state.append_in(function_body)
            function_body.append(once ": switch(*(")
            storage_internal_c_local.append_in(function_body)
            function_body.extend('+')
            i_internal_c_local.append_in(function_body)
            function_body.append(once ")) {%N")
            transition := inspector.string_pool.transition(cur_state)
            from
               i := transition.lower
            until
               i > transition.upper
            loop
               cur_char := transition.item(i).first
               new_state := transition.item(i).second
               function_body.append(once "case ")
               compile_character(cur_char)
               function_body.append(once ": ")
               state_internal_c_local.append_in(function_body)
               function_body.extend('=')
               if new_state < inspector.headers.count and then new_state /= inspector.string_pool.unknown_state then
                  ext_state := inspector.string_pool.external_state(new_state)
                  if ext_state /= new_state then
                     function_body.extend('(')
                     i_internal_c_local.append_in(function_body)
                     function_body.append(once "!=")
                     count_internal_c_local.append_in(function_body)
                     function_body.append(once "-1)?")
                     new_state.append_in(function_body)
                     function_body.extend(':')
                  end
                  ext_state.append_in(function_body)
               else
                  new_state.append_in(function_body)
               end
               function_body.append(once ";break;%N")
               i := i + 1
            end
            function_body.append(once "default: ")
            state_internal_c_local.append_in(function_body)
            function_body.extend('=')
            inspector.string_pool.unknown_state.append_in(function_body)
            function_body.append(once ";%Nbreak;%N}%Nbreak;%N")
            cur_state := cur_state + 1
         end
         function_body.append(once "default: ")
         state_internal_c_local.append_in(function_body)
         function_body.extend('=')
         inspector.string_pool.unknown_state.append_in(function_body)
         function_body.append(once ";%Nbreak;%N}%N")
         i_internal_c_local.append_in(function_body)
         function_body.append(once "++;%N}%N")
         -- now compile the compounds:
         function_body.append(once "switch(")
         state_internal_c_local.append_in(function_body)
         function_body.append(once "){%N")
         compile_inspect_as_switch(inspect_statement)
         if inspect_statement.else_compound /= Void then
            check
               not inspect_statement.else_position.is_unknown
            end
            function_body.append(once "default:;%N")
            compile_code(inspect_statement.else_compound)
         elseif inspect_statement.else_position.is_unknown and then no_check then
            function_body.append(once "default:;%N")
            exceptions_handler.bad_inspect_value(inspect_statement.start_position)
         end
         function_body.append(once "}}/*manifest INSPECT]*/%N")
         storage_internal_c_local.unlock
         count_internal_c_local.unlock
         state_internal_c_local.unlock
         i_internal_c_local.unlock
      end

   compile_as_loop_invariant (assertion_list: ASSERTION_LIST)
         -- A require assertion with only one item.
      do
         if not assertion_list.is_always_true(type) then
            cpp.stop_recursive_assertion_opening(True)
            assertion_list.for_each(agent compile_assertion_as_loop_invariant(?))
            cpp.stop_recursive_assertion_closing(True)
         end
      end

   compile_as_require (assertion_list: REQUIRE_ASSERTION)
      require
         not assertion_list.is_always_true(type)
      local
         i: INTEGER; alternative: BOOLEAN
         ra: REQUIRE_ASSERTION
      do
         if assertion_list.local_require /= Void then
            if assertion_list.direct_parents_require = Void then
               compile_as_require_1(assertion_list.local_require)
            else
               function_body.append(once "{int requireresult=1;%N")
               compile_as_require_n(assertion_list.local_require)
               function_body.append(once "if(!requireresult){%N")
               alternative := True
            end
         end
         if assertion_list.direct_parents_require /= Void then
            from
               i := assertion_list.direct_parents_require.lower
            until
               i > assertion_list.direct_parents_require.upper
            loop
               ra := assertion_list.direct_parents_require.item(i)
               if not ra.is_always_true(type) then
                  compile_as_require(ra)
               end
               i := i + 1
            end
            if alternative then
               function_body.append(once "}%N}%N")
            end
         end
      end

   compile_as_require_1 (assertion_list: ASSERTION_LIST)
         -- A require assertion with only one level.
      require
         not assertion_list.is_always_true(type)
      do
         assertion_list.list.for_each(agent compile_assertion_as_require_1(?))
      end

   compile_as_require_n (assertion_list: ASSERTION_LIST)
         -- A require assertion with more than one level.
      require
         not assertion_list.is_always_true(type)
      do
         assertion_list.for_each(agent compile_assertion_as_require_n(?))
      end

   compile_assertion_as_require_n (assertion: ASSERTION)
      do
         if not assertion.is_always_true(type) then
            function_body.append(once "if(requireresult){%N")
            cpp.compound_expression_compiler.compile(once "requireresult=", assertion.expression, once ";%N", type)
            function_body.append(once "}%N")
         end
      end

   compile_as_check_compound (assertion_list: ASSERTION_LIST)
         -- A require assertion with only one item.
      do
         if not assertion_list.is_always_true(type) then
            cpp.stop_recursive_assertion_opening(True)
            assertion_list.for_each(agent compile_assertion_as_check_compound(?))
            cpp.stop_recursive_assertion_closing(True)
         end
      end

   compile_assertion_as_check_compound (assertion: ASSERTION)
      do
         compile_assertion(assertion, once "ac_civ")
      end

   compile_assertion_as_loop_invariant (assertion: ASSERTION)
      do
         compile_assertion(assertion, once "ac_liv")
      end

   compile_assertion_as_require_1 (assertion: ASSERTION)
      do
         compile_assertion(assertion, once "ac_req")
      end

   compile_assertion_as_ensure (assertion: ASSERTION)
      do
         compile_assertion(assertion, once "ac_ens")
      end

   compile_assertion_as_class_invariant (assertion: ASSERTION)
      do
         compile_assertion(assertion, once "ac_inv")
      end

   compile_assertion (assertion: ASSERTION; check_assertion_mode: STRING)
      local
         tag_name: STRING
      do
         if not assertion.is_always_true(type) then
            if assertion.tag /= Void then
               tag_name := assertion.tag.to_string
            else
               tag_name := assertion.source_view
            end
            cpp.check_assertion(type, assertion.expression, check_assertion_mode, tag_name)
         end
      end

end -- class C_CODE_COMPILER
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
