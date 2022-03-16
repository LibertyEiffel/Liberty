-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class CODE_COMPARATOR

inherit
   CODE_VISITOR
      undefine is_equal
      end
   EFFECTIVE_ARG_LIST_VISITOR
      undefine is_equal
      end

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {INSPECT_STATEMENT}
   make

feature {EFFECTIVE_ARG_LIST_0}
   visit_effective_arg_list_0 (visited: EFFECTIVE_ARG_LIST_0)
      do
         trace.append(once "()")
      end

feature {EFFECTIVE_ARG_LIST_N}
   visit_effective_arg_list_n (visited: EFFECTIVE_ARG_LIST_N)
      local
         i: INTEGER
      do
         trace.extend('(')
         from
            i := visited.lower
         until
            not trace_result or else i > visited.upper
         loop
            visited.item(i).accept(Current)
            trace.extend(',')
            i := i + 1
         end
         trace.extend(')')
      end

feature {COMPOUND}
   visit_compound (visited: COMPOUND)
      local
         i: INTEGER
      do
         from
            i := visited.lower
         until
            not trace_result or else i > visited.upper
         loop
            visited.item(i).accept(Current)
            trace.extend(';')
            i := i + 1
         end
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      local
         i: INTEGER
      do
         from
            i := visited.lower
         until
            not trace_result or else i > visited.upper
         loop
            visited.item(i).accept(Current)
            trace.extend(';')
            i := i + 1
         end
      end

feature {COMMENT}
   visit_comment (visited: COMMENT)
      do
      end

feature {LOOP_INSTRUCTION}
   visit_loop_instruction (visited: LOOP_INSTRUCTION)
      do
         trace_result := False
      end

feature {NO_INVARIANT_WRAPPER}
   visit_no_invariant_wrapper (visited: NO_INVARIANT_WRAPPER)
      do
         trace_result := False
      end

feature {ASSIGNMENT_ATTEMPT}
   visit_assignment_attempt (visited: ASSIGNMENT_ATTEMPT)
      do
         visited.left_side.accept(Current)
         trace.append(if visited.forced_flag then once "::=" else once "?=" end)
         visited.right_side.accept(Current)
      end

feature {ASSIGNMENT}
   visit_assignment (visited: ASSIGNMENT)
      do
         visited.left_side.accept(Current)
         trace.append(once ":=")
         visited.right_side.accept(Current)
      end

feature {ASSIGNMENT_CALL_ASSIGNER}
   visit_assignment_call_assigner (visited: ASSIGNMENT_CALL_ASSIGNER)
      do
         visited.left_side.accept(Current)
         trace.append(once ":=")
         visited.right_side.accept(Current)
      end

feature {CECIL_ENTRY}
   visit_cecil_entry (visited: CECIL_ENTRY)
      do
         trace_result := False
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      do
         trace_result := False
      end

feature {PRECURSOR_INSTRUCTION}
   visit_precursor_instruction (visited: PRECURSOR_INSTRUCTION)
      do
         trace_result := False
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         trace_result := False
      end

feature {IFTHENELSE}
   visit_ifthenelse (visited: IFTHENELSE)
      do
         trace_result := False
      end

feature {IFTHENELSE_EXP}
   visit_ifthenelse_exp (visited: IFTHENELSE_EXP)
      do
         trace_result := False
      end

feature {VOID_PROC_CALL}
   visit_void_proc_call (visited: VOID_PROC_CALL)
      do
         trace_result := False
      end

feature {SEDB}
   visit_sedb (visited: SEDB)
      do
         trace_result := False
      end

feature {RUN_TIME_ERROR_INSTRUCTION}
   visit_run_time_error_instruction (visited: RUN_TIME_ERROR_INSTRUCTION)
      do
         trace_result := False
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT)
      do
         trace_result := False
      end

feature {C_INLINE}
   visit_c_inline (visited: C_INLINE)
      do
         trace_result := False
      end

feature {MANIFEST_STRING_INSPECT_STATEMENT}
   visit_manifest_string_inspect_statement (visited: MANIFEST_STRING_INSPECT_STATEMENT)
      do
         trace_result := False
      end

feature {OTHER_INSPECT_STATEMENT}
   visit_other_inspect_statement (visited: OTHER_INSPECT_STATEMENT)
      do
         trace_result := False
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            trace.append(once "()")
         end
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            visited.arguments.accept(Current)
         end
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            visited.arguments.accept(Current)
         end
      end

feature {PROCEDURE_CALL_0}
   visit_procedure_call_0 (visited: PROCEDURE_CALL_0)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            trace.append(once "()")
         end
      end

feature {PROCEDURE_CALL_1}
   visit_procedure_call_1 (visited: PROCEDURE_CALL_1)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            visited.arguments.accept(Current)
         end
      end

feature {PROCEDURE_CALL_N}
   visit_procedure_call_n (visited: PROCEDURE_CALL_N)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            visited.arguments.accept(Current)
         end
      end

feature {REQUIRE_ASSERTION}
   visit_require_assertion (visited: REQUIRE_ASSERTION)
      do
         trace_result := False
      end

feature {AGENT_INSTRUCTION}
   visit_agent_instruction (visited: AGENT_INSTRUCTION)
      do
         trace_result := False
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT)
      do
         visited.value_memory.append_in(trace)
      end

feature {NATURAL_CONSTANT}
   visit_natural_constant (visited: NATURAL_CONSTANT)
      do
         visited.value_memory.append_in(trace)
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET)
      do
         trace_result := False
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING)
      do
         trace_result := False
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF)
      do
         trace_result := False
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1)
      do
         trace_result := False
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         trace_result := False
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2)
      do
         trace_result := False
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT)
      do
         trace.extend(visited.value)
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT)
      do
         trace.append(visited.normalized_view)
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL)
      do
         trace_result := False
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER)
      do
         trace.append(once " _NULL ")
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         trace_result := False
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
         if visited.array /= Void then
            visited.array.accept(Current)
         end
         trace.extend('@')
         visited.index.accept(Current)
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH)
      do
         trace_result := False
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH)
      do
         trace.append(visited.dynamic_type.name.to_string)
         trace.extend('.')
         trace.append(visited.feature_stamp.name.to_string)
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION)
      do
         trace_result := False
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID)
      do
         trace.append(as_void)
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE)
      do
         trace_result := False
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD)
      do
         trace_result := False
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT)
      do
         if ace.boost then
            trace.append(as_current)
         end
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT)
      do
         trace.append(as_current)
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST)
      do
         visited.expression.accept(Current)
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE)
      do
         trace_result := False
      end

feature {RETRY_INSTRUCTION}
   visit_retry_instruction (visited: RETRY_INSTRUCTION)
      do
         trace_result := False
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE)
      do
         trace.append(fz_true)
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE)
      do
         trace.append(fz_false)
      end

feature {CHECK_COMPOUND}
   visit_check_compound (visited: CHECK_COMPOUND)
      do
         trace_result := False
      end

feature {}
   visit_call_infix (visited: CALL_INFIX)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
            visited.arguments.accept(Current)
         end
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES)
      do
         trace_result := False
         check
            is_actually_inlined: False
         end
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN)
      do
         trace_result := False
         check
            is_actually_inlined: False
         end
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE)
      do
         trace_result := False
         check
            is_actually_inlined: False
         end
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE)
      do
         visit_call_infix(visited)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE)
      do
         visit_call_infix(visited)
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C)
      do
         trace_result := False
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST)
      do
         trace_result := False
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE)
      do
         trace_result := False
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE)
      do
         trace_result := False
      end

feature {}
   visit_call_prefix (visited: CALL_PREFIX)
      do
         visited.target.accept(Current)
         if trace_result then
            trace.extend(':')
            trace.append(visited.target.resolve_in(type).name.to_string)
            trace.extend('.')
            trace.append(visited.feature_stamp.name.to_string)
         end
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT)
      do
         visit_call_prefix(visited)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP)
      do
         visit_call_prefix(visited)
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS)
      do
         visit_call_prefix(visited)
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS)
      do
         visit_call_prefix(visited)
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT)
      do
         trace_result := False
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         trace.append(visited.to_string)
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
         trace.append(visited.to_string)
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY)
      do
         trace_result := False
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC)
      do
         trace_result := False
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         trace.append(as_result)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         trace.append(visited.to_string)
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND)
      do
         trace_result := False
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION)
      do
         trace_result := False
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ)
      do
         trace_result := False
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND)
      do
         trace_result := False
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION)
      do
         trace_result := False
      end

feature {ASSERTION_LIST}
   visit_assertion_list (visited: ASSERTION_LIST)
      do
         trace_result := False
      end

feature {ENSURE_ASSERTION}
   visit_ensure_assertion (visited: ENSURE_ASSERTION)
      do
         trace_result := False
      end

feature {LOOP_INVARIANT}
   visit_loop_invariant (visited: LOOP_INVARIANT)
      do
         trace_result := False
      end

feature {CLASS_INVARIANT}
   visit_class_invariant (visited: CLASS_INVARIANT)
      do
         trace_result := False
      end

feature {DEBUG_COMPOUND}
   visit_debug_compound (visited: DEBUG_COMPOUND)
      do
         trace_result := False
      end

feature {IFTHEN}
   visit_ifthen (visited: IFTHEN)
      do
         trace_result := False
      end

feature {IFTHEN_EXP}
   visit_ifthen_exp (visited: IFTHEN_EXP)
      do
         trace_result := False
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      do
         trace_result := False
      end

feature {CREATE_INSTRUCTION}
   visit_create_instruction (visited: CREATE_INSTRUCTION)
      do
         trace_result := False
      end

feature {RAW_CREATE_INSTRUCTION}
   visit_raw_create_instruction (visited: RAW_CREATE_INSTRUCTION)
      do
         trace_result := False
      end

feature {WHEN_CLAUSE}
   visit_when_clause (visited: WHEN_CLAUSE)
      do
         trace_result := False
      end

feature {UNUSED_EXPRESSION}
   visit_unused_expression (visited: UNUSED_EXPRESSION)
      do
         visited.expression.accept(Current)
         trace.extend(';')
      end

feature {INSPECT_STATEMENT}
   trace_in (tr: like trace; ty: like type; instruction: INSTRUCTION): BOOLEAN
         -- In case of a True `Result', there is a possibility that the `instruction' can be identical to
         -- some other piece of `instruction' (written somewhere else!).
      require
         smart_eiffel.status.inlining_dynamic_dispatch_done
         tr /= Void
         ty /= Void
         instruction /= Void
      do
         type := ty
         trace := tr
         trace.clear_count
         trace_result := True
         instruction.accept(Current)
         Result := trace_result
      end

feature {}
   type: TYPE
         -- The classic context TYPE.

   trace: STRING
         -- The identification `trace' of the INSTRUCTION to traverse.

   trace_result: BOOLEAN
         -- The `Result' of `trace_in'.

   make
      do
      end

invariant
   smart_eiffel.status.inlining_dynamic_dispatch_done

end -- class CODE_COMPARATOR
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
