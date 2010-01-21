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
class LIBERTY_TYPE_RESOLVER_IN_UNIVERSE

inherit
	LIBERTY_TYPE_RESOLVER

insert
	LIBERTY_ERROR_LEVELS
		undefine out_in_tagged_out_memory
		end

creation {LIBERTY_UNIVERSE}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "resolver in universe")
		end

feature {}
	universe: LIBERTY_UNIVERSE

	lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
		do
			if not type_definition.is_anchor then
				Result := universe.get_type_from_type_definition(type_definition, Void)
			end
		end

	lookup_export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
		do
			check Result = Void end
		end

	lookup_position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION is
		do
			check Result = Void end
		end

	make (a_universe: like universe) is
		require
			a_universe /= Void
		do
			universe := a_universe
		ensure
			universe = a_universe
		end

invariant
	parent = Void
	universe /= Void

end -- class LIBERTY_TYPE_RESOLVER_IN_TYPE
