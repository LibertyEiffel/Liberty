-- This file is part of Liberty Eiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_ASSIGNMENT

inherit
   LOCAL_NAME_REF_VISITOR
   WRITABLE_ATTRIBUTE_NAME_VISITOR
   RESULT_VISITOR
   INTERNAL_LOCAL2_VISITOR
   CREATE_WRITABLE_VISITOR
   FUNCTION_CALL_0_VISITOR

insert
   RUNNER_PROCESSOR_FACET

create {RUNNER_PROCESSOR}
   make

feature {RUNNER_EXPRESSIONS}
   test_assign (assignment: ASSIGNMENT_TEST): BOOLEAN
      local
         right: RUNNER_OBJECT; left_type: TYPE
      do
         if assignment.left_type_mark /= Void then
            left_type := smart_eiffel.get_type(assignment.left_type_mark, False)
         else
            left_type := smart_eiffel.get_type(type_mark(assignment.left_writable), False)
         end
         right := processor.expressions.eval(assignment.right_side)
         Result := right.type = left_type or else right.type.inherits_from(left_type)
      end

feature {RUNNER_INSTRUCTIONS}
   do_assign (assignment: ASSIGNMENT)
      local
         right: RUNNER_OBJECT
      do
         right := processor.expressions.eval(assignment.right_side)
         assign_to(right, assignment.left_side)
      end

   try_assign (assignment: ASSIGNMENT_ATTEMPT)
      local
         right: RUNNER_OBJECT; left_type: TYPE
      do
         right := processor.expressions.eval(assignment.right_side)
         left_type := smart_eiffel.get_type(type_mark(assignment.left_side), False)
         if right.type = left_type or else right.type.inherits_from(left_type) then
            assign_to(right, assignment.left_side)
         elseif assignment.forced_flag then
            processor.set_exception(exceptions.System_level_type_error,
                                    once "Forced assignment failed, #(1) does not conform to #(2)" # right.type.name.to_string # left_type.name.to_string)
         else
            check
               not left_type.is_expanded
            end
            assign_to(Void, assignment.left_side)
         end
      end

   assign_to (a_value: RUNNER_OBJECT; a_writable: EXPRESSION)
      do
         value := a_value
         a_writable.accept(Current)
         value := Void
      end

feature {LOCAL_NAME_REF}
   visit_local_name_ref (visited: LOCAL_NAME_REF)
      do
         current_frame.set_local_object(visited.to_string, value)
         entity_type := visited.resolve_in(current_frame.type_of_current)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME)
      local
         target: RUNNER_STRUCTURED_OBJECT
      do
         target ::= current_frame.target
         target.set_field(visited.to_string, value)
         entity_type := visited.resolve_in(current_frame.type_of_current)
      end

feature {RESULT}
   visit_result (visited: RESULT)
      do
         current_frame.set_return(value)
         entity_type := current_frame.type_of_result
      end

feature {INTERNAL_LOCAL2}
   visit_internal_local2 (visited: INTERNAL_LOCAL2)
      do
         current_frame.set_internal_local_object(visited, value)
         entity_type := visited.resolve_in(current_frame.type_of_current)
      end

feature {CREATE_WRITABLE}
   visit_create_writable (visited: CREATE_WRITABLE)
      do
         visited.writable.accept(Current)
      end

feature {FUNCTION_CALL_0}
   visit_function_call_0 (visited: FUNCTION_CALL_0)
      local
         target: RUNNER_STRUCTURED_OBJECT
         field_name: STRING; af: ANONYMOUS_FEATURE
      do
         target ::= processor.expressions.eval(visited.target)
         field_name := visited.feature_name.to_string
         af := visited.feature_stamp.anonymous_feature(target.type)
         check
            inlined_assignment: {WRITABLE_ATTRIBUTE} ?:= af
         end
         target.set_field(field_name, value)
         entity_type := af.result_type.resolve_in(target.type)
      end

feature {}
   type_mark (writable: EXPRESSION): TYPE_MARK
      do
         Result := writable.written_declaration_type_mark.to_static(current_frame.target.type, False)
      ensure
         Result.is_static
      end

feature {}
   make (a_processor: like processor)
      require
         a_processor /= Void
      do
         processor := a_processor
      ensure
         processor = a_processor
      end

   value: RUNNER_OBJECT
   entity_type: TYPE

end -- class RUNNER_ASSIGNMENT
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
-- Copyright (C) 2011-2016: Cyril ADRIAN, Paolo REDAELLI, Raphael MACK
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
