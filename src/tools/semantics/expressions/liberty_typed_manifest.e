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
class LIBERTY_TYPED_MANIFEST[E_]

inherit
	LIBERTY_EXPRESSION

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	manifest: E_

	result_type: LIBERTY_TYPE

	is_result_type_set: BOOLEAN is True

feature {}
	make (a_type: like result_type; a_manifest: like manifest) is
		require
			a_type /= Void
		do
			result_type := a_type
			manifest := a_manifest
		ensure
			result_type = a_type
			manifest = a_manifest
		end

invariant
	result_type /= Void

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_TYPED_MANIFEST_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_typed_manifest(Current)
		end

end
