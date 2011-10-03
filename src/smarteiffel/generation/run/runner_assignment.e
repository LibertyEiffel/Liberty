-- This file is part of SmartEiffel The GNU Eiffel Compiler Tools and Libraries.
-- See the Copyright notice at the end of this file.
--
class RUNNER_ASSIGNMENT

inherit
   LOCAL_NAME2_VISITOR
   WRITABLE_ATTRIBUTE_NAME_VISITOR
   RESULT_VISITOR

insert
   RUNNER_FACET

create {RUNNER_INSTRUCTIONS}
   make

feature {RUNNER_INSTRUCTIONS}
   processor: RUNNER_PROCESSOR

   assign (assignment: ASSIGNMENT) is
      do
         assign_to(processor.expressions.eval(assignment.right_side),
                   assignment.left_side)
      end

   try_assign (assignment: ASSIGNMENT_ATTEMPT) is
      do
         assign_to(processor.expressions.eval(assignment.right_side),
                   assignment.left_side)
         --|*** TODO check the entity type and act accordingly
      end

   assign_to (a_value: RUNNER_OBJECT; a_writable: EXPRESSION) is
      do
         value := a_value
         a_writable.accept(Current)
         value := Void
      end

feature {LOCAL_NAME2}
   visit_local_name2 (visited: LOCAL_NAME2) is
      do
         processor.current_frame.set_local_object(visited.to_string, value)
         entity_type := visited.resolve_in(processor.current_frame.type_of_current)
      end

feature {WRITABLE_ATTRIBUTE_NAME}
   visit_writable_attribute_name (visited: WRITABLE_ATTRIBUTE_NAME) is
      local
         target: RUNNER_STRUCTURED_OBJECT
      do
         target ::= processor.current_frame.target
         target.set_field(visited.to_string, value)
         entity_type := visited.resolve_in(processor.current_frame.type_of_current)
      end

feature {RESULT}
   visit_result (visited: RESULT) is
      do
         processor.current_frame.set_return(value)
         entity_type := processor.current_frame.type_of_result
      end

feature {}
   make (a_processor: like processor) is
      require
         a_processor /= Void
      do
         processor := a_processor
      ensure
         processor = a_processor
      end

   value: RUNNER_OBJECT
   entity_type: TYPE

invariant
   processor /= Void

end -- class RUNNER_ASSIGNMENT
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
