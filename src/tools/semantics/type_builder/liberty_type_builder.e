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

insert
	LIBERTY_ERROR_LEVELS

creation {LIBERTY_TYPE_BUILDER_AUTOMATON}
	make

feature {LIBERTY_TYPE_BUILDER_AUTOMATON}
	type: LIBERTY_TYPE
	universe: LIBERTY_UNIVERSE
	automaton_context: AUTOMATON_CONTEXT[LIBERTY_TYPE_BUILDER]

	set_automaton_context (a: like automaton_context) is
		require
			a /= Void
			automaton_context = Void
		do
			automaton_context := a
		ensure
			automaton_context = a
		end

	init_header is
			-- Initialize the type using its header: check the name and compare the formal type parameters to the
			-- given effective parameters.
		local
			init: LIBERTY_TYPE_INIT
		do
			check
				effective_generic_parameters = empty_effective_generic_parameters
			end
			create init.make(Current, type, universe, empty_effective_generic_parameters)
			init.init_type_header
		end

	load_parents is
			-- Just load the parent types, not trying to import anything yet, just to let the universe know that
			-- those classes will be needed, and for us to be able to iterate through all the type's parents
		local
			loader: LIBERTY_TYPE_PARENT_LOADER
		do
			create loader.make(Current, type, universe, effective_generic_parameters)
			loader.load
		end

	can_load_parent_features: BOOLEAN is
			-- True if all the parents have finished loading their features
		do
			if not errors.has_error then
				Result := check_have_loaded_features(type.conformant_parents)
					and then check_have_loaded_features(type.non_conformant_parents)
				debug
					if Result then
						std_output.put_line(type.name + " can load its parent's features")
					end
				end
			end
		end

	load_parent_features is
			-- Load the parent features, considering renamings, redefinitions and so on
		local
			loader: LIBERTY_TYPE_PARENT_FEATURES_LOADER
		do
			check redefined_features = no_redefined_features end
			create loader.make(Current, type, universe, effective_generic_parameters, no_redefined_features)
			loader.load
		end

	can_load_features: BOOLEAN is
			-- Currently always True
		do
			Result := not errors.has_error
		end

	load_features is
			-- Load the type's own features, not trying to reconcile anchors yet.
			-- The full semantics tree of each feature is built here.
		local
			loader: LIBERTY_TYPE_FEATURES_LOADER
		do
			check anchored_types = no_anchored_types end
			create loader.make(Current, type, universe, effective_generic_parameters, redefined_features, anchored_types)
			loader.load
			if not anchored_types.is_empty then
				sedb_breakpoint
			end
		end

	can_reconcile_anchors: BOOLEAN is
			-- Currently always True
		do
			Result := not errors.has_error
		end

	reconcile_anchors: BOOLEAN is
			-- Try to reconcile anchors using other features' result types.
			-- True if all the anchors were reconciled, False if some are left to do later.
		do
			--create {LIBERTY_TYPE_ANCHORS_RESOLVER}.resolve(type, universe)
		end

	can_check_type: BOOLEAN is
			-- Currently always True
		do
			Result := not errors.has_error
		end

	check_type is
			-- Check the type integrity: types conformance (assignments), BOOLEAN (assertions, if, until....)
			-- and so on
		do
			--create {LIBERTY_TYPE_CHECKER}.check_type(type, universe)
		end

feature {}
	check_have_loaded_features (parents: INDEXABLE[LIBERTY_TYPE]): BOOLEAN is
		local
			i: INTEGER
		do
			Result := True
			from
				i := parents.lower
			until
				not Result or else i > parents.upper
			loop
				Result := parents.item(i).has_loaded_features
				i := i + 1
			end
		end

feature {LIBERTY_TYPE_BUILDER_TOOLS}
	effective_generic_parameter (formal_parameter_name: ABSTRACT_STRING): LIBERTY_TYPE is
		require
			formal_parameter_name /= Void
			has_effective_generic_parameter(formal_parameter_name)
		do
			Result := effective_generic_parameters.reference_at(formal_parameter_name.intern)
		end

	has_effective_generic_parameter (formal_parameter_name: ABSTRACT_STRING): BOOLEAN is
		require
			formal_parameter_name /= Void
		do
			Result := effective_generic_parameters.fast_has(formal_parameter_name.intern)
		end

	get_type_from_type_definition (type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		do
			Result := universe.get_type_from_type_definition(type, type_definition, effective_generic_parameters)
		end

feature {LIBERTY_TYPE_INIT}
	set_effective_generic_parameters (effective: like effective_generic_parameters) is
		require
			useful: not effective.is_empty
		do
			debug
				std_output.put_line(type.full_name + ": computed effective generic parameters: " + effective.out)
			end
			effective_generic_parameters := effective
		ensure
			effective_generic_parameters = effective
		end

feature {LIBERTY_TYPE_PARENT_FEATURES_LOADER}
	set_redefined_features (redefined: like redefined_features) is
		require
			useful: not redefined.is_empty
		do
			redefined_features := redefined
		ensure
			redefined_features = redefined
		end

feature {LIBERTY_TYPE_FEATURES_LOADER}
	set_anchored_types (anchored: like anchored_types) is
		require
			useful: not anchored.is_empty
		do
			anchored_types := anchored
		ensure
			anchored_types = anchored
		end

feature {}
	effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING]
			-- key: generic parameter name (e.g. E_)
			-- value: effective parameter (e.g. STRING)

	empty_effective_generic_parameters: DICTIONARY[LIBERTY_TYPE, FIXED_STRING] is
		once
			-- Special common case (no effective parameters) factored out, using the smallest possible structure
			-- (an empty AVL tree)
			create {AVL_DICTIONARY[LIBERTY_TYPE, FIXED_STRING]} Result.make
		end

	redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]

	no_redefined_features: DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME] is
		once
			create {HASHED_DICTIONARY[LIBERTY_FEATURE_REDEFINED, LIBERTY_FEATURE_NAME]} Result.make
		end

	anchored_types: COLLECTION[LIBERTY_ANCHORED_TYPE]

	no_anchored_types: COLLECTION[LIBERTY_ANCHORED_TYPE] is
		once
			create {FAST_ARRAY[LIBERTY_ANCHORED_TYPE]} Result.with_capacity(0)
		end

feature {}
	make (a_type: like type; a_universe: like universe) is
		require
			a_type /= Void
			a_universe /= Void
		do
			type := a_type
			universe := a_universe
			effective_generic_parameters := empty_effective_generic_parameters
			redefined_features := no_redefined_features
			anchored_types := no_anchored_types
		ensure
			type = a_type
			universe = a_universe
		end

	errors: LIBERTY_ERRORS

invariant
	effective_generic_parameters /= Void
	redefined_features /= Void
	anchored_types /= Void

end -- class LIBERTY_TYPE_BUILDER
