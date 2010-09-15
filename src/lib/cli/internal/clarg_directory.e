class CLARG_DIRECTORY

inherit
	CLARG_WITH_ARG[DIRECTORY]

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: DIRECTORY

	is_set: BOOLEAN is
		do
			Result := item /= Void
		end

feature {CLARG_WITH_ARG}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			bd.ensure_system_notation
			if bd.system_notation.is_valid_path(arg) then
				Result := ft.file_exists(arg) and then ft.is_directory(arg)
			end
		end

feature {}
	set_data (arg: STRING) is
		do
			create item.scan(arg)
		end

	unset is
		do
			item := Void
		end

	bd: BASIC_DIRECTORY
	ft: FILE_TOOLS

end -- CLARG_DIRECTORY
