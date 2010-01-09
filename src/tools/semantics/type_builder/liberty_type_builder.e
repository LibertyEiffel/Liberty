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

insert
	LIBERTY_ERROR_LEVELS

creation {LIBERTY_TYPE_BUILDER}
	make

feature {LIBERTY_TYPE_BUILDER}
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
		do
			create {LIBERTY_TYPE_PARENT_LOADER}.load(type, universe)
		end

	can_load_parent_entities: BOOLEAN is
			-- True if all the parents have finished loading their entities
		do
			Result := check_have_loaded_entities(type.conformant_parents)
				and then check_have_loaded_entities(type.non_conformant_parents)
		end

	load_parent_entities is
			-- Load the parent entities, considering renamings, redefinitions and so on
		do
			create {LIBERTY_TYPE_PARENT_ENTITIES_LOADER}.load(type, universe)
		end

	can_load_entities: BOOLEAN is True
			-- Currently always True

	load_entities is
			-- Load the type's own entities, not trying to reconcile anchors yet.
			-- The full semantics tree of each feature is built here.
		do
			create {LIBERTY_TYPE_ENTITIES_LOADER}.load(type, universe)
		end

	can_reconcile_anchors: BOOLEAN is True
			-- Currently always True

	reconcile_anchors is
			-- Try to reconcile anchors using other entities' result types
		do
			create {LIBERTY_TYPE_ANCHORS_RESOLVER}.resolve(type, universe)
		end

feature {}
	check_have_loaded_entities (parents: INDEXABLE[LIBERTY_TYPE]): BOOLEAN is
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
					Result := parents.item(i).has_loaded_entities
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
		ensure
			type = a_type
			universe = a_universe
		end

	errors: LIBERTY_ERRORS

end -- class LIBERTY_TYPE_BUILDER
