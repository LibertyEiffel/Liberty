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
	local_context: LIBERTY_FEATURE_LOCAL_CONTEXT
	feature_name: LIBERTY_AST_FEATURE_NAME

feature {ANY}
	out_in_tagged_out_memory is
		local
			fnoa: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
		do
			tagged_out_memory.append(once "resolver in feature ")
			fnoa := feature_name.feature_name_or_alias
			if fnoa.is_regular then
				tagged_out_memory.append(fnoa.entity_name.image.image.intern)
			elseif fnoa.is_prefix then
				tagged_out_memory.append(once "prefix ")
				tagged_out_memory.append(fnoa.free_operator_name.image.image.intern)
			else
				check fnoa.is_infix end
				tagged_out_memory.append(once "infix ")
				tagged_out_memory.append(fnoa.free_operator_name.image.image.intern)
			end
		end

feature {}
	lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		local
			name: FIXED_STRING
		do
			if type_definition.is_like_result then
				if local_context.result_type = Void then
					--|*** TODO: error: not a function
					not_yet_implemented
				end
				Result := local_context.result_type
			elseif type_definition.is_like_entity then
				-- If it's an anchor to a parameter or a local, resolve it immediately. (TODO: beware of cycles!)
				-- Other cases will be caught by parent resolvers.
				name := type_definition.entity_anchor.image.image.intern
				if local_context.is_parameter(name) then
					Result := local_context.parameter(name).result_type
				elseif local_context.is_local(name) then
					Result := local_context.local_var(name).result_type
				end
			end
		end

	lookup_export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		do
			check Result = Void end
		end

	lookup_position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION is
		do
			check Result = Void end
		end

	make (a_feature_name: like feature_name; a_local_context: like local_context) is
		require
			a_feature_name /= Void
			a_local_context /= Void
		do
			feature_name := a_feature_name
			local_context := a_local_context
		ensure
			feature_name = a_feature_name
			local_context = a_local_context
		end

invariant
	feature_name /= Void
	local_context /= Void

end -- class LIBERTY_TYPE_RESOLVER_IN_FEATURE
