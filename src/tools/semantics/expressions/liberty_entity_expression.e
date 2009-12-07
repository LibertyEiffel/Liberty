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
class LIBERTY_ENTITY_EXPRESSION
	-- expressions like "entity"

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	entity: LIBERTY_ENTITY

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	is_result_type_set: BOOLEAN is
		do
			Result := entity.is_result_type_set
		end

feature {}
	make (a_entity: like entity) is
		require
			a_entity.result_type /= Void
		do
			entity := a_entity
		ensure
			entity = a_entity
		end

invariant
	entity /= Void

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ENTITY_EXPRESSION_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_entity_expression(Current)
		end

end
