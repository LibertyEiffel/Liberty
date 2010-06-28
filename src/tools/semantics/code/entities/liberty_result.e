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
class LIBERTY_RESULT

inherit
	LIBERTY_WRITABLE
		redefine out_in_tagged_out_memory
		end

create {LIBERTY_TYPE}
	make

feature {ANY}
	name: FIXED_STRING is
		once
			Result := "Result".intern
		end

	result_type: LIBERTY_TYPE

	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(name)
		end

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE): like Current is
		do
			Result := result_type.specialized_in(a_type).result_entity
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			if result_type.is_known and then result_type.known_type.is_runtime_category_set and then result_type.known_type.is_expanded then
				result_type.mark_reachable_code(mark)
			end
		end

feature {}
	make (a_result_type: like result_type; a_position: like position) is
		require
			a_result_type /= Void
			a_position /= Void
		do
			result_type := a_result_type
			position := a_position
		ensure
			result_type = a_result_type
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_RESULT_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_result(Current)
		end

invariant
	result_type /= Void

end
