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
deferred class LIBERTY_PRECURSOR

insert
	LIBERTY_POSITIONABLE
	LIBERTY_REACHABLE

feature {ANY}
	the_feature: LIBERTY_FEATURE
	actuals: TRAVERSABLE[LIBERTY_EXPRESSION]

feature {LIBERTY_REACHABLE, LIBERTY_REACHABLE_COLLECTION_MARKER}
	mark_reachable_code (mark: INTEGER) is
		do
			the_feature.mark_reachable_code(mark)
			expressions_marker.mark_reachable_code(mark, actuals)
		end

feature {}
	make (a_feature: like the_feature; a_actuals: like actuals; a_position: like position) is
		require
			a_feature /= Void
			a_actuals /= Void
			a_position /= Void
		do
			the_feature := a_feature
			actuals := a_actuals
			position := a_position
		ensure
			the_feature = a_feature
			actuals = a_actuals
			position = a_position
		end

invariant
	the_feature /= Void
	actuals /= Void

end
