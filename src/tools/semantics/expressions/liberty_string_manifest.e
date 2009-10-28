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
class LIBERTY_STRING_MANIFEST

inherit
	LIBERTY_TYPED_MANIFEST[STRING]
		rename
			make as typed_make
		end

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	is_once: BOOLEAN

feature {}
	make (a_type: like result_type; a_manifest: like manifest; a_once: like is_once) is
		require
			a_type /= Void
			-- a_type is STRING
		do
			typed_make(a_type, a_manifest)
			is_once := a_once
		ensure
			result_type = a_type
			manifest = a_manifest
			is_once = a_once
		end

invariant
	result_type /= Void
	-- result_type is STRING

end
