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
deferred class LIBERTY_AST_EXPRESSION_BINARY[E_ -> LIBERTY_AST_NON_TERMINAL_NODE]

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {LIBERTY_AST_HANDLER}
	left_expression: E_ is
		require
			not is_empty
			not is_binary
		do
			Result ::= nodes.first
		end

	left_binary: like Current is
		require
			not is_empty
			is_binary
		do
			Result ::= nodes.first
		end

	right_expression: E_ is
		require
			not is_empty
		do
			Result ::= nodes.last
		end

	is_binary: BOOLEAN is
		require
			not is_empty
		do
			Result := nodes.first.name = name
		end

	is_double_operator: BOOLEAN is
		do
			Result := count = 4
		end

	operator1: EIFFEL_IMAGE is
		local
			op1: LIBERTY_AST_TERMINAL_NODE
		do
			op1 ::= nodes.item(1)
			Result := op1.image
		end

	operator2: EIFFEL_IMAGE is
		require
			is_double_operator
		local
			op2: LIBERTY_AST_TERMINAL_NODE
		do
			op2 ::= nodes.item(2)
			Result := op2.image
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 3, 4 >> } -- depends on the operator
		end

	errors: LIBERTY_ERRORS

end
