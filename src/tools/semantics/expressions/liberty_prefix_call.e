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
deferred class LIBERTY_PREFIX_CALL

inherit
	LIBERTY_EXPRESSION

insert
	LIBERTY_CALL

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY

	actuals: TRAVERSABLE[LIBERTY_EXPRESSION] is
		once
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.make(0)
		end

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

feature {}
	make (a_target: like target; a_entity_builder: FUNCTION[TUPLE[LIBERTY_FEATURE_NAME], LIBERTY_FEATURE_ENTITY]) is
		require
			a_target /= Void
			a_entity_builder /= Void
		do
			target := a_target
			entity := a_entity_builder.item([prefix_name])
		end

	prefix_name: LIBERTY_FEATURE_NAME is
		deferred
		ensure
			Result.is_prefix
		end

invariant
	actuals.is_empty
	not is_implicit_current

end
