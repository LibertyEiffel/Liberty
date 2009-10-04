class LIBERTY_UNIVERSE

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERRORS

create {ANY}
	make

feature {ANY}
	get_type (cluster: LIBERTY_CLUSTER; class_name: STRING; effective_type_parameters: TRAVERSABLE[LIBERTY_TYPE]): LIBERTY_TYPE is
			-- the class must be in the given cluster
		require
			not has_error
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR; c: like cluster
		do
			if cluster /= Void then
				c := cluster
			else
				c := universe.find(class_name)
			end
			if c /= Void then
				create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(c, class_name), effective_type_parameters)
				Result := get_type_from_descriptor(descriptor)
			else
				create error(0, once "Unknown class: " + class_name)
			end
		ensure
			Result.cluster = cluster
			Result.name.is_equal(class_name)
			Result.parameters.is_equal(effective_type_parameters)
		end

	get_type_from_descriptor (descriptor: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_TYPE is
		require
			not has_error
		local
			ast: LIBERTY_AST_CLASS
		do
			Result := types.reference_at(descriptor)
			if Result = Void then
				ast := parse_class(descriptor.cluster, descriptor.name)
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

feature {}
	kernel_type (class_name: STRING): LIBERTY_TYPE is
		require
			not has_error
		local
			cd: LIBERTY_CLASS_DESCRIPTOR; td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_CLASS
			cluster: LIBERTY_CLUSTER
		do
			Result := kernel_types.reference_at(class_name)
			if Result = Void then
				cluster := universe.find(class_name)
				create cd.make(cluster, class_name)
				create td.make(cd, create {FAST_ARRAY[LIBERTY_TYPE]}.with_capacity(0))
				Result := types.reference_at(td)
				if Result = Void then
					ast := parse_class(cluster, class_name)
					create Result.make(td, ast)
					types.put(Result, td)
					Result.check_and_initialize(Current)
				end
				kernel_types.add(Result, class_name.twin)
			end
		ensure
			Result /= Void
		end

feature {LIBERTY_TYPE_BUILDER}
	get_type_from_type_definition (origin: LIBERTY_CLUSTER; type_definition: LIBERTY_AST_TYPE_DEFINITION; effective_parameters: DICTIONARY[LIBERTY_TYPE, STRING]): LIBERTY_TYPE is
		require
			origin /= Void
			type_definition /= Void
			effective_parameters /= Void
			not type_definition.is_anchor
			not has_error
		local
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			class_name := type_definition.type_name.image.image
			cluster := origin.find(class_name)
			if cluster = Void then
				create error(type_definition.type_name.image.index, once "Unknown class: " + class_name)
			else
				parameters := get_parameters(origin, type_definition.type_parameters, effective_parameters)
				Result := get_type(cluster, class_name, parameters)
			end
		end

	get_type_from_client (origin: LIBERTY_CLUSTER; client: LIBERTY_AST_CLIENT; effective_parameters: DICTIONARY[LIBERTY_TYPE, STRING]): LIBERTY_TYPE is
		require
			origin /= Void
			client /= Void
			effective_parameters /= Void
			not client.type_definition.is_anchor
			not has_error
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			if client.type_definition.type_parameters.list_count /= effective_parameters.count then
				if client.type_definition.type_parameters.list_count = 0 then
					-- legacy: only a class name is given
					class_name := client.class_name.image.image
					cluster := origin.find(class_name)
					parameters := get_parameter_constraints(origin, parse_class(cluster, class_name), effective_parameters)
					create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(cluster, class_name), parameters)
					Result := get_type_from_descriptor(descriptor)
				else
					create error(client.class_name.image.index, "Bad generics list")
				end
			else
				Result := get_type_from_type_definition(origin, client.type_definition, effective_parameters)
			end
		end

feature {} -- Type parameters fetching
	get_parameter_constraints (origin: LIBERTY_CLUSTER; a_class: LIBERTY_AST_CLASS; effective_parameters: DICTIONARY[LIBERTY_TYPE, STRING]): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			i: INTEGER
		do
			type_parameters := a_class.class_header.type_parameters
			if type_parameters.is_empty then
				create {FAST_ARRAY[LIBERTY_TYPE]}Result.with_capacity(0)
			else
				create {FAST_ARRAY[LIBERTY_TYPE]}Result.with_capacity(type_parameters.list_count)
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

	get_parameters (origin: LIBERTY_CLUSTER; type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS; effective_parameters: DICTIONARY[LIBERTY_TYPE, STRING]): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameter: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER
			type_definition: LIBERTY_AST_TYPE_DEFINITION
			type: LIBERTY_TYPE
			i: INTEGER
		do
			if type_parameters.is_empty then
				create {FAST_ARRAY[LIBERTY_TYPE]}Result.with_capacity(0)
			else
				create {FAST_ARRAY[LIBERTY_TYPE]}Result.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.lower
				until
					i > type_parameters.upper
				loop
					type_parameter := type_parameters.list_item(i)
					type_definition := type_parameter.type_definition
					if type_definition.is_class_type then
						type := effective_parameters.reference_at(type_definition.type_name.image.image)
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

	parse_class (cluster: LIBERTY_CLUSTER; class_name: STRING): LIBERTY_AST_CLASS is
		local
			code: STRING
			error: PARSE_ERROR
		do
			parse_descriptor.make(cluster, class_name)
			Result := classes.reference_at(parse_descriptor)
			if Result = Void then
				code := once ""
				code.clear_count
				read_file_in(parse_descriptor, code)

				parser_buffer.initialize_with(code)
				parser.eval(parser_buffer, eiffel.table, once "Class")
				error := parser.error
				if error /= Void then
					emit_syntax_error(error, code)
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
			create universe.make(universe_path)
			create {HASHED_DICTIONARY[LIBERTY_AST_CLASS, LIBERTY_CLASS_DESCRIPTOR]}classes.make
			create {HASHED_DICTIONARY[LIBERTY_TYPE, LIBERTY_TYPE_DESCRIPTOR]}types.make
		end

	universe: LIBERTY_CLUSTER
	classes: DICTIONARY[LIBERTY_AST_CLASS, LIBERTY_CLASS_DESCRIPTOR]
	types: DICTIONARY[LIBERTY_TYPE, LIBERTY_TYPE_DESCRIPTOR]

	kernel_types: DICTIONARY[LIBERTY_TYPE, STRING] is
		once
			create {HASHED_DICTIONARY[LIBERTY_TYPE, STRING]}Result.make
		end

feature {LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS}
	visit_liberty_ast_effective_type_parameters (v: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS) is
		do
			check False end
		end

feature {LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER}
	visit_liberty_ast_effective_type_parameter (v: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER) is
		do
			check False end
		end

feature {LIBERTY_AST_FEATURE}
	visit_liberty_ast_feature (v: LIBERTY_AST_FEATURE) is
		do
			check False end
		end

feature {LIBERTY_AST_TYPE_DEFINITION}
	visit_liberty_ast_type_definition (v: LIBERTY_AST_TYPE_DEFINITION) is
		do
			check False end
		end

feature {LIBERTY_AST_TYPE_PARAMETERS}
	visit_liberty_ast_type_parameters (v: LIBERTY_AST_TYPE_PARAMETERS) is
		do
			check False end
		end

feature {LIBERTY_AST_TYPE_PARAMETER}
	visit_liberty_ast_type_parameter (v: LIBERTY_AST_TYPE_PARAMETER) is
		do
			check False end
		end

feature {LIBERTY_AST_CLASS}
	visit_liberty_ast_class (v: LIBERTY_AST_CLASS) is
		do
			check False end
		end

feature {LIBERTY_AST_CLASS_HEADER}
	visit_liberty_ast_class_header (v: LIBERTY_AST_CLASS_HEADER) is
		do
			check False end
		end

invariant
	types /= Void

end
