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
deferred class LIBERTY_INFIX_CALL

inherit
	LIBERTY_EXPRESSION

insert
	LIBERTY_CALL

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			target.mark_reachable_code(mark)
			entity.mark_reachable_code(mark)
			expressions_marker.mark_reachable_code(mark, actuals)
		end

feature {}
	make (a_left, a_right: LIBERTY_EXPRESSION; a_entity_builder: FUNCTION[TUPLE[LIBERTY_TYPE, LIBERTY_FEATURE_NAME], LIBERTY_FEATURE_ENTITY]; a_position: like position) is
		require
			a_left /= Void
			a_right /= Void
			a_entity_builder /= Void
			a_position /= Void
		do
			create infix_name.make_infix(the_infix_name, a_position)
			target := a_left
			actuals_list := {FAST_ARRAY[LIBERTY_EXPRESSION] << a_right >> }
			entity := a_entity_builder.item([target.result_type, infix_name])
			position := a_position
			register_for_promotion
		ensure
			target = a_left or else {LIBERTY_CAST_EXPRESSION} ?:= target
			actuals.first = a_right
			position = a_position
		end

	new (a_target: like target; a_entity: like entity; a_actuals: like actuals_list; a_position: like position) is
		require
			a_target /= Void
			a_actuals.count = 1
			a_position /= Void
		do
			target := a_target
			entity := a_entity
			actuals_list := a_actuals
			position := a_position
		ensure
			target = a_target
			entity = a_entity
			actuals_list = a_actuals
			position = a_position
		end

	infix_name: LIBERTY_FEATURE_NAME is
		attribute
		ensure
			Result.is_infix
		end

	the_infix_name: FIXED_STRING is
		deferred
		ensure
			Result /= Void
		end

	actuals_list: COLLECTION[LIBERTY_EXPRESSION]

feature {LIBERTY_CALL_PROMOTION}
	set_entity (a_entity: like entity) is
		do
			entity := a_entity
		end

	set_target (a_target: like target) is
		do
			target := a_target
		end

invariant
	actuals.count = 1
	not is_implicit_current

end
