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
class LIBERTY_ENTITY_REFERENCE
	-- expressions like "$entity"

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	entity: LIBERTY_ENTITY
	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (type: like result_type; a_entity: like entity) is
		require
			type /= Void -- type is POINTER
			a_entity /= Void
		do
			result_type := type
			entity := a_entity
		ensure
			result_type = type
			entity = a_entity
		end

invariant
	result_type /= Void -- result_type is POINTER
	entity /= Void

end
