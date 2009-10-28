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
class LIBERTY_AST_ACTUAL

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_expression: BOOLEAN is
		do
			Result := count = 1
			check
				Result = nodes.first.name.is_equal(once "Expression")
			end
		end

	is_ref_to_entity: BOOLEAN is
		do
			Result := count = 2
			check
				Result = nodes.first.name.is_equal(once "KW $")
			end
		end

	expression: LIBERTY_AST_EXPRESSION is
		require
			is_expression
		do
			Result ::= nodes.item(0)
		end

	ref_entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_ref_to_entity
		do
			Result ::= nodes.item(1)
		end

feature {ANY}
	count: INTEGER is
		do
			Result := nodes.count
		end

	name: STRING is "Actual"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1, 2 >> }
		end

end
