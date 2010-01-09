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
class LIBERTY_TYPE_BUILDER_AUTOMATON

insert
	LIBERTY_ERROR_LEVELS

creation {LIBERTY_TYPE}
	make

feature {LIBERTY_TYPE}
	build_more is
		require
			not is_built
		do
			automaton.next(builder.automaton_context)
		end

	is_built: BOOLEAN is
		do
			Result := not builder.automaton_context.is_valid
		end

feature {}
	make (a_type: like type; a_universe: like universe) is
		require
			a_type /= Void
			a_universe /= Void
		do
			create builder.make(a_type, a_universe)
			builder.set_automaton_context(automaton.start(once "loading parents", Result))
		ensure
			builder.is_valid
		end

	builder: LIBERTY_TYPE_BUILDER

	errors: LIBERTY_ERRORS

	automaton: AUTOMATON[LIBERTY_TYPE_BUILDER] is
		once
			Result := {AUTOMATON[LIBERTY_TYPE_BUILDER] <<
																				  "loading parents", {STATE[LIBERTY_TYPE_BUILDER] <<
																																								agent no_errors, agent load_parents;
																																								agent otherwise, agent abort
																																								>>};
																				  "loading parents entities", {STATE[LIBERTY_TYPE_BUILDER] <<
																																											agent can_load_parent_entities, agent load_parent_entities;
																																											agent no_errors, agent stay;
																																											agent otherwise, agent abort
																																											>>};
																				  "loading entities", {STATE[LIBERTY_TYPE_BUILDER] <<
																																								 agent can_load_entities, agent load_entities;
																																								 agent no_errors, agent stay;
																																								 agent otherwise, agent abort
																																								 >>};
																				  "reconciling anchors", {STATE[LIBERTY_TYPE_BUILDER] <<
																																									 agent can_reconcile_anchors, agent reconcile_anchors;
																																									 agent no_errors, agent stay;
																																									 agent otherwise, agent abort
																																									 >>};
																				  >>};
		end

	otherwise: BOOLEAN is True

	errors: LIBERTY_ERRORS

	no_errors: BOOLEAN is
		do
			Result := not errors.has_errors
		end

	stay (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): FIXED_STRING is
		do
			Result := state.name
		end

	abort (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): FIXED_STRING is
		require
			errors.has_errors
		do
			errors.set(level_fatal_error,
						  "Errors were found while " + state.name.out + " of type " + ctx.type.name.out + " (see above). Please fix them first.")
			errors.emit
		ensure
			dead: False
		end

	load_parents (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			ctx.load_parents
			Result := once "loading parent entities"
		end

	can_load_parent_entities (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_load_entities
		end

	load_parent_entities (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			ctx.load_parent_entities
			Result := once "loading entities"
		end

	can_load_entities (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_load_entities
		end

	load_entities (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			ctx.load_entities
			Result := once "reconciling anchors"
		end

	can_reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_reconcile_anchors
		end

	reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			ctx.reconcile_anchors
			if ctx.type.entities_have_anchors then
				Result := once "reconciling anchors"
			else
				check
					done: Result = Void
				end
			end
		end

end -- class LIBERTY_TYPE_BUILDER_AUTOMATON
