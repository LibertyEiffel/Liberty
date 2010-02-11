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
deferred class LIBERTY_ASSERTIONS

insert
	LIBERTY_REACHABLE_MARKER

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	infix "and then" (other: LIBERTY_ASSERTIONS): LIBERTY_ASSERTIONS is
			-- Considering that `Current' is the parent, adds an "and then" assertions block. Used by "require
			-- then", "ensure then", and "invariant".
		do
			create {LIBERTY_ASSERTIONS_AND_THEN} Result.make(Current, other)
		ensure
			Result /= Void
		end

	infix "or else" (other: LIBERTY_ASSERTIONS): LIBERTY_ASSERTIONS is
			-- Considering that `Current' is the parent, adds an "or else" assertions block. Used by "require
			-- else".
		do
			create {LIBERTY_ASSERTIONS_OR_ELSE} Result.make(Current, other)
		ensure
			Result /= Void
		end

feature {}
	assertions_marker: LIBERTY_REACHABLE_MARKER_AGENT[LIBERTY_ASSERTION]

end
