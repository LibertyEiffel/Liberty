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
class LIBERTY_SYNTAX_POSITION

inherit
	LIBERTY_POSITION

create {LIBERTY_ERRORS}
	make

feature {ANY}
	source: STRING

feature {ANY}
	is_unknown: BOOLEAN is False

feature {}
	make (a_index: like index; a_source: like source; a_file: like file) is
		require
			a_source /= Void
			a_index.in_range(a_source.lower, a_source.upper)
			a_file /= Void
		do
			index := a_index
			source := a_source
			file := a_file
		ensure
			index = a_index
			source = a_source
			file = a_file
		end

invariant
	source /= Void

end
