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
class LIBERTY_AST_ASSIGNMENT

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	writable: LIBERTY_AST_WRITABLE is
		do
			Result ::= nodes.item(0)
		end

	expression: LIBERTY_AST_EXPRESSION is
		do
			Result ::= nodes.item(2)
		end

	is_regular_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW :=")
		ensure
			Result = not is_assignment_attempt and then not is_forced_assignment
		end

	is_assignment_attempt: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ?=")
		ensure
			Result = not is_regular_assignment and then not is_forced_assignment
		end

	is_forced_assignment: BOOLEAN is
		do
			Result := nodes.item(1).name.is_equal(once "KW ::=")
		ensure
			Result = not is_assignment_attempt and then not is_regular_assignment
		end

feature {ANY}
	count: INTEGER is 3

	name: STRING is "Assignment"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3 >> }
		end

end
