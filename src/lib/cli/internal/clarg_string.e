class CLARG_STRING

inherit
	CLARG_WITH_ARG[STRING]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: STRING

	is_set: BOOLEAN is
		do
			Result := item /= Void
		end

feature {CLARG_WITH_ARG}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := True
		end

feature {}
	set_data (arg: STRING) is
		do
			if item = Void then
				item := ""
			end
			item.copy(arg)
		end

	unset is
		do
			item := Void
		end

end -- CLARG_STRING
