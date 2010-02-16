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
deferred class LIBERTY_COMPOSED_ASSERTIONS

inherit
	LIBERTY_ASSERTIONS

feature {ANY}
	left, right: LIBERTY_ASSERTIONS

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			left.mark_reachable_code(mark)
			right.mark_reachable_code(mark)
		end

feature {}
	make (a_left: like left; a_right: like right) is
		require
			a_left /= Void
			a_right /= Void
		do
			left := a_left
			right := a_right
		ensure
			left = a_left
			right = a_right
		end

invariant
	left /= Void
	right /= Void

end
