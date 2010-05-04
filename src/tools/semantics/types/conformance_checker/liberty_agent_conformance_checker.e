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
class LIBERTY_AGENT_CONFORMANCE_CHECKER

inherit
	LIBERTY_GENERICS_CONFORMANCE_CHECKER
		undefine
			is_equal
		end

insert
	SINGLETON

creation {LIBERTY_UNIVERSE}
	make

feature {LIBERTY_ACTUAL_TYPE}
	inherits (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN is
		do
			--|*** TODO
			not_yet_implemented
		end

	inserts (parent, child: LIBERTY_KNOWN_TYPE): BOOLEAN is
		do
			--|*** TODO
			not_yet_implemented
		end

feature {}
	make is
		do
		end

end -- class LIBERTY_AGENT_CONFORMANCE_CHECKER
