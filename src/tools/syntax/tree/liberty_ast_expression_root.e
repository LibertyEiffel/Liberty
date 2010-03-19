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
deferred class LIBERTY_AST_EXPRESSION_ROOT[S_ -> LIBERTY_AST_NON_TERMINAL_NODE, B_ -> LIBERTY_AST_EXPRESSION_BINARY[S_]]

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {LIBERTY_AST_HANDLER}
	simple_expression: S_ is
		require
			is_simple_expression
		do
			Result ::= nodes.first
		ensure
			Result /= Void
		end

	binary_expression: B_ is
		require
			is_binary_expression
		do
			Result ::= nodes.first
		ensure
			Result /= Void
		end

	is_simple_expression: BOOLEAN is
		do
			Result := not is_binary_expression
		end

	is_binary_expression: BOOLEAN is
		do
			Result := nodes.first.name.has_suffix(once "-exp")
		end

feature {ANY}
	count: INTEGER is 1

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

end
