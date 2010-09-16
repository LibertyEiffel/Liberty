class CLARG_INTEGERS

inherit
	CLARG_WITH_ARGS[INTEGER]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {CLARG_PARSER}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := arg.is_integer
		end

feature {}
	decode (arg: STRING): INTEGER is
		do
			Result := arg.to_integer
		end

end -- CLARG_INTEGERS
