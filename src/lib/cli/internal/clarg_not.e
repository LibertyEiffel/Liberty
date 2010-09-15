class CLARG_NOT

inherit
	COMMAND_LINE_ARGUMENT
		redefine
			prefix "not"
		end

create {COMMAND_LINE_ARGUMENT}
	make

feature {ANY}
	prefix "not": COMMAND_LINE_ARGUMENT is
		do
			Result := arg
		end

	is_set: BOOLEAN is
		do
			Result := arg.is_set
		end

	is_mandatory: BOOLEAN is
		do
			Result := arg.is_mandatory
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			arg.prepare_parse
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		do
			Result := arg.parse_command_line(context)
			if not Result.is_parsed then
				Result := context
			end
		end

	usage_summary (stream: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			stream.put_character('~')
			stream.put_character('(')
			arg.usage_summary(stream)
			stream.put_character(')')
			detailed := False
		end

	usage_details (stream: OUTPUT_STREAM) is
		do
			if not detailed then
				arg.usage_details(stream)
				detailed := True
			end
		end

feature {}
	arg: COMMAND_LINE_ARGUMENT

	make (a_arg: COMMAND_LINE_ARGUMENT) is
		require
			a_arg /= Void
		do
			arg := a_arg
		end

invariant
	arg /= Void

end -- class CLARG_NOT
