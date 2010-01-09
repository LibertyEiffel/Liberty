class AUX_AUTOMATON_01

creation {TEST_AUTOMATON_01}
	make

feature {TEST_AUTOMATON_01}
	run is
		do
			automaton.run(once "start", context);
		end

	is_number: BOOLEAN is
		do
			Result := context.success
		end

	found_number: FIXED_STRING is
		require
			is_number
		do
			Result := context.output
		end

feature {}
	make (a_input: ABSTRACT_STRING) is
		require
			a_input /= Void
		do
			create context.make(a_input)
		end

	context: AUX_AUTOMATON_01_CONTEXT

feature {} -- automaton implementation

	-- Note: since the automaton is a once function, no agent may rely on Current.
	-- That's why the automaton allows us to pass some context around.

	read_next (ctx: like context) is
		do
			ctx.next
			debug("test/aux_automaton_01")
				if ctx.is_off then
					std_output.put_line("No more characters")
				else
					std_output.put_line("Read character '" + ctx.current_character.out + "'")
				end
			end
		end

	on_read_figure (ctx: like context): BOOLEAN is
		do
			if not ctx.is_off then
				Result := ctx.current_character.is_digit
			end
		end

	on_read_dot (ctx: like context): BOOLEAN is
		do
			if not ctx.is_off then
				Result := ctx.current_character = '.'
			end
		end

	on_end_of_text (ctx: like context): BOOLEAN is
		do
			Result := ctx.is_off
		end

	otherwise: BOOLEAN is
		do
			Result := True
		end

	transition (next: STRING; ctx: like context): STRING is
		do
			ctx.extend
			Result := next
		end

	transition_end (next: STRING; ctx: like context): STRING is
		do
			inspect next
			when "success" then
				ctx.set_success(True)
			when "error" then
				ctx.set_success(False)
			end
			Result := next
		end

	finished: STRING is
		do
			check Result = Void end
		end

	automaton: AUTOMATON[AUX_AUTOMATON_01_CONTEXT] is
		once
			Result := {AUTOMATON[AUX_AUTOMATON_01_CONTEXT] <<
																			 "start", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																		agent on_read_figure, agent transition("integral", ?);
																																		agent on_read_dot, agent transition("after_dot", ?);
																																		agent otherwise, agent transition_end("error", ?)
																																		>>};
																			 "integral", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																			agent on_read_figure, agent transition("integral", ?);
																																			agent on_read_dot, agent transition("after_dot", ?);
																																			agent on_end_of_text, agent transition_end("success", ?);
																																			agent otherwise, agent transition_end("error", ?)
																																			>>};
																			 "after_dot", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																			 agent on_read_figure, agent transition("fractional", ?);
																																			 agent otherwise, agent transition_end("error", ?)
																																			 >>};
																			 "fractional", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																			  agent on_read_figure, agent transition("fractional", ?);
																																			  agent on_end_of_text, agent transition_end("success", ?);
																																			  agent otherwise, agent transition_end("error", ?)
																																			  >>};
																			 "success", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																		  agent otherwise, agent finished
																																		  >>};
																			 "error", {STATE[AUX_AUTOMATON_01_CONTEXT] <<
																																		agent otherwise, agent finished
																																		>>}
																			 >>}
			Result.set_before_guards(agent read_next)
		end

invariant
	context /= Void

end
