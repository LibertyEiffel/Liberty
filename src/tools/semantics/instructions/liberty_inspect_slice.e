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

insert
	LIBERTY_POSITIONABLE
	LIBERTY_REACHABLE

create {LIBERTY_TYPE_BUILDER_TOOLS}
	make

feature {ANY}
	lower, upper: LIBERTY_EXPRESSION

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			lower.mark_reachable_code(mark)
			if upper /= lower then
				upper.mark_reachable_code(mark)
			end
		end

feature {}
	make (a_lower: like lower; a_upper: like upper; a_position: like position) is
		require
			a_lower /= Void
			a_position /= Void
		do
			lower := a_lower
			if a_upper /= Void then
				upper := a_upper
			else
				upper := a_lower
			end
			position := a_position
		ensure
			lower = a_lower
			a_upper /= Void implies upper = a_upper
			a_upper = Void implies upper = a_lower
			position = a_position
		end

feature {ANY}
	accept (v: VISITOR) is
		local
			v0: LIBERTY_INSPECT_SLICE_VISITOR
		do
			v0 ::= v
			v0.visit_liberty_inspect_slice(Current)
		end

invariant
	lower /= Void
	upper /= Void

end
