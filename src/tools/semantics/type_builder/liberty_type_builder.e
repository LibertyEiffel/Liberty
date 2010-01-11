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

	load_parents is
			-- Just load the parent types, not trying to import anything yet, just to let the universe know that
			-- those classes will be needed, and for us to be able to iterate through all the type's parents
		local
			loader: LIBERTY_TYPE_PARENT_LOADER
		do
			check
				effective_generic_parameters = empty_effective_generic_parameters
			end
			create loader.make(Current, type, universe, empty_effective_generic_parameters)
			loader.load
		end

	can_load_parent_features: BOOLEAN is
			-- True if all the parents have finished loading their features
		do
			Result := check_have_loaded_features(type.conformant_parents)
				and then check_have_loaded_features(type.non_conformant_parents)
		end

	load_parent_features is
			-- Load the parent features, considering renamings, redefinitions and so on
		local
			loader: LIBERTY_TYPE_PARENT_FEATURES_LOADER
		do
			create loader.make(Current, type, universe, effective_generic_parameters)
			loader.load
		end

	can_load_features: BOOLEAN is True
			-- Currently always True

	load_features is
			-- Load the type's own features, not trying to reconcile anchors yet.
			-- The full semantics tree of each feature is built here.
		do
			--create {LIBERTY_TYPE_FEATURES_LOADER}.load(type, universe)
		end

	can_reconcile_anchors: BOOLEAN is True
			-- Currently always True

	reconcile_anchors: BOOLEAN is
			-- Try to reconcile anchors using other features' result types.
			-- True if all the anchors were reconciled, False if some are left to do later.
		do
			--create {LIBERTY_TYPE_ANCHORS_RESOLVER}.resolve(type, universe)
		end

feature {}
	check_have_loaded_features (parents: INDEXABLE[LIBERTY_TYPE]): BOOLEAN is
		local
			i: INTEGER
		do
			Result := True
			if parents /= Void then
				from
					i := parents.lower
				until
					not Result or else i > parents.upper
				loop
					Result := parents.item(i).has_loaded_features
					i := i + 1
				end
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

	get_type_from_type_definition (origin: LIBERTY_TYPE; type_definition: LIBERTY_AST_TYPE_DEFINITION): LIBERTY_TYPE is
		do
			Result := universe.get_type_from_type_definition(origin, type_definition, effective_generic_parameters)
		end

feature {LIBERTY_TYPE_PARENT_LOADER}
	set_effective_generic_parameters (effective: like effective_generic_parameters) is
		require
			useful: not effective.is_empty
		do
			effective_generic_parameters := effective
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

feature {}
	make (a_type: like type; a_universe: like universe) is
		require
			a_type /= Void
			a_universe /= Void
		do
			type := a_type
			universe := a_universe
			effective_generic_parameters := empty_effective_generic_parameters
		ensure
			type = a_type
			universe = a_universe
		end

	errors: LIBERTY_ERRORS

invariant
	effective_generic_parameters /= Void

end -- class LIBERTY_TYPE_BUILDER
