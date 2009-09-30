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
			ast := a_type.ast
			type := a_type
			universe := a_universe
			init_header(ast.class_header)
			if not has_error then
				if ast.obsolete_clause.count > 0 then
					create warning(ast.obsolete_clause.string.image.index, decoded_string(ast.obsolete_clause.string))
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
				create last_error.error(a_header.class_name.image.index, once "Bad number of generic parameters", last_error)
			else
				check
					same_indexes: type_parameters.list_lower = type.parameters.lower
				end
				create {HASHED_DICTIONARY[LIBERTY_TYPE, STRING]}generic_effective_parameters.with_capacity(type_parameters.list_count)
				from
					i := type_parameters.list_lower
				until
					i > type_parameters.list_upper
				loop
					type_parameter := type_parameters.list_item(i)
					if type_parameter.has_constraint then
						constraint := universe.get_type_from_type_definition(type.cluster, type_parameter.constraint, generic_effective_parameters)
						if not constraint.is_parent_of(type.parameters.item(i)) then
							create last_error.error(type_parameter.class_name.image.index, once "Bad effective parameter: does not inherit or insert the constraint " + constraint.name, last_error)
						end
					end
					generic_effective_parameters.add(type.parameters.item(i), type_parameter.class_name.image.image)
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
				parent := universe.get_type_from_type_definition(parent_clause.type_definition)
				if parent /= Void then
					type.add_parent(parent, conformant)
					inject_parent_features(parent, parent_clause.parent_clause, conformant)
					has_parent := True
				end
				i := i + 1
			end
			if not has_parent then
				parent := universe.type_any
				type.add_parent(parent, False)
				import_features(parent, Void)
			end
		end

	inject_parent_features (parent: LIBERTY_TYPE; clause: LIBERTY_AST_PARENT_CLAUSE; conformant: BOOLEAN) is
		local
			parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, STRING]
		do
			parent_features := parent.features_twin
			rename_features(parent_features, clause.rename_clause)
			export_features(parent_features, clause.export_clause)
			undefine_features(parent_features, clause.undefine_clause)
			redefine_features(parent_features, clause.redefine_clause)
		end

	rename_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, STRING]; clause: LIBERTY_AST_PARENT_RENAME) is
		local
			i: INTEGER; r: LIBERTY_AST_RENAME; old_name, new_name: EIFFEL_IMAGE
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			until
				i > clause.list_upper
			loop
				r := clause.list_item(i)
				if r.old_name.feature_name_or_alias.is_regular then
					old_name := r.old_name.feature_name_or_alias.entity_name.image
				else
					old_name := r.old_name.feature_name_or_alias.free_operator_name.image
				end
				if r.new_name.feature_name_or_alias.is_regular then
					new_name := r.new_name.feature_name_or_alias.entity_name.image
				else
					new_name := r.new_name.feature_name_or_alias.free_operator_name.image
				end
				fd := parent_features.reference_at(old_name.image)
				if fd = Void then
					error(old_name.index, once "Unknown feature name: " + old_name.image)
				elseif parent_features.reference_at(new_name.image)
					error(new_name.index, once "Duplicate feature name: " + new_name.image)
				else
					parent_features.remove(old_name.image)
					if r.new_name.feature_name_or_alias.is_regular then
						fd.rename_regular(new_name.image)
					elseif r.new_name.feature_name_or_alias.is_prefix then
						fd.rename_prefix(new_name.image)
					else
						check
							r.new_name.feature_name_or_alias.is_infix
						end
						fd.rename_infix(new_name.image)
					end
					parent_features.add(fd, new_name.image)
				end
				i := i + 1
			end
		end

	export_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, STRING]; clause: LIBERTY_AST_PARENT_EXPORT) is
		local
			i, j: INTEGER; e: LIBERTY_AST_EXPORT; feature_name: LIBERTY_AST_FEATURE_NAME; name: EIFFEL_IMAGE
			clients: COLLECTION[LIBERTY_TYPE]; client: LIBERTY_AST_CLIENT
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			until
				i > clause.list_upper
			loop
				e := clause.list_item(i)
				create {FAST_ARRAY[LIBERTY_TYPE]}clients.with_capacity(e.clients.count)
				from
					j := e.clients.lower
				until
					j > e.clients.upper
				loop
					client := e.clients.item(j)
					clients.add_last(universe.get_type_from_client(type.cluster, client, generic_effective_parameters))
					j := j + 1
				end
				from
					j := e.feature_names.lower
				until
					j > e.feature_names.upper
				loop
					feature_name := e.feature_names.item(j)
					if feature_name.feature_name_or_alias.is_regular then
						name := feature_name.feature_name_or_alias.entity_name.image
					else
						name := feature_name.feature_name_or_alias.free_operator_name.image
					end
					fd := parent_features.reference_at(name.image)
					if fd = Void then
						error(name.index, once "Unknown feature name: " + name.image)
					else
						fd.set_clients(clients)
					end
					j := j + 1
				end
				i := i + 1
			end
		end

	undefine_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, STRING]; clause: LIBERTY_AST_PARENT_UNDEFINE) is
			-- replace the feature by a LIBERTY_FEATURE_DEFERRED
			--|*** ATTENTION A L'HERITAGE DES CONTRATS
		do
		end

	redefine_features (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, STRING]; clause: LIBERTY_AST_PARENT_REDEFINE) is
			-- replace the feature by a LIBERTY_FEATURE_TO_REDEFINE
			--|*** ATTENTION A L'HERITAGE DES CONTRATS
		do
		end

feature {}
	add_features (features: EIFFEL_LIST_NODE) is
		do
			not_yet_implemented
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

feature {}
	decoded_string (image: LIBERTY_AST_STRING): STRING is
		local
			img: TYPED_EIFFEL_IMAGE[STRING]
		do
			img ::= image.image
			Result := img.decoded
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

	generic_effective_parameters: DICTIONARY[LIBERTY_TYPE, STRING]
			-- key: generic parameter name (e.g. E_)
			-- value: effective parameter (e.g. STRING)

invariant
	type /= Void
	universe /= Void

end
