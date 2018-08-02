-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_DISPLAYER

inherit
   INSTRUCTION_VISITOR
   RUNNER_LOOP_VISITOR
   EXPRESSION_VISITOR
   EFFECTIVE_ARG_LIST_VISITOR
   WHEN_ITEM_VISITOR

insert
   RUNNER_FACET

create {RUNNER_GLOBALS}
   make

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION)
      do
         visited.written_link.accept(Current)
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST)
      do
         break --| **** TODO
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT)
      do
         break --| **** TODO
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION)
      do
         break --| **** TODO
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT)
      do
         break --| **** TODO
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT)
      do
         visited.left_side.accept(Current)
         if visited.forced_flag then
            stream.put_string(once " ::= ")
         else
            stream.put_string(once " ?= ")
         end
         visited.right_side.accept(Current)
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT)
      do
         visited.left_side.accept(Current)
         stream.put_string(once " := ")
         visited.right_side.accept(Current)
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND)
      do
         stream.put_string(once "<check>")
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE)
      do
         break --| **** TODO
      end

feature {COMMENT}
   visit_comment (visited: COMMENT)
      do
         stream.put_string(once "-- ...")
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND)
      do
         visited.list.for_each(agent (i: INSTRUCTION) do i.accept(Current); stream.put_string(once "; ") end)
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION)
      do
         stream.put_string(once "create ")
         if visited.explicit_type /= Void then
            stream.put_character('{')
            stream.put_string(visited.explicit_type.written_mark)
            stream.put_character('}')
            stream.put_character(' ')
         end
         if visited.call /= Void then
            visited.call.accept(Current)
         else
            visited.writable.accept(Current)
         end
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION)
      do
         visit_create_instruction(visited)
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND)
      do
         break --| **** TODO
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE)
      do
         stream.put_string(once "if ")
         visited.expression.accept(Current)
         stream.put_string(once " then ... else ...")
      end

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN)
      do
         stream.put_string(once "if ")
         visited.expression.accept(Current)
         stream.put_string(once " then ...")
      end

feature {}
   visit_inspect_statement (visited: INSPECT_STATEMENT)
      do
         stream.put_string(once "inspect ")
         visited.expression.accept(Current)
         visited.when_list.for_each(agent {WHEN_CLAUSE}.accept(Current))
         if visited.else_compound /= Void then
            stream.put_string(once " else ...")
         end
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT)
      do
         visit_inspect_statement(visited)
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT)
      do
         visit_inspect_statement(visited)
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION)
      do
         stream.put_string(once "from ... until ")
         visited.until_expression.accept(Current)
         stream.put_string(once " loop ...")
      end

feature {RUNNER_LOOP}
   visit_runner_loop (visited: RUNNER_LOOP)
      do
         stream.put_string(once "until ")
         visited.loop_instruction.until_expression.accept(Current)
         stream.put_string(once " loop ...")
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER)
      do
         break --| **** TODO
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION)
      do
         break --| **** TODO
      end

feature {SEDB}
   visit_sedb (visited: SEDB)
      do
         stream.put_string(once "<sedb>")
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION)
      do
         stream.put_string(once "<unused>")
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL)
      do
         stream.put_string(once "<Void call!>")
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION)
      do
         break --| **** TODO
      end

feature {}
   visit_feature_call (visited: FEATURE_CALL)
      do
         if visited.feature_name.is_simple_feature_name then
            stream.put_character('(')
            visited.target.accept(Current)
            stream.put_character(')')
            stream.put_character('.')
            stream.put_string(visited.feature_name.to_string)
            if visited.arguments /= Void then
               stream.put_character('(')
               visited.arguments.accept(Current)
               stream.put_character(')')
            end
         elseif visited.feature_name.is_infix_name then
            stream.put_character('(')
            visited.target.accept(Current)
            stream.put_character(')')
            stream.put_character(' ')
            stream.put_string(visited.feature_name.to_string)
            stream.put_character(' ')
            stream.put_character('(')
            visited.arguments.accept(Current)
            stream.put_character(')')
         elseif visited.feature_name.is_prefix_name then
            stream.put_string(visited.feature_name.to_string)
            stream.put_character('(')
            visited.target.accept(Current)
            stream.put_character(')')
            check
               visited.arguments = Void
            end
         else
            check False end
         end
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0)
      do
         visit_feature_call(visited)
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1)
      do
         visit_feature_call(visited)
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N)
      do
         visit_feature_call(visited)
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION)
      do
         break --| **** TODO
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION)
      do
         break --| **** TODO
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      do
         stream.put_string(once " when ")
         visited.list.for_each(agent {WHEN_ITEM}.accept(Current))
         stream.put_string(once " then ...")
      end

feature {WHEN_ITEM_1}
   visit_when_item_1 (visited: WHEN_ITEM_1)
      do
         visited.expression.accept(Current)
         stream.put_character(',')
      end

feature {WHEN_ITEM_2}
   visit_when_item_2 (visited: WHEN_ITEM_2)
      do
         visited.lower.accept(Current)
         stream.put_character('.')
         stream.put_character('.')
         visited.upper.accept(Current)
         stream.put_character(',')
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT)
      do
         stream.put_string(once "(Current)")
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT)
      do
         stream.put_string(once "Current")
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF)
      do
         break --| **** TODO
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION)
      do
         stream.put_string(once "agent ")
         visited.original_function_call.accept(Current)
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION)
      do
         visited.written_link.accept(Current)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION)
      do
         break --| **** TODO
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST)
      do
         if visited.left_type_mark /= Void then
            stream.put_character('{')
            stream.put_string(visited.left_type_mark.written_name.to_string)
            stream.put_character('}')
         else
            visited.left_writable.accept(Current)
         end
         stream.put_string(once " ?:= ")
         visited.right_side.accept(Current)
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ)
      do
         stream.put_character('(')
         visited.left_side.accept(Current)
         stream.put_character(')')
         stream.put_character(' ')
         if not visited.eq_flag then
            stream.put_character('/')
         end
         stream.put_character('=')
         stream.put_character(' ')
         stream.put_character('(')
         visited.right_side.accept(Current)
         stream.put_character(')')
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND)
      do
         visited.original_capture.accept(Current)
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      do
         stream.put_string(once "create ")
         stream.put_character('{')
         stream.put_string(visited.explicit_type.written_mark)
         stream.put_character('}')
         if visited.call /= Void then
            stream.put_character('.')
            visited.call.accept(Current)
         end
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE)
      do
         visited.writable.accept(Current)
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD)
      do
         break --| **** TODO
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT)
      do
         visited.expression.accept(Current)
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT)
      do
         break --| **** TODO
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET)
      do
         break --| **** TODO
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE)
      do
         break --| **** TODO
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS)
      do
         visit_feature_call(visited)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP)
      do
         visit_feature_call(visited)
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT)
      do
         visit_feature_call(visited)
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS)
      do
         visit_feature_call(visited)
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C)
      do
         visit_feature_call(visited)
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES)
      do
         visit_feature_call(visited)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR)
      do
         visit_feature_call(visited)
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1)
      do
         visit_feature_call(visited)
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N)
      do
         visit_feature_call(visited)
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE)
      do
         break --| **** TODO
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST)
      do
         stream.put_character('{')
         stream.put_string(visited.expression_type.name.to_string)
         stream.put_character(' ')
         visited.expression.accept(Current)
         stream.put_character('}')
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         stream.put_string(once "<argument:")
         stream.put_string(visited.to_string)
         stream.put_character('>')
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
         stream.put_string(once "<local:")
         stream.put_string(visited.to_string)
         stream.put_character('>')
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         break --| **** TODO
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE)
      do
         stream.put_string(once "False")
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE)
      do
         stream.put_string(once "True")
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT)
      do
         stream.put_string(visited.to_string)
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT)
      do
         stream.put_integer(visited.value_memory)
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT)
      do
         stream.put_string(visited.to_string)
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID)
      do
         stream.put_string(once "Void")
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING)
      do
         if visited.once_flag then
            stream.put_string(once "once ")
         end
         if visited.unicode_flag then
            stream.put_character('U')
         end
         stream.put_character('"')
         stream.put_string(visited.to_string)
         stream.put_character('"')
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC)
      local
         i, sc_count: INTEGER
      do
         stream.put_character('{')
         stream.put_string(visited.type_mark.written_mark)
         stream.put_character(' ')
         if visited.optional_arguments /= Void then
            visited.optional_arguments.for_each(agent (arg: EXPRESSION)
                                              do
                                                 arg.accept(Current)
                                                 stream.put_string(once ", ")
                                              end)
         end
         stream.put_string(once "<< ")
         from
            i := visited.item_list.lower
         until
            i > visited.item_list.upper
         loop
            if i > visited.item_list.lower then
               if visited.semicolon_count > 0 and then sc_count = visited.semicolon_count then
                  sc_count := 0
                  stream.put_string(once "; ")
               else
                  stream.put_string(once ", ")
                  sc_count := sc_count + 1
               end
            end
            visited.item_list.item(i).accept(Current)
            i := i + 1
         end
         stream.put_string(once " >>")
         stream.put_character('}')
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE)
      do
         stream.put_character('[')
         if visited.effective_arg_list /= Void then
            visited.effective_arg_list.accept(Current)
         end
         stream.put_character(']')
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY)
      do
         break --| **** TODO
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND)
      do
         if visited.curly_type /= Void then
            stream.put_character('{')
            stream.put_string(visited.curly_type.written_mark)
            stream.put_character('}')
         else
            stream.put_character('?')
         end
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      do
         break --| **** TODO
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         stream.put_string(once "Result")
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         stream.put_string(once "<writable:")
         stream.put_string(visited.to_string)
         stream.put_character('>')
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH)
      do
         visited.side_effect_free_expression.accept(Current)
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         stream.put_string(once "<internal:")
         stream.put_string(visited.hash_tag)
         stream.put_character('>')
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1)
      do
         visited.target.accept(Current)
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         stream.put_string(once "<id:")
         visited.dynamic_dispatch_temporary1.accept(Current)
         stream.put_character('>')
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2)
      do
         stream.put_string(once "<dispatch:")
         visited.dynamic_dispatch_temporary1.accept(Current)
         stream.put_character('>')
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL)
      do
         stream.put_string(once "<Void call!>")
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER)
      do
         stream.put_string(once "<null>")
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
         break --| **** TODO
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH)
      local
         name: STRING
      do
         stream.put_string("<non_void_no_dispatch:{")
         stream.put_string(visited.context_type.name.to_string)
         stream.put_string(once "}.")
         name := once ""
         name.clear_count
         visited.feature_stamp.name.complete_name_in(name)
         stream.put_string(name)
         stream.put_character('>')
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      do
         stream.put_string("<compound:")
         visited.list.last.to_expression.accept(Current)
         stream.put_character('>')
      end

feature {EFFECTIVE_ARG_LIST_0}
   visit_effective_arg_list_0 (visited: EFFECTIVE_ARG_LIST_0)
      do
      end

feature {EFFECTIVE_ARG_LIST_N}
   visit_effective_arg_list_n (visited: EFFECTIVE_ARG_LIST_N)
      do
         visited.first_one.accept(Current)
         if visited.remainder /= Void then
            visited.remainder.for_each(agent (e: EXPRESSION)
                                     do
                                        stream.put_string(once ", ")
                                        e.accept(Current)
                                     end)
         end
      end

feature {}
   make (a_stream: like stream)
      require
         a_stream.is_connected
      do
         stream := a_stream
      ensure
         stream = a_stream
      end

   stream: OUTPUT_STREAM

invariant
   stream.is_connected

end -- class RUNNER_DISPLAYER
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
