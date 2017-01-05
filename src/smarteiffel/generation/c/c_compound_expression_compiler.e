-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_COMPOUND_EXPRESSION_COMPILER
   -- Produce C code in order to pass the expression as an argument of the feature called.

inherit
   EXPRESSION_VISITOR
      undefine
         is_equal
      end

insert
   C_EXPRESSION_COMPILATION_MIXIN[EXPRESSION]
      rename
         compile as compile_,
         compile_expression as compile_expression_
      export {}
         compile_, compile_expression_
      redefine
         visit_abstract_current,
         visit_address_of,
         visit_agent_creation,
         visit_agent_expression,
         visit_assertion,
         visit_assignment_test,
         visit_built_in_eq_neq,
         visit_closed_operand,
         visit_create_expression,
         visit_create_writable,
         visit_e_old,
         visit_expression_with_comment,
         visit_fake_argument,
         visit_fake_target,
         visit_fake_tuple,
         visit_call_prefix_minus,
         visit_call_prefix_freeop,
         visit_call_prefix_not,
         visit_call_prefix_plus,
         visit_static_call_0_c,
         visit_function_call_0,
         visit_call_infix_and_then,
         visit_call_infix_and,
         visit_call_infix_int_div,
         visit_call_infix_freeop,
         visit_call_infix_ge,
         visit_call_infix_gt,
         visit_call_infix_implies,
         visit_call_infix_div,
         visit_call_infix_int_rem,
         visit_call_infix_le,
         visit_call_infix_lt,
         visit_call_infix_minus,
         visit_call_infix_or_else,
         visit_call_infix_or,
         visit_call_infix_plus,
         visit_call_infix_power,
         visit_call_infix_times,
         visit_call_infix_xor,
         visit_function_call_1,
         visit_function_call_n,
         visit_generator_generating_type,
         visit_implicit_cast,
         visit_argument_name_ref,
         visit_local_name_ref,
         visit_loop_variant,
         visit_e_false,
         visit_e_true,
         visit_character_constant,
         visit_integer_constant,
         visit_natural_constant,
         visit_real_constant,
         visit_e_void,
         visit_manifest_string,
         visit_manifest_generic,
         visit_manifest_tuple,
         visit_compound_expression,
         visit_dynamic_dispatch_temporary1_id,
         visit_dynamic_dispatch_temporary1,
         visit_dynamic_dispatch_temporary2,
         visit_internal_local2,
         visit_native_array_item,
         visit_no_dispatch,
         visit_non_void_no_dispatch,
         visit_null_pointer,
         visit_void_call,
         visit_old_manifest_array,
         visit_open_operand,
         visit_precursor_expression,
         visit_result,
         visit_writable_attribute_name,
         visit_ifthen_exp,
         visit_ifthenelse_exp
      end

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   compile (a_continue: like continue; expression: EXPRESSION; a_finish: like finish; a_type: like type)
      do
         do_compile(a_continue, expression, False, a_finish, a_type)
      end

   compile_expression (a_continue: like continue; expression: EXPRESSION; a_finish: like finish; a_type: like type)
      do
         do_compile(a_continue, expression, True, a_finish, a_type)
      end

feature {}
   do_compile (a_continue: like continue; expression: EXPRESSION; a_is_expression: BOOLEAN; a_finish: like finish; a_type: like type)
      local
         old_continue, old_finish: STRING
         old_is_expression: BOOLEAN
      do
         old_continue := continue
         old_finish := finish
         old_is_expression := is_expression
         continue := a_continue
         finish := a_finish
         is_expression := a_is_expression

         compile_(expression, a_type)

         is_expression := old_is_expression
         continue := old_continue
         finish := old_finish
      end

   continue, finish: STRING
   is_expression: BOOLEAN

feature {}
   visit_abstract_current (visited: ABSTRACT_CURRENT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_PREFIX_MINUS}
   visit_call_prefix_minus (visited: CALL_PREFIX_MINUS)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_PREFIX_FREEOP}
   visit_call_prefix_freeop (visited: CALL_PREFIX_FREEOP)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_PREFIX_NOT}
   visit_call_prefix_not (visited: CALL_PREFIX_NOT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_PREFIX_PLUS}
   visit_call_prefix_plus (visited: CALL_PREFIX_PLUS)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {STATIC_CALL_0_C}
   visit_static_call_0_c (visited: STATIC_CALL_0_C)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_AND_THEN}
   visit_call_infix_and_then (visited: CALL_INFIX_AND_THEN)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_AND}
   visit_call_infix_and (visited: CALL_INFIX_AND)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_INT_DIV}
   visit_call_infix_int_div (visited: CALL_INFIX_INT_DIV)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_FREEOP}
   visit_call_infix_freeop (visited: CALL_INFIX_FREEOP)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_GE}
   visit_call_infix_ge (visited: CALL_INFIX_GE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_GT}
   visit_call_infix_gt (visited: CALL_INFIX_GT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_IMPLIES}
   visit_call_infix_implies (visited: CALL_INFIX_IMPLIES)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_DIV}
   visit_call_infix_div (visited: CALL_INFIX_DIV)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_INT_REM}
   visit_call_infix_int_rem (visited: CALL_INFIX_INT_REM)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_LE}
   visit_call_infix_le (visited: CALL_INFIX_LE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_LT}
   visit_call_infix_lt (visited: CALL_INFIX_LT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_MINUS}
   visit_call_infix_minus (visited: CALL_INFIX_MINUS)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_OR_ELSE}
   visit_call_infix_or_else (visited: CALL_INFIX_OR_ELSE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_OR}
   visit_call_infix_or (visited: CALL_INFIX_OR)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_PLUS}
   visit_call_infix_plus (visited: CALL_INFIX_PLUS)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_POWER}
   visit_call_infix_power (visited: CALL_INFIX_POWER)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_TIMES}
   visit_call_infix_times (visited: CALL_INFIX_TIMES)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CALL_INFIX_XOR}
   visit_call_infix_xor (visited: CALL_INFIX_XOR)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FUNCTION_CALL_1}
   visit_function_call_1 (visited: FUNCTION_CALL_1)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {FUNCTION_CALL_N}
   visit_function_call_n (visited: FUNCTION_CALL_N)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {IMPLICIT_CAST}
   visit_implicit_cast (visited: IMPLICIT_CAST)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {E_FALSE}
   visit_e_false (visited: E_FALSE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {E_TRUE}
   visit_e_true (visited: E_TRUE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {CHARACTER_CONSTANT}
   visit_character_constant (visited: CHARACTER_CONSTANT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {INTEGER_CONSTANT}
   visit_integer_constant (visited: INTEGER_CONSTANT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {NATURAL_CONSTANT}
   visit_natural_constant (visited: NATURAL_CONSTANT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {REAL_CONSTANT}
   visit_real_constant (visited: REAL_CONSTANT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      local
         i: INTEGER; exp: EXPRESSION
      do
         if is_expression then
            function_body.extend('(')
            from
               i := visited.list.lower
            until
               i = visited.list.upper
            loop
               if i > visited.list.lower then
                  function_body.extend(',')
               end
               function_body.extend('(')
               compile_code_as_expression(visited.list.item(i))
               function_body.extend(')')
               i := i + 1
            end
            if i > visited.list.lower then
               function_body.extend(',')
            end
            function_body.extend('(')
            function_body.append(continue)
            exp ::= visited.list.last
            compile_expression_(exp)
            function_body.append(finish)
            function_body.extend(')')
            function_body.extend(')')
         else
            from
               i := visited.list.lower
            until
               i = visited.list.upper
            loop
               compile_code(visited.list.item(i))
               i := i + 1
            end
            function_body.append(continue)
            exp ::= visited.list.last
            compile_expression_(exp)
            function_body.append(finish)
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {NULL_POINTER}
   visit_null_pointer (visited: NULL_POINTER)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {IFTHEN_EXP}
   visit_ifthen_exp (visited: IFTHEN_EXP)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

feature {IFTHENELSE_EXP}
   visit_ifthenelse_exp (visited: IFTHENELSE_EXP)
      do
         function_body.append(continue)
         Precursor(visited)
         function_body.append(finish)
      end

end -- class C_COMPOUND_EXPRESSION_COMPILER
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
