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
class LIBERTY_TYPE_FEATURES_LOADER
	--
	-- Loads the type's own features.
	--
	-- Also loads the type's invariant.
	--

insert
	LIBERTY_SEMANTICS_BUILDER
	LIBERTY_TYPE_BUILDER_TOOLS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_builder: like builder; a_current_entity: like current_entity; a_universe: like universe;
		a_effective_generic_parameters: like effective_generic_parameters; a_redefined_features: like redefined_features) is
		require
			a_builder /= Void
			a_current_entity /= Void
			a_universe /= Void
			a_redefined_features /= Void
		do
			builder := a_builder
			current_entity := a_current_entity
			type := a_current_entity.result_type
			universe := a_universe
			effective_generic_parameters := a_effective_generic_parameters
			redefined_features := a_redefined_features
			create {HASHED_DICTIONARY[LIBERTY_WRITABLE_FEATURE, FIXED_STRING]} feature_writables.with_capacity(3)
		ensure
			builder = a_builder
			current_entity = a_current_entity
			universe = a_universe
			effective_generic_parameters = a_effective_generic_parameters
			redefined_features = a_redefined_features
		end

	current_entity: LIBERTY_CURRENT
	universe: LIBERTY_UNIVERSE

feature {LIBERTY_TYPE_BUILDER}
	load is
		local
			ast_class: LIBERTY_AST_ONE_CLASS
		do
			ast_class := type.ast
			add_features(ast_class.features)
			check_that_all_redefined_features_were_redefined
			if not errors.has_error then
				add_creations(ast_class.creations)
				if not errors.has_error then
					type.set_invariant(class_invariant(ast_class.invariant_clause))
				end
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
		end

	add_feature (clients: COLLECTION[LIBERTY_TYPE]; a_feature: LIBERTY_AST_FEATURE_DEFINITION) is
		local
			result_type: LIBERTY_TYPE
			the_feature: LIBERTY_FEATURE
			local_context: LIBERTY_FEATURE_LOCAL_CONTEXT
			type_resolver: LIBERTY_TYPE_RESOLVER_IN_FEATURE
			fn: LIBERTY_AST_FEATURE_NAME
		do
			create local_context.make(type)
			if a_feature.signature.has_result_type then
				result_type := type_lookup.resolver.type(a_feature.signature.result_type)
				local_context.set_result_type(result_type)
			end
			local_context.set_feature_names(a_feature.signature.feature_names)
			fn ::= a_feature.signature.feature_names.first
			create type_resolver.make(fn, local_context)
			type_lookup.push(type_resolver)

			if a_feature.has_routine_definition then
				if a_feature.signature.has_parameters then
					list_parameters(a_feature.signature.parameters, local_context)
				end
				the_feature := routine_definition(a_feature.routine_definition, local_context)
			else
				if a_feature.signature.has_parameters then
					errors.add_position(semantics_position_at(a_feature.signature.node_at(1)))
					errors.set(level_error, once "Unexpected parameters")
				elseif not a_feature.signature.has_result_type then
					errors.add_position(semantics_position_after(fn.feature_name_or_alias.node_at(fn.feature_name_or_alias.upper)))
					errors.set(level_error, once "Missing entity type")
				else
					if a_feature.is_constant then
						the_feature := feature_constant(a_feature.constant, local_context)
					elseif a_feature.is_unique then
						create {LIBERTY_FEATURE_UNIQUE} the_feature.make(type)
					else
						create {LIBERTY_FEATURE_ATTRIBUTE} the_feature.make(type)
					end
				end
			end

			if not errors.has_error then
				the_feature.set_context(local_context)
				the_feature.set_type_resolver(type_resolver, False)
				add_feature_definition(the_feature, a_feature.signature.feature_names, clients)
			end

			type_lookup.pop
		end

	routine_definition (routine_def: LIBERTY_AST_ROUTINE_DEFINITION; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_FEATURE is
		require
			local_context /= Void
		local
			obsolete_message: STRING
			routine_execution: LIBERTY_AST_ROUTINE_EXECUTION
			do_block: LIBERTY_AST_DO_BLOCK
			routine: LIBERTY_FEATURE_ROUTINE; ext: LIBERTY_FEATURE_EXTERNAL
			comp: LIBERTY_INSTRUCTION
		do
			if routine_def.obsolete_clause.count > 0 then
				obsolete_message := decoded_string(routine_def.obsolete_clause.string)
			end
			routine_execution := routine_def.execution
			if routine_execution.is_external then
				if routine_execution.external_clause.alias_clause.has_alias then
					create ext.make(type,
										 decoded_string(routine_execution.external_clause.definition).intern,
										 decoded_string(routine_execution.external_clause.alias_clause.definition).intern,
										 local_context.best_accelerator)
				else
					create ext.make(type,
										 decoded_string(routine_execution.external_clause.definition).intern,
										 Void,
										 local_context.best_accelerator)
				end
				if not routine_def.rescue_block.is_empty then
					ext.set_rescue(compound(routine_def.rescue_block.list, local_context))
				end
				Result := ext
			else
				check routine_execution.is_regular end
				do_block := routine_execution.do_block
				if do_block.is_deferred then
					create {LIBERTY_FEATURE_DEFERRED} Result.make(type)
				elseif do_block.is_attribute then
					create {LIBERTY_FEATURE_ATTRIBUTE} Result.make(type)
				else
					list_locals(routine_execution.local_block, local_context)
					comp := compound(routine_execution.do_block.list, local_context)
					if not errors.has_error then
						if do_block.is_do then
							create {LIBERTY_FEATURE_DO} routine.make(type, comp, local_context.best_accelerator)
						else
							check do_block.is_once end
							create {LIBERTY_FEATURE_ONCE} routine.make(type, comp, local_context.best_accelerator)
						end
						if not routine_def.rescue_block.is_empty then
							routine.set_rescue(compound(routine_def.rescue_block.list, local_context))
						end
						Result := routine
					end
				end
			end
			if not errors.has_error then
				Result.set_precondition(feature_precondition(routine_def.require_clause, local_context))
				Result.set_postcondition(feature_postcondition(routine_def.ensure_clause, local_context))
				if not errors.has_error then
					local_context.reconcile_retry_instructions(Result)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_precondition (precondition: LIBERTY_AST_REQUIRE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_REQUIRE is
		require
			precondition /= Void
			local_context /= Void
		local
			assertions: COLLECTION[LIBERTY_ASSERTION]
		do
			assertions := feature_assertions(precondition, local_context)
			if not errors.has_error then
				if precondition.count = 0 then
					create Result.make(assertions)
				elseif precondition.require_else.is_require_else then
					create {LIBERTY_REQUIRE_ELSE} Result.make(assertions)
				elseif precondition.require_else.is_require_then then
					create {LIBERTY_REQUIRE_THEN} Result.make(assertions)
				else
					create Result.make(assertions)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_postcondition (postcondition: LIBERTY_AST_ENSURE; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_ENSURE is
		require
			postcondition /= Void
			local_context /= Void
		local
			assertions: COLLECTION[LIBERTY_ASSERTION]
		do
			assertions := feature_assertions(postcondition, local_context)
			if not errors.has_error then
				if postcondition.count = 0 then
					create Result.make(assertions)
				elseif postcondition.ensure_then.is_ensure_then then
					create {LIBERTY_ENSURE_THEN} Result.make(assertions)
				else
					create Result.make(assertions)
				end
			end
		ensure
			not errors.has_error implies Result /= Void
		end

	feature_constant (constant: LIBERTY_AST_MANIFEST_OR_TYPE_TEST; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_FEATURE_CONSTANT is
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
				tm := typed_manifest_or_type_test(constant, local_context)
				if not errors.has_error then
					create Result.make(type, tm)
				end
			end
		end

	add_feature_definition (a_feature: LIBERTY_FEATURE; names: EIFFEL_LIST_NODE; clients: COLLECTION[LIBERTY_TYPE]) is
		local
			i: INTEGER; name: LIBERTY_AST_FEATURE_NAME; feature_name: LIBERTY_FEATURE_NAME
			fd_parent, fd: LIBERTY_FEATURE_DEFINITION
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
						fd_parent := type.feature_definition(feature_name)
						check
							({LIBERTY_FEATURE_DEFERRED} ?:= fd_parent.the_feature)
								or else ({LIBERTY_FEATURE_REDEFINED} ?:= fd_parent.the_feature) -- in that case the redefined_feature is a DEFERRED
						end
						if fd_parent.the_feature.definition_type = type then
							--|*** TODO: warning or error?? an undefined feature should not be defined
						end

						create fd.make(feature_name, type, clients, name.is_frozen, feature_name.position)
						fd.set_the_feature(a_feature)

						debug ("type.building.internals")
							log.trace.put_string(once " <=> late binding down to ")
							log.trace.put_string(type.full_name)
							log.trace.put_string(once " of defined feature ")
							log.trace.put_line(feature_name.full_name)
						end

						type.replace_feature(fd)
						a_feature.replace(fd_parent.the_feature, type)
					elseif redefined.redefined_feature = Void then
						redefined.set_redefined_feature(a_feature)
					elseif redefined.redefined_feature = a_feature then
						-- Nothing, just another name for the same feature
					else
						name_or_alias := name.feature_name_or_alias
						errors.add_position(semantics_position_at(name_or_alias.node_at(0)))
						errors.set(level_error, once "Duplicate feature: " + feature_name.name)
					end
				else
					create fd.make(feature_name, type, clients, name.is_frozen, feature_name.position)
					fd.set_the_feature(a_feature)
					type.add_feature(fd)
				end

				i := i + 1
			end
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
						errors.set(level_error, once "Missing redefinition for " + feature_name.name + once " in " + type.out)
					end
					i := i + 1
				end
			end
		end

feature {}
	add_creations (creations: EIFFEL_LIST_NODE) is
		local
			i, j: INTEGER; clients: COLLECTION[LIBERTY_TYPE]
			c: LIBERTY_AST_CLASS_CREATION; fn: LIBERTY_AST_FEATURE_NAME
		do
			from
				i := creations.lower
			until
				i > creations.upper
			loop
				c ::= creations.item(i)
				clients := list_clients(c.clients)
				from
					j := c.feature_names.lower
				until
					errors.has_error or else j > c.feature_names.upper
				loop
					fn ::= c.feature_names.item(j)
					add_creation(clients, fn)
					j := j + 1
				end
				i := i + 1
			end
		end

	add_creation (a_clients: COLLECTION[LIBERTY_TYPE]; fn: LIBERTY_AST_FEATURE_NAME) is
		local
			the_feature: LIBERTY_FEATURE_DEFINITION
			feature_name: LIBERTY_FEATURE_NAME
		do
			create feature_name.make_from_ast(fn.feature_name_or_alias, type.ast, type.file)
			if type.has_feature(feature_name) then
				the_feature := type.feature_definition(feature_name)
				the_feature.set_creation_clients(a_clients)
				torch.burn
			else
				--|*** TODO: error: unknown feature
				not_yet_implemented
			end
		end

feature {}
	class_invariant (invariant_clause: LIBERTY_AST_INVARIANT): LIBERTY_INVARIANT is
		do
			--|*** TODO
		end

feature {}
	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

	instruction_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_PRECURSOR_INSTRUCTION is
		local
			f: LIBERTY_FEATURE
			precursor_type: LIBERTY_ACTUAL_TYPE
			tn: LIBERTY_AST_TERMINAL_NODE
		do
			if a_precursor_target.precursor_type_mark.count /= 0 then
				precursor_type ::= type_lookup.resolver.type(a_precursor_target.precursor_type_mark.type_definition)
			end
			f := local_context.find_precursor(precursor_type, redefined_features, type.ast, type.file)
			if f = Void then
				tn ::= a_precursor_target.node_at(0)
				errors.add_position(errors.semantics_position(tn.image.index, type.ast, type.file))
				if precursor_type /= Void then
					errors.add_position(type_lookup.resolver.position(a_precursor_target.precursor_type_mark.type_definition))
					errors.set(level_error, once "Could not find any Precursor of " + local_context.written_feature_names + once " in " + precursor_type.out)
				else
					errors.set(level_error, once "Could not find any Precursor of " + local_context.written_feature_names + once " in any parent of " + type.out)
				end
			else
				create {LIBERTY_PRECURSOR_INSTRUCTION} Result.make(f, actuals(a_precursor_target.actuals, local_context), semantics_position_at(a_precursor_target.node_at(0)))
			end
		end

	expression_call_on_precursor (a_precursor_target: LIBERTY_AST_TARGET; local_context: LIBERTY_FEATURE_LOCAL_CONTEXT): LIBERTY_PRECURSOR_EXPRESSION is
		local
			f: LIBERTY_FEATURE
			precursor_type: LIBERTY_ACTUAL_TYPE
		do
			if a_precursor_target.precursor_type_mark.count /= 0 then
				precursor_type ::= type_lookup.resolver.type(a_precursor_target.precursor_type_mark.type_definition)
			end
			f := local_context.find_precursor(precursor_type, redefined_features, type.ast, type.file)
			create Result.make(f, actuals(a_precursor_target.actuals, local_context), semantics_position_at(a_precursor_target.node_at(0)))
		end

invariant
	feature_writables /= Void
	redefined_features /= Void

end -- class LIBERTY_TYPE_FEATURES_LOADER
