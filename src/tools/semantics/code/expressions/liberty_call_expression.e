-- This file is part of Liberty Eiffel.
--
-- Liberty Eiffel is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, version 3 of the License.
--
-- Liberty Eiffel is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with Liberty Eiffel.  If not, see <http://www.gnu.org/licenses/>.
--
class LIBERTY_CALL_EXPRESSION

inherit
   LIBERTY_EXPRESSION
      redefine
         is_agent_call
      end
   LIBERTY_CALL

create {LIBERTY_BUILDER_TOOLS, LIBERTY_CALL_EXPRESSION}
   make, implicit_current

feature {ANY}
   target: LIBERTY_EXPRESSION
   entity: LIBERTY_FEATURE_ENTITY
   is_agent_call: BOOLEAN

   result_type: LIBERTY_TYPE is
      do
         Result := entity.result_type
      end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
   mark_reachable_code (mark: INTEGER) is
      do
         if target /= Void then
            target.mark_reachable_code(mark)
         end
         entity.mark_reachable_code(mark)
         expressions_marker.mark_reachable_code(mark, actuals)
      end

feature {LIBERTY_AGENT, LIBERTY_CALL_EXPRESSION}
   set_agent_call is
      do
         is_agent_call := True
      ensure
         is_agent_call
      end

   set_open_target (open_target: LIBERTY_OPEN_ARGUMENT) is
      require
         is_agent_call
         {LIBERTY_OPEN_ARGUMENT} ?:= target
         open_target /= Void
      do
         target := open_target
      ensure
         target = open_target
      end

   set_actual (new_actual: LIBERTY_OPEN_ARGUMENT; index: INTEGER) is
      require
         is_agent_call
         actuals.valid_index(index)
         {LIBERTY_OPEN_ARGUMENT} ?:= actuals.item(index)
         new_actual /= Void
      do
         actuals_list.put(new_actual, index)
      ensure
         actuals.item(index) = new_actual
      end

feature {LIBERTY_DELAYED_AGENT_CALL}
   can_compute_agent_type: BOOLEAN is
      local
         i: INTEGER
      do
         Result := entity.can_check_agent_signature(Current)
         if target /= Void then
            Result := target.is_open_argument implies target.result_type.is_known
         end
         if actuals /= Void then
            from
               i := actuals.lower
            until
               not Result or else i > actuals.upper
            loop
               Result := actuals.item(i).is_open_argument implies actuals.item(i).result_type.is_known
               i := i + 1
            end
         end
      end

   agent_type: LIBERTY_ACTUAL_TYPE is
      require
         is_agent_call
         can_compute_agent_type
      local
         arguments_types: COLLECTION[LIBERTY_KNOWN_TYPE]
         i: INTEGER
      do
         if actuals = Void and then (target = Void or else not target.is_open_argument) then
            arguments_types := entity.agent_signature(Current)
         else
            create {FAST_ARRAY[LIBERTY_KNOWN_TYPE]} arguments_types.with_capacity(actuals.count + 1)
            if target /= Void and then target.is_open_argument then
               arguments_types.add_last(target.result_type.known_type)
            end
            from
               i := actuals.lower
            until
               i > actuals.upper
            loop
               if actuals.item(i).is_open_argument then
                  arguments_types.add_last(actuals.item(i).result_type.known_type)
               end
               i := i + 1
            end
         end
         entity.check_agent_signature(Current)
         if result_type = Void then
            Result := lookup.universe.type_procedure(arguments_types, position)
         elseif result_type = lookup.universe.type_boolean then
            Result := lookup.universe.type_predicate(arguments_types, position)
         else
            Result := lookup.universe.type_function(arguments_types, result_type.known_type, position)
         end
      end

feature {LIBERTY_DELAYED_OPEN_ARGUMENT}
   can_compute_open_argument_type (index: INTEGER): BOOLEAN is
      do
         if index = -1 then
            Result := entity.can_check_agent_signature(Current) and then target.result_type.is_known
         elseif actuals /= Void then
            check
               actuals.valid_index(index)
            end
            Result := entity.can_check_agent_signature(Current) and then actuals.item(index).result_type.is_known
         end
      end

   open_argument_type (index: INTEGER): LIBERTY_KNOWN_TYPE is
      require
         can_compute_open_argument_type(index)
      do
         if index = -1 then
            Result := target.result_type.known_type
         elseif actuals /= Void then
            Result := actuals.item(index).result_type.known_type
         end
      end

feature {}
   make (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position) is
      require
         a_target /= Void
         a_entity /= Void
         a_actuals /= Void
         a_position /= Void
      do
         target := a_target
         entity := a_entity
         actuals_list := a_actuals
         position := a_position
         register_for_promotion
      ensure
         target = a_target or else {LIBERTY_CAST_EXPRESSION} ?:= target
         entity = a_entity
         actuals_list = a_actuals
         position = a_position
      end

   implicit_current (a_entity: like entity; a_actuals: like actuals_list; a_position: like position) is
      require
         a_entity /= Void
         a_actuals /= Void
         a_position /= Void
      do
         entity := a_entity
         actuals_list := a_actuals
         position := a_position
      ensure
         is_implicit_current
         entity = a_entity
         actuals_list = a_actuals
         position = a_position
      end

   lookup: LIBERTY_TYPE_LOOKUP
   actuals_list: COLLECTION[LIBERTY_EXPRESSION]

   no_args: COLLECTION[LIBERTY_KNOWN_TYPE] is
      once
         create {FAST_ARRAY[LIBERTY_KNOWN_TYPE]} Result.with_capacity(0)
      end

   make_new (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position): like Current is
      do
         if a_target = Void then
            create Result.implicit_current(a_entity, a_actuals, a_position)
         else
            create Result.make(a_target, a_entity, a_actuals, a_position)
         end
         if is_agent_call then
            Result.set_agent_call
         end
      end

feature {LIBERTY_CALL_PROMOTION}
   set_entity (a_entity: like entity) is
      do
         entity := a_entity
      end

   set_target (a_target: like target) is
      do
         target := a_target
      end

feature {ANY}
   accept (v: VISITOR) is
      local
         v0: LIBERTY_CALL_EXPRESSION_VISITOR
      do
         v0 ::= v
         v0.visit_liberty_call_expression(Current)
      end

end
