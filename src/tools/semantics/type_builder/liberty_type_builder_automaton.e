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

	has_loaded_features: BOOLEAN is
		do
			Result := builder.has_loaded_features
		end

	current_state: FIXED_STRING is
		do
			Result := builder.current_state
		end

feature {LIBERTY_TYPE}
	builder: LIBERTY_TYPE_BUILDER

feature {}
	make (a_type: LIBERTY_TYPE; a_universe: LIBERTY_UNIVERSE) is
		require
			a_type /= Void
			a_universe /= Void
		do
			create builder.make(a_type, a_universe)
			builder.set_automaton_context(automaton.start(once "checking header", builder))
		end

	errors: LIBERTY_ERRORS

	automaton: AUTOMATON[LIBERTY_TYPE_BUILDER] is
		once
			Result := {AUTOMATON[LIBERTY_TYPE_BUILDER] <<
																		"checking header", {STATE[LIBERTY_TYPE_BUILDER] <<
																																		  agent no_errors, agent init_header;
																																		  agent otherwise, agent abort
																																		  >>};
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
																		"checking type", {STATE[LIBERTY_TYPE_BUILDER] <<
																																		agent can_check_type, agent check_type;
																																		agent no_errors, agent stay;
																																		agent otherwise, agent abort
																																		>>}
																		>>}
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
			errors.set(level_fatal_error, "Errors have to be fixed, see above.")
			errors.emit
		ensure
			dead: False
		end

	init_header (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.full_name + ": init header")
			end
			ctx.init_header
			Result := once "loading parents"
		end

	load_parents (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.full_name + ": load parents")
			end
			ctx.load_parents
			if ctx.type.has_no_parents then
				-- meaning it's ANY, but
				--    ctx.type = ctx.universe.type_any
				-- may raise a precondition failure if errors.has_error
				Result := once "loading features"
			else
				Result := once "loading parents features"
			end
		end

	can_load_parent_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_load_parent_features
			debug
				if not Result then
					std_output.put_line(ctx.type.full_name + " cannot load parent features yet")
				end
			end
		end

	load_parent_features (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.full_name + ": load parent features")
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
				std_output.put_line(ctx.type.full_name + ": load features")
			end
			ctx.load_features
			debug
				std_output.put_line(ctx.type.full_name + ": features loaded")
			end
			Result := once "reconciling anchors"
		end

	can_reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_reconcile_anchors
		end

	reconcile_anchors (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.full_name + ": reconcile anchors")
			end
			if not ctx.reconcile_anchors then
				Result := once "reconciling anchors"
			else
				Result := once "checking type"
			end
		end

	can_check_type (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): BOOLEAN is
		do
			Result := ctx.can_check_type
		end

	check_type (ctx: LIBERTY_TYPE_BUILDER; state: STATE[LIBERTY_TYPE_BUILDER]): STRING is
		do
			debug
				std_output.put_line(ctx.type.full_name + ": check type")
			end
			check
				Result = Void
			end
		end

invariant
	builder /= Void

end -- class LIBERTY_TYPE_BUILDER_AUTOMATON
