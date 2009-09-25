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
	LIBERTY_AST_INSTRUCTION_VISITOR
	LIBERTY_AST_ASSIGNMENT_VISITOR
	LIBERTY_AST_CALL_VISITOR
	LIBERTY_AST_IF_THEN_ELSE_VISITOR
	LIBERTY_AST_INSPECT_VISITOR
	LIBERTY_AST_LOOP_VISITOR
	LIBERTY_AST_CHECK_VISITOR
	LIBERTY_AST_DEBUG_VISITOR
	LIBERTY_AST_OLD_CREATION_VISITOR
	LIBERTY_AST_CREATION_VISITOR
	LIBERTY_AST_RETRY_VISITOR
	LIBERTY_AST_IF_VISITOR
	LIBERTY_AST_ELSE_VISITOR
	LIBERTY_AST_WHEN_VISITOR
	LIBERTY_AST_WHEN_SLICE_VISITOR
	LIBERTY_AST_WHEN_VALUE_VISITOR
	LIBERTY_AST_FROM_VISITOR
	LIBERTY_AST_INVARIANT_VISITOR
	LIBERTY_AST_VARIANT_VISITOR
	LIBERTY_AST_DEBUG_KEYS_VISITOR

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
			last_instruction := Void
			last_condition := Void
			last_default := Void
			last_inspect := Void
			last_feature_definition := Void
			last_feature_routine := Void
			last_feature_block := Void
			last_from_instructions := Void
			last_invariant := Void
			last_variant := Void
			last_entity_reference := Void
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
				last_feature_routine.set_require(create {LIBERTY_REQUIRE_ELSE}.make(last_assertions))
			elseif v.is_require_then then
				last_feature_routine.set_require(create {LIBERTY_REQUIRE_THEN}.make(last_assertions))
			else
				last_feature_routine.set_require(create {LIBERTY_REQUIRE}.make(last_assertions))
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
				if v.is_do then
					create {LIBERTY_FEATURE_DO}last_feature_block.make(list_instructions(v.list))
				elseif v.is_once then
					create {LIBERTY_FEATURE_ONCE}last_feature_block.make(list_instructions(v.list))
				end
				last_feature_routine := last_feature_block
				last_feature_definition := last_feature_routine
			end
		end

feature {}
	list_instructions (instructions_list: EIFFEL_LIST_NODE): COLLECTION[LIBERTY_INSTRUCTION] is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[LIBERTY_INSTRUCTION]}Result.with_capacity(v.list_count)
			from
				i := v.list_lower
			until
				last_error /= Void or else i > v.list_upper
			loop
				v.list_item(i).accept(Current)
				Result.add_last(last_instruction)
				i := i + 1
			end
		end

feature {LIBERTY_AST_RESCUE_BLOCK}
	visit_liberty_ast_rescue_block (v: LIBERTY_AST_RESCUE_BLOCK) is
		do
			last_feature_block.set_rescue(list_instructions(v.list))
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
				last_feature_routine.set_ensure(create {LIBERTY_ENSURE_THEN}.make(last_assertions))
			else
				last_feature_routine.set_ensure(create {LIBERTY_ENSURE}.make(last_assertions))
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

feature {LIBERTY_AST_INSTRUCTION}
	visit_liberty_ast_instruction (v: LIBERTY_AST_INSTRUCTION) is
		do
			v.instruction.accept(Current)
		end

feature {LIBERTY_AST_CALL}
	visit_liberty_ast_call (v: LIBERTY_AST_CALL) is
		deferred
		end

feature {LIBERTY_AST_ASSIGNMENT}
	visit_liberty_ast_assignment (v: LIBERTY_AST_ASSIGNMENT) is
		deferred
		end

feature {LIBERTY_AST_IF_THEN_ELSE}
	visit_liberty_ast_if_then_else (v: LIBERTY_AST_IF_THEN_ELSE) is
		local
			i: INTEGER; cond: LIBERTY_CONDITIONAL
		do
			create cond.make
			v.then_clause.accept(Current)
			cond.add_condition(last_condition)
			from
				i := v.elseif_list.lower
			until
				last_error /= Void or else i > v.elseif_list.upper
			loop
				v.elseif_list.item(i).accept(Current)
				cond.add_condition(last_condition)
				i := i + 1
			end
			v.else_clause.accept(Current)
			cond.set_default(default)
			last_instruction := cond
		end

feature {LIBERTY_AST_IF}
	visit_liberty_ast_if (v: LIBERTY_AST_IF) is
		do
			v.expression.accept(Current)
			create last_condition.make(last_expression, list_instructions(v.instructions))
		end

feature {LIBERTY_AST_ELSE}
	visit_liberty_ast_else (v: LIBERTY_AST_ELSE) is
		do
			create last_default.make(list_instructions(v.list))
		end

feature {LIBERTY_AST_INSPECT}
	visit_liberty_ast_inspect (v: LIBERTY_AST_INSPECT) is
		local
			li: like last_inspect
		do
			li := last_inspect
			v.expression.accept(Current)
			create last_inspect.make(last_expression)
			v.when_list.accept(Current)
			v.else_clause.accept(Current)
			last_inspect.set_default(last_default)
			last_instruction := last_inspect
			last_inspect := li
		end

feature {LIBERTY_AST_WHEN}
	visit_liberty_ast_when (v: LIBERTY_AST_WHEN) is
		local
			lic: like last_inspect_clause
		do
			lic := last_inspect_clause
			create last_inspect_clause.make(list_instructions(v.instructions))
			v.when_clauses.accept(Current)
			last_inspect.add_clause(last_inspect_clause)
			last_inspect_clause := lic
		end

feature {LIBERTY_AST_WHEN_SLICE}
	visit_liberty_ast_when_slice (v: LIBERTY_AST_WHEN_SLICE) is
		local
			low, up: LIBERTY_EXPRESSION
		do
			v.low_value.accept(Current)
			low := last_expression
			if v.has_up_value then
				v.up_value.accept(Current)
				up := last_expression
			end
			last_inspect_clause.add_value(create {LIBERTY_INSPECT_SLICE}.make(low, up))
		end

feature {LIBERTY_AST_WHEN_VALUE}
	visit_liberty_ast_when_value (v: LIBERTY_AST_WHEN_VALUE) is
		do
			if v.is_number then
				v.number.accept(Current)
			elseif v.is_character then
				v.character.accept(Current)
			elseif v.is_string then
				v.string.accept(Current)
			else
				check
					v.is_entity_name
				end
				v.entity_name.accept(Current)
			end
		end

feature {LIBERTY_AST_LOOP}
	visit_liberty_ast_loop (v: LIBERTY_AST_LOOP) is
		local
			le: like last_expression; li: like last_invariant; lv: like last_variant
		do
			v.from_clause.accept(Current)
			v.invariant_clause.accept(Current)
			li := last_invariant
			v.variant_clause.accept(Current)
			lv := last_variant
			v.expression.accept(Current)
			le := last_expression
			create {LIBERTY_LOOP}last_instruction.make(last_from_instructions, le, list_instructions(v.instructions), li, lv)
		end

feature {LIBERTY_AST_FROM}
	visit_liberty_ast_from (v: LIBERTY_AST_FROM) is
		do
			last_from_instructions := list_instructions(v.instructions)
		end

feature {LIBERTY_AST_INVARIANT}
	visit_liberty_ast_invariant (v: LIBERTY_AST_INVARIANT) is
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
			create last_invariant.make(last_assertions)
		end

feature {LIBERTY_AST_VARIANT}
	visit_liberty_ast_variant (v: LIBERTY_AST_VARIANT) is
		do
			if v.has_variant then
				v.expression.accept(Current)
				create last_variant.make(last_expression)
			else
				last_variant := Void
			end
		end

feature {LIBERTY_AST_CHECK}
	visit_liberty_ast_check (v: LIBERTY_AST_CHECK) is
		local
			i: INTEGER; c: LIBERTY_CHECK
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
			create c.make(last_assertions)
			create {LIBERTY_CHECK_INSTRUCTION}last_instruction.make(c)
		end

feature {LIBERTY_AST_DEBUG}
	visit_liberty_ast_debug (v: LIBERTY_AST_DEBUG) is
		local
			ldk: like last_debug_keys
		do
			ldk := last_debug_keys
			v.debug_keys.accept(Current)
			create {LIBERTY_DEBUG}last_instruction.make(last_debug_keys, list_instructions(v.instructions))
			last_debug_keys := ldk
		end

feature {LIBERTY_AST_DEBUG_KEYS}
	visit_liberty_ast_debug_keys (v: LIBERTY_AST_DEBUG_KEYS) is
		local
			i: INTEGER
		do
			create {FAST_ARRAY[STRING]}last_debug_keys.with_capacity(v.list_count)
			from
				i := v.list_lower
			until
				i > v.list_upper
			loop
				last_debug_keys.add_last(decoded_string(v.list_item(i)))
				i := i + 1
			end
		end

feature {LIBERTY_AST_OLD_CREATION}
	visit_liberty_ast_old_creation (v: LIBERTY_AST_OLD_CREATION) is
		do
			visit_liberty_ast_creation(v)
		end

feature {LIBERTY_AST_CREATION}
	visit_liberty_ast_creation (v: LIBERTY_AST_CREATION) is
		local
			i: INTEGER; target_type: LIBERTY_TYPE
		do
			v.writable.accept(Current)
			if v.has_type_definition then
				v.type_definition.accept(Current)
				target_type := last_type
			end
			
		end

feature {LIBERTY_AST_RETRY}
	visit_liberty_ast_retry (v: LIBERTY_AST_RETRY) is
		do
			create {LIBERTY_RETRY}last_instruction.make
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
	last_instruction: LIBERTY_INSTRUCTION
	last_alias: STRING
	last_feature_definition: LIBERTY_FEATURE_DEFINITION
	last_feature_routine: LIBERTY_FEATURE_ROUTINE
	last_feature_block: LIBERTY_FEATURE_BLOCK
	universe: LIBERTY_UNIVERSE
	last_condition: LIBERTY_CONDITION
	last_default: LIBERTY_DEFAULT
	last_inspect: LIBERTY_INSPECT
	last_inspect_clause: LIBERTY_INSPECT_CLAUSE
	last_from_instructions: TRAVERSABLE[LIBERTY_INSTRUCTION]
	last_invariant: LIBERTY_INVARIANT
	last_variant: LIBERTY_VARIANT
	last_debug_keys: COLLECTION[STRING]
	last_entity_reference: LIBERTY_ENTITY_REFERENCE

invariant
	last_declaration_names /= Void
	last_feature_block /= Void implies last_feature_block = last_feature_definition
	last_feature_routine /= Void implies last_feature_routine = last_feature_definition

end
