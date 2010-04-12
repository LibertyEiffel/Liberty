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
deferred class LIBERTY_TYPED_MANIFEST[E_]

inherit
	LIBERTY_EXPRESSION

feature {ANY}
	manifest: E_
	result_type: LIBERTY_TYPE

	specialized_in (a_type: LIBERTY_ACTUAL_TYPE_IMPL): like Current is
		do
			Result := Current
		end

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			result_type.mark_reachable_code(mark)
		end

feature {}
	make (a_type: like result_type; a_manifest: like manifest; a_position: like position) is
		require
			a_type /= Void
			a_position /= Void
		do
			result_type := a_type
			manifest := a_manifest
			position := a_position
		ensure
			result_type = a_type
			manifest = a_manifest
			position = a_position
		end

invariant
	result_type /= Void

end
