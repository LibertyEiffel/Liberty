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
class LIBERTY_TYPE_RESOLVER_IN_TYPE

inherit
	LIBERTY_TYPE_RESOLVER

creation {LIBERTY_TYPE_BUILDER}
	make

feature {ANY}
	out_in_tagged_out_memory is
		do
			tagged_out_memory.append(once "resolver in type ")
			current_type.out_in_tagged_out_memory
		end

feature {LIBERTY_TYPE_BUILDER}
	set_effective_parameters (effective: like effective_parameters) is
		require
			useful: not effective.is_empty
		do
			effective_parameters := effective
		ensure
			effective_parameters = effective
		end

feature {}
	universe: LIBERTY_UNIVERSE
	current_type: LIBERTY_ACTUAL_TYPE
	effective_parameters: DICTIONARY[LIBERTY_ACTUAL_TYPE, FIXED_STRING]

	lookup_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		local
			fn: LIBERTY_FEATURE_NAME
		do
			if type_definition.is_like_current then
				Result := current_type
			elseif type_definition.is_anchor then
				-- like <feature>
				create fn.make_from_ast_entity_name(type_definition.entity_anchor, current_type.ast, current_type.file)
				if current_type.has_feature(fn) then
					Result := current_type.feature_definition(fn).result_type
				end
			else
				Result := effective_parameters.fast_reference_at(type_definition.type_name.image.image.intern)
				if Result = Void then
					Result := universe.get_type_from_type_definition(type_definition, current_type.cluster)
				end
			end
		end

	lookup_export_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		do
			if type_definition.type_parameters.list_count = 0 then
				Result := type_from_legacy_class_name_or_full_liberty_type(type_definition)
			else
				Result := universe.get_type_from_type_definition(type_definition, current_type.cluster)
			end
		end

	lookup_position (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_POSITION is
		do
			Result := errors.semantics_position(type_definition.type_name.image.index, current_type.ast, current_type.file)
		end

	make (a_universe: like universe; a_current_type: like current_type; a_effective_parameters: like effective_parameters) is
		require
			a_universe /= Void
			a_current_type /= Void
			a_effective_parameters /= Void
		do
			universe := a_universe
			current_type := a_current_type
			effective_parameters := a_effective_parameters
		ensure
			current_type = a_current_type
			effective_parameters = a_effective_parameters
		end

feature {}
	type_from_legacy_class_name_or_full_liberty_type (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_ACTUAL_TYPE is
			-- Special code to handle legacy Eiffel class marks (in exports and precursors) or full-fledged type
			-- marks Liberty recommends
		require
			not type_definition.is_anchor
			not errors.has_error
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
			pos: LIBERTY_POSITION
		do
			pos := position(type_definition)
			class_name := type_definition.type_name.image.image
			cluster := current_type.cluster.find(class_name)
			if cluster /= Void then
				parameters := get_parameter_constraints(universe.parse_class(cluster, class_name, pos))
				create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(cluster, class_name.intern, pos), parameters)
				Result := universe.get_type_from_descriptor(descriptor)
			end
		end

	get_parameter_constraints (a_class: LIBERTY_AST_ONE_CLASS): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			i: INTEGER
		do
			type_parameters := a_class.class_header.type_parameters
			if type_parameters.is_empty or else type_parameters.list_is_empty then
				Result := no_parameters
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						Result.add_last(type(type_parameter.constraint))
					else
						Result.add_last(universe.type_any)
					end
					i := i + 1
				end
				debug
					std_output.put_string(once " ***** inferred implicit parameters of ")
					std_output.put_string(a_class.class_header.class_name.image.image)
					std_output.put_string(once ": ")
					std_output.put_line(Result.out)
					check
						Result.count = type_parameters.list_count
					end
				end
			end
		end

	no_parameters: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

invariant
	universe /= Void
	current_type /= Void
	effective_parameters /= Void

end -- class LIBERTY_TYPE_RESOLVER_IN_TYPE
