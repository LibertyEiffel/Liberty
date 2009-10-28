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
deferred class LIBERTY_AST_LIST[N_ -> EIFFEL_NODE]
	-- An optional list preceded by a keyword.

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

feature {LIBERTY_AST_HANDLER}
	list: EIFFEL_LIST_NODE is
		require
			count > 1
		do
			Result ::= nodes.item(1)
		end

feature {LIBERTY_AST_HANDLER}
	list_valid_index (index: INTEGER): BOOLEAN is
		require
			count > 1
		do
			Result := list.valid_index(index)
		end

	list_count: INTEGER is
		require
			count > 1
		do
			Result := list.count
		end

	list_lower: INTEGER is
		require
			count > 1
		do
			Result := list.lower
		end

	list_upper: INTEGER is
		require
			count > 1
		do
			Result := list.upper
		end

	list_item (index: INTEGER): N_ is
		require
			count > 1
			valid_index(index)
		do
			Result ::= list.item(index)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 0, 2 >> }
		end

end
