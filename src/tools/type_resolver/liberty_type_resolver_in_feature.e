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
class LIBERTY_TYPE_RESOLVER_IN_FEATURE

inherit
	LIBERTY_TYPE_RESOLVER

creation {LIBERTY_TYPE_FEATURES_LOADER}
	make

feature {}
	result_type: LIBERTY_ENTITY_TYPE
	anchor_factory: FUNCTION[TUPLE[LIBERTY_AST_ENTITY_NAME], LIBERTY_ANCHORED_TYPE]

feature {}
	lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ENTITY_TYPE is
		do
			if type_definition.is_like_result then
				Result := result_type
			elseif type_definition.is_like_entity then
				Result := anchor_factory.item([type_definition.entity_anchor])
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

	make (a_result_type: like result_type; a_anchor_factory: like anchor_factory) is
		require
			a_anchor_factory /= Void
		do
			result_type := a_result_type
			anchor_factory := a_anchor_factory
		ensure
			anchor_factory = a_anchor_factory
		end

invariant
	anchor_factory /= Void

end -- class LIBERTY_TYPE_RESOLVER_IN_FEATURE
