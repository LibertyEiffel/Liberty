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

	has_loaded_features: BOOLEAN

feature {}
	make (a_type: LIBERTY_TYPE; a_universe: LIBERTY_UNIVERSE) is
		require
			a_type /= Void
			a_universe /= Void
		do
			create builder.make(a_type, a_universe)
			builder.set_automaton_context(automaton.start(once "loading parents", builder))
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
																				  "loading parents features", {STATE[LIBERTY_TYPE_BUILDER] <<
																																											agent can_load_parent_features, agent load_parent_features;
																																											agent no_errors, agent stay;
																																											agent otherwise, agent abort
																																											>>};
																				  "loading features", {STATE[LIBERTY_TYPE_BUILDER] <<
																																								 agent can_load_features, agent load_features;
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

	no_errors: BOOLEAN is
		do
			Result := not errors.has_error
		end

	stay (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): FIXED_STRING is
		do
			Result := state.name
		end

	abort (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): FIXED_STRING is
		require
			errors.has_error
		do
			errors.set(level_fatal_error,
						  "Errors were found while " + state.name.out + " of type " + ctx.type.name.out + " (see above). Please fix them first.")
			errors.emit
		ensure
			dead: False
		end

	load_parents (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.name + once ": load parents")
			end
			ctx.load_parents
			if ctx.type = ctx.universe.type_any then
				Result := once "loading features"
			else
				Result := once "loading parents features"
			end
		end

	can_load_parent_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_load_parent_features
		end

	load_parent_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.name + once ": load parent features")
			end
			ctx.load_parent_features
			Result := once "loading features"
		end

	can_load_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_load_features
		end

	load_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.name + once ": load features")
			end
			ctx.load_features
			has_loaded_features := True
			Result := once "reconciling anchors"
		end

	can_reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_reconcile_anchors
		end

	reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.name + once ": reconcile anchors")
			end
			if not ctx.reconcile_anchors then
				Result := once "reconciling anchors"
			else
				check
					done: Result = Void
				end
			end
		end

end -- class LIBERTY_TYPE_BUILDER_AUTOMATON
