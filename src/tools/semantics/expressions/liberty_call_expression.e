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

insert
	LIBERTY_CALL

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make, implicit_current

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]
	is_agent_call: BOOLEAN

	result_type: LIBERTY_ENTITY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

feature {LIBERTY_AGENT}
	set_agent_call is
		do
			is_agent_call := True
		ensure
			is_agent_call
		end

	agent_type: LIBERTY_ENTITY_TYPE is
		require
			is_result_type_set
		local
			arguments_types: COLLECTION[LIBERTY_TYPE]
			i: INTEGER
		do
			if actuals = Void then
				arguments_types := no_args
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} arguments_types.with_capacity(actuals.count)
				from
					i := actuals.lower
				until
					i > actuals.upper
				loop
					arguments_types.add_last(actuals.item(i).result_type.type)
					i := i + 1
				end
			end
			if result_type = Void then
				Result := lookup.universe.type_procedure(arguments_types, position)
			elseif result_type = lookup.universe.type_boolean then
				Result := lookup.universe.type_predicate(arguments_types, position)
			else
				Result := lookup.universe.type_function(arguments_types, result_type.type, position)
			end
		end

feature {}
	make (a_target: like target; a_entity: like entity; a_actuals: like actuals; a_position: like position) is
		require
			a_target /= Void
			a_entity /= Void
			a_actuals /= Void
			a_position /= Void
		do
			target := a_target
			entity := a_entity
			actuals := a_actuals
			position := a_position
		ensure
			target = a_target
			entity = a_entity
			actuals = a_actuals
			position = a_position
		end

	implicit_current (a_entity: like entity; a_actuals: like actuals; a_position: like position) is
		require
			a_entity /= Void
			a_actuals /= Void
			a_position /= Void
		do
			entity := a_entity
			actuals := a_actuals
			position := a_position
		ensure
			is_implicit_current
			entity = a_entity
			actuals = a_actuals
			position = a_position
		end

	lookup: LIBERTY_TYPE_LOOKUP

	no_args: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
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
