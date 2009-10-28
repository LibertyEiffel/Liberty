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
class LIBERTY_AST_WHEN_VALUE

inherit
	LIBERTY_AST_NON_TERMINAL_NODE

create {LIBERTY_NODE_FACTORY}
	make

feature {LIBERTY_AST_HANDLER}
	is_number: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW number")
		end

	number: LIBERTY_AST_NUMBER is
		require
			is_number
		do
			Result ::= nodes.first
		end

	is_character: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW character")
		end

	character: LIBERTY_AST_CHARACTER is
		require
			is_character
		do
			Result ::= nodes.first
		end

	is_string: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW string")
		end

	string: LIBERTY_AST_STRING is
		require
			is_string
		do
			Result ::= nodes.first
		end

	is_entity_name: BOOLEAN is
		do
			Result := nodes.first.name.is_equal(once "KW entity name")
		end

	entity_name: LIBERTY_AST_ENTITY_NAME is
		require
			is_entity_name
		do
			Result ::= nodes.first
		end

feature {ANY}
	count: INTEGER is 1

	name: STRING is "When_Value"

feature {}
	possible_counts: SET[INTEGER] is
		once
			Result := {AVL_SET[INTEGER] << 1 >> }
		end

end
