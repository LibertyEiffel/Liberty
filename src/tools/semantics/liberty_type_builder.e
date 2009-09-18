class LIBERTY_TYPE_BUILDER

inherit
	EIFFEL_LIST_NODE_IMPL_VISITOR
	LIBERTY_AST_CLASS_VISITOR
	LIBERTY_AST_CLASS_HEADER_VISITOR
	LIBERTY_AST_OBSOLETE_VISITOR
	LIBERTY_AST_FEATURE_VISITOR
	LIBERTY_AST_FEATURE_DEFINITION_VISITOR
	LIBERTY_AST_SIGNATURE_VISITOR
	LIBERTY_AST_FEATURE_NAME_VISITOR
	LIBERTY_AST_FEATURE_NAME_OR_ALIAS_VISITOR
	LIBERTY_AST_EIFFEL_BLOCK_VISITOR
	LIBERTY_AST_MANIFEST_OR_TYPE_TEST_VISITOR
	LIBERTY_AST_REQUIRE_VISITOR
	LIBERTY_AST_LOCAL_BLOCK_VISITOR
	LIBERTY_AST_DO_BLOCK_VISITOR
	LIBERTY_AST_RESCUE_BLOCK_VISITOR
	LIBERTY_AST_ENSURE_VISITOR
	LIBERTY_AST_EXTERNAL_VISITOR
	LIBERTY_AST_REQUIRE_ELSE_VISITOR
	LIBERTY_AST_ENSURE_THEN_VISITOR
	LIBERTY_AST_DECLARATION_VISITOR
	LIBERTY_AST_TYPE_DEFINITION_VISITOR
	LIBERTY_AST_VARIABLE_VISITOR
	LIBERTY_AST_ALIAS_VISITOR

create {LIBERTY_TYPE}
	make

feature {LIBERTY_TYPE}
	check_and_initialize (a_type: LIBERTY_TYPE; a_universe: like universe): LIBERTY_ERROR is
		do
			type := a_type
			universe := a_universe
			last_error := Void
			last_clients := Void
			last_assertions := Void
			last_type_definition := Void
			last_instructions := Void
			last_feature_definition := Void
			last_feature_routine := Void
			last_feature_block := Void
			feature_definition := Void
			feature_definition_names := Void
			a_type.ast.accept(Current)
			Result := last_error
			if Result /= Void then
				Result := a_type.check_validity
			end
		end

feature {EIFFEL_LIST_NODE_IMPL}
	visit_eiffel_list_node_impl (node: EIFFEL_LIST_NODE_IMPL) is
		local
			i: INTEGER
		do
			from
				i := node.lower
			until
				last_error /= Void or else i > node.upper
			loop
				node.item(i).accept(Current)
				i := i + 1
			end
		end

feature {LIBERTY_AST_CLASS}
	visit_liberty_ast_class (v: LIBERTY_AST_CLASS) is
		do
			v.class_header.accept(Current)
			v.obsolete_clause.accept(Current)
			v.features.accept(Current)
			v.inherit_clause.accept(Current)
			v.insert_clause.accept(Current)
			v.creations.accept(Current)
			v.invariant_clause.accept(Current)
		end

feature {LIBERTY_AST_CLASS_HEADER}
	visit_liberty_ast_class_header (v: LIBERTY_AST_CLASS_HEADER) is
		do
			v.class_marker.accept(Current)
			v.class_name.accept(Current)
			v.type_parameters.accept(Current)
			v.indexing_clause.accept(Current)
		end

feature {LIBERTY_AST_OBSOLETE}
	visit_liberty_ast_obsolete (v: LIBERTY_AST_OBSOLETE) is
		local
			string: LIBERTY_AST_STRING
		do
			if v.count > 0 then
				string := v.string
				if feature_definition /= Void then
					feature_definition.set_obsolete(decoded_string(string))
				else
					type.set_obsolete(decoded_string(string))
				end
			end
		end

feature {LIBERTY_AST_FEATURE}
	visit_liberty_ast_feature (v: LIBERTY_AST_FEATURE) is
		local
			client: LIBERTY_AST_CLASS_NAME
			client_list: COLLECTION[LIBERTY_AST_CLASS_NAME]
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_AST_CLASS_NAME]}client_list.with_capacity(v.clients.count)
			from
				i := v.clients.lower
			until
				last_error /= Void or else i > v.clients.upper
			loop
				client ::= v.clients.item(i)
				client_list.add_last(client)
				i := i + 1
			end
			create last_clients.make(type, client_list, universe)
			v.definition_list.accept(Current)
		end

feature {LIBERTY_AST_FEATURE_DEFINITION}
	visit_liberty_ast_feature_definition (v: LIBERTY_AST_FEATURE_DEFINITION) is
		do
			create feature_definition.make(last_clients)
			last_feature_routine := Void
			last_feature_block := Void
			if v.has_block then
				v.block.accept(Current)
			elseif v.is_constant then
				v.constant.accept(Current)
			else
				check
					v.is_unique
				end
				create {LIBERTY_FEATURE_UNIQUE}last_feature_definition.make
			end
			feature_definition.set_definition(last_feature_definition)
			v.signature.accept(Current)
			feature_definition_names.accept(Current)
		end

feature {LIBERTY_AST_SIGNATURE}
	visit_liberty_ast_signature (v: LIBERTY_AST_SIGNATURE) is
		local
			i, j: INTEGER
		do
			feature_definition_names := v.feature_names
			if v.has_result_type then
				v.result_type.accept(Current)
				last_feature_definition.set_result_type(last_type_definition)
			end
			if v.has_parameters then
				if last_feature_definition.can_have_parameters then
					from
						i := v.parameters.lower
					until
						last_error /= Void or else i > v.parameters.upper
					loop
						last_declaration_names.clear_count
						v.parameters.item(i).accept(Current)
						from
							j := last_declaration_names.lower
						until
							last_error /= Void or else j > last_declaration_names.upper
						loop
							last_feature_definition.add_parameter(create {LIBERTY_PARAMETER}.make(last_declaration_names.item(j), last_type_definition))
							j := j + 1
						end
						i := i + 1
					end
				else
					create last_error.make(v.source_index, once "*** Unexpected parameters", last_error)
				end
			end
		end

feature {LIBERTY_AST_FEATURE_NAME}
	visit_liberty_ast_feature_name (v: LIBERTY_AST_FEATURE_NAME) is
		do
			if feature_definition.name_set then
				feature_definition := feature_definition.twin
			end
			if v.is_frozen then
				feature_definition.set_frozen
			end
			v.feature_name_or_alias.accept(Current)
			type.add_feature(feature_definition)
		end

feature {LIBERTY_AST_FEATURE_NAME_OR_ALIAS}
	visit_liberty_ast_feature_name_or_alias (v: LIBERTY_AST_FEATURE_NAME_OR_ALIAS) is
		do
			if v.is_regular then
				feature_definition.set_name(v.entity_name.image.image)
			elseif v.is_prefix then
				feature_definition.set_prefix_name(v.free_operator_name.image.image)
			else
				check
					v.is_infix
				end
				feature_definition.set_infix_name(v.free_operator_name.image.image)
			end
		end

feature {LIBERTY_AST_EIFFEL_BLOCK}
	visit_liberty_ast_eiffel_block (v: LIBERTY_AST_EIFFEL_BLOCK) is
		do
			v.obsolete_clause.accept(Current)
			if v.is_regular then
				v.do_block.accept(Current)
				v.require_clause.accept(Current)
				v.local_block.accept(Current)
				v.rescue_block.accept(Current)
				v.ensure_clause.accept(Current)
			else
				check
					v.is_external
				end
				v.external_clause.accept(Current)
			end
		end

feature {LIBERTY_AST_REQUIRE}
	visit_liberty_ast_require (v: LIBERTY_AST_REQUIRE) is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_ASSERTION]}last_assertions.with_capacity(v.list_count)
			from
				i := v.list_lower
			until
				last_error /= Void or else i > v.list_upper
			loop
				v.list_item(i).accept(Current)
				i := i + 1
			end
			v.require_else.accept(Current)
		end

feature {LIBERTY_AST_REQUIRE_ELSE}
	visit_liberty_ast_require_else (v: LIBERTY_AST_REQUIRE_ELSE) is
		do
			if v.is_require_else then
				last_feature_routine.set_require_else(last_assertions)
			elseif v.is_require_then then
				last_feature_routine.set_require_then(last_assertions)
			else
				last_feature_routine.set_require(last_assertions)
			end
		end

feature {LIBERTY_AST_LOCAL_BLOCK}
	visit_liberty_ast_local_block (v: LIBERTY_AST_LOCAL_BLOCK) is
		local
			i, j: INTEGER
		do
			from
				i := v.list_lower
			until
				last_error /= Void or else i > v.list_upper
			loop
				last_declaration_names.clear_count
				v.list_item(i).accept(Current)
				from
					j := last_declaration_names.lower
				until
					last_error /= Void or else j > last_declaration_names.upper
				loop
					last_feature_block.add_local(create {LIBERTY_LOCAL}.make(last_declaration_names.item(j), last_type_definition))
					j := j + 1
				end
				i := i + 1
			end
		end

feature {LIBERTY_AST_DECLARATION}
	visit_liberty_ast_declaration (v: LIBERTY_AST_DECLARATION) is
		do
			v.type_definition.accept(Current)
			v.variables.accept(Current)
		end

feature {LIBERTY_AST_VARIABLE}
	visit_liberty_ast_variable (v: LIBERTY_AST_VARIABLE) is
		do
			last_declaration_names.add_last(v.variable.image.image)
		end

feature {LIBERTY_AST_DO_BLOCK}
	visit_liberty_ast_do_block (v: LIBERTY_AST_DO_BLOCK) is
		local
			i: INTEGER
		do
			if v.is_attribute then
				create {LIBERTY_FEATURE_ATTRIBUTE}last_feature_routine.make
				last_feature_definition := last_feature_routine
				check
					last_feature_block = Void
				end
			elseif v.is_deferred then
				create {LIBERTY_FEATURE_DEFERRED}last_feature_routine.make
				last_feature_definition := last_feature_routine
				check
					last_feature_block = Void
				end
			else
				create {FAST_ARRAY[LIBERTY_INSTRUCTION]}last_instructions.with_capacity(v.list_count)
				from
					i := v.list_lower
				until
					last_error /= Void or else i > v.list_upper
				loop
					v.list_item(i).accept(Current)
					i := i + 1
				end
				if v.is_do then
					create {LIBERTY_FEATURE_DO}last_feature_block.make(last_instructions)
				elseif v.is_once then
					create {LIBERTY_FEATURE_ONCE}last_feature_block.make(last_instructions)
				end
				last_feature_routine := last_feature_block
				last_feature_definition := last_feature_routine
			end
		end

feature {LIBERTY_AST_RESCUE_BLOCK}
	visit_liberty_ast_rescue_block (v: LIBERTY_AST_RESCUE_BLOCK) is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_INSTRUCTION]}last_instructions.with_capacity(v.list_count)
			from
				i := v.list_lower
			until
				last_error /= Void or else i > v.list_upper
			loop
				v.list_item(i).accept(Current)
				i := i + 1
			end
			last_feature_block.set_rescue(last_instructions)
		end

feature {LIBERTY_AST_ENSURE}
	visit_liberty_ast_ensure (v: LIBERTY_AST_ENSURE) is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_ASSERTION]}last_assertions.with_capacity(v.list_count)
			from
				i := v.list_lower
			until
				last_error /= Void or else i > v.list_upper
			loop
				v.list_item(i).accept(Current)
				i := i + 1
			end
			v.ensure_then.accept(Current)
		end

feature {LIBERTY_AST_ENSURE_THEN}
	visit_liberty_ast_ensure_then (v: LIBERTY_AST_ENSURE_THEN) is
		do
			if v.is_ensure_then then
				last_feature_routine.set_ensure_then(last_assertions)
			else
				last_feature_routine.set_ensure(last_assertions)
			end
		end

feature {LIBERTY_AST_EXTERNAL}
	visit_liberty_ast_external (v: LIBERTY_AST_EXTERNAL) is
		do
			v.alias_clause.accept(Current)
			create {LIBERTY_FEATURE_EXTERNAL}last_feature_routine.make(decoded_string(v.definition), last_alias)
			last_feature_definition := last_feature_routine
			check
				last_feature_block = Void
			end
		end

feature {LIBERTY_AST_ALIAS}
	visit_liberty_ast_alias (v: LIBERTY_AST_ALIAS) is
		do
			if v.has_alias then
				last_alias := decoded_string(v.definition)
			else
				last_alias := Void
			end
		end

feature {LIBERTY_AST_MANIFEST_OR_TYPE_TEST}
	visit_liberty_ast_manifest_or_type_test (v: LIBERTY_AST_MANIFEST_OR_TYPE_TEST) is
		do
			
		end

feature {LIBERTY_AST_TYPE_DEFINITION}
	visit_liberty_ast_type_definition (v: LIBERTY_AST_TYPE_DEFINITION) is
		do
			last_type_definition := universe.get_type_from_type_definition(type.cluster, v)
		end

feature {}
	decoded_string (image: LIBERTY_AST_STRING): STRING is
		local
			img: TYPED_EIFFEL_IMAGE[STRING]
		do
			img ::= image.image
			Result := img.decoded
		end

feature {}
	make is
		do
			create {FAST_ARRAY[STRING]}last_declaration_names.make(0)
		end

	type: LIBERTY_TYPE
	last_error: LIBERTY_ERROR
	last_clients: LIBERTY_CLIENTS
	feature_definition: LIBERTY_FEATURE
	feature_definition_names: EIFFEL_LIST_NODE
	last_assertions: COLLECTION[LIBERTY_ASSERTION]
	last_declaration_names: COLLECTION[STRING]
	last_type_definition: LIBERTY_TYPE
	last_instructions: COLLECTION[LIBERTY_INSTRUCTION]
	last_alias: STRING
	last_feature_definition: LIBERTY_FEATURE_DEFINITION
	last_feature_routine: LIBERTY_FEATURE_ROUTINE
	last_feature_block: LIBERTY_FEATURE_BLOCK
	universe: LIBERTY_UNIVERSE

invariant
	last_declaration_names /= Void
	last_feature_block /= Void implies last_feature_block = last_feature_definition
	last_feature_routine /= Void implies last_feature_routine = last_feature_definition

end
