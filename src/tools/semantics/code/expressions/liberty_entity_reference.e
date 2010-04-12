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

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_ENTITY_REFERENCE}
	make

feature {ANY}
	entity: LIBERTY_ENTITY
	result_type: LIBERTY_TYPE

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		local
			e: like entity
		do
			check result_type.specialized_in(a_type) = result_type end
			e := entity.specialized_in(a_type)
			if e = entity then
				Result := Current
			else
				create Result.make(result_type, e, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			-- nothing
		end

feature {}
	make (type: like result_type; a_entity: like entity; a_position: like position) is
		require
			type /= Void -- type is POINTER
			a_entity /= Void
			a_position /= Void
		do
			result_type := type
			entity := a_entity
			position := a_position
		ensure
			result_type = type
			entity = a_entity
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_ENTITY_REFERENCE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_entity_reference(Current)
		end

invariant
	result_type /= Void -- result_type is POINTER
	entity /= Void

end
