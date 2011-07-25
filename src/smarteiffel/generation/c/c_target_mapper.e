-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_TARGET_MAPPER
   -- Produce C code in order to pass `Current' EXPRESSION as the target of some feature call. When it is
   -- needed, C code to check invariant is automatically added as well as a C cast according to the
   -- destination `target_formal_type'.

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
   SINGLETON

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   compile (target: EXPRESSION; a_type: like type; a_target_formal_type: like target_formal_type) is
      require
         smart_eiffel.is_ready
         target /= Void
         a_type.live_type /= Void
         a_target_formal_type.live_type /= Void
         cpp.pending_c_function
      local
         old_type: like type
         old_target_formal_type: like target_formal_type
      do
         old_type := type
         old_target_formal_type := target_formal_type
         type := a_type
         target_formal_type := a_target_formal_type

         target.accept(Current)

         type := old_type
         target_formal_type := old_target_formal_type
      end

feature {}
   type: TYPE
   target_formal_type: TYPE

   frozen standard_mapping_c_target (target: EXPRESSION) is
         -- The standard definition for `mapping_c_target'.
      require
         smart_eiffel.is_ready
         type.live_type /= Void
         target_formal_type.live_type /= Void
      local
         class_invariant_flag: INTEGER; actual_type: TYPE
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, True)
         -- ***
         -- Why don't we use `target_formal_type' to avoid the following computation:
         actual_type := target.resolve_in(type)
         -- *** Dom April 30th 2008 ***
         if actual_type.is_reference then
            function_body.append(once "((")
            target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
            function_body.extend(')')
            target.compile_to_c(type)
            function_body.extend(')')
         else
            if actual_type.canonical_type_mark.need_c_struct or actual_type.has_external_type then
               function_body.extend('&')
            end
            target.compile_to_c(type)
         end
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

feature {}
   make is
      do
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT) is
      do
         cpp.print_current
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT) is
      local
         class_invariant_flag: INTEGER
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, False)
         cpp.print_current
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF) is
      do
         visited.compile_to_c(type)
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION) is
      do
         visited.compile_to_c(type)
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION) is
      do
         standard_mapping_c_target(visited)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION) is
      do
         crash
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST) is
      do
         function_body.extend('(')
         visited.compile_to_c(type)
         function_body.extend(')')
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ) is
      do
         visited.compile_to_c(type)
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND) is
      do
         if visited.is_static then
            -- No field to store such a static value:
            visited.original_capture.accept(Current)
         elseif visited.inside_agent_launcher_flag then
            standard_mapping_c_target(visited)
         else
            -- Well, outside of the agent:
            visited.capture_memory.reference_at(type).accept(Current)
         end
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION) is
      local
         internal_c_local: INTERNAL_C_LOCAL
      do
         check
            -- This is actually a direct call:
            target_formal_type = visited.created_type(type)
         end
         if target_formal_type.is_reference then
            visited.compile_to_c_support(type, target_formal_type)
         elseif visited.extra_local_expanded(type) = Void then
            visited.compile_to_c_support(type, target_formal_type)
         else
            check
               visited.extra_local_expanded(type) = target_formal_type
            end
            function_body.extend('(')
            internal_c_local := cpp.pending_c_function_lock_local(target_formal_type, once "new")
            internal_c_local.append_in(function_body)
            function_body.extend('=')
            visited.compile_to_c_support(type, target_formal_type)
            function_body.append(once ",&")
            internal_c_local.append_in(function_body)
            internal_c_local.unlock
            function_body.extend(')')
         end
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE) is
      do
         visited.writable.accept(Current)
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD) is
      do
         standard_mapping_c_target(visited)
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT) is
      do
         visited.expression.accept(Current)
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT) is
      do
         crash
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET) is
      do
         standard_mapping_c_target(visited)
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE) is
      do
         crash
      end

feature {}
   visit_function_call (visited: FUNCTION_CALL) is
      local
         class_invariant_flag: INTEGER; actual_type: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, True)
         actual_type := visited.resolve_in(type)
         if actual_type.is_reference then
            function_body.extend('(')
            target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
            function_body.append(once ")(")
            visited.compile_to_c(type)
            function_body.extend(')')
         elseif target_formal_type.canonical_type_mark.need_c_struct or target_formal_type.has_external_type then
            if visited.extra_local_expanded(type) = Void then
               function_body.append(once "&(")
            else
               check
                  visited.extra_local_expanded(type) = actual_type
               end
               function_body.extend('(')
               internal_c_local := cpp.pending_c_function_lock_local(actual_type, once "fcstrangeisnotunlock")
               internal_c_local.append_in(function_body)
               function_body.extend('=')
            end
            visited.compile_to_c(type)
            if internal_c_local /= Void then
               function_body.append(once ",&")
               internal_c_local.append_in(function_body)
            end
            function_body.extend(')')
         else
            visited.compile_to_c(type)
         end
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS) is
      do
         visit_function_call(visited)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP) is
      do
         visit_function_call(visited)
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT) is
      do
         visit_function_call(visited)
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS) is
      do
         visit_function_call(visited)
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C) is
      do
         visit_function_call(visited)
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES) is
      do
         visit_function_call(visited)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR) is
      do
         visit_function_call(visited)
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1) is
      do
         visit_function_call(visited)
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N) is
      do
         visit_function_call(visited)
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE) is
      do
         standard_mapping_c_target(visited)
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST) is
      do
         visited.compile_to_c(type)
      end

feature {ARGUMENT_NAME2}
   visit_argument_name2 (visited: ARGUMENT_NAME2) is
      do
         standard_mapping_c_target(visited)
      end

feature {LOCAL_NAME2}
   visit_local_name2 (visited: LOCAL_NAME2) is
      do
         standard_mapping_c_target(visited)
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT) is
      do
         crash -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE) is
      do
         visited.compile_to_c(type)
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE) is
      do
         visited.compile_to_c(type)
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT) is
      do
         visited.compile_to_c(type)
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT) is
      do
         visited.compile_to_c(type)
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT) is
      do
         visited.compile_to_c(type)
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID) is
      do
         crash
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING) is
      do
         function_body.append(once "((")
         target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
         function_body.extend(')')
         visited.compile_to_c(type)
         function_body.extend(')')
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC) is
      do
         function_body.append(once "((T")
         visited.created_type.id.append_in(function_body)
         function_body.append(once "*)(")
         visited.compile_to_c(type)
         function_body.append(once "))")
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE) is
      do
         function_body.append(once "((")
         target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
         function_body.extend(')')
         visited.compile_to_c(type)
         function_body.extend(')')
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION) is
      do
         not_yet_implemented
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID) is
      do
         not_yet_implemented
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1) is
      do
         not_yet_implemented -- By very nature, not used in target position.
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2) is
      do
         check
            visited.live_type.type = target_formal_type
         end
         if visited.live_type.is_reference then
            function_body.append(once "((T")
            visited.live_type.id.append_in(function_body)
            function_body.append(once "*)")
            visited.dynamic_dispatch_temporary1.compile_to_c(type)
            function_body.extend(')')
         else
            visited.dynamic_dispatch_temporary1.accept(Current)
         end
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2) is
      do
         if target_formal_type.is_reference then
            function_body.append(once "((T")
            target_formal_type.id.append_in(function_body)
            function_body.append(once "*)")
            visited.compile_to_c(type)
            function_body.extend(')')
         elseif target_formal_type.is_user_expanded then
            if not target_formal_type.is_empty_expanded then
               function_body.extend('&')
            end
            visited.compile_to_c(type)
         else
            visited.compile_to_c(type)
         end
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH) is
      do
         function_body.append(once "((")
         target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
         function_body.extend(')')
         visited.compile_to_c(type)
         function_body.extend(')')
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH) is
      do
         if visited.once_function = Void then
            visited.compile_to_c(type)
         elseif visited.dynamic_type.is_user_expanded then
            function_body.extend('&')
            visited.compile_to_c(type)
         else
            function_body.append(once "((")
            target_formal_type.canonical_type_mark.c_type_for_target_in(function_body)
            function_body.extend(')')
            visited.compile_to_c(type)
            function_body.extend(')')
         end
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER) is
      do
         visited.compile_to_c(type)
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL) is
      do
         visited.compile_to_c(type)
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY) is
      do
         crash -- Because we have already switched to the canonical form.
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND) is
      do
         standard_mapping_c_target(visited)
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION) is
      do
         standard_mapping_c_target(visited)
      end

feature {RESULT}
   visit_result (visited: RESULT) is
      do
         standard_mapping_c_target(visited)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      do
         crash -- Cannot be syntactically in target position.
      end

end -- class C_TARGET_MAPPER
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
