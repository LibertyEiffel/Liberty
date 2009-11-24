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

insert
	LIBERTY_CALL

create {LIBERTY_TYPE_BUILDER}
	make, implicit_current

feature {ANY}
	target: LIBERTY_EXPRESSION
	entity: LIBERTY_FEATURE_ENTITY
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

feature {}
	make (a_target: like target; a_entity: like entity; a_actuals: like actuals) is
		require
			a_target /= Void
			a_entity /= Void
			a_actuals /= Void
		do
			target := a_target
			entity := a_entity
			actuals := a_actuals
		ensure
			target = a_target
			entity = a_entity
			actuals = a_actuals
		end

	implicit_current (a_entity: like entity; a_actuals: like actuals) is
		require
			a_entity /= Void
			a_actuals /= Void
		do
			entity := a_entity
			actuals := a_actuals
		ensure
			is_implicit_current
			entity = a_entity
			actuals = a_actuals
		end

end
