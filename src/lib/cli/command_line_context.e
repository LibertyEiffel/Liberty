expanded class COMMAND_LINE_CONTEXT

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	index: INTEGER
			-- set to the next argument to read

	short_index: INTEGER
			-- set to the next option parameter position when parsing a short parameters sequence

	short_option_index: INTEGER
			-- position of the short option in the short option sequence

	is_parsed: BOOLEAN is
			-- True if the parsing may continue. False if a grave parsing error occurs (such as an option present
			-- but with invalid data)
		do
			Result := index > 0
		end

	is_short: BOOLEAN is
		do
			Result := short_option_index > 1
		end

feature {COMMAND_LINE_ARGUMENTS}
	init is
		do
			index := 1
			short_index := 2
			short_option_index := 1
		ensure
			index = 1
			is_parsed
		end

feature {COMMAND_LINE_ARGUMENT}
	set_short (a_short_index: like short_index; a_short_option_index: like short_option_index) is
		require
			a_short_index > index
		do
			short_index := a_short_index
			short_option_index := a_short_option_index
		ensure
			short_index = a_short_index
			short_option_index = a_short_option_index
			is_short
		end

	set_index (a_index: like index) is
		require
			a_index > 0
		do
			index := a_index
			short_index := a_index + 1
			short_option_index := 1
		ensure
			index = a_index
			not is_short
		end

invariant
	index > 0 implies short_index > index
	index > 0 implies short_option_index >= 1

end -- class COMMAND_LINE_CONTEXT
