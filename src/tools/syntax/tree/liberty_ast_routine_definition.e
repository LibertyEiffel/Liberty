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
class LIBERTY_AST_ROUTINE_DEFINITION

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	obsolete_clause: LIBERTY_AST_OBSOLETE is
		do
			Result ::= nodes.item(0)
		end

	require_clause: LIBERTY_AST_REQUIRE is
		do
			Result ::= nodes.item(1)
		end

	execution: LIBERTY_AST_ROUTINE_EXECUTION is
		do
			Result ::= nodes.item(2)
		end

	ensure_clause: LIBERTY_AST_ENSURE is
		do
			Result ::= nodes.item(3)
		end

feature {ANY}
	count: INTEGER is 5

	name: STRING is "Routine_Definition"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 5 >> }
		end

end
