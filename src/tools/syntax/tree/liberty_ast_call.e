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
class LIBERTY_AST_CALL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_call: BOOLEAN is
		do
			Result := count = 2
		end

	is_assignment_test: BOOLEAN is
		do
			Result := count = 3
		ensure
			Result = nodes.item(1).name.is_equal(once "KW ?:=")
		end

	call_target: LIBERTY_AST_TARGET is
		require
			is_call
		do
			Result ::= nodes.item(0)
		end

	call_r10: LIBERTY_AST_R10 is
		require
			is_call
		do
			Result ::= nodes.item(1)
		end

	assignment_test_entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_assignment_test
		do
			Result ::= nodes.item(0)
		end

	assignment_test_expression: LIBERTY_AST_EXPRESSION is
		require
			is_assignment_test
		do
			Result ::= nodes.item(2)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Call"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 2, 3 >> }
		end

end
