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
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
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
			actuals := {FAST_ARRAY[LIBERTY_EXPRESSION] << a_right >> }
			entity := a_entity_builder.item([target.result_type, infix_name])
			position := a_position
		ensure
			target = a_left
			actuals.first = a_right
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

invariant
	actuals.count = 1
	not is_implicit_current

end
