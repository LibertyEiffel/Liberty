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
class LIBERTY_INTEGER_32_MANIFEST

inherit
	LIBERTY_TYPED_MANIFEST[INTEGER_32]

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_INTEGER_32_MANIFEST_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_integer_32_manifest(Current)
		end

end
