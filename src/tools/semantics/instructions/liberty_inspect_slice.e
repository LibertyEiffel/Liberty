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
class LIBERTY_INSPECT_SLICE

create {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	lower, upper: LIBERTY_EXPRESSION

feature {}
	make (a_lower: like lower; a_upper: like upper) is
		require
			a_lower /= Void
		do
			lower := a_lower
			if a_upper /= Void then
				upper := a_upper
			else
				upper := a_lower
			end
		ensure
			lower = a_lower
			a_upper /= Void implies upper = a_upper
			a_upper = Void implies upper = a_lower
		end

invariant
	lower /= Void
	upper /= Void

end
