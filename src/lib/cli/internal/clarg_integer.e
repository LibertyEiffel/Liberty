class CLARG_INTEGER

inherit
	CLARG_WITH_ARG[INTEGER]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: INTEGER
	is_set: BOOLEAN

feature {CLARG_PARSER}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := arg.is_integer
		end

feature {}
	set_data (context: COMMAND_LINE_CONTEXT; arg: STRING) is
		do
			item := arg.to_integer
			is_set := True
		end

	unset is
		do
			is_set := False
		end

end -- CLARG_INTEGER
