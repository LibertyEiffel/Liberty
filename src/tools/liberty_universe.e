class LIBERTY_UNIVERSE

inherit
	LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS_VISITOR
	LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER_VISITOR
	LIBERTY_AST_FEATURE_VISITOR
	LIBERTY_AST_TYPE_DEFINITION_VISITOR
	LIBERTY_AST_TYPE_PARAMETERS_VISITOR
	LIBERTY_AST_TYPE_PARAMETER_VISITOR
	LIBERTY_AST_CLASS_VISITOR
	LIBERTY_AST_CLASS_HEADER_VISITOR

create {ANY}
	make

feature {ANY}
	get_type (cluster: LIBERTY_CLUSTER; class_name: STRING; effective_type_parameters: TRAVERSABLE[LIBERTY_TYPE]): LIBERTY_TYPE is
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR; c: like cluster
		do
			if cluster /= Void then
				c := cluster
			else
				c := universe.find(class_name)
			end
			if c /= Void then
				last_error := Void
				create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(c, class_name), effective_type_parameters)
				Result := get_type_from_descriptor(descriptor)
			else
				create last_error.make(0, once "*** Unknown class: " + class_name, Void)
			end
		ensure
			Result.cluster = cluster
			Result.name.is_equal(class_name)
			Result.parameters.is_equal(effective_type_parameters)
		end

	get_type_from_descriptor (descriptor: LIBERTY_TYPE_DESCRIPTOR): LIBERTY_TYPE is
		local
			ast: LIBERTY_AST_CLASS
		do
			last_error := Void
			Result := types.reference_at(descriptor)
			if Result = Void then
				ast := parse_class(descriptor.cluster, descriptor.name)
				create Result.make(descriptor, ast, Current)
				types.put(Result, descriptor)
			end
		ensure
			Result.cluster.is_equal(descriptor.cluster)
			Result.name.is_equal(descriptor.name)
			Result.parameters.is_equal(descriptor.parameters)
		end

	get_type_from_type_definition (origin: LIBERTY_CLUSTER; type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		local
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			if type_definition.is_anchor then
				create last_error.make(type_definition.anchor_index, "*** Cannot use an anchor here", Void)
			else
				cluster := origin.find(class_name)
				class_name := type_definition.type_name.image.image
				parameters := get_parameters(origin, type_definition.type_parameters)
				Result := get_type(cluster, class_name, parameters)
			end
		end

	get_type_from_client (origin: LIBERTY_CLUSTER; client: LIBERTY_AST_CLIENT): LIBERTY_TYPE is
		local
			descriptor: LIBERTY_TYPE_DESCRIPTOR
			cluster: LIBERTY_CLUSTER
			class_name: STRING
			parameters: TRAVERSABLE[LIBERTY_TYPE]
		do
			last_error := Void
			if client.is_type_definition then
				Result := get_type_from_type_definition(origin, client.type_definition)
			else
				-- legacy
				class_name := client.class_name.image.image
				cluster := origin.find(class_name)
				parameters := get_parameter_constraints(origin, parse_class(cluster, class_name))
				create descriptor.make(create {LIBERTY_CLASS_DESCRIPTOR}.make(cluster, class_name), parameters)
				Result := get_type_from_descriptor(descriptor)
			end
		end

	type_any: LIBERTY_TYPE is
		local
			cd: LIBERTY_CLASS_DESCRIPTOR; td: LIBERTY_TYPE_DESCRIPTOR
			ast: LIBERTY_AST_CLASS
			class_name: STRING
			cluster: LIBERTY_CLUSTER
		do
			Result := type_any_memory
			if Result = Void then
				last_error := Void
				class_name := once "ANY"
				cluster := universe.find(class_name)
				create cd.make(cluster, class_name)
				create td.make(cd, create {FAST_ARRAY[LIBERTY_TYPE]}.with_capacity(0))
				Result := types.reference_at(td)
				if Result = Void then
					ast := parse_class(cluster, class_name)
					create Result.make(td, ast, Current)
					types.put(Result, td)
				end
				type_any_memory := Result
			end
		ensure
			Result /= Void
		end

	last_error: LIBERTY_ERROR

feature {} -- Type parameters fetching
	get_parameter_constraints (origin: LIBERTY_CLUSTER; a_class: LIBERTY_AST_CLASS): COLLECTION[LIBERTY_TYPE] is
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
						Result.add_last(get_type_from_type_definition(origin, type_parameter.constraint))
					else
						Result.add_last(type_any)
					end
					i := i + 1
				end
			end
		end

	get_parameters (origin: LIBERTY_CLUSTER; type_parameters: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETERS): COLLECTION[LIBERTY_TYPE] is
		local
			type_parameter: LIBERTY_AST_EFFECTIVE_TYPE_PARAMETER
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
					Result.add_last(get_type_from_type_definition(origin, type_parameter.type_definition))
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
					(create {LIBERTY_ERROR}.from_parse_error(error)).emit(code)
					die_with_code(1)
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

	type_any_memory: LIBERTY_TYPE

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
