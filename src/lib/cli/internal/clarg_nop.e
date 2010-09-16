class CLARG_NOP

inherit
	COMMAND_LINE_ARGUMENT

create {COMMAND_LINE_ARGUMENT_FACTORY}
	make

feature {ANY}
	is_set: BOOLEAN
	is_mandatory: BOOLEAN is True
	is_repeatable: BOOLEAN is False

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			is_set := False
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		do
			Result := context
			is_set := True
		ensure
			Result.is_parsed
			Result.index = context.index
		end

	usage_summary (stream: OUTPUT_STREAM) is
		do
			detailed := False
		end

	usage_details (stream: OUTPUT_STREAM) is
		do
			detailed := True
		end

	undo_parse (context: COMMAND_LINE_CONTEXT) is
		do
			is_set := False
		end

	is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN is
		do
			Result := is_set
		end

feature {}
	make is
		do
		end

	detailed: BOOLEAN

end -- class CLARG_NOP
