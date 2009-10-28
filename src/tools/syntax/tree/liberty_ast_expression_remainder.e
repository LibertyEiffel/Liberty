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
deferred class LIBERTY_AST_EXPRESSION_REMAINDER[E_ -> LIBERTY_AST_NON_TERMINAL_NODE]

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {LIBERTY_AST_HANDLER}
	expression: E_ is
		require
			not is_empty
		do
			Result ::= nodes.item(nodes.upper-1)
		end

	remainder: like Current is
		require
			not is_empty
		do
			Result ::= nodes.last
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 3 >> }
		end

end
