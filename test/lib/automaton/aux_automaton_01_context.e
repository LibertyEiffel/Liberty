class AUX_AUTOMATON_01_CONTEXT

creation {AUX_AUTOMATON_01}
	make

feature {AUX_AUTOMATON_01}
	output: FIXED_STRING is
		do
			Result := output_memory.intern
		end

	extend is
		do
			output_memory.extend(current_character)
		ensure
			output.count = old (output.count + 1)
			output.last = current_character
		end

	current_character: CHARACTER is
		require
			not is_off
		do
			Result := input.item(index)
		end

	next is
		do
			index := index + 1
		end

	is_off: BOOLEAN is
		do
			Result := not input.valid_index(index)
		end

	success: BOOLEAN

	set_success (s: BOOLEAN) is
		do
			success := s
		ensure
			success = s
		end

feature {}
	make (a_string: ABSTRACT_STRING) is
		require
			a_string /= Void
		do
			input := a_string.intern
			output_memory := ""
			index := input.lower - 1
		end

	input: FIXED_STRING
	output_memory: STRING
	index: INTEGER

end
