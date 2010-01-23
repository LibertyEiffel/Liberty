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
class LIBERTY_TYPE_PARENT_FEATURES_LOADER
	--
	-- Loads the type's parents' features.
	--
	-- Also loads the parent invariant.
	--

insert
	LIBERTY_TYPE_BUILDER_TOOLS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {}
	make (a_builder: like builder; a_type: like type; a_universe: like universe; a_effective_generic_parameters: like effective_generic_parameters; a_redefined_features: like redefined_features) is
		require
			a_builder /= Void
			a_type /= Void
			a_universe /= Void
			a_effective_generic_parameters /= Void
			a_redefined_features /= Void
		do
			builder := a_builder
			type := a_type
			universe := a_universe
			effective_generic_parameters := a_effective_generic_parameters
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} parent_features.make
			redefined_features := a_redefined_features
		ensure
			builder = a_builder
			type = a_type
			universe = a_universe
			effective_generic_parameters = a_effective_generic_parameters
			redefined_features = a_redefined_features
		end

feature {LIBERTY_TYPE_BUILDER}
	load is
		do
			inject_parents(type.ast.inherit_clause, True)
			inject_parents(type.ast.insert_clause, False)
			if not redefined_features.is_empty then
				builder.set_redefined_features(redefined_features)
			end
		end

	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

feature {}
	inject_parents (parents: LIBERTY_AST_LIST[LIBERTY_AST_PARENT]; conformant: BOOLEAN) is
		local
			i: INTEGER; parent_clause: LIBERTY_AST_PARENT
			parent: LIBERTY_ENTITY_TYPE
			has_parent: BOOLEAN
		do
			from
				has_parent := False
				i := parents.list_lower
			until
				errors.has_error or else i > parents.list_upper
			loop
				parent_clause := parents.list_item(i)
				parent := type_lookup.resolver.type(parent_clause.type_definition)
				if parent /= Void then
					inject_parent_invariant(parent.type)
					inject_parent_features(parent.type, parent_clause.parent_clause, conformant)
					has_parent := True
				end
				i := i + 1
			end
			if not has_parent and then not errors.has_error then
				inject_parent_invariant(universe.type_any)
				inject_parent_features(universe.type_any, Void, False)
			end
			push_parent_features_in_type
		end

	inject_parent_invariant (parent: LIBERTY_TYPE) is
		do
			--|*** TODO
		end

	inject_parent_features (parent: LIBERTY_TYPE; clause: LIBERTY_AST_PARENT_CLAUSE; conformant: BOOLEAN) is
		local
			i: INTEGER; fd, parent_fd, actual_fd: LIBERTY_FEATURE_DEFINITION; name: LIBERTY_FEATURE_NAME
			pf: like parent_features; rf_count: INTEGER; r: LIBERTY_FEATURE_REDEFINED
		do
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]} pf.with_capacity(parent.features.count)
			from
				i := parent.features.lower
			until
				i > parent.features.upper
			loop
				name := parent.features.key(i)
				parent_fd := parent.features.item(i)
				create fd.make(name, parent_fd.clients, parent_fd.is_frozen, name.position)
				fd.add_precursor(parent_fd.the_feature, parent)
				fd.set_the_feature(parent_fd.the_feature)
				pf.add(fd, name)
				i := i + 1
			end
			if clause /= Void and then clause.has_clauses then
				rename_features(pf, clause.rename_clause)
				export_features(pf, clause.export_clause)
				undefine_features(pf, clause.undefine_clause, conformant)
				rf_count := redefine_features(pf, clause.redefine_clause, conformant)
				if rf_count > 0 and then redefined_features.is_empty then
					-- create a new collection because the default empty collection is shared
					create {HASHED_DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]} redefined_features.with_capacity(rf_count)
				end
			end
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
					actual_fd := fd
				else
					actual_fd.join(fd, parent)
					check
						actual_fd.feature_name.is_equal(name)
					end
				end
				--|*** TODO: below, that code is a dirty hack.
				if actual_fd.the_feature.definition_type = type and then (r ?:= actual_fd.the_feature) and then not redefined_features.has(name) then
					check
						fd.the_feature = actual_fd.the_feature
					end
					r ::= actual_fd.the_feature
					redefined_features.add(r, name)
				end
				i := i + 1
			end
		end

	rename_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_RENAME) is
		local
			i: INTEGER; r: LIBERTY_AST_RENAME; old_name, new_name: LIBERTY_FEATURE_NAME
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
			until
				i > clause.list_upper
			loop
				r := clause.list_item(i)
				create old_name.make_from_ast(r.old_name.feature_name_or_alias, type.ast, type.file)
				create new_name.make_from_ast(r.new_name.feature_name_or_alias, type.ast, type.file)
				fd := pf.reference_at(old_name)
				if fd = Void then
					errors.add_position(old_name.position)
					errors.set(level_error, once "Cannot rename inexistent feature: " + old_name.name)
				elseif pf.reference_at(new_name) /= Void then
					errors.add_position(new_name.position)
					errors.set(level_error, once "Cannot rename feature (another feature with the same name exists): " + new_name.name)
				else
					pf.remove(old_name)
					fd.set_name(new_name)
					pf.add(fd, new_name)
				end
				i := i + 1
			end
		end

	export_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_EXPORT) is
		local
			i, j: INTEGER; e: LIBERTY_AST_EXPORT; feature_name: LIBERTY_FEATURE_NAME; fn: LIBERTY_AST_FEATURE_NAME
			clients: COLLECTION[LIBERTY_ENTITY_TYPE]
			fd: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := clause.list_lower
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
					fd := pf.reference_at(feature_name)
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

	undefine_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_UNDEFINE; conformant: BOOLEAN) is
			-- replace the feature by a LIBERTY_FEATURE_DEFERRED
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
			inherited_feature: LIBERTY_FEATURE; deferred_feature: LIBERTY_FEATURE_DEFERRED
		do
			from
				i := clause.list_lower
			until
				i > clause.list_upper
			loop
				create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
				fd := pf.reference_at(feature_name)
				if fd = Void then
					errors.add_position(feature_name.position)
					errors.set(level_error, once "Cannot undefine inexistent feature: " + feature_name.name)
				elseif fd.is_frozen then
					errors.add_position(feature_name.position)
					errors.set(level_error, once "Cannot undefine frozen feature: " + feature_name.name)
				else
					inherited_feature := fd.the_feature
					create deferred_feature.make(type)
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

	redefine_features (pf: like parent_features; clause: LIBERTY_AST_PARENT_REDEFINE; conformant: BOOLEAN): INTEGER is
			-- replace the feature by a LIBERTY_FEATURE_REDEFINED
		local
			i: INTEGER; feature_name: LIBERTY_FEATURE_NAME; fd: LIBERTY_FEATURE_DEFINITION
			inherited_feature: LIBERTY_FEATURE; redefined_feature: LIBERTY_FEATURE
		do
			Result := clause.list_count
			if Result > 0 then
				from
					i := clause.list_lower
				until
					i > clause.list_upper
				loop
					create feature_name.make_from_ast(clause.list_item(i).feature_name_or_alias, type.ast, type.file)
					fd := pf.reference_at(feature_name)
					if fd = Void then
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Cannot redefine inexistent feature: " + feature_name.name)
					elseif fd.is_frozen then
						errors.add_position(feature_name.position)
						errors.set(level_error, once "Cannot redefine frozen feature: " + feature_name.name)
					else
						inherited_feature := fd.the_feature
						redefined_feature := inherited_feature.bound(type)
						if redefined_feature = Void then
							create {LIBERTY_FEATURE_REDEFINED} redefined_feature.make(type)
							redefined_feature.set_precondition(inherited_feature.precondition)
							redefined_feature.set_postcondition(inherited_feature.postcondition)
							redefined_feature.set_context(inherited_feature.context)
							if conformant then
								inherited_feature.bind(redefined_feature, type)
							end
						else
							--|*** TODO: ??? is it possible to have a non-related feature here???
						end
						fd.set_the_feature(redefined_feature)
					end
					i := i + 1
				end
			end
		end

	push_parent_features_in_type is
		local
			i: INTEGER
			fn, k: LIBERTY_FEATURE_NAME
			f: LIBERTY_FEATURE_DEFINITION
		do
			from
				i := parent_features.lower
			until
				i >  parent_features.upper
			loop
				f := parent_features.item(i)
				fn := f.feature_name
				debug
					k := parent_features.key(i)
					check
						fn.is_equal(k)
					end
				end
				if not type.has_feature(fn) then
					torch.burn
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
	parent_features: DICTIONARY[LIBERTY_FEATURE_DEFINITION, LIBERTY_FEATURE_NAME]

invariant
	parent_features /= Void
	redefined_features /= Void

end -- class LIBERTY_TYPE_PARENT_FEATURES_LOADER
