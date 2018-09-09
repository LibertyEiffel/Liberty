-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class C_TARGET_MAPPER
   -- Produce C code in order to pass `Current' EXPRESSION as the target of some feature call. When it
   -- needed, C code to check invariant is automatically added as well as a C cast according to the
   -- destination `target_formal_type'.

inherit
   EXPRESSION_VISITOR
      undefine
         is_equal
      end

insert
   C_EXPRESSION_COMPILATION_MIXIN[EXPRESSION]
      rename
         compile as compile_
      export {}
         compile_
      redefine
         visit_implicit_current,
         visit_written_current,
         visit_agent_expression,
         visit_assertion,
         visit_assignment_test,
         visit_closed_operand,
         visit_create_expression,
         visit_create_writable,
         visit_e_old,
         visit_expression_with_comment,
         visit_fake_argument,
         visit_fake_target,
         visit_fake_tuple,
         visit_generator_generating_type,
         visit_argument_name_ref,
         visit_local_name_ref,
         visit_loop_variant,
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
         visit_old_manifest_array,
         visit_open_operand,
         visit_precursor_expression,
         visit_result,
         visit_writable_attribute_name,
         compile_feature_call
      end

create {C_PRETTY_PRINTER}
   make

feature {ANY}
   compile (target: EXPRESSION; a_type: like type; a_target_formal_type: like target_formal_type)
      require
         smart_eiffel.is_ready
         target /= Void
         a_type.live_type /= Void
         a_target_formal_type.live_type /= Void
         cpp.pending_c_function
      local
         old_target_formal_type: like target_formal_type
      do
         old_target_formal_type := target_formal_type
         target_formal_type := a_target_formal_type

         compile_(target, a_type)

         target_formal_type := old_target_formal_type
      end

feature {}
   target_formal_type: TYPE

   frozen standard_mapping_c_target (target: EXPRESSION; is_addressable: BOOLEAN)
         -- The standard definition for `mapping_c_target'.
      require
         smart_eiffel.is_ready
         type.live_type /= Void
         target_formal_type.live_type /= Void
      local
         class_invariant_flag: INTEGER; actual_type: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, True)
         -- ***
         -- Why don't we use `target_formal_type' to avoid the following computation:
         actual_type := target.resolve_in(type)
         -- *** Dom April 30th 2008 ***
         if actual_type.is_reference then
            function_body.append(once "((")
            function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
            function_body.extend(')')
            compile_expression(target)
            function_body.extend(')')
         elseif is_addressable then
            if actual_type.has_external_type or else cpp.need_struct.for(actual_type.canonical_type_mark) then
               function_body.extend('&')
            end
            compile_expression(target)
         else
            if actual_type.has_external_type or else cpp.need_struct.for(actual_type.canonical_type_mark) then
               internal_c_local := cpp.pending_c_function_lock_local(actual_type, once "userexpandedagent")
               function_body.extend('(')
               internal_c_local.append_in(function_body)
               function_body.extend('=')
               compile_expression(target)
               function_body.extend(',')
               function_body.extend('&')
               internal_c_local.append_in(function_body)
               function_body.extend(')')
               internal_c_local.unlock
            else
               compile_expression(target)
            end
         end
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

feature {IMPLICIT_CURRENT}
   visit_implicit_current (visited: IMPLICIT_CURRENT)
      do
         cpp.print_current
      end

feature {WRITTEN_CURRENT}
   visit_written_current (visited: WRITTEN_CURRENT)
      local
         class_invariant_flag: INTEGER
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, False)
         cpp.print_current
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION)
      do
         standard_mapping_c_target(visited, False)
      end

feature {ASSERTION}
   visit_assertion (visited: ASSERTION)
      do
         crash
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST)
      do
         function_body.extend('(')
         Precursor(visited)
         function_body.extend(')')
      end

feature {CLOSED_OPERAND}
   visit_closed_operand (visited: CLOSED_OPERAND)
      do
         if visited.is_static then
            -- No field to store such a static value:
            visited.original_capture.accept(Current)
         elseif visited.inside_agent_launcher_flag then
            standard_mapping_c_target(visited, True)
         else
            -- Well, outside of the agent:
            visited.capture_memory.reference_at(type).accept(Current)
         end
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      local
         internal_c_local: INTERNAL_C_LOCAL
      do
         check
            -- This is actually a direct call:
            target_formal_type = visited.created_type(type)
         end
         if target_formal_type.is_reference then
            create_expression_support(visited, target_formal_type)
         elseif visited.extra_local_expanded(type) = Void then
            create_expression_support(visited, target_formal_type)
         else
            check
               visited.extra_local_expanded(type) = target_formal_type
            end
            function_body.extend('(')
            internal_c_local := cpp.pending_c_function_lock_local(target_formal_type, once "new")
            internal_c_local.append_in(function_body)
            function_body.extend('=')
            create_expression_support(visited, target_formal_type)
            function_body.append(once ",&")
            internal_c_local.append_in(function_body)
            internal_c_local.unlock
            function_body.extend(')')
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
         standard_mapping_c_target(visited, True)
      end

feature {EXPRESSION_WITH_COMMENT}
   visit_expression_with_comment (visited: EXPRESSION_WITH_COMMENT)
      do
         visited.expression.accept(Current)
      end

feature {FAKE_ARGUMENT}
   visit_fake_argument (visited: FAKE_ARGUMENT)
      do
         crash
      end

feature {FAKE_TARGET}
   visit_fake_target (visited: FAKE_TARGET)
      do
         standard_mapping_c_target(visited, True)
      end

feature {FAKE_TUPLE}
   visit_fake_tuple (visited: FAKE_TUPLE)
      do
         crash
      end

feature {GENERATOR_GENERATING_TYPE}
   visit_generator_generating_type (visited: GENERATOR_GENERATING_TYPE)
      do
         standard_mapping_c_target(visited, True)
      end

feature {ARGUMENT_NAME_REF}
   visit_argument_name_ref (visited: ARGUMENT_NAME_REF)
      do
         standard_mapping_c_target(visited, True)
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
         standard_mapping_c_target(visited, True)
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         crash -- Already moved as an EXPRESSION into the enclosing LOOP_INSTRUCTION.
      end

feature {E_VOID}
   visit_e_void (visited: E_VOID)
      do
         crash
      end

feature {MANIFEST_STRING}
   visit_manifest_string (visited: MANIFEST_STRING)
      do
         function_body.append(once "((")
         function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
         function_body.extend(')')
         Precursor(visited)
         function_body.extend(')')
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC)
      do
         function_body.append(once "((T")
         visited.created_type.id.append_in(function_body)
         function_body.append(once "*)(")
         Precursor(visited)
         function_body.append(once "))")
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE)
      do
         function_body.append(once "((")
         function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
         function_body.extend(')')
         Precursor(visited)
         function_body.extend(')')
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      do
         not_yet_implemented
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         not_yet_implemented
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1}
   visit_dynamic_dispatch_temporary1 (visited: DYNAMIC_DISPATCH_TEMPORARY1)
      do
         not_yet_implemented -- By very nature, not used in target position.
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2)
      do
         check
            visited.live_type.type = target_formal_type
         end
         if visited.live_type.is_reference then
            function_body.append(once "((T")
            visited.live_type.id.append_in(function_body)
            function_body.append(once "*)")
            compile_expression(visited.dynamic_dispatch_temporary1)
            function_body.extend(')')
         else
            compile_expression(visited.dynamic_dispatch_temporary1) -- should be compile_expanded_target???
         end
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         if target_formal_type.is_reference then
            function_body.append(once "((T")
            target_formal_type.id.append_in(function_body)
            function_body.append(once "*)")
            Precursor(visited)
            function_body.extend(')')
         elseif target_formal_type.is_user_expanded then
            if target_formal_type.has_external_type or else cpp.need_struct.for(target_formal_type.canonical_type_mark) then
               function_body.extend('&')
            end
            Precursor(visited)
         else
            Precursor(visited)
         end
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
         if target_formal_type.is_user_expanded and then not target_formal_type.is_empty_expanded then
            function_body.extend('&')
            function_body.extend('(')
            Precursor(visited)
            function_body.extend(')')
         else
            Precursor(visited)
         end
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH)
      do
         function_body.append(once "((")
         function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
         function_body.extend(')')
         Precursor(visited)
         function_body.extend(')')
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH)
      local
         actual_type: TYPE
      do
         if visited.once_function = Void then
            Precursor(visited)
         else
            actual_type := visited.dynamic_type
            if actual_type.is_user_expanded then
               if actual_type.has_external_type or else cpp.need_struct.for(actual_type.canonical_type_mark) then
                  function_body.extend('&')
               end
               Precursor(visited)
            else
               function_body.append(once "((")
               function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
               function_body.extend(')')
               Precursor(visited)
               function_body.extend(')')
            end
         end
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY)
      do
         crash -- Because we have already switched to the canonical form.
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND)
      do
         standard_mapping_c_target(visited, True)
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      do
         standard_mapping_c_target(visited, False)
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         standard_mapping_c_target(visited, True)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      do
         crash -- Cannot be syntactically in target position.
      end

feature {}
   compile_feature_call (visited: FUNCTION_CALL)
      local
         class_invariant_flag: INTEGER; actual_type: TYPE; internal_c_local: INTERNAL_C_LOCAL
      do
         class_invariant_flag := cpp.class_invariant_call_opening(target_formal_type, True)
         actual_type := visited.resolve_in(type)
         if actual_type.is_reference then
            function_body.extend('(')
            function_body.append(cpp.target_type.for(target_formal_type.canonical_type_mark))
            function_body.append(once ")(")
            Precursor(visited)
            function_body.extend(')')
         elseif target_formal_type.has_external_type or else cpp.need_struct.for(target_formal_type.canonical_type_mark) then
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
            Precursor(visited)
            if internal_c_local /= Void then
               function_body.append(once ",&")
               internal_c_local.append_in(function_body)
            end
            function_body.extend(')')
         else
            Precursor(visited)
         end
         cpp.class_invariant_call_closing(class_invariant_flag, False)
      end

end -- class C_TARGET_MAPPER
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
