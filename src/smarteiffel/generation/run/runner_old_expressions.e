-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_OLD_EXPRESSIONS

inherit
   RUNNER_EXPRESSIONS
      rename
         execute as execute_
      redefine
         visit_e_old,
         visit_address_of,
         visit_agent_creation,
         visit_agent_expression,
         visit_assignment_test,
         visit_built_in_eq_neq,
         visit_create_expression,
         visit_create_writable,
         visit_function_call,
         visit_loop_variant,
         visit_manifest_generic,
         visit_manifest_tuple,
         visit_old_manifest_array,
         visit_open_operand,
         visit_precursor_expression,
         visit_no_dispatch,
         visit_internal_local2,
         visit_dynamic_dispatch_temporary1_id,
         visit_dynamic_dispatch_temporary2,
         visit_void_call,
         visit_native_array_item,
         visit_non_void_no_dispatch,
         visit_compound_expression
      end
   EFFECTIVE_ARG_LIST_VISITOR

insert
   RUNNER_PROCESSOR_FACET

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_FACET}
   execute (a_expression: EXPRESSION; a_rf: RUN_FEATURE)
      require
         a_expression /= Void
         a_rf /= Void
      local
         counter: TAGGED_COUNTER
         old_id_counter: like id_counter
         old_old_mode: like old_mode
      do
         old_id_counter := id_counter

         counter ::= a_rf.tag(tag_id_counter)
         if counter = Void then
            create counter.make
            a_rf.set_tag(tag_id_counter, counter)
         end

         id_counter := counter.item
         old_old_mode := old_mode
         old_mode := False

         execute_(a_expression)

         old_mode := old_old_mode
         id_counter := old_id_counter
      end

feature {E_OLD}
   visit_e_old (visited: E_OLD)
      local
         value: like return
         id: TAGGED_INTEGER
         old_old_mode: like old_mode
      do
         old_old_mode := old_mode
         old_mode := True
         value := eval(visited.expression)
         old_mode := old_old_mode
         processor.clear_exception

         id ::= visited.tag(tag_id)
         if id = Void then
            create id.set_item(id_counter.item)
            id_counter.next
            visited.set_tag(tag_id, id)
         end
         processor.current_frame.set_old_value(id.item, value)
      end

feature {}
   old_mode: BOOLEAN
   id_counter: COUNTER

   tag_id_counter: FIXED_STRING
      once
         Result := "run.id_counter".intern
      end

feature {ADDRESS_OF}
   visit_address_of (visited: ADDRESS_OF)
      do
         if old_mode then
            Precursor(visited)
         else
            if visited.local_name /= Void then
               visited.local_name.accept(Current)
            end
            if visited.calling_code /= Void then
               visited.calling_code.accept(Current)
            end
         end
      end

feature {AGENT_CREATION}
   visit_agent_creation (visited: AGENT_CREATION)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.code.accept(Current)
            if visited.open_operand_list /= Void then
               visited.open_operand_list.for_each(agent {OPEN_OPERAND}.accept(Current))
            end
            if visited.closed_operand_list /= Void then
               visited.closed_operand_list.for_each(agent {CLOSED_OPERAND}.accept(Current))
            end
         end
      end

feature {AGENT_EXPRESSION}
   visit_agent_expression (visited: AGENT_EXPRESSION)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.target.accept(Current)
            if visited.fake_tuple.list /= Void then
               visited.fake_tuple.list.for_each(agent {EXPRESSION}.accept(Current))
            end
         end
      end

feature {ASSIGNMENT_TEST}
   visit_assignment_test (visited: ASSIGNMENT_TEST)
      do
         if old_mode then
            Precursor(visited)
         else
            if visited.left_writable /= Void then
               visited.left_writable.accept(Current)
            end
            visited.right_side.accept(Current)
         end
      end

feature {BUILT_IN_EQ_NEQ}
   visit_built_in_eq_neq (visited: BUILT_IN_EQ_NEQ)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.left_side.accept(Current)
            visited.right_side.accept(Current)
         end
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
            visited.remainder.for_each(agent {EXPRESSION}.accept(Current))
         end
      end

feature {CREATE_EXPRESSION}
   visit_create_expression (visited: CREATE_EXPRESSION)
      do
         if old_mode then
            Precursor(visited)
         else
            if visited.call /= Void and then visited.call.arguments /= Void then
               visited.call.arguments.accept(Current)
            end
         end
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.writable.accept(Current)
         end
      end

feature {}
   visit_function_call (visited: FUNCTION_CALL)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.target.accept(Current)
            if visited.arguments /= Void then
               visited.arguments.accept(Current)
            end
         end
      end

feature {LOOP_VARIANT}
   visit_loop_variant (visited: LOOP_VARIANT)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.expression.accept(Current)
         end
      end

feature {MANIFEST_GENERIC}
   visit_manifest_generic (visited: MANIFEST_GENERIC)
      do
         if old_mode then
            Precursor(visited)
         else
            if visited.optional_arguments /= Void then
               visited.optional_arguments.for_each(agent {EXPRESSION}.accept(Current))
            end
            visited.item_list.for_each(agent {EXPRESSION}.accept(Current))
         end
      end

feature {MANIFEST_TUPLE}
   visit_manifest_tuple (visited: MANIFEST_TUPLE)
      do
         if old_mode then
            Precursor(visited)
         elseif visited.effective_arg_list /= Void then
            visited.effective_arg_list.accept(Current)
         end
      end

feature {OLD_MANIFEST_ARRAY}
   visit_old_manifest_array (visited: OLD_MANIFEST_ARRAY)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.list.for_each(agent {EXPRESSION}.accept(Current))
         end
      end

feature {OPEN_OPERAND}
   visit_open_operand (visited: OPEN_OPERAND)
      do
         if old_mode then
            Precursor(visited)
         end
      end

feature {PRECURSOR_EXPRESSION}
   visit_precursor_expression (visited: PRECURSOR_EXPRESSION)
      do
         if old_mode then
            Precursor(visited)
         elseif visited.arguments /= Void then
            visited.arguments.accept(Current)
         end
      end

feature {NO_DISPATCH}
   visit_no_dispatch (visited: NO_DISPATCH)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.side_effect_free_expression.accept(Current)
         end
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         if old_mode then
            Precursor(visited)
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY1_ID}
   visit_dynamic_dispatch_temporary1_id (visited: DYNAMIC_DISPATCH_TEMPORARY1_ID)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.dynamic_dispatch_temporary1.accept(Current)
         end
      end

feature {DYNAMIC_DISPATCH_TEMPORARY2}
   visit_dynamic_dispatch_temporary2 (visited: DYNAMIC_DISPATCH_TEMPORARY2)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.dynamic_dispatch_temporary1.accept(Current)
         end
      end

feature {NATIVE_ARRAY_ITEM}
   visit_native_array_item (visited: NATIVE_ARRAY_ITEM)
      do
         if old_mode then
            Precursor(visited)
         end
      end

feature {VOID_CALL}
   visit_void_call (visited: VOID_CALL)
      do
         if old_mode then
            Precursor(visited)
         end
      end

feature {NON_VOID_NO_DISPATCH}
   visit_non_void_no_dispatch (visited: NON_VOID_NO_DISPATCH)
      do
         if old_mode then
            Precursor(visited)
         end
      end

feature {COMPOUND_EXPRESSION}
   visit_compound_expression (visited: COMPOUND_EXPRESSION)
      do
         if old_mode then
            Precursor(visited)
         else
            visited.for_each(agent visit_compound_expression_code)
         end
      end

feature {}
   visit_compound_expression_code (code: CODE)
      do
         if {INSTRUCTION} ?:= code then -- OK, dirty, but the alternative is a bunch of trivial visitors
            if old_mode then
               processor.instructions.execute(code)
            end
         else
            code.accept(Current)
         end
      end

end -- class RUNNER_OLD_EXPRESSIONS
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
