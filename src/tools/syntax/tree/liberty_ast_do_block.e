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
class LIBERTY_AST_DO_BLOCK

inherit
	LIBERTY_AST_LIST[LIBERTY_AST_INSTRUCTION]
		redefine
			possible_counts
		end

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_do: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW do")
		ensure
			Result implies count = 3
		end

	is_once: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW once")
		ensure
			Result implies count = 3
		end

	is_deferred: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW deferred")
		ensure
			Result implies count = 1
		end

	is_attribute: BOOLEAN is
		do
			Result := keyword.name.is_equal(once "KW attribute")
		ensure
			Result implies count = 1
		end

feature {}
	keyword: EIFFEL_TERMINAL_NODE is
		do
			Result ::= nodes.item(0)
		end

feature {ANY}
	name: STRING is "Do_Block"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 3 >> }
		end

end
