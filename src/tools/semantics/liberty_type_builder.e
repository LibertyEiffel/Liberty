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
					inject_parent_invariant(parent)
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
				parent_features.item(i).name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				r := clause.list_item(i)
				create old_name.make_from_ast(r.old_name.feature_name_or_alias)
				create new_name.make_from_ast(r.new_name.feature_name_or_alias)
				fd := parent_features.reference_at(old_name)
				if fd = Void then
					error(old_name.index, once "Unknown feature name: " + old_name)
				elseif parent_features.reference_at(new_name)
					error(new_name.index, once "Duplicate feature name: " + new_name)
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
			i, j: INTEGER; e: LIBERTY_AST_EXPORT; feature_name: LIBERTY_FEATURE_NAME
			clients: COLLECTION[LIBERTY_TYPE]; client: LIBERTY_AST_CLIENT
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			invariant
				parent_features.item(i).name.is_equal(parent_features.key(i))
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
					create feature_name.make_from_ast(e.feature_names.item(j))
					fd := parent_features.reference_at(feature_name)
					if fd = Void then
						error(feature_name.index, once "Unknown feature name: " + feature_name)
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
				parent_features.item(i).name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				create feature_name.make_from_ast(clause.list_item(i))
				fd := parent_features.reference_at(feature_name)
				if fd = Void then
					error(feature_name.index, once "Unknown feature name: " + feature_name)
				else
					inherited_feature := fd.the_feature
					create deferred_feature.make
					deferred_feature.set_preconfition(inherited_feature.precondition)
					deferred_feature.set_postcondition(inherited_feature.postcondition)
					deferred_feature.set_result_type(inherited_feature.result_type)
					deferred_feature.add_parameters(inherited_feature.parameters)
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
				parent_features.item(i).name.is_equal(parent_features.key(i))
			until
				i > clause.list_upper
			loop
				create feature_name.make_from_ast(clause.list_item(i))
				fd := parent_features.reference_at(feature_name)
				if fd = Void then
					error(feature_name.index, once "Unknown feature name: " + feature_name)
				else
					inherited_feature := fd.the_feature
					create redefined_feature.make
					redefined_feature.set_preconfition(inherited_feature.precondition)
					redefined_feature.set_postcondition(inherited_feature.postcondition)
					redefined_feature.set_result_type(inherited_feature.result_type)
					redefined_feature.add_parameters(inherited_feature.parameters)
					if conformant then
						inherited_feature.bind(redefined_feature, type)
					end
					fd.set_the_feature(redefined_feature)
					redefined_features.add(redefined_feature, feature_name)
				end
				i := i + 1
			end
		end

	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

	push_parent_features_in_type (parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]) is
		local
			i: INTEGER
		do
			from
				i := parent_features.lower
			invariant
				parent_features.item(i).name.is_equal(parent_features.key(i))
			until
				i >  parent_features.upper
			loop
				type.add_feature(parent_features.item(i))
				i := i + 1
			end
		end

feature {}
	add_features (features: EIFFEL_LIST_NODE) is
		do
			not_yet_implemented --|*** TODO

			check_that_all_redefined_features_were_redefined
		end

	check_that_all_redefined_features_were_redefined is
		local
			i: INTEGER; name: EIFFEL_IMAGE
		do
			from
				i := redefined_features.lower
			until
				i > redefined_features.upper
			loop
				if redefined_features.item(i).redefined_feature = Void then
					name := redefined_features.key(i)
					error(name.index, once "Missing redefinition for " + name.image)
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
