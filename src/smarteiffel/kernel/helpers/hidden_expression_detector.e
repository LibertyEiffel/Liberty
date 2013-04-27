-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class HIDDEN_EXPRESSION_DETECTOR

inherit
   EXPRESSION_VISITOR
      undefine is_equal
      end

insert
   GLOBALS
      undefine is_equal
      end
   SINGLETON

create {ASSERTION_PRINT_TOOLS}
   make

feature {}
   check_anonymous_feature (af: ANONYMOUS_FEATURE) is
      require
         af /= Void
         not hidden
         not_done_to_report_errors: error_handler.is_empty -- required by gives_permission_to
      do
         hidden := not af.permissions.gives_permission_to(client)
      ensure
         not_done_to_report_errors: error_handler.is_empty
      end

   check_arg_list (args: EFFECTIVE_ARG_LIST) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            hidden or else i > args.count
         loop
            args.expression(i).accept(Current)
            i := i + 1
         end
      end

   visit_call (visited: FUNCTION_CALL) is
      local
         t: EXPRESSION
      do
         t := visited.target
         check_anonymous_feature(visited.feature_stamp.anonymous_feature(t.resolve_in(current_type)))
         if not hidden then
            t.accept(Current)
         end
      end

   visit_call_1 (visited: CALL_1) is
      do
         visit_call(visited)
         if not hidden then
            visited.arg1.accept(Current)
         end
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION) is
      local
         i: INTEGER
      do
         from
            i := visited.lower
         until
            hidden or else i > visited.upper
         loop
            visited.item(i).accept(Current)
            i := i + 1
         end
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE) is
      local
         i: INTEGER
      do
         from
            i := 1
         until
            hidden or else i > visited.count
         loop
            visited.expression(i).accept(Current)
            i := i + 1
         end
      end

feature {}
   visit_fast_array_of_expression (list: FAST_ARRAY[EXPRESSION]) is
      require
         list /= Void
      local
         i: INTEGER
      do
         from
            i := list.lower
         until
            hidden or else i > list.upper
         loop
            list.item(i).accept(Current)
            i := i + 1
         end
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC) is
      do
         if visited.optional_arguments /= Void then
            visit_fast_array_of_expression(visited.optional_arguments)
         end
         if not hidden then
            visit_fast_array_of_expression(visited.item_list)
         end
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT) is
      do
         check
            False -- Not a real expression.
         end
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY) is
      do
         check
            False -- (Because we have already switched to the canonical form.)
         end
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ) is
      do
         visited.left_side.accept(Current)
         if not hidden then
            visited.right_side.accept(Current)
         end
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST) is
      do
         if visited.left_writable /= Void then
            visited.left_writable.accept(Current)
         end
         if not hidden then
            visited.right_side.accept(Current)
         end
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION) is
      do
         if visited.expression /= Void then
            visited.expression.accept(Current)
         end
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION) is
      do
         visited.target.accept(Current)
         if not hidden then
            visited.fake_tuple.accept(Current)
         end
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION) is
      do
         visited.code.accept(Current)
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION) is
      local
         call: PROCEDURE_CALL; args: EFFECTIVE_ARG_LIST; created_type: TYPE
      do
         created_type := visited.created_type(current_type)
         if not hidden then
            call := visited.call
            if call /= Void then
               args := call.arguments
               if args /= Void then
                  check_arg_list(args)
               end
            end
         end
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N) is
      do
         visit_call(visited)
         check_arg_list(visited.arguments)
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE) is
      local
         args: EFFECTIVE_ARG_LIST
      do
         args := visited.effective_arg_list
         if args /= Void then
            check_arg_list(args)
         end
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM) is
      do
         visited.index.accept(Current)
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH) is
      do
         check_anonymous_feature(visited.feature_stamp.anonymous_feature(visited.context_type))
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT) is
      do
         hidden := hide_current
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT) is
      do
         hidden := hide_current
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      do
         check
            False
         end
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C) is
      do
         visit_call(visited)
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE) is
      do
         check
            False
         end
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT) is
      do
         visited.expression.accept(Current)
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD) is
      do
         visited.expression.accept(Current)
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF) is
      do
         hidden := hide_current
         if not hidden then
            check_anonymous_feature(visited.feature_stamp.anonymous_feature(current_type))
         end
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0) is
      do
         visit_call(visited)
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS) is
      do
         visit_call(visited)
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS) is
      do
         visit_call(visited)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP) is
      do
         visit_call(visited)
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT) is
      do
         visit_call(visited)
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS) is
      do
         visit_call_1(visited)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE) is
      do
         visit_call_1(visited)
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE) is
      do
         -- Nothing to do
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID) is
      do
         -- Nothing to do
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING) is
      do
         -- Nothing to do
      end

feature {RESULT}
   visit_result (visited: RESULT) is
      do
         -- Nothing to do
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE) is
      do
         -- Nothing to do
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT) is
      do
         -- Nothing to do
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT) is
      do
         -- Nothing to do
      end

feature {NATURAL_CONSTANT}
   visit_natural_constant (visited: NATURAL_CONSTANT) is
      do
         -- Nothing to do
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT) is
      do
         -- Nothing to do
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET) is
      do
         -- Nothing to do
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND) is
      do
         -- Nothing to do
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND) is
      do
         visited.original_capture.accept(Current)
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER) is
      do
         -- Nothing to do
      end

feature {ARGUMENT_NAME2}
   visit_argument_name2 (visited: ARGUMENT_NAME2) is
      do
         -- Nothing to do
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST) is
      do
         -- Nothing to do
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH) is
      do
         -- Nothing to do
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL) is
      do
         check
            False
         end
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION) is
      do
         check
            False
         end
      end

feature {LOCAL_NAME2}
   visit_local_name2 (visited: LOCAL_NAME2) is
      do
         check
            False
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2) is
      do
         check
            False
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1) is
      do
         check
            False
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID) is
      do
         check
            False
         end
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2) is
      do
         check
            False
         end
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE) is
      do
         check
            False
         end
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT) is
      do
         check
            False
         end
      end

feature {ASSERTION_PRINT_TOOLS}
   visit (a: ASSERTION; ct: like current_type; cl: like client; hc: like hide_current): BOOLEAN is
      require
         a /= Void
         ct /= Void
         cl /= Void
      do
         hidden := False
         hide_current := hc
         client := cl
         current_type := ct
         if a.expression /= Void then
            a.expression.accept(Current)
         end
         Result := hidden
      end

feature {}
   hidden: BOOLEAN
         -- Memorize the result of the `visit'.

   hide_current: BOOLEAN

   client: CLASS_NAME

   current_type: TYPE

   make is
      do
      end

end -- class HIDDEN_EXPRESSION_DETECTOR
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
-- Copyright(C) 2011-2012: Cyril ADRIAN, Paolo REDAELLI
--
-- http://liberty-eiffel.blogspot.com - https://github.com/LibertyEiffel/Liberty
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
