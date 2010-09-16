class CLARG_STRING

inherit
	CLARG_WITH_ARG[FIXED_STRING]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: FIXED_STRING

	is_set: BOOLEAN is
		do
			Result := item /= Void
		end

feature {CLARG_PARSER}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := True
		end

feature {}
	set_data (context: COMMAND_LINE_CONTEXT; arg: STRING) is
		do
			item := arg.intern
		end

	unset is
		do
			item := Void
		end

end -- CLARG_STRING
