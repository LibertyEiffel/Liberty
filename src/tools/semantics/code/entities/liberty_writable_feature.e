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
class LIBERTY_WRITABLE_FEATURE
--
-- A proxy to the feature itself, which must be an attribute.
--
-- See also LIBERTY_FEATURE_ENTITY
--

inherit
	LIBERTY_WRITABLE
		redefine out_in_tagged_out_memory
		end

create {LIBERTY_TYPE_BUILDER_TOOLS, LIBERTY_WRITABLE_FEATURE}
	make

feature {ANY}
	name: FIXED_STRING is
		do
			Result := entity.name
		end

	feature_name: LIBERTY_FEATURE_NAME is
		do
			Result := entity.feature_name
		end

	result_type: LIBERTY_TYPE is
		do
			Result := entity.result_type
		end

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "writable feature: ")
			tagged_out_memory.append(name)
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		local
			e: like entity
		do
			e := entity.specialized_in(a_type)
			if e = entity then
				Result := Current
			else
				create Result.make(e, position)
			end
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			if result_type.is_actual_type_set and then result_type.actual_type.is_runtime_category_set and then result_type.actual_type.is_expanded then
				result_type.mark_reachable_code(mark)
			end
		end

feature {}
	entity: LIBERTY_FEATURE_ENTITY

	make (a_entity: like entity; a_position: like position) is
		require
			a_entity /= Void
			a_position /= Void
		do
			entity := a_entity
			position := a_position
		ensure
			entity = a_entity
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_WRITABLE_FEATURE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_writable_feature(Current)
		end

invariant
	entity /= Void

end
