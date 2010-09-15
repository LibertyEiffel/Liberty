class CLARG_FILE

inherit
	CLARG_WITH_ARG[REGULAR_FILE]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: REGULAR_FILE

	is_set: BOOLEAN is
		do
			Result := item /= Void
		end

feature {CLARG_WITH_ARG}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			bd.ensure_system_notation
			if bd.system_notation.is_valid_path(arg) then
				Result := not ft.file_exists(arg) or else not ft.is_directory(arg)
			end
		end

feature {}
	set_data (arg: STRING) is
		do
			create item.make(arg)
		end

	unset is
		do
			item := Void
		end

	bd: BASIC_DIRECTORY
	ft: FILE_TOOLS

end -- CLARG_FILE
