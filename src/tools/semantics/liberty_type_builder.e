class LIBERTY_TYPE_BUILDER

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERRORS

create {LIBERTY_TYPE}
	make

feature {LIBERTY_TYPE}
	check_and_initialize is
		require
			not has_error
		local
			ast: LIBERTY_AST_CLASS
		do
			ast := type.ast
			init_header(ast.class_header)
			if not has_error then
				if ast.obsolete_clause.count > 0 then
					warning(ast.obsolete_clause.string.image.index, decoded_string(ast.obsolete_clause.string))
				end
				add_parents(ast.inherit_clause, True)
				add_parents(ast.insert_clause, False)
				if not has_error then
					add_features(ast.features)
					if not has_error then
						add_creations(ast.creations)
						if not has_error then
							add_invariant(ast.invariant_clause)
						end
					end
				end
			end
		end

feature {}
	init_header (a_header: LIBERTY_AST_CLASS_HEADER) is
		local
			marker: LIBERTY_AST_CLASS_MARKER
			name: STRING
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			constraint: LIBERTY_TYPE
			i: INTEGER
		do
			marker := a_header.class_marker
			if marker.is_deferred then
				type.set_deferred
			elseif marker.is_expanded then
				type.set_expanded
			elseif marker.is_separate then
				type.set_separate
			else
				type.set_reference
			end
			name := a_header.class_name.image.image
			type_parameters := a_header.type_parameters
			if type_parameters.list_count /= type.parameters.count then
				error(a_header.class_name.image.index, once "Bad number of generic parameters")
			else
				check
					same_indexes: type_parameters.list_lower = type.parameters.lower
				end
				create {HASHED_DICTIONARY[LIBERTY_TYPE, STRING]}effective_generic_parameters.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						constraint := universe.get_type_from_type_definition(type.cluster, type_parameter.constraint, effective_generic_parameters)
						if not type.parameters.item(i).is_child_of(constraint) then
							error(type_parameter.class_name.image.index, once "Bad effective parameter: does not inherit or insert the constraint " + constraint.name)
						end
					end
					effective_generic_parameters.add(type.parameters.item(i), type_parameter.class_name.image.image)
					i := i + 1
				end
			end
		end

	add_parents (parents: LIBERTY_AST_LIST[LIBERTY_AST_PARENT]; conformant: BOOLEAN) is
		local
			i: INTEGER; parent_clause: LIBERTY_AST_PARENT
			parent: LIBERTY_TYPE
			has_parent: BOOLEAN
		do
			from
				has_parent := False
				i := parents.list_lower
			until
				has_error or else i > parents.list_upper
			loop
				parent_clause := parents.list_item(i)
				parent := universe.get_type_from_type_definition(type.cluster, parent_clause.type_definition, effective_generic_parameters)
				if parent /= Void then
					type.add_parent(parent, conformant)
					inject_parent_invariant(parent)
					inject_parent_features(parent, parent_clause.parent_clause, conformant)
					has_parent := True
				end
				i := i + 1
			end
			if not has_parent then
				parent := universe.type_any
				type.add_parent(parent, False)
				inject_parent_invariant(parent)
				inject_parent_features(parent, Void, False)
			end
		end

	inject_parent_invariant (parent: LIBERTY_TYPE) is
		do
			--|*** TODO
		end

	inject_parent_features (parent: LIBERTY_TYPE; clause: LIBERTY_AST_PARENT_CLAUSE; conformant: BOOLEAN) is
		local
			parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]
		do
			parent_features := parent.features_twin
			rename_features(parent_features, clause.rename_clause)
			export_features(parent_features, clause.export_clause)
			undefine_features(parent_features, clause.undefine_clause, conformant)
			redefine_features(parent_features, clause.redefine_clause, conformant)
			push_parent_features_in_type(parent_features)
		end

	rename_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]; clause: LIBERTY_AST_PARENT_RENAME) is
		local
			i: INTEGER; r: LIBERTY_AST_RENAME; old_name, new_name: LIBERTY_FEATURE_NAME
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				r := clause.list_item(i)
				create old_name.make_from_ast(r.old_name.feature_name_or_alias)
				create new_name.make_from_ast(r.new_name.feature_name_or_alias)
				fd := parent_features.reference_at(old_name)
				if fd = Void then
					error(old_name.index, once "Unknown feature name: " + old_name.name)
				elseif parent_features.reference_at(new_name) /= Void then
					error(new_name.index, once "Duplicate feature name: " + new_name.name)
				else
					parent_features.remove(old_name)
					fd.set_name(new_name)
					parent_features.add(fd, new_name)
				end
				i := i + 1
			end
		end

	export_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]; clause: LIBERTY_AST_PARENT_EXPORT) is
		local
			i, j: INTEGER; e: LIBERTY_AST_EXPORT; feature_name: LIBERTY_FEATURE_NAME; fn: LIBERTY_AST_FEATURE_NAME
			clients: COLLECTION[LIBERTY_TYPE]
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				e := clause.list_item(i)
				clients := list_clients(e.clients)
				from
					j := e.feature_names.lower
				until
					j > e.feature_names.upper
				loop
					fn ::= e.feature_names.item(j)
					create feature_name.make_from_ast(fn.feature_name_or_alias)
					fd := parent_features.reference_at(feature_name)
					if fd = Void then
						error(feature_name.index, once "Unknown feature name: " + feature_name.name)
					else
						fd.set_clients(clients)
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	undefine_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]; clause: LIBERTY_AST_PARENT_UNDEFINE; conformant: BOOLEAN) is
			-- replace the feature by a LIBERTY_FEATURE_DEFERRED
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
			inherited_feature: LIBERTY_FEATURE; deferred_feature: LIBERTY_FEATURE_DEFERRED
		do
			from
				i := clause.list_lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias)
				fd := parent_features.reference_at(feature_name)
				if fd = Void then
					error(feature_name.index, once "Unknown feature name: " + feature_name.name)
				elseif fd.is_frozen then
					error(feature_name.index, once "Cannot undefine frozen feature: " + feature_name.name)
				else
					inherited_feature := fd.the_feature
					create deferred_feature.make
					deferred_feature.set_precondition(inherited_feature.precondition)
					deferred_feature.set_postcondition(inherited_feature.postcondition)
					deferred_feature.set_result_type(inherited_feature.result_type)
					deferred_feature.set_parameters(inherited_feature.parameters)
					if conformant then
						inherited_feature.bind(deferred_feature, type)
					end
					fd.set_the_feature(deferred_feature)
				end
				i := i + 1
			end
		end

	redefine_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]; clause: LIBERTY_AST_PARENT_REDEFINE; conformant: BOOLEAN) is
			-- replace the feature by a LIBERTY_FEATURE_REDEFINED
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
			inherited_feature: LIBERTY_FEATURE; redefined_feature: LIBERTY_FEATURE_REDEFINED
		do
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]}redefined_features.with_capacity(clause.list_count)
			from
				i := clause.list_lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias)
				fd := parent_features.reference_at(feature_name)
				if fd = Void then
					error(feature_name.index, once "Unknown feature name: " + feature_name.name)
				elseif fd.is_frozen then
					error(feature_name.index, once "Cannot redefine frozen feature: " + feature_name.name)
				else
					inherited_feature := fd.the_feature
					create redefined_feature.make
					redefined_feature.set_precondition(inherited_feature.precondition)
					redefined_feature.set_postcondition(inherited_feature.postcondition)
					redefined_feature.set_result_type(inherited_feature.result_type)
					redefined_feature.set_parameters(inherited_feature.parameters)
					if conformant then
						inherited_feature.bind(redefined_feature, type)
					end
					fd.set_the_feature(redefined_feature)
					redefined_features.add(redefined_feature, feature_name)
				end
				i := i + 1
			end
		end

	push_parent_features_in_type (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]) is
		local
			i: INTEGER
		do
			from
				i := parent_features.lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i >  parent_features.upper
			loop
				type.add_feature(parent_features.item(i))
				i := i + 1
			end
		end

feature {}
	add_features (features: EIFFEL_LIST_NODE) is
		local
			i, j: INTEGER; clients: COLLECTION[LIBERTY_TYPE]
			f: LIBERTY_AST_FEATURE; fd: LIBERTY_AST_FEATURE_DEFINITION
		do
			from
				i := features.lower
			until
				i > features.upper
			loop
				f ::= features.item(i)
				clients := list_clients(f.clients)
				from
					j := f.definition_list.lower
				until
					j > f.definition_list.upper
				loop
					fd ::= f.definition_list.item(i)
					add_feature(clients, fd)
					j := j + 1
				end
				i := i + 1
			end

			check_that_all_redefined_features_were_redefined
		end

	add_feature (clients: COLLECTION[LIBERTY_TYPE]; a_feature: LIBERTY_AST_FEATURE_DEFINITION) is
		local
			result_type: LIBERTY_TYPE; parameters: COLLECTION[LIBERTY_PARAMETER]
			the_feature: LIBERTY_FEATURE; a_ast_terminal: LIBERTY_AST_TERMINAL_NODE
		do
			if a_feature.signature.has_result_type then
				result_type := universe.get_type_from_type_definition(type.cluster, a_feature.signature.result_type, effective_generic_parameters)
			end
			if a_feature.has_block then
				if a_feature.signature.has_parameters then
					parameters := list_parameters(a_feature.signature.parameters)
				else
					parameters := empty_parameter_list
				end
				the_feature := feature_block(parameters, result_type, a_feature.block)
			else
				if a_feature.signature.has_parameters then
					a_ast_terminal ::= a_feature.signature.node_at(1)
					error(a_ast_terminal.image.index, once "Unexpected parameters")
				elseif not a_feature.signature.has_result_type then
					a_ast_terminal ::= a_feature.signature.node_at(3)
					error(a_ast_terminal.image.index + 1, once "Missing entity type")
				else
					if a_feature.is_constant then
						the_feature := feature_constant(result_type, a_feature.constant)
					else
						check a_feature.is_unique end
						create {LIBERTY_FEATURE_UNIQUE}the_feature.make(result_type)
					end
				end
			end
			add_feature_definition(the_feature, a_feature.signature.feature_names, clients)
		end

	feature_block (parameters: COLLECTION[LIBERTY_PARAMETER]; result_type: LIBERTY_TYPE; block: LIBERTY_AST_EIFFEL_BLOCK): LIBERTY_FEATURE is
		require
			parameters /= Void
		local
			obsolete_message: STRING
			locals: COLLECTION[LIBERTY_LOCAL]
		do
			if block.obsolete_clause.count > 0 then
				obsolete_message := decoded_string(block.obsolete_clause.string)
			end
			if block.is_external then
				if block.external_clause.alias_clause.has_alias then
					create {LIBERTY_FEATURE_EXTERNAL} Result.make(decoded_string(block.external_clause.definition), decoded_string(block.external_clause.alias_clause.definition))
				else
					create {LIBERTY_FEATURE_EXTERNAL} Result.make(decoded_string(block.external_clause.definition), Void)
				end
			else
				locals := list_locals(block.local_block)
				
			end
			Result.set_parameters(parameters)
			Result.set_result_type(result_type)
		end

	feature_constant (result_type: LIBERTY_TYPE; constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST): LIBERTY_FEATURE_CONSTANT is
		require
			result_type /= Void
		local
			tm: like typed_manifest_or_type_test
			a_ast_terminal: LIBERTY_AST_TERMINAL_NODE
		do
			if constant.is_assignment_test then
				a_ast_terminal ::= constant.node_at(0)
				error(a_ast_terminal.image.index, once "Unexpected assignment test")
			elseif constant.is_typed_open_argument then
				a_ast_terminal ::= constant.node_at(0)
				error(a_ast_terminal.image.index, once "Unexpected open argument")
			else
				tm := typed_manifest_or_type_test(constant)
				if not has_error then
					if tm.result_type.is_conform_to(result_type) then
						create Result.make(result_type, tm)
					else
						a_ast_terminal ::= constant.node_at(0)
						error(a_ast_terminal.image.index, once "That expression does not conform to " + result_type.name)
					end
				end
			end
		end

	add_feature_definition (a_feature: LIBERTY_FEATURE; names: EIFFEL_LIST_NODE; clients: COLLECTION[LIBERTY_TYPE]) is
		local
			i: INTEGER; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME
			fd: LIBERTY_FEATURE_DEFINITION
			a_ast_terminal: LIBERTY_AST_TERMINAL_NODE
			name_or_alias: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
			redefined: LIBERTY_FEATURE_REDEFINED
		do
			from
				i := names.lower
			until
				i > names.upper
			loop
				name ::= names.item(i)
				create feature_name.make_from_ast(name.feature_name_or_alias)
				if type.has_feature(feature_name) then
					redefined := redefined_features.reference_at(feature_name)
					if redefined /= Void and then redefined.redefined_feature = Void then
						if parameters_match(a_feature.parameters, redefined.parameters, name, feature_name) then
							if a_feature.result_type.is_conform_to(redefined.result_type) then
								redefined.set_redefined_feature(a_feature)
							else
								name_or_alias := name.feature_name_or_alias
								a_ast_terminal ::= name_or_alias.node_at(0)
								error(a_ast_terminal.image.index, once "Cannot redefine feature (result types don't conform): " + feature_name.name)
							end
						else
							-- an error was emitted by `parameters_match'
							check has_error end
						end
					else
						name_or_alias := name.feature_name_or_alias
						a_ast_terminal ::= name_or_alias.node_at(0)
						error(a_ast_terminal.image.index, once "Duplicate feature: " + feature_name.name)
					end
				else
					create fd.make(feature_name, clients, name.is_frozen)
					type.add_feature(fd)
				end
				i := i + 1
			end
		end

	parameters_match (child_parameters, parent_parameters: COLLECTION[LIBERTY_PARAMETER]; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		local
			a_ast_terminal: LIBERTY_AST_TERMINAL_NODE
			name_or_alias: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
			i: INTEGER
		do
			if child_parameters = Void then
				Result := parent_parameters = Void
				name_or_alias := name.feature_name_or_alias
				a_ast_terminal ::= name_or_alias.node_at(0)
				error(a_ast_terminal.image.index, once "Cannot redefine feature (not enough parameters): " + feature_name.name)
			elseif parent_parameters /= Void then
				if child_parameters.count < parent_parameters.count then
					name_or_alias := name.feature_name_or_alias
					a_ast_terminal ::= name_or_alias.node_at(0)
					error(a_ast_terminal.image.index, once "Cannot redefine feature (not enough parameters): " + feature_name.name)
				elseif child_parameters.count > parent_parameters.count then
					name_or_alias := name.feature_name_or_alias
					a_ast_terminal ::= name_or_alias.node_at(0)
					error(a_ast_terminal.image.index, once "Cannot redefine feature (too many parameters): " + feature_name.name)
				else
					from
						Result := True
						check
							child_parameters.lower = parent_parameters.lower
						end
						i := child_parameters.lower
					until
						not Result or else i > child_parameters.upper
					loop
						Result := child_parameters.item(i).result_type.is_conform_to(parent_parameters.item(i).result_type)
						i := i + 1
					end
					if not Result then
						name_or_alias := name.feature_name_or_alias
						a_ast_terminal ::= name_or_alias.node_at(0)
						error(a_ast_terminal.image.index, once "Cannot redefine feature (parameter types don't conform): " + feature_name.name)
					end
				end
			end
		ensure
			not Result implies has_error
		end

	check_that_all_redefined_features_were_redefined is
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME
		do
			from
				i := redefined_features.lower
			until
				i > redefined_features.upper
			loop
				if redefined_features.item(i).redefined_feature = Void then
					feature_name := redefined_features.key(i)
					error(feature_name.index, once "Missing redefinition for " + feature_name.name)
				end
				i := i + 1
			end
		end

feature {}
	add_creations (creations: EIFFEL_LIST_NODE) is
		do
			not_yet_implemented
		end

feature {}
	add_invariant (invariant_clause: LIBERTY_AST_INVARIANT) is
		do
			not_yet_implemented
		end

feature {} -- Expressions
	expression (exp: LIBERTY_AST_EXPRESSION): LIBERTY_EXPRESSION is
		do
			not_yet_implemented
		end

	expression_array (array: LIBERTY_AST_ARRAY): LIBERTY_EXPRESSION is
		do
			not_yet_implemented
		end

	expression_no_array (exp: LIBERTY_AST_EXPRESSION_NO_ARRAY): LIBERTY_EXPRESSION is
		do
			not_yet_implemented
		end

	typed_manifest_or_type_test (constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST): LIBERTY_EXPRESSION is
		require
			constant /= Void
		do
			if constant.is_assignment_test then
				--|*** TODO
			elseif constant.is_typed_open_argument then
				--|*** TODO
			elseif constant.is_number then
				Result := number(constant.number.image)
			elseif constant.is_true then
				create {LIBERTY_TYPED_MANIFEST[BOOLEAN]}Result.make(universe.type_boolean, True)
			elseif constant.is_false then
				create {LIBERTY_TYPED_MANIFEST[BOOLEAN]}Result.make(universe.type_boolean, False)
			elseif constant.is_character then
				Result := character(constant.character.image)
			elseif constant.is_string then
				create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, decoded_string(constant.string), False)
			elseif constant.is_once_string then
				create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, decoded_string(constant.string), True)
			elseif constant.is_number_typed_manifest then
				Result := number_typed_manifest(universe.get_type_from_type_definition(type.cluster, constant.typed_manifest_type, effective_generic_parameters),
														  constant.typed_manifest_number.image)
			elseif constant.is_string_typed_manifest then
				create {LIBERTY_TYPED_MANIFEST[STRING]} Result.make(universe.get_type_from_type_definition(type.cluster, constant.typed_manifest_type, effective_generic_parameters),
																					 decoded_string(constant.typed_manifest_string))
			elseif constant.is_array_typed_manifest then
				Result := array_typed_manifest(universe.get_type_from_type_definition(type.cluster, constant.typed_manifest_type, effective_generic_parameters),
														 constant.typed_manifest_array_parameters, constant.typed_manifest_array)
			else
				check False end
			end
		end

	number (number_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION is
		require
			({TYPED_EIFFEL_IMAGE[INTEGER_64]} ?:= number_image)
				or else ({TYPED_EIFFEL_IMAGE[REAL]} ?:= number_image)
		local
			i: TYPED_EIFFEL_IMAGE[INTEGER_64]
			r: TYPED_EIFFEL_IMAGE[REAL]
			i64: INTEGER_64
		do
			-- That's not pretty! but doing without all those type tests would incur big changes and code
			-- duplication in the eiffel parser :-/
			if i ?:= number_image then
				i ::= number_image
				i64 := i.decoded
				if i64.fit_integer_8 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_8]}Result.make(universe.type_integer_64, i64.to_integer_8)
				elseif i64.fit_integer_16 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_16]}Result.make(universe.type_integer_64, i64.to_integer_16)
				elseif i64.fit_integer_32 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_32]}Result.make(universe.type_integer_64, i64.to_integer_32)
				else
					create {LIBERTY_TYPED_MANIFEST[INTEGER_64]}Result.make(universe.type_integer_64, i64)
				end
			else
				check
					r ?:= number_image
				end
				r ::= number_image
				create {LIBERTY_TYPED_MANIFEST[REAL]}Result.make(universe.type_real, r.decoded)
			end
		end

	character (character_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION is
		require
			{TYPED_EIFFEL_IMAGE[CHARACTER]} ?:= character_image
		local
			c: TYPED_EIFFEL_IMAGE[CHARACTER]
		do
			c ::= character_image
			create {LIBERTY_TYPED_MANIFEST[CHARACTER]}Result.make(universe.type_character, c.decoded)
		end

	number_typed_manifest (manifest_type: LIBERTY_TYPE; number_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION is
		require
			({TYPED_EIFFEL_IMAGE[INTEGER_64]} ?:= number_image)
				or else ({TYPED_EIFFEL_IMAGE[REAL]} ?:= number_image)
		local
			i: TYPED_EIFFEL_IMAGE[INTEGER_64]
			r: TYPED_EIFFEL_IMAGE[REAL]
			i64: INTEGER_64
		do
			-- That's not pretty! but doing without all those type tests would incur big changes and code
			-- duplication in the eiffel parser :-/
			if i ?:= number_image then
				i ::= number_image
				i64 := i.decoded
				if i64.fit_integer_8 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_8]}Result.make(manifest_type, i64.to_integer_8)
				elseif i64.fit_integer_16 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_16]}Result.make(manifest_type, i64.to_integer_16)
				elseif i64.fit_integer_32 then
					create {LIBERTY_TYPED_MANIFEST[INTEGER_32]}Result.make(manifest_type, i64.to_integer_32)
				else
					create {LIBERTY_TYPED_MANIFEST[INTEGER_64]}Result.make(manifest_type, i64)
				end
			else
				check
					r ?:= number_image
				end
				r ::= number_image
				create {LIBERTY_TYPED_MANIFEST[REAL]}Result.make(manifest_type, r.decoded)
			end
		end

	array_typed_manifest (manifest_type: LIBERTY_TYPE; array_parameters: EIFFEL_LIST_NODE; array: LIBERTY_AST_ARRAY): LIBERTY_ARRAY_MANIFEST is
		local
			i: INTEGER; ena: LIBERTY_AST_EXPRESSION_NO_ARRAY; exp: LIBERTY_AST_EXPRESSION
		do
			create Result.make(manifest_type)
			from
				i := array_parameters.lower
			until
				i > array_parameters.upper
			loop
				ena ::= array_parameters.item(i)
				Result.add_parameter(expression_no_array(ena))
				i := i + 1
			end
			from
				i := array.content.lower
			until
				i > array.content.upper
			loop
				exp ::= array.content.item(i)
				Result.add_content(expression(exp))
				i := i + 1
			end
		end

feature {}
	decoded_string (string_image: LIBERTY_AST_STRING): STRING is
		require
			{TYPED_EIFFEL_IMAGE[STRING]} ?:= string_image.image
		local
			s: TYPED_EIFFEL_IMAGE[STRING]
		do
			s ::= string_image.image
			Result := s.decoded
		end

	list_clients (clients: EIFFEL_LIST_NODE): COLLECTION[LIBERTY_TYPE] is
		local
			i: INTEGER; client: LIBERTY_AST_CLIENT
		do
			if clients.is_empty then
				Result := empty_client_list
			else
				create {FAST_ARRAY[LIBERTY_TYPE]}Result.with_capacity(clients.count)
				from
					i := clients.lower
				until
					i > clients.upper
				loop
					client ::= clients.item(i)
					Result.add_last(universe.get_type_from_client(type.cluster, client, effective_generic_parameters))
					i := i + 1
				end
			end
		end

	empty_client_list: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

	list_parameters (parameters: EIFFEL_LIST_NODE): COLLECTION[LIBERTY_PARAMETER] is
		local
			i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
			typedef: LIBERTY_TYPE; parameter: LIBERTY_PARAMETER
		do
			if parameters.is_empty then
				Result := empty_parameter_list
			else
				create {FAST_ARRAY[LIBERTY_PARAMETER]}Result.make(0)
				from
					i := parameters.lower
				until
					i > parameters.upper
				loop
					declaration ::= parameters.item(i)
					typedef := universe.get_type_from_type_definition(type.cluster, declaration.type_definition, effective_generic_parameters)
					if typedef /= Void then
						from
							j := declaration.variables.lower
						until
							j > declaration.variables.upper
						loop
							variable ::= declaration.variables.item(j)
							create parameter.make(variable.variable.image.image, typedef)
							Result.add_last(parameter)
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

	empty_parameter_list: COLLECTION[LIBERTY_PARAMETER] is
		once
			create {FAST_ARRAY[LIBERTY_PARAMETER]} Result.with_capacity(0)
		end

	list_locals (locals: LIBERTY_AST_LOCAL_BLOCK): COLLECTION[LIBERTY_LOCAL] is
		local
			i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
			typedef: LIBERTY_TYPE; localdef: LIBERTY_LOCAL
		do
			if locals.list_count = 0 then
				Result := empty_local_list
			else
				create {FAST_ARRAY[LIBERTY_LOCAL]}Result.make(0)
				from
					i := locals.list_lower
				until
					i > locals.list_upper
				loop
					declaration := locals.list_item(i)
					typedef := universe.get_type_from_type_definition(type.cluster, declaration.type_definition, effective_generic_parameters)
					if typedef /= Void then
						from
							j := declaration.variables.lower
						until
							j > declaration.variables.upper
						loop
							variable ::= declaration.variables.item(j)
							create localdef.make(variable.variable.image.image, typedef)
							Result.add_last(localdef)
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

	empty_local_list: COLLECTION[LIBERTY_LOCAL] is
		once
			create {FAST_ARRAY[LIBERTY_LOCAL]} Result.with_capacity(0)
		end

feature {}
	make (a_type: like type; a_universe: like universe) is
		require
			a_type /= Void
			a_universe /= Void
		do
			type := a_type
			universe := a_universe
		ensure
			type = a_type
			universe = a_universe
		end

	type: LIBERTY_TYPE
	universe: LIBERTY_UNIVERSE

	effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, STRING]
			-- key: generic parameter name (e.g. E_)
			-- value: effective parameter (e.g. STRING)

	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

invariant
	type /= Void
	universe /= Void

end
