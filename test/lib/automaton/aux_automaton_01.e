class AUX_AUTOMATON_01

creation {TEST_AUTOMATON_01}
	make

feature {TEST_AUTOMATON_01}
	is_number: BOOLEAN

	found_number: FIXED_STRING is
		require
			is_number
		do
			Result := last_numeric.intern
		end

feature {}
	make (a_input: ABSTRACT_STRING) is
		require
			a_input /= Void
		do
			last_numeric.clear_count
			create input.from_string(a_input.out.twin)
			automaton.run(once "start");
			input.disconnect
		end

	input: STRING_INPUT_STREAM

	last_character: CHARACTER
	last_numeric: STRING is ""

	read_next is
		do
			input.read_character
			if input.end_of_input then
				debug("test/aux_automaton_01")
					std_output.put_line("No more characters")
				end
			else
				last_character := input.last_character
				debug("test/aux_automaton_01")
					std_output.put_line("Read character '" + last_character.out + "'")
				end
			end
		end

	on_read_figure: BOOLEAN is
		do
			if not input.end_of_input then
				Result := last_character.is_digit
			end
		end

	on_read_dot: BOOLEAN is
		do
			if not input.end_of_input then
				Result := last_character = '.'
			end
		end

	on_end_of_text: BOOLEAN is
		do
			Result := input.end_of_input
		end

	otherwise: BOOLEAN is
		do
			Result := True
		end

	transition (next: STRING): STRING is
		do
			last_numeric.extend(last_character)
			Result := next
		end

	transition_end (next: STRING): STRING is
		do
			inspect next
			when "success" then
				is_number := True
			when "error" then
				is_number := False
			end
			Result := next
		end

	finished: STRING is
		do
			check Result = Void end
		end

	automaton: AUTOMATON is
		do -- not once!
			Result := {AUTOMATON <<
										  "start", {STATE <<
																  agent on_read_figure, agent transition("integral");
																  agent on_read_dot, agent transition("after_dot");
																  agent otherwise, agent transition_end("error")
																  >>};
										  "integral", {STATE <<
																	  agent on_read_figure, agent transition("integral");
																	  agent on_read_dot, agent transition("after_dot");
																	  agent on_end_of_text, agent transition_end("success");
																	  agent otherwise, agent transition_end("error")
																	  >>};
										  "after_dot", {STATE <<
																		agent on_read_figure, agent transition("fractional");
																		agent otherwise, agent transition_end("error")
																		>>};
										  "fractional", {STATE <<
																		 agent on_read_figure, agent transition("fractional");
																		 agent on_end_of_text, agent transition_end("success");
																		 agent otherwise, agent transition_end("error")
																		 >>};
										  "success", {STATE <<
																agent otherwise, agent finished
																>>};
										  "error", {STATE <<
																  agent otherwise, agent finished
																  >>}
										  >>}
			Result.set_before_guards(agent read_next)
		end

end
