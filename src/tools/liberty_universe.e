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
class LIBERTY_UNIVERSE

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERROR_LEVELS

create {ANY}
	make

feature {ANY}
	get_type (cluster: LIBERTY_CLUSTER; position: LIBERTY_POSITION; class_name: STRING; effective_type_parameters: TRAVERSABLE[LIBERTY_TYPE]): LIBERTY_TYPE is
		require
			position /= Void
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			c: like cluster
		do
			c := cluster
			if c = Void then
				c := root.find(class_name)
			end
			create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(c, class_name.intern, position), effective_type_parameters)
			Result := get_type_from_descriptor(descriptor)
		ensure
			Result.cluster = cluster
			Result.name.is_equal(class_name)
			Result.parameters.is_equal(effective_type_parameters)
		end

	get_type_from_descriptor (descriptor: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_TYPE is
		require
			not errors.has_error
		local
			ast: LIBERTY_AST_CLASS
		do
			Result := types.reference_at(descriptor)
			if Result = Void then
				ast := parse_class(descriptor.cluster, descriptor.name.out, descriptor.position)
				create Result.make(descriptor, ast)
				types.put(Result, descriptor)
				Result.check_and_initialize(Current)
			end
		ensure
			Result.cluster.is_equal(descriptor.cluster)
			Result.name.is_equal(descriptor.name)
			Result.parameters.is_equal(descriptor.parameters)
		end

	type_any: LIBERTY_TYPE is
		do
			Result := kernel_type(once "ANY")
		end

	type_pointer: LIBERTY_TYPE is
		do
			Result := kernel_type(once "POINTER")
		end

	type_integer_64: LIBERTY_TYPE is
		do
			Result := kernel_type(once "INTEGER_64")
		end

	type_real: LIBERTY_TYPE is
		do
			Result := kernel_type(once "REAL")
		end

	type_character: LIBERTY_TYPE is
		do
			Result := kernel_type(once "CHARACTER")
		end

	type_string: LIBERTY_TYPE is
		do
			Result := kernel_type(once "STRING")
		end

	type_boolean: LIBERTY_TYPE is
		do
			Result := kernel_type(once "BOOLEAN")
		end

	type_tuple (tuple_count: INTEGER): LIBERTY_TYPE is
		do
			--|*** TODO
			not_yet_implemented
		end

feature {}
	kernel_type (class_name: STRING): LIBERTY_TYPE is
		require
			not errors.has_error
		local
			cd: LIBERTY_CLASS_DESCRIPTOR; td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_CLASS
			cluster: LIBERTY_CLUSTER
		do
			Result := kernel_types.reference_at(class_name)
			if Result = Void then
				cluster := root.find(class_name)
				if cluster = Void then
					errors.set(level_fatal_error, once "Kernel class not found: " + class_name)
				end
				create cd.make(cluster, class_name.intern, Void)
				create td.make(cd, create {FAST_ARRAY[LIBERTY_TYPE]}.with_capacity(0))
				Result := types.reference_at(td)
				if Result = Void then
					ast := parse_class(cluster, class_name, Void)
					create Result.make(td, ast)
					types.put(Result, td)
					Result.check_and_initialize(Current)
				end
				kernel_types.add(Result, class_name)
			end
		ensure
			Result /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	get_type_from_type_definition (origin: LIBERTY_TYPE; type_definition: LIBERTY_AST_TYPE_DEFINITION; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): LIBERTY_TYPE is
		require
			origin /= Void
			type_definition /= Void
			effective_parameters /= Void
			not type_definition.is_anchor
			not errors.has_error
		local
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			class_name := type_definition.type_name.image.image
			cluster := origin.cluster.find(class_name)
			if cluster = Void then
				errors.add_position(errors.semantics_position(type_definition.type_name.image.index, origin.ast))
				errors.set(level_fatal_error, once "Unknown class: " + class_name)
			else
				parameters := get_parameters(origin, type_definition.type_parameters, effective_parameters)
				Result := get_type(cluster, errors.semantics_position(type_definition.type_name.image.index, origin.ast), class_name, parameters)
			end
		end

	get_type_from_client (origin: LIBERTY_TYPE; client: LIBERTY_AST_CLIENT; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): LIBERTY_TYPE is
		require
			origin /= Void
			client /= Void
			effective_parameters /= Void
			not client.type_definition.is_anchor
			not errors.has_error
		do
			Result := type_from_legacy_class_name_or_full_liberty_type(origin, client.type_definition, effective_parameters)
		ensure
			type_found_or_fatal_error: Result /= Void
		end

	get_type_from_precursor (origin: LIBERTY_TYPE; precursor_type_mark: LIBERTY_AST_PRECURSOR_TYPE_MARK; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): LIBERTY_TYPE is
		require
			origin /= Void
			precursor_type_mark /= Void
			effective_parameters /= Void
			precursor_type_mark.count > 0
			not precursor_type_mark.type_definition.is_anchor
			not errors.has_error
		do
			Result := type_from_legacy_class_name_or_full_liberty_type(origin, precursor_type_mark.type_definition, effective_parameters)
		ensure
			type_found_or_fatal_error: Result /= Void
		end

feature {}
	type_from_legacy_class_name_or_full_liberty_type (origin: LIBERTY_TYPE; a_type_definition: LIBERTY_AST_TYPE_DEFINITION; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): LIBERTY_TYPE is
			-- Special code to handle legacy Eiffel class marks (in exports and precursors) or full-fledged type
			-- marks Liberty recommends
		require
			origin /= Void
			effective_parameters /= Void
			not a_type_definition.is_anchor
			not errors.has_error
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
			pos: LIBERTY_POSITION
		do
			if a_type_definition.type_parameters.list_count /= effective_parameters.count then
				pos := errors.semantics_position(a_type_definition.type_name.image.index, origin.ast)
				if a_type_definition.type_parameters.list_count = 0 then
					-- legacy: only a class name is given
					class_name := a_type_definition.type_name.image.image
					cluster := origin.cluster.find(class_name)
					if cluster = Void then
						errors.add_position(pos)
						errors.set(level_fatal_error, once "Unknown class: " + class_name)
					else
						parameters := get_parameter_constraints(origin, parse_class(cluster, class_name, pos), effective_parameters)
						create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(cluster, class_name.intern, pos), parameters)
						Result := get_type_from_descriptor(descriptor)
					end
				else
					errors.add_position(pos)
					errors.set(level_fatal_error, "Bad generics list (generics count mismatch)")
				end
			else
				Result := get_type_from_type_definition(origin, a_type_definition, effective_parameters)
			end
		ensure
			type_found_or_fatal_error: Result /= Void
		end

feature {} -- Type parameters fetching
	get_parameter_constraints (origin: LIBERTY_TYPE; a_class: LIBERTY_AST_CLASS; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			i: INTEGER
		do
			type_parameters := a_class.class_header.type_parameters
			if type_parameters.is_empty then
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.lower
				until
					i > type_parameters.upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						Result.add_last(get_type_from_type_definition(origin, type_parameter.constraint, effective_parameters))
					else
						Result.add_last(type_any)
					end
					i := i + 1
				end
			end
		end

	get_parameters (origin: LIBERTY_TYPE; type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS; effective_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameter: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER
			type_definition: LIBERTY_AST_TYPE_DEFINITION
			type: LIBERTY_TYPE
			i: INTEGER
		do
			if type_parameters.is_empty then
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
			else
				create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.lower
				until
					i > type_parameters.upper
				loop
					type_parameter := type_parameters.list_item(i)
					type_definition := type_parameter.type_definition
					if type_definition.is_class_type then
						type := effective_parameters.reference_at(type_definition.type_name.image.image.intern)
						if type = Void then
							type := get_type_from_type_definition(origin, type_parameter.type_definition, effective_parameters)
						end
					else
						not_yet_implemented
					end
					Result.add_last(type)
					i := i + 1
				end
			end
		end

feature {} -- AST building
	read_file_in (descriptor: LIBERTY_CLASS_DESCRIPTOR; code: STRING) is
		require
			descriptor /= Void
			code.is_empty
		local
			file: STRING
		do
			file := descriptor.file
			parser_file.connect_to(file)
			if not parser_file.is_connected then
				std_error.put_string(" *** Could not read file " + file)
				die_with_code(1)
			end

			from
				parser_file.read_line
			until
				parser_file.end_of_input
			loop
				code.append(parser_file.last_string)
				code.extend('%N')
				parser_file.read_line
			end
			code.append(parser_file.last_string)
			parser_file.disconnect
		end

	parse_class (cluster: LIBERTY_CLUSTER; class_name: STRING; pos: LIBERTY_POSITION): LIBERTY_AST_CLASS is
		local
			code: STRING
		do
			std_output.put_line(once "Parsing " + class_name)
			parse_descriptor.make(cluster, class_name.intern, pos)
			Result := classes.reference_at(parse_descriptor)
			if Result = Void then
				code := once ""
				code.clear_count
				read_file_in(parse_descriptor, code)

				parser_buffer.initialize_with(code)
				parser.eval(parser_buffer, eiffel.table, once "Class")
				if parser.error /= Void then
					errors.emit_syntax_error(parser.error, code)
				end
				Result ::= eiffel.root_node
				classes.put(Result, parse_descriptor.twin)
			end
		end

	parse_descriptor: LIBERTY_CLASS_DESCRIPTOR is
		once
			create Result
		end

	parser_file: TEXT_FILE_READ is
		once
			create Result.make
		end

	parser_buffer: MINI_PARSER_BUFFER is
		once
			create Result
		end

	parser: DESCENDING_PARSER is
		once
			create Result.make
		end

	eiffel: EIFFEL_GRAMMAR is
		once
			create Result.make(create {LIBERTY_NODE_FACTORY}.make)
		end

feature {}
	make (universe_path: STRING) is
		do
			create root.make(universe_path)
			create {HASHED_DICTIONARY[LIBERTY_AST_CLASS, LIBERTY_CLASS_DESCRIPTOR]} classes.make
			create {HASHED_DICTIONARY[LIBERTY_TYPE, LIBERTY_TYPE_DESCRIPTOR]} types.make
			create {HASHED_DICTIONARY[LIBERTY_TYPE, STRING]} kernel_types.make
		end

	root: LIBERTY_CLUSTER

	classes: DICTIONARY[LIBERTY_AST_CLASS, LIBERTY_CLASS_DESCRIPTOR]
	types: DICTIONARY[LIBERTY_TYPE, LIBERTY_TYPE_DESCRIPTOR]
	kernel_types: DICTIONARY[LIBERTY_TYPE, STRING]

	errors: LIBERTY_ERRORS

invariant
	types /= Void
	classes /= Void

end
