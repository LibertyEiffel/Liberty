class CLARG_STRINGS

inherit
	CLARG_WITH_ARGS[FIXED_STRING]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {CLARG_PARSER}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := True
		end

feature {}
	decode (arg: STRING): FIXED_STRING is
		do
			Result := arg.intern
		end

end -- CLARG_STRINGS
