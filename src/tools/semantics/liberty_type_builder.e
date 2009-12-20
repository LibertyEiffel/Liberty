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
class LIBERTY_TYPE_BUILDER
	--
	-- OK, this class is ugly and should be refactored.
	-- But let's make it bootstrap first.
	--

insert
	LIBERTY_AST_HANDLER
	LIBERTY_ERROR_LEVELS

create {LIBERTY_TYPE}
	make

feature {LIBERTY_TYPE}
	check_and_initialize is
		require
			not errors.has_error
		local
			ast: LIBERTY_AST_CLASS
			parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]
		do
			ast := type.ast
			init_header(ast.class_header)
			if not errors.has_error then
				if ast.obsolete_clause.count > 0 then
					errors.add_position(semantics_position_at(ast.obsolete_clause))
					errors.set(level_warning, decoded_string(ast.obsolete_clause.string))
				end
				if not is_any then
					create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} parent_features.make
					add_parents(ast.inherit_clause, True, parent_features)
					add_parents(ast.insert_clause, False, parent_features)
				end
				if not errors.has_error then
					add_features(ast.features)
					if not errors.has_error then
						add_creations(ast.creations)
						if not errors.has_error then
							type.set_invariant(class_invariant(ast.invariant_clause))
							if not errors.has_error then
								reconcile_and_check
							end
						end
					end
				end
			end
		end

feature {}
	reconcile_and_check is
		do
			--| TODO:
			--| * attach feature_entities to actual features
			--|     - all the feature entities must be attached to a known feature
			--|     - check that all the writable features are attributes
			--|     - check that all FEATURE_CALL_INSTRUCTIONs point to resultless feature entities
			--|     - check that all FEATURE_CALL_EXPRESSIONs point to feature entities with a conforming
			--|       result_type
			--| * check the result types of expressions
			--|     - if expressions must be booleans
			--|     - inspect expressions must be comparables
			--|     - contract expressions must be booleans
			--| * "retry" only in rescue blocks
			--| * "old" only in postconditions
			--| * what else?
		end

feature {}
	empty_effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING] is
		once
			-- Special common case (no effective parameters) factored out, using the smallest possible structure
			-- (an empty AVL tree)
			create {AVL_DICTIONARY[LIBERTY_TYPE, FIXED_STRING]} Result.make
		end

	init_header (a_header: LIBERTY_AST_CLASS_HEADER) is
		local
			marker: LIBERTY_AST_CLASS_MARKER
			name: FIXED_STRING
			type_parameters: LIBERTY_AST_TYPE_PARAMETERS
			type_parameter: LIBERTY_AST_TYPE_PARAMETER
			constraint: LIBERTY_TYPE
			i, n: INTEGER
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
			name := a_header.class_name.image.image.intern
			if name /= type.name then
				errors.set(level_fatal_error, "Expected type " + type.name + ", but got " + name)
			end
			type_parameters := a_header.type_parameters
			n := type_parameters.list_count
			if n /= type.parameters.count then
				errors.add_position(semantics_position_at(a_header.class_name))
				errors.set(level_error, once "Bad number of generic parameters")
			elseif n = 0 then
				effective_generic_parameters := empty_effective_generic_parameters
			else
				check
					same_indexes: type_parameters.list_lower = type.parameters.lower
				end
				create {HASHED_DICTIONARY[LIBERTY_TYPE, FIXED_STRING]}effective_generic_parameters.with_capacity(n)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						constraint := universe.get_type_from_type_definition(type, type_parameter.constraint, effective_generic_parameters, False)
						if not type.parameters.item(i).type.is_child_of(constraint) then
							errors.add_position(semantics_position_at(type_parameter.class_name))
							errors.set(level_error, once "Bad effective parameter: does not inherit or insert the constraint " + constraint.name)
						end
					end
					effective_generic_parameters.add(type.parameters.item(i).type, type_parameter.class_name.image.image.intern)
					i := i + 1
				end
			end
		end

	is_any: BOOLEAN is
		do
			Result := type.name = any_type_name
		end

	any_type_name: FIXED_STRING is
		once
			Result := "ANY".intern
		end

	add_parents (parents: LIBERTY_AST_LIST[LIBERTY_AST_PARENT]; conformant: BOOLEAN; parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]) is
		local
			i: INTEGER; parent_clause: LIBERTY_AST_PARENT
			parent: LIBERTY_TYPE
			has_parent: BOOLEAN
		do
			from
				has_parent := False
				i := parents.list_lower
			until
				errors.has_error or else i > parents.list_upper
			loop
				parent_clause := parents.list_item(i)
				parent := universe.get_type_from_type_definition(type, parent_clause.type_definition, effective_generic_parameters, True)
				if parent /= Void then
					type.add_parent(parent, conformant)
					inject_parent_invariant(parent)
					inject_parent_features(parent, parent_clause.parent_clause, conformant, parent_features)
					has_parent := True
				end
				i := i + 1
			end
			if not has_parent and then not errors.has_error then
				parent := universe.type_any
				type.add_parent(parent, False)
				inject_parent_invariant(parent)
				inject_parent_features(parent, Void, False, parent_features)
			end
			push_parent_features_in_type(parent_features)
		end

	inject_parent_invariant (parent: LIBERTY_TYPE) is
		do
			--|*** TODO
		end

	inject_parent_features (parent: LIBERTY_TYPE; clause: LIBERTY_AST_PARENT_CLAUSE; conformant: BOOLEAN; parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]) is
		local
			i: INTEGER; fd, parent_fd, actual_fd: LIBERTY_FEATURE_DEFINITION; name: LIBERTY_FEATURE_NAME
			pf: like parent_features
		do
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} pf.with_capacity(parent.features.count)
			from
				i := parent.features.lower
			until
				i > parent.features.upper
			loop
				name := parent.features.key(i)
				parent_fd := parent.features.item(i)
				create fd.make(name, parent_fd.clients, parent_fd.is_frozen)
				fd.add_precursor(parent_fd.the_feature, parent)
				pf.add(fd, name)
				i := i + 1
			end
			rename_features(pf, clause.rename_clause)
			export_features(pf, clause.export_clause)
			undefine_features(pf, clause.undefine_clause, conformant)
			redefine_features(pf, clause.redefine_clause, conformant)
			from
				i := pf.lower
			until
				i > pf.upper
			loop
				name := pf.key(i)
				fd := pf.item(i)
				actual_fd := parent_features.reference_at(name)
				if actual_fd = Void then
					parent_features.add(fd, name)
				else
					actual_fd.join(fd, parent)
				end
				i := i + 1
			end
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
				create old_name.make_from_ast(r.old_name.feature_name_or_alias, type.ast, type.file)
				create new_name.make_from_ast(r.new_name.feature_name_or_alias, type.ast, type.file)
				fd := parent_features.reference_at(old_name)
				if fd = Void then
					errors.add_position(old_name.position)
					errors.set(level_error, once "Cannot rename inexistent feature: " + old_name.name)
				elseif parent_features.reference_at(new_name) /= Void then
					errors.add_position(new_name.position)
					errors.set(level_error, once "Cannot rename feature (another feature with the same name exists): " + new_name.name)
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
					create feature_name.make_from_ast(fn.feature_name_or_alias, type.ast, type.file)
					fd := parent_features.reference_at(feature_name)
					if fd = Void then
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Cannot change export of inexistent feature: " + feature_name.name)
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
				create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
				fd := parent_features.reference_at(feature_name)
				if fd = Void then
					errors.add_position(feature_name.position)
					errors.set(level_error, once "Cannot undefine inexistent feature: " + feature_name.name)
				elseif fd.is_frozen then
					errors.add_position(feature_name.position)
					errors.set(level_error, once "Cannot undefine frozen feature: " + feature_name.name)
				else
					inherited_feature := fd.the_feature
					create deferred_feature.make
					deferred_feature.set_precondition(inherited_feature.precondition)
					deferred_feature.set_postcondition(inherited_feature.postcondition)
					deferred_feature.set_context(inherited_feature.context)
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
			if clause.list_count > 0 then
				create {HASHED_DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]}redefined_features.with_capacity(clause.list_count)
				from
					i := clause.list_lower
				invariant
					parent_features.item(i).feature_name.is_equal(parent_features.key(i))
				until
					i > clause.list_upper
				loop
					create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
					fd := parent_features.reference_at(feature_name)
					if fd = Void then
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Cannot redefine inexistent feature: " + feature_name.name)
					elseif fd.is_frozen then
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Cannot redefine frozen feature: " + feature_name.name)
					else
						inherited_feature := fd.the_feature
						create redefined_feature.make
						redefined_feature.set_precondition(inherited_feature.precondition)
						redefined_feature.set_postcondition(inherited_feature.postcondition)
						redefined_feature.set_context(inherited_feature.context)
						if conformant then
							inherited_feature.bind(redefined_feature, type)
						end
						fd.set_the_feature(redefined_feature)
						redefined_features.add(redefined_feature, feature_name)
					end
					i := i + 1
				end
			end
		end

	push_parent_features_in_type (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]) is
		local
			i: INTEGER
			fn: LIBERTY_FEATURE_NAME
			f: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := parent_features.lower
			invariant
				parent_features.item(i).feature_name.is_equal(parent_features.key(i))
			until
				i >  parent_features.upper
			loop
				f := parent_features.item(i)
				fn := f.feature_name
				if not type.has_feature(fn) then
					type.add_feature(f)
				else
					check
						type.features.reference_at(fn) = f
					end
				end
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
					errors.has_error or else j > f.definition_list.upper
				loop
					fd ::= f.definition_list.item(j)
					add_feature(clients, fd)
					j := j + 1
				end
				i := i + 1
			end
			if not errors.has_error then
				check_that_all_redefined_features_were_redefined
			end
		end

	add_feature (clients: COLLECTION[LIBERTY_TYPE]; a_feature: LIBERTY_AST_FEATURE_DEFINITION) is
		local
			result_type: LIBERTY_TYPE
			the_feature: LIBERTY_FEATURE
			local_context: LIBERTY_FEATURE_LOCAL_CONTEXT
			redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]
			fn: LIBERTY_AST_FEATURE_NAME
		do
			redefinitions := feature_redefinitions(a_feature.signature.feature_names)
			if a_feature.signature.has_result_type then
				result_type := universe.get_type_from_type_definition(type, a_feature.signature.result_type, effective_generic_parameters, False)
			end
			if a_feature.has_routine_definition then
				create local_context.make(result_type)
				if a_feature.signature.has_parameters then
					list_parameters(a_feature.signature.parameters, local_context, redefinitions)
				end
				the_feature := routine_definition(a_feature.routine_definition, local_context, redefinitions)
			else
				if a_feature.signature.has_parameters then
					errors.add_position(semantics_position_at(a_feature.signature.node_at(1)))
					errors.set(level_error, once "Unexpected parameters")
				elseif not a_feature.signature.has_result_type then
					fn ::= a_feature.signature.feature_names.last
					errors.add_position(semantics_position_after(fn.feature_name_or_alias.node_at(fn.feature_name_or_alias.upper)))
					errors.set(level_error, once "Missing entity type")
				else
					if a_feature.is_constant then
						the_feature := feature_constant(a_feature.constant, local_context, redefinitions)
					else
						check a_feature.is_unique end
						create {LIBERTY_FEATURE_UNIQUE}the_feature.make
					end
				end
			end
			if not errors.has_error then
				the_feature.set_context(local_context)
				add_feature_definition(the_feature, a_feature.signature.feature_names, clients)
			end
		end

	routine_definition (routine_def: LIBERTY_AST_ROUTINE_DEFINITION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_FEATURE is
		require
			local_context /= Void
		local
			obsolete_message: STRING
			routine_execution: LIBERTY_AST_ROUTINE_EXECUTION
			do_block: LIBERTY_AST_DO_BLOCK; routine: LIBERTY_FEATURE_ROUTINE
			comp: LIBERTY_INSTRUCTION
		do
			if routine_def.obsolete_clause.count > 0 then
				obsolete_message := decoded_string(routine_def.obsolete_clause.string)
			end
			routine_execution := routine_def.execution
			if routine_execution.is_external then
				if routine_execution.external_clause.alias_clause.has_alias then
					create {LIBERTY_FEATURE_EXTERNAL} Result.make(decoded_string(routine_execution.external_clause.definition), decoded_string(routine_execution.external_clause.alias_clause.definition))
				else
					create {LIBERTY_FEATURE_EXTERNAL} Result.make(decoded_string(routine_execution.external_clause.definition), Void)
				end
			else
				check routine_execution.is_regular end
				do_block := routine_execution.do_block
				if do_block.is_deferred then
					create {LIBERTY_FEATURE_DEFERRED} Result.make
				elseif do_block.is_attribute then
					create {LIBERTY_FEATURE_ATTRIBUTE} Result.make
				else
					list_locals(routine_execution.local_block, local_context, redefinitions)
					comp := compound(routine_execution.do_block.list, local_context, redefinitions)
					if not errors.has_error then
						if do_block.is_do then
							create {LIBERTY_FEATURE_DO} routine.make(comp)
						else
							check do_block.is_once end
							create {LIBERTY_FEATURE_ONCE} routine.make(comp)
						end
						if not routine_execution.rescue_block.is_empty then
							routine.set_rescue(compound(routine_execution.rescue_block.list, local_context, redefinitions))
						end
						Result := routine
					end
				end
			end
			if not errors.has_error then
				Result.set_precondition(feature_precondition(routine_def.require_clause, local_context, redefinitions))
				Result.set_postcondition(feature_postcondition(routine_def.ensure_clause, local_context, redefinitions))
				if not errors.has_error then
					local_context.reconcile_retry_instructions(Result)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_precondition (precondition: LIBERTY_AST_REQUIRE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_REQUIRE is
		require
			precondition /= Void
			local_context /= Void
		local
			assertions: TRAVERSABLE[LIBERTY_ASSERTION]
		do
			assertions := feature_assertions(precondition, local_context, redefinitions)
			if not errors.has_error then
				if precondition.count = 0 then
					create Result.make(assertions)
				elseif precondition.require_else.is_require_else then
					create {LIBERTY_REQUIRE_ELSE}Result.make(assertions)
				elseif precondition.require_else.is_require_then then
					create {LIBERTY_REQUIRE_THEN}Result.make(assertions)
				else
					create Result.make(assertions)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_postcondition (postcondition: LIBERTY_AST_ENSURE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_ENSURE is
		require
			postcondition /= Void
			local_context /= Void
		local
			assertions: TRAVERSABLE[LIBERTY_ASSERTION]
		do
			assertions := feature_assertions(postcondition, local_context, redefinitions)
			if not errors.has_error then
				if postcondition.count = 0 then
					create Result.make(assertions)
				elseif postcondition.ensure_then.is_ensure_then then
					create {LIBERTY_ENSURE_THEN}Result.make(assertions)
				else
					create Result.make(assertions)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	empty_feature_assertions: COLLECTION[LIBERTY_ASSERTION] is
		once
			create {FAST_ARRAY[LIBERTY_ASSERTION]} Result.with_capacity(0)
		end

	feature_assertions (assertions: LIBERTY_AST_LIST[LIBERTY_AST_ASSERTION]; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): COLLECTION[LIBERTY_ASSERTION] is
		require
			assertions /= Void
			local_context /= Void
		local
			i: INTEGER; assertion: LIBERTY_AST_ASSERTION
			tag: FIXED_STRING; exp: LIBERTY_EXPRESSION
		do
			if assertions.list_count = 0 then
				Result := empty_feature_assertions
			else
				create {FAST_ARRAY[LIBERTY_ASSERTION]} Result.with_capacity(assertions.list_count)
				from
					i := assertions.list_lower
				until
					errors.has_error or else i > assertions.list_upper
				loop
					assertion := assertions.list_item(i)
					if assertion.tag.has_tag then
						tag := assertion.tag.tag.image.image.intern
					else
						tag := Void
					end
					exp := expression(assertion.expression, local_context, redefinitions)
					if exp.result_type /= universe.type_boolean then
						--| TODO: error
						not_yet_implemented
					else
						Result.add_last(create {LIBERTY_ASSERTION}.make(tag, exp))
					end
					i := i + 1
				end
			end
		end

	feature_constant (constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_FEATURE_CONSTANT is
		require
			local_context.result_type /= Void
		local
			tm: like typed_manifest_or_type_test
		do
			if constant.is_assignment_test then
				errors.add_position(semantics_position_at(constant.node_at(0)))
				errors.set(level_error, once "Unexpected assignment test")
			elseif constant.is_typed_open_argument then
				errors.add_position(semantics_position_at(constant.node_at(0)))
				errors.set(level_error, once "Unexpected open argument")
			else
				tm := typed_manifest_or_type_test(constant, local_context, redefinitions)
				if not errors.has_error then
					if tm.result_type.type.is_conform_to(local_context.result_type.type) then
						create Result.make(tm)
					else
						errors.add_position(semantics_position_at(constant.node_at(0)))
						errors.set(level_error, once "That expression does not conform to " + local_context.result_type.type.name)
					end
				end
			end
		end

	feature_redefinitions (names: EIFFEL_LIST_NODE): COLLECTION[LIBERTY_FEATURE_DEFINITION] is
		local
			i: INTEGER; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				create {FAST_ARRAY[LIBERTY_FEATURE_DEFINITION]} Result.with_capacity(1) -- usual case
				i := names.lower
			until
				Result /= Void or else i > names.upper
			loop
				name ::= names.item(i)
				create feature_name.make_from_ast(name.feature_name_or_alias, type.ast, type.file)
				if type.has_feature(feature_name) then
					fd := type.feature_definition(feature_name)
					if not Result.fast_has(fd) then
						Result.add_last(fd)
					end
				end
				i := i + 1
			end
		end

	add_feature_definition (a_feature: LIBERTY_FEATURE; names: EIFFEL_LIST_NODE; clients: COLLECTION[LIBERTY_TYPE]) is
		local
			i: INTEGER; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME
			fd: LIBERTY_FEATURE_DEFINITION
			name_or_alias: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
			redefined: LIBERTY_FEATURE_REDEFINED
		do
			from
				i := names.lower
			until
				i > names.upper
			loop
				name ::= names.item(i)
				create feature_name.make_from_ast(name.feature_name_or_alias, type.ast, type.file)
				if type.has_feature(feature_name) then
					if redefined_features = Void then
						redefined := Void
					else
						redefined := redefined_features.reference_at(feature_name)
					end
					if redefined = Void then
						-- Nothing, not a redefined feature
					elseif redefined.redefined_feature = Void then
						if parameters_match(a_feature.parameters, redefined.parameters, name, feature_name) then
							if a_feature.result_type.type.is_conform_to(redefined.result_type.type) then
								redefined.set_redefined_feature(a_feature)
							else
								name_or_alias := name.feature_name_or_alias
								errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
								errors.set(level_error, once "Cannot redefine feature (result types don't conform): " + feature_name.name)
							end
						else
							-- an error was emitted by `parameters_match'
							check errors.has_error end
						end
					else
						name_or_alias := name.feature_name_or_alias
						errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
						errors.set(level_error, once "Duplicate feature: " + feature_name.name)
					end
				else
					create fd.make(feature_name, clients, name.is_frozen)
					type.add_feature(fd)
				end
				i := i + 1
			end
		end

	parameters_match (child_parameters, parent_parameters: TRAVERSABLE[LIBERTY_PARAMETER]; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME): BOOLEAN is
		local
			name_or_alias: LIBERTY_AST_FEATURE_NAME_OR_ALIAS
			i: INTEGER
		do
			if child_parameters = Void then
				Result := parent_parameters = Void
				name_or_alias := name.feature_name_or_alias
				errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
				errors.set(level_error, once "Cannot redefine feature (not enough parameters): " + feature_name.name)
			elseif parent_parameters /= Void then
				if child_parameters.count < parent_parameters.count then
					name_or_alias := name.feature_name_or_alias
					errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
					errors.set(level_error, once "Cannot redefine feature (not enough parameters): " + feature_name.name)
				elseif child_parameters.count > parent_parameters.count then
					name_or_alias := name.feature_name_or_alias
					errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
					errors.set(level_error, once "Cannot redefine feature (too many parameters): " + feature_name.name)
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
						Result := child_parameters.item(i).result_type.type.is_conform_to(parent_parameters.item(i).result_type.type)
						i := i + 1
					end
					if not Result then
						name_or_alias := name.feature_name_or_alias
						errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
						errors.set(level_error, once "Cannot redefine feature (parameter types don't conform): " + feature_name.name)
					end
				end
			end
		ensure
			not Result implies errors.has_error
		end

	check_that_all_redefined_features_were_redefined is
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME
		do
			if redefined_features /= Void then
				from
					i := redefined_features.lower
				until
					i > redefined_features.upper
				loop
					if redefined_features.item(i).redefined_feature = Void then
						feature_name := redefined_features.key(i)
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Missing redefinition for " + feature_name.name)
					end
					i := i + 1
				end
			end
		end

feature {}
	add_creations (creations: EIFFEL_LIST_NODE) is
		do
			not_yet_implemented
		end

feature {}
	class_invariant (invariant_clause: LIBERTY_AST_INVARIANT): LIBERTY_INVARIANT is
		do
			not_yet_implemented
		end

feature {} -- Instructions
	empty_instruction: LIBERTY_EMPTY is
		once
			create Result.make
		end

	compound (insts: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSTRUCTION is
		require
			insts /= Void
			local_context /= Void
		local
			i, n: INTEGER; inst: LIBERTY_AST_INSTRUCTION
			instructions: COLLECTION[LIBERTY_INSTRUCTION]
		do
			n := insts.count
			inspect
				n
			when 0 then
				Result := empty_instruction
			when 1 then
				inst ::= insts.first
				Result := instruction(inst, local_context, redefinitions)
			else
				create {FAST_ARRAY[LIBERTY_INSTRUCTION]} instructions.with_capacity(n)
				from
					i := insts.lower
				until
					i > insts.upper
				loop
					inst ::= insts.item(i)
					instructions.add_last(instruction(inst, local_context, redefinitions))
					i := i + 1
				end
				create {LIBERTY_COMPOUND} Result.make(instructions, instructions.first.position)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	instruction (inst: LIBERTY_AST_INSTRUCTION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSTRUCTION is
		require
			inst /= Void
			local_context /= Void
		local
			assignment_or_call: LIBERTY_AST_ASSIGNMENT_OR_CALL
		do
			inspect
				inst.instruction.name
			when "Assignment_Or_Call" then
				assignment_or_call ::= inst.instruction
				if assignment_or_call.is_assignment then
					Result := instruction_assignment(assignment_or_call, local_context, redefinitions)
				else
					Result := instruction_call(assignment_or_call, local_context, redefinitions)
				end
			when "If_Then_Else" then
				Result := instruction_ifthenelse(inst.instruction, local_context, redefinitions)
			when "Inspect" then
				Result := instruction_inspect(inst.instruction, local_context, redefinitions)
			when "Loop" then
				Result := instruction_loop(inst.instruction, local_context, redefinitions)
			when "Check" then
				Result := instruction_check(inst.instruction, local_context, redefinitions)
			when "Debug" then
				Result := instruction_debug(inst.instruction, local_context, redefinitions)
			when "Creation", "Old_Creation" then
				Result := instruction_creation(inst.instruction, local_context, redefinitions)
			when "Retry" then
				Result := instruction_retry(inst.instruction, local_context, redefinitions)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	instruction_assignment (a_assignment: LIBERTY_AST_ASSIGNMENT_OR_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_ASSIGNMENT is
		require
			a_assignment.is_assignment
		local
			w: LIBERTY_WRITABLE
			exp: LIBERTY_EXPRESSION
		do
			w := writable(a_assignment.writable, local_context, redefinitions)
			exp := expression(a_assignment.expression, local_context, redefinitions)
			if a_assignment.is_regular_assignment then
				create {LIBERTY_ASSIGNMENT_REGULAR} Result.make(w, exp, w.position)
			elseif a_assignment.is_forced_assignment then
				create {LIBERTY_ASSIGNMENT_FORCED} Result.make(w, exp, w.position)
			elseif a_assignment.is_assignment_attempt then
				create {LIBERTY_ASSIGNMENT_ATTEMPT} Result.make(w, exp, w.position)
			else
				check False end
			end
		end

	instruction_call (a_call: LIBERTY_AST_ASSIGNMENT_OR_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSTRUCTION is
		require
			a_call.is_call
		local
			tgt: LIBERTY_EXPRESSION
			fe: LIBERTY_FEATURE_ENTITY
			fa: TRAVERSABLE[LIBERTY_EXPRESSION]
			r10: LIBERTY_AST_R10
		do
			r10 := a_call.r10
			if r10.is_empty then
				Result := implicit_feature_call_instruction(a_call.target, local_context, redefinitions)
			else
				from
					tgt := target_or_implicit_feature_call_expression(a_call.target, local_context, redefinitions)
				until
					errors.has_error or else Result /= Void
				loop
					fe ::= entity(r10.feature_name, local_context, redefinitions)
					fa := actuals(r10.actuals, local_context, redefinitions)
					r10 := r10.remainder
					if r10.is_empty then
						create {LIBERTY_CALL_INSTRUCTION} Result.make(tgt, fe, fa, tgt.position)
					else
						create {LIBERTY_CALL_EXPRESSION} tgt.make(tgt, fe, fa, tgt.position)
					end
				end
			end
			check
				errors.has_error or else r10.is_empty
			end
		end

	instruction_ifthenelse (a_cond: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_CONDITIONAL is
		require
			a_cond /= Void
			{LIBERTY_AST_IF_THEN_ELSE} ?:= a_cond
		local
			ifthenelse: LIBERTY_AST_IF_THEN_ELSE
			ifthen: LIBERTY_AST_IF
			conditional: LIBERTY_CONDITIONAL
			i: INTEGER
		do
			ifthenelse ::= a_cond
			create conditional.make(semantics_position_at(ifthenelse.then_clause.node_at(0)))
			conditional.add_condition(condition(ifthenelse.then_clause, local_context, redefinitions))
			from
				i := ifthenelse.elseif_list.lower
			until
				i > ifthenelse.elseif_list.upper
			loop
				ifthen ::= ifthenelse.elseif_list.item(i)
				conditional.add_condition(condition(ifthen, local_context, redefinitions))
				i := i + 1
			end
			conditional.set_else_clause(else_clause(ifthenelse.else_clause, local_context, redefinitions))
			Result := conditional
		end

	condition (a_if: LIBERTY_AST_IF; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_CONDITION is
		do
			create Result.make(expression(a_if.expression, local_context, redefinitions), compound(a_if.instructions, local_context, redefinitions),
									 semantics_position_at(a_if.node_at(0)))
		end

	else_clause (a_else: LIBERTY_AST_ELSE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_DEFAULT is
		do
			create Result.make(compound(a_else.list, local_context, redefinitions),
									 semantics_position_at(a_else.node_at(0)))
		end

	instruction_inspect (a_inspect: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSPECT is
		require
			a_inspect /= Void
			{LIBERTY_AST_INSPECT} ?:= a_inspect
		local
			inspct: LIBERTY_AST_INSPECT
			insp: LIBERTY_INSPECT
			i: INTEGER
		do
			inspct ::= a_inspect
			create insp.make(expression(inspct.expression, local_context, redefinitions), semantics_position_at(inspct.node_at(0)))
			from
				i := inspct.when_list.lower
			until
				i > inspct.when_list.upper
			loop
				insp.add_clause(inspect_clause(inspct.when_list.item(i), local_context, redefinitions))
				i := i + 1
			end
			insp.set_else_clause(else_clause(inspct.else_clause, local_context, redefinitions))
			Result := insp
		end

	inspect_clause (a_clause: EIFFEL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSPECT_CLAUSE is
		require
			{LIBERTY_AST_WHEN} ?:= a_clause
		local
			when_clause: LIBERTY_AST_WHEN
			when_slice: LIBERTY_AST_WHEN_SLICE
			i: INTEGER
			low, up: LIBERTY_EXPRESSION
		do
			when_clause ::= a_clause
			create Result.make(compound(when_clause.instructions, local_context, redefinitions), semantics_position_at(when_clause.node_at(0)))
			from
				i := when_clause.when_slices.lower
			until
				i > when_clause.when_slices.upper
			loop
				when_slice ::= when_clause.when_slices.item(i)
				low := when_value(when_slice.low_value, local_context, redefinitions)
				if when_slice.has_up_value then
					up := when_value(when_slice.up_value, local_context, redefinitions)
				else
					up := Void
				end
				Result.add_value(create {LIBERTY_INSPECT_SLICE}.make(low, up, low.position))
				i := i + 1
			end
		end

	when_value (value: LIBERTY_AST_WHEN_VALUE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			if value.is_number then
				Result := number(value.number.image)
			elseif value.is_character then
				Result := character(value.character.image)
			elseif value.is_string then
				create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, decoded_string(value.string), True, semantics_position_at(value.node_at(0)))
			elseif value.is_entity_name then
				not_yet_implemented
			else
				check False end
			end
		ensure
			Result /= Void
		end

	instruction_loop (a_loop: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_LOOP is
		require
			a_loop /= Void
			{LIBERTY_AST_LOOP} ?:= a_loop
		local
			l00p: LIBERTY_AST_LOOP
			init, body: like compound
			exp, variant_clause: LIBERTY_EXPRESSION
			invariant_clause: LIBERTY_INVARIANT
		do
			l00p ::= a_loop
			init := compound(l00p.from_clause.instructions, local_context, redefinitions)
			invariant_clause := loop_invariant(l00p.invariant_clause, local_context, redefinitions)
			if l00p.variant_clause.has_expression then
				variant_clause := expression(l00p.variant_clause.expression, local_context, redefinitions)
			end
			exp := expression(l00p.expression, local_context, redefinitions)
			body := compound(l00p.instructions, local_context, redefinitions)
			create Result.make(init, invariant_clause, variant_clause, exp, body, init.position)
		end

	loop_invariant (invariant_clause: LIBERTY_AST_INVARIANT; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INVARIANT is
		require
			invariant_clause /= Void
			local_context /= Void
		local
			assertions: TRAVERSABLE[LIBERTY_ASSERTION]
		do
			assertions := feature_assertions(invariant_clause, local_context, redefinitions)
			if not errors.has_error then
				create Result.make(assertions)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	instruction_check (a_check: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_CHECK_INSTRUCTION is
		require
			a_check /= Void
			{LIBERTY_AST_CHECK} ?:= a_check
		local
			chk: LIBERTY_AST_CHECK; ck: LIBERTY_CHECK
		do
			chk ::= a_check
			create ck.make(feature_assertions(chk, local_context, redefinitions))
			create Result.make(ck, semantics_position_at(chk.node_at(0)))
		end

	instruction_debug (a_debug: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_DEBUG is
		require
			a_debug /= Void
			{LIBERTY_AST_DEBUG} ?:= a_debug
		local
			dbg: LIBERTY_AST_DEBUG
			keys: FAST_ARRAY[STRING]; inst: like compound
			i: INTEGER
		do
			dbg ::= a_debug
			if dbg.debug_keys.list_count > 0 then
				create keys.with_capacity(dbg.debug_keys.list_count)
				from
					i := dbg.debug_keys.list_lower
				until
					i > dbg.debug_keys.list_upper
				loop
					keys.add_last(decoded_string(dbg.debug_keys.list_item(i)))
					i := i + 1
				end
			end
			inst := compound(dbg.instructions, local_context, redefinitions)
			create Result.make(keys, inst, semantics_position_at(dbg.node_at(0)))
		ensure
			Result /= Void
		end

	instruction_creation (a_creation: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_CREATION_INSTRUCTION is
		require
			a_creation /= Void
			{LIBERTY_AST_CREATION} ?:= a_creation
		local
			creat: LIBERTY_AST_CREATION
			w: LIBERTY_WRITABLE
			creation_type: LIBERTY_ENTITY_TYPE
			fe: LIBERTY_FEATURE_ENTITY
			fa: TRAVERSABLE[LIBERTY_EXPRESSION]
		do
			creat ::= a_creation
			w := writable(creat.writable, local_context, redefinitions)
			if creat.has_type_definition then
				creation_type := universe.get_type_from_type_definition(type, creat.type_definition, effective_generic_parameters, False)
				if not errors.has_error then
					if not creation_type.type.is_conform_to(w.result_type.type) then
						--|*** TODO: the given creation_type must be a conformant subtype of the writable type
						not_yet_implemented
					end
				end
			else
				creation_type := w.result_type
			end
			if creat.has_creation_feature_call then
				fe := feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(creat.creation_feature_name.image.image.intern))
				fa := actuals(creat.creation_feature_actuals, local_context, redefinitions)
			else
				fe := feature_entity(default_create_name)
				fa := empty_actuals
			end
			create Result.make(w, creation_type, fe, fa, semantics_position_at(creat.node_at(0)))
		end

	default_create_name: LIBERTY_FEATURE_NAME is
		once
			create Result.make_regular("default_create".intern)
		end

	instruction_retry (a_retry: LIBERTY_AST_NON_TERMINAL_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_RETRY is
		require
			a_retry /= Void
			{LIBERTY_AST_RETRY} ?:= a_retry
		local
			re: LIBERTY_AST_RETRY
		do
			re ::= a_retry
			Result := local_context.retry_instruction(semantics_position_at(re.node_at(0)))
		end

feature {} -- Entities and writables
	writable (a_writable: LIBERTY_AST_WRITABLE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_WRITABLE is
		local
			name: FIXED_STRING
		do
			if a_writable.is_result then
				Result := local_context.result_entity
			else
				name := a_writable.entity_name.image.image.intern
				if local_context.is_local(name) then
					Result := local_context.local_var(name)
				elseif local_context.is_parameter(name) then
					--|*** TODO: error! (not writable)
					not_yet_implemented
				else
					Result := feature_writable(name)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	entity (a_entity: LIBERTY_AST_ENTITY_NAME; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_ENTITY is
		local
			name: FIXED_STRING
		do
			name := a_entity.image.image.intern
			if name.is_equal(once "Current") then
				Result := current_entity
			elseif name.is_equal(once "Result") then
				Result := local_context.result_entity
			elseif local_context.is_local(name) then
				Result := local_context.local_var(name)
			elseif local_context.is_parameter(name) then
				Result := local_context.parameter(name)
			else
				Result := feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(name))
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	implicit_feature_call_instruction (a_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_INSTRUCTION is
		local
			e: LIBERTY_FEATURE_ENTITY; fn: LIBERTY_AST_FEATURE_NAME_OR_ALIAS; name: FIXED_STRING
			f: LIBERTY_FEATURE; precursor_type: LIBERTY_TYPE
		do
			if a_target.is_current then
				--| TODO: error
				not_yet_implemented
			elseif a_target.is_result then
				--| TODO: error
				not_yet_implemented
			elseif a_target.is_implicit_feature_call then
				fn := a_target.implicit_feature_name.feature_name_or_alias
				if fn.is_regular then
					-- may be a local or a parameter of a regular feature name
					name := fn.entity_name.image.image.intern
					if local_context.is_local(name) then
						--| TODO: error
						not_yet_implemented
					elseif local_context.is_parameter(name) then
						--| TODO: error
						not_yet_implemented
					else
						e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(name))
						create {LIBERTY_CALL_INSTRUCTION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
					end
				elseif fn.is_prefix then
					e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_prefix(decoded_string(fn.free_operator_name).intern))
					create {LIBERTY_CALL_INSTRUCTION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
				elseif fn.is_infix then
					e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_infix(decoded_string(fn.free_operator_name).intern))
					create {LIBERTY_CALL_INSTRUCTION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
				else
					check False end
				end
			elseif a_target.is_precursor then
				if a_target.precursor_type_mark.count /= 0 then
					precursor_type := universe.get_type_from_precursor(type, a_target.precursor_type_mark, effective_generic_parameters)
				end
				f := find_precursor(redefinitions, precursor_type)
				create {LIBERTY_PRECURSOR_INSTRUCTION} Result.make(f, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(a_target.node_at(0)))
			elseif a_target.is_parenthesized_expression then
				--| TODO: error
				not_yet_implemented
			else
				check False end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	find_precursor (redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]; parent: LIBERTY_TYPE): LIBERTY_FEATURE is
		local
			i: INTEGER; fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := redefinitions.lower
			until
				i > redefinitions.upper
			loop
				fd := redefinitions.item(i)
				if fd.has_precursor(parent) then
					Result := fd.precursor_feature(parent)
				end
				i := i + 1
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	target_or_implicit_feature_call_expression (a_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		local
			e: LIBERTY_FEATURE_ENTITY; fn: LIBERTY_AST_FEATURE_NAME_OR_ALIAS; name: FIXED_STRING
			f: LIBERTY_FEATURE; precursor_type: LIBERTY_TYPE
		do
			if a_target.is_current then
				create {LIBERTY_ENTITY_EXPRESSION} Result.make(current_entity, semantics_position_at(a_target.node_at(0)))
			elseif a_target.is_result then
				create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.result_entity, semantics_position_at(a_target.node_at(0)))
			elseif a_target.is_implicit_feature_call then
				fn := a_target.implicit_feature_name.feature_name_or_alias
				if fn.is_regular then
					-- may be a local or a parameter of a regular feature name
					name := fn.entity_name.image.image.intern
					if local_context.is_local(name) then
						create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.local_var(name), semantics_position_at(fn.node_at(0)))
						--| TODO: check no actuals
					elseif local_context.is_parameter(name) then
						create {LIBERTY_ENTITY_EXPRESSION} Result.make(local_context.parameter(name), semantics_position_at(fn.node_at(0)))
						--| TODO: check no actuals
					else
						e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(name))
						create {LIBERTY_CALL_EXPRESSION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
					end
				elseif fn.is_prefix then
					e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_prefix(decoded_string(fn.free_operator_name).intern))
					create {LIBERTY_CALL_EXPRESSION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
				elseif fn.is_infix then
					e := feature_entity(create {LIBERTY_FEATURE_NAME}.make_infix(decoded_string(fn.free_operator_name).intern))
					create {LIBERTY_CALL_EXPRESSION} Result.implicit_current(e, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(fn.node_at(0)))
				else
					check False end
				end
			elseif a_target.is_precursor then
				if a_target.precursor_type_mark.count /= 0 then
					precursor_type := universe.get_type_from_precursor(type, a_target.precursor_type_mark, effective_generic_parameters)
				end
				f := find_precursor(redefinitions, precursor_type)
				create {LIBERTY_PRECURSOR_EXPRESSION} Result.make(f, actuals(a_target.actuals, local_context, redefinitions), semantics_position_at(a_target.node_at(0)))
			elseif a_target.is_parenthesized_expression then
				Result := expression(a_target.parenthesized_expression, local_context, redefinitions)
			else
				check False end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_writable (name: FIXED_STRING): LIBERTY_WRITABLE_FEATURE is
		require
			name = name.intern
		do
			Result := feature_writables.reference_at(name)
			if Result = Void then
				create {LIBERTY_WRITABLE_FEATURE} Result.make(feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(name)))
				feature_writables.put(Result, name)
			end
		ensure
			Result.name = name
		end

	feature_entity (name: LIBERTY_FEATURE_NAME): LIBERTY_FEATURE_ENTITY is
		require
			name /= Void
		do
			Result := feature_entities.reference_at(name)
			if Result = Void then
				create {LIBERTY_FEATURE_ENTITY} Result.make(name)
				feature_entities.put(Result, name)
			end
		ensure
			Result.feature_name = name
		end

	current_entity: LIBERTY_CURRENT
	feature_entities: DICTIONARY[LIBERTY_FEATURE_ENTITY, LIBERTY_FEATURE_NAME]
	feature_writables: DICTIONARY[LIBERTY_WRITABLE_FEATURE, FIXED_STRING]

feature {} -- Expressions
	actuals (a_actuals: LIBERTY_AST_ACTUALS; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): COLLECTION[LIBERTY_EXPRESSION] is
		local
			i: INTEGER
			act: LIBERTY_AST_ACTUAL
		do
			if a_actuals.list_count= 0 then
				Result := empty_actuals
			else
				create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.with_capacity(a_actuals.list_count)
				from
					i := a_actuals.list_lower
				until
					i > a_actuals.list_upper
				loop
					act := a_actuals.list_item(i)
					if act.is_expression then
						Result.add_last(expression(act.expression, local_context, redefinitions))
					else
						check act.is_ref_to_entity end
						Result.add_last(create {LIBERTY_ENTITY_REFERENCE}.make(universe.type_pointer, entity(act.ref_entity_name, local_context, redefinitions), semantics_position_at(act.node_at(0))))
					end
					i := i + 1
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	empty_actuals: COLLECTION[LIBERTY_EXPRESSION] is
		once
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} Result.make(0)
		end

	expression (exp: LIBERTY_AST_EXPRESSION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			exp /= Void
			local_context /= Void
		do
			if exp.is_array then
				Result := expression_array(exp.array, local_context, redefinitions)
			else
				Result := expression_no_array(exp.no_array, local_context, redefinitions)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_array (array: LIBERTY_AST_ARRAY; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_ARRAY_MANIFEST is
		require
			array /= Void
			local_context /= Void
		local
			i: INTEGER; content: COLLECTION[LIBERTY_EXPRESSION]
			exp: LIBERTY_AST_EXPRESSION; t: LIBERTY_ENTITY_TYPE
		do
			create {FAST_ARRAY[LIBERTY_EXPRESSION]} content.with_capacity(array.content.count)
			from
				i := array.content.lower
			until
				i > array.content.upper or else errors.has_error
			loop
				exp ::= array.content.item(i)
				content.add_last(expression(exp, local_context, redefinitions))
				i := i + 1
			end
			if not errors.has_error then
				t := common_conformant_type(content)
				create Result.make_array(t, content, semantics_position_at(array.node_at(0)))
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	common_conformant_type (a_contents: TRAVERSABLE[LIBERTY_EXPRESSION]): LIBERTY_ENTITY_TYPE is
		local
			i: INTEGER
		do
			if a_contents.is_empty then
				Result := universe.type_any
			else
				from
					Result := a_contents.first.result_type
					i := a_contents.lower + 1
				until
					i > a_contents.upper
				loop
					Result := a_contents.item(i).result_type.type.common_conformant_parent_with(Result.type)
					if Result = Void then
						--| *** TODO fatal error
						not_yet_implemented
					end
					i := i + 1
				end
			end
		ensure
			no_common_parent_is_fatal: Result /= Void
		end

	expression_no_array (exp: LIBERTY_AST_EXPRESSION_NO_ARRAY; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			exp /= Void
			local_context /= Void
		do
			Result := expression_1(exp.e1, exp.r1, local_context, redefinitions)
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_1 (e1: LIBERTY_AST_E1; r1: LIBERTY_AST_R1; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_2(e1.e2, e1.r2, local_context, redefinitions)
			if r1.is_implies then
				create {LIBERTY_IMPLIES} Result.make(Result, expression_1(r1.expression, r1.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_2 (e2: LIBERTY_AST_E2; r2: LIBERTY_AST_R2; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_3(e2.e3, e2.r3, local_context, redefinitions)
			if r2.is_or_else then
				create {LIBERTY_OR_ELSE} Result.make(Result, expression_2(r2.expression, r2.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r2.is_or then
				create {LIBERTY_OR} Result.make(Result, expression_2(r2.expression, r2.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r2.is_xor then
				create {LIBERTY_XOR} Result.make(Result, expression_2(r2.expression, r2.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_3 (e3: LIBERTY_AST_E3; r3: LIBERTY_AST_R3; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_4(e3.e4, e3.r4, local_context, redefinitions)
			if r3.is_and_then then
				create {LIBERTY_AND_THEN} Result.make(Result, expression_3(r3.expression, r3.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r3.is_and then
				create {LIBERTY_AND} Result.make(Result, expression_3(r3.expression, r3.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_4 (e4: LIBERTY_AST_E4; r4: LIBERTY_AST_R4; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_5(e4.e5, e4.r5, local_context, redefinitions)
			if r4.is_eq then
				create {LIBERTY_EQUALS} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), universe.type_boolean, Result.position)
			elseif r4.is_ne then
				create {LIBERTY_NOT_EQUALS} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), universe.type_boolean, Result.position)
			elseif r4.is_le then
				create {LIBERTY_LESS_OR_EQUAL} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r4.is_lt then
				create {LIBERTY_LESS_THAN} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r4.is_ge then
				create {LIBERTY_GREATER_OR_EQUAL} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r4.is_gt then
				create {LIBERTY_GREATER_THAN} Result.make(Result, expression_4(r4.expression, r4.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_5 (e5: LIBERTY_AST_E5; r5: LIBERTY_AST_R5; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_6(e5.e6, e5.r6, local_context, redefinitions)
			if r5.is_plus then
				create {LIBERTY_ADD} Result.make(Result, expression_5(r5.expression, r5.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r5.is_minus then
				create {LIBERTY_SUBTRACT} Result.make(Result, expression_5(r5.expression, r5.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_6 (e6: LIBERTY_AST_E6; r6: LIBERTY_AST_R6; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_7(e6.e7, e6.r7, local_context, redefinitions)
			if r6.is_times then
				create {LIBERTY_TIMES} Result.make(Result, expression_6(r6.expression, r6.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r6.is_divide then
				create {LIBERTY_DIVIDE} Result.make(Result, expression_6(r6.expression, r6.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r6.is_int_divide then
				create {LIBERTY_INT_DIVIDE} Result.make(Result, expression_6(r6.expression, r6.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			elseif r6.is_int_remainder then
				create {LIBERTY_INT_REMAINDER} Result.make(Result, expression_6(r6.expression, r6.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_7 (e7: LIBERTY_AST_E7; r7: LIBERTY_AST_R7; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_8(e7.e8, e7.r8, local_context, redefinitions)
			if r7.is_power then
				create {LIBERTY_POWER} Result.make(Result, expression_7(r7.expression, r7.remainder, local_context, redefinitions), agent feature_entity, Result.position)
			end
		end

	expression_8 (e8: LIBERTY_AST_E8; r8: LIBERTY_AST_R8; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		local
			fn: LIBERTY_FEATURE_NAME
		do
			if e8.has_prefix_operator then
				inspect
					e8.prefix_operator.name
				when "KW +" then
					create {LIBERTY_POSITIVE} Result.make(expression_8(e8.prefixed_expression, r8, local_context, redefinitions), agent feature_entity, semantics_position_at(e8.prefix_operator))
				when "KW -" then
					create {LIBERTY_NEGATIVE} Result.make(expression_8(e8.prefixed_expression, r8, local_context, redefinitions), agent feature_entity, semantics_position_at(e8.prefix_operator))
				when "KW not" then
					create {LIBERTY_NOT} Result.make(expression_8(e8.prefixed_expression, r8, local_context, redefinitions), agent feature_entity, semantics_position_at(e8.prefix_operator))
				else
					create fn.make_prefix(e8.prefix_operator.image.image.intern)
					create {LIBERTY_PREFIX_OPERATOR} Result.make(expression_8(e8.prefixed_expression, r8, local_context, redefinitions), feature_entity(fn), semantics_position_at(e8.prefix_operator))
				end
			else
				Result := expression_9(e8.e9, local_context, redefinitions)
			end
			if r8.is_free_operator then
				create fn.make_infix(r8.free_operator.image.image.intern)
				create {LIBERTY_INFIX_OPERATOR} Result.make(Result, expression_8(r8.expression, r8.remainder, local_context, redefinitions), feature_entity(fn), Result.position)
			end
		end

	expression_9 (e9: LIBERTY_AST_E9; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		do
			Result := expression_10(e9.e10, local_context, redefinitions)
			if e9.has_old then
				create {LIBERTY_OLD} Result.make(Result, semantics_position_at(e9.node_at(0)))
			end
		end

	expression_10 (e10: LIBERTY_AST_E10; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		local
			tgt: LIBERTY_EXPRESSION
		do
			if e10.is_call then
				Result := expression_call(e10.call, local_context, redefinitions)
			elseif e10.is_tuple then
				Result := expression_tuple(e10.tuple_actuals, local_context, redefinitions, semantics_position_at(e10.node_at(0)))
			elseif e10.is_open_argument then
				create {LIBERTY_OPEN_ARGUMENT} Result.make(semantics_position_at(e10.node_at(0)))
			elseif e10.is_manifest_or_type_test then
				tgt := typed_manifest_or_type_test(e10.manifest_or_type_test, local_context, redefinitions)
				Result := expression_remainder(tgt, e10.manifest_or_type_test_r10, local_context, redefinitions)
			elseif e10.is_inline_agent then
				--|*** TODO
				not_yet_implemented
			elseif e10.is_agent_creation then
				--|*** TODO
				not_yet_implemented
			elseif e10.is_creation_expression then
				Result := expression_creation(e10.creation_expression, local_context, redefinitions)
			elseif e10.is_void then
				create {LIBERTY_VOID} Result.make(semantics_position_at(e10.node_at(0)))
			elseif e10.is_assignment_test then
				create {LIBERTY_ASSIGNMENT_TEST} Result.test_entity(entity(e10.assignment_test_entity_name, local_context, redefinitions),
																					 expression(e10.assignment_test_expression, local_context, redefinitions),
																					 universe.type_boolean, semantics_position_at(e10.assignment_test_entity_name))
			else
				check False end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_creation (a_creation: LIBERTY_AST_CREATION_EXPRESSION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			a_creation /= Void
		local
			creation_type: LIBERTY_TYPE
			tgt: LIBERTY_EXPRESSION
			fe: LIBERTY_FEATURE_ENTITY
			fa: TRAVERSABLE[LIBERTY_EXPRESSION]
		do
			creation_type := universe.get_type_from_type_definition(type, a_creation.type_definition, effective_generic_parameters, False)
			if a_creation.r10.is_empty then
				fe := feature_entity(default_create_name)
				fa := empty_actuals
				create {LIBERTY_CREATION_EXPRESSION} Result.make(creation_type, fe, fa, semantics_position_at(a_creation.node_at(0)))
			else
				fe := feature_entity(create {LIBERTY_FEATURE_NAME}.make_regular(a_creation.r10.feature_name.image.image.intern))
				fa := actuals(a_creation.r10.actuals, local_context, redefinitions)
				create {LIBERTY_CREATION_EXPRESSION} tgt.make(creation_type, fe, fa, semantics_position_at(a_creation.node_at(0)))
				Result := expression_remainder(tgt, a_creation.r10.remainder, local_context, redefinitions)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_call (a_call: LIBERTY_AST_CALL; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			a_call /= Void
		local
			tgt: LIBERTY_EXPRESSION
		do
			tgt := target_or_implicit_feature_call_expression(a_call.target, local_context, redefinitions)
			Result := expression_remainder(tgt, a_call.r10, local_context, redefinitions)
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_remainder (a_target: LIBERTY_EXPRESSION; a_remainder: LIBERTY_AST_R10; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			a_target /= Void
			a_remainder /= Void
		local
			tgt: LIBERTY_EXPRESSION
			fe: LIBERTY_FEATURE_ENTITY
			fa: TRAVERSABLE[LIBERTY_EXPRESSION]
		do
			-- We may derecursivate this thing (algorithm similar to `instruction_call')
			-- but I guess modern compilers are smart enough to do that anyway :-)
			if not errors.has_error then
				if a_remainder.is_empty then
					Result := a_target
				else
					fe ::= entity(a_remainder.feature_name, local_context, redefinitions)
					fa := actuals(a_remainder.actuals, local_context, redefinitions)
					create {LIBERTY_CALL_EXPRESSION} tgt.make(a_target, fe, fa, a_target.position) --|*** or semantics_position_at(a_remainder.node_at(0)) ??
					Result := expression_remainder(tgt, a_remainder.remainder, local_context, redefinitions)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	expression_tuple (a_tuple: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]; a_position: LIBERTY_POSITION): LIBERTY_TUPLE is
		local
			exp: LIBERTY_AST_EXPRESSION
			expr: LIBERTY_EXPRESSION
			expressions: COLLECTION[LIBERTY_EXPRESSION]
			exp_types: COLLECTION[LIBERTY_ENTITY_TYPE]
			i: INTEGER
		do
			from
				create {FAST_ARRAY[LIBERTY_EXPRESSION]} expressions.with_capacity(a_tuple.count)
				create {FAST_ARRAY[LIBERTY_ENTITY_TYPE]} exp_types.with_capacity(a_tuple.count)
				i := a_tuple.lower
			until
				errors.has_error or else i > a_tuple.upper
			loop
				exp ::= a_tuple.item(i)
				expr := expression(exp, local_context, redefinitions)
				if not errors.has_error then
					expressions.add_last(expr)
					exp_types.add_last(expr.result_type)
				end
				i := i + 1
			end
			if not errors.has_error then
				create Result.make(universe.type_tuple(exp_types, a_position), expressions, a_position)
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	typed_manifest_or_type_test (constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]): LIBERTY_EXPRESSION is
		require
			constant /= Void
			local_context /= Void
		local
			openarg: LIBERTY_OPEN_ARGUMENT
		do
			if constant.is_assignment_test then
				create {LIBERTY_ASSIGNMENT_TEST} Result.test_type(universe.get_type_from_type_definition(type, constant.assignment_test_type, effective_generic_parameters, False),
																				  expression(constant.assignment_test_expression, local_context, redefinitions),
																				  universe.type_boolean, semantics_position_at(constant.node_at(0)))
			elseif constant.is_typed_open_argument then
				create openarg.make(semantics_position_at(constant.node_at(0)))
				openarg.set_result_type(universe.get_type_from_type_definition(type, constant.open_argument_type, effective_generic_parameters, False))
				Result := openarg
			elseif constant.is_number then
				Result := number(constant.number.image)
			elseif constant.is_true then
				create {LIBERTY_BOOLEAN_MANIFEST}Result.make(universe.type_boolean, True, semantics_position_at(constant.node_at(0)))
			elseif constant.is_false then
				create {LIBERTY_BOOLEAN_MANIFEST}Result.make(universe.type_boolean, False, semantics_position_at(constant.node_at(0)))
			elseif constant.is_character then
				Result := character(constant.character.image)
			elseif constant.is_string then
				create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, decoded_string(constant.string), False, semantics_position_at(constant.node_at(0)))
			elseif constant.is_once_string then
				create {LIBERTY_STRING_MANIFEST} Result.make(universe.type_string, decoded_string(constant.string), True, semantics_position_at(constant.node_at(0)))
			elseif constant.is_number_typed_manifest then
				Result := number_typed_manifest(universe.get_type_from_type_definition(type, constant.typed_manifest_type, effective_generic_parameters, False),
														  constant.typed_manifest_number.image)
			elseif constant.is_string_typed_manifest then
				create {LIBERTY_STRING_TYPED_MANIFEST} Result.make(universe.get_type_from_type_definition(type, constant.typed_manifest_type, effective_generic_parameters, False),
																				   decoded_string(constant.typed_manifest_string), semantics_position_at(constant.node_at(0)))
			elseif constant.is_array_typed_manifest then
				Result := array_typed_manifest(universe.get_type_from_type_definition(type, constant.typed_manifest_type, effective_generic_parameters, False),
														 constant.typed_manifest_array_parameters, constant.typed_manifest_array,
														 local_context, redefinitions, semantics_position_at(constant.node_at(0)))
			else
				check False end
			end
		ensure
			not errors.has_error implies Result /= Void
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
					create {LIBERTY_INTEGER_8_MANIFEST}Result.make(universe.type_integer_64, i64.to_integer_8, image_semantics_position_at(number_image))
				elseif i64.fit_integer_16 then
					create {LIBERTY_INTEGER_16_MANIFEST}Result.make(universe.type_integer_64, i64.to_integer_16, image_semantics_position_at(number_image))
				elseif i64.fit_integer_32 then
					create {LIBERTY_INTEGER_32_MANIFEST}Result.make(universe.type_integer_64, i64.to_integer_32, image_semantics_position_at(number_image))
				else
					create {LIBERTY_INTEGER_64_MANIFEST}Result.make(universe.type_integer_64, i64, image_semantics_position_at(number_image))
				end
			else
				check
					r ?:= number_image
				end
				r ::= number_image
				create {LIBERTY_REAL_MANIFEST}Result.make(universe.type_real, r.decoded, image_semantics_position_at(number_image))
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	character (character_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION is
		require
			{TYPED_EIFFEL_IMAGE[CHARACTER]} ?:= character_image
		local
			c: TYPED_EIFFEL_IMAGE[CHARACTER]
		do
			c ::= character_image
			create {LIBERTY_CHARACTER_MANIFEST}Result.make(universe.type_character, c.decoded, image_semantics_position_at(character_image))
		ensure
			not errors.has_error implies Result /= Void
		end

	number_typed_manifest (manifest_type: LIBERTY_TYPE; number_image: EIFFEL_IMAGE): LIBERTY_EXPRESSION is
		require
			({TYPED_EIFFEL_IMAGE[INTEGER_64]} ?:= number_image)
				or else ({TYPED_EIFFEL_IMAGE[REAL]} ?:= number_image)
		local
			i: TYPED_EIFFEL_IMAGE[INTEGER_64]
			r: TYPED_EIFFEL_IMAGE[REAL]
		do
			if i ?:= number_image then
				i ::= number_image
				create {LIBERTY_INTEGER_TYPED_MANIFEST}Result.make(manifest_type, i.decoded, image_semantics_position_at(number_image))
			else
				check
					r ?:= number_image
				end
				r ::= number_image
				create {LIBERTY_REAL_TYPED_MANIFEST}Result.make(manifest_type, r.decoded, image_semantics_position_at(number_image))
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	array_typed_manifest (manifest_type: LIBERTY_TYPE; array_parameters: EIFFEL_LIST_NODE; array: LIBERTY_AST_ARRAY;
		local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION];
		a_position: LIBERTY_POSITION): LIBERTY_ARRAY_MANIFEST is
		require
			local_context /= Void
		local
			i: INTEGER; ena: LIBERTY_AST_EXPRESSION_NO_ARRAY; exp: LIBERTY_AST_EXPRESSION
		do
			create Result.make(manifest_type, a_position)
			from
				i := array_parameters.lower
			until
				i > array_parameters.upper
			loop
				ena ::= array_parameters.item(i)
				Result.add_parameter(expression_no_array(ena, local_context, redefinitions))
				i := i + 1
			end
			from
				i := array.content.lower
			until
				i > array.content.upper
			loop
				exp ::= array.content.item(i)
				Result.add_content(expression(exp, local_context, redefinitions))
				i := i + 1
			end
		ensure
			not errors.has_error implies Result /= Void
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
					errors.has_error or else i > clients.upper
				loop
					client ::= clients.item(i)
					Result.add_last(universe.get_type_from_client(type, client, effective_generic_parameters))
					i := i + 1
				end
			end
		end

	empty_client_list: COLLECTION[LIBERTY_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_TYPE]} Result.with_capacity(0)
		end

	list_parameters (parameters: EIFFEL_LIST_NODE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]) is
		local
			i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
			typedef: LIBERTY_TYPE; parameter: LIBERTY_PARAMETER
		do
			if not parameters.is_empty then
				from
					i := parameters.lower
				until
					i > parameters.upper
				loop
					declaration ::= parameters.item(i)
					typedef := universe.get_type_from_type_definition(type, declaration.type_definition, effective_generic_parameters, False)
					if typedef /= Void then
						from
							j := declaration.variables.lower
						until
							j > declaration.variables.upper
						loop
							variable ::= declaration.variables.item(j)
							create parameter.make(variable.variable.image.image.intern, typedef)
							local_context.add_parameter(parameter)
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

	list_locals (locals: LIBERTY_AST_LOCAL_BLOCK; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT; redefinitions: TRAVERSABLE[LIBERTY_FEATURE_DEFINITION]) is
		local
			i, j: INTEGER; declaration: LIBERTY_AST_DECLARATION; variable: LIBERTY_AST_VARIABLE
			typedef: LIBERTY_TYPE; localdef: LIBERTY_LOCAL
		do
			if locals.list_count > 0 then
				from
					i := locals.list_lower
				until
					i > locals.list_upper
				loop
					declaration := locals.list_item(i)
					typedef := universe.get_type_from_type_definition(type, declaration.type_definition, effective_generic_parameters, False)
					if typedef /= Void then
						from
							j := declaration.variables.lower
						until
							j > declaration.variables.upper
						loop
							variable ::= declaration.variables.item(j)
							create localdef.make(variable.variable.image.image.intern, typedef)
							local_context.add_local(localdef)
							j := j + 1
						end
					end
					i := i + 1
				end
			end
		end

feature {}
	make (a_type: like type; a_universe: like universe) is
		require
			a_type /= Void
			a_universe /= Void
		do
			type := a_type
			universe := a_universe
			create current_entity.make(a_type)
			create {HASHED_DICTIONARY[LIBERTY_WRITABLE_FEATURE, FIXED_STRING]} feature_writables.make
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_ENTITY, LIBERTY_FEATURE_NAME]} feature_entities.make
		ensure
			type = a_type
			universe = a_universe
		end

	type: LIBERTY_TYPE
	universe: LIBERTY_UNIVERSE

	effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]
			-- key: generic parameter name (e.g. E_)
			-- value: effective parameter (e.g. STRING)

	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

	errors: LIBERTY_ERRORS

	semantics_position_at (a_node: EIFFEL_NODE): LIBERTY_POSITION is
		require
			{LIBERTY_AST_TERMINAL_NODE} ?:= a_node
		local
			node: LIBERTY_AST_TERMINAL_NODE
		do
			node ::= a_node
			Result := image_semantics_position_at(node.image)
		end

	image_semantics_position_at (a_image: EIFFEL_IMAGE): LIBERTY_POSITION is
		do
			Result := errors.semantics_position(a_image.index, type.ast, type.file)
		end

	semantics_position_after (a_node: EIFFEL_NODE): LIBERTY_POSITION is
		require
			{LIBERTY_AST_TERMINAL_NODE} ?:= a_node
		local
			node: LIBERTY_AST_TERMINAL_NODE
		do
			node ::= a_node
			Result := image_semantics_position_after(node.image)
		end

	image_semantics_position_after (a_image: EIFFEL_IMAGE): LIBERTY_POSITION is
		do
			Result := errors.semantics_position(a_image.index + a_image.image.count, type.ast, type.file)
		end

invariant
	type /= Void
	universe /= Void
	current_entity /= Void
	feature_writables /= Void
	feature_entities /= Void

end
