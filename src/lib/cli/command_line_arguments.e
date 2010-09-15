class COMMAND_LINE_ARGUMENTS

insert
	ARGUMENTS

create {ANY}
	make

feature {ANY}
	set_helper (a_helper: like helper) is
		do
			if a_helper /= Void then
				helper := a_helper
			else
				helper := agent default_helper
			end
		ensure
			a_helper /= Void implies helper = a_helper
		end

	parse_command_line: BOOLEAN is
		do
			Result := parse_argument(cli_argument)
			if not Result and then parse_argument(help_argument) then
				if help_argument.is_set then
					helper.call([Current])
					Result := True
				end
			end
		end

	usage (stream: OUTPUT_STREAM) is
		do
			stream.put_line(once "Usage: ")
			cli_argument.usage_summary(stream)
			stream.put_new_line
			stream.put_new_line
			stream.put_line(once "Options:")
			cli_argument.usage_details(stream)
		end

feature {}
	parse_argument (a_argument: COMMAND_LINE_ARGUMENT): BOOLEAN is
		local
			context: COMMAND_LINE_CONTEXT
		do
			context.init
			a_argument.prepare_parse
			context := a_argument.parse_command_line(context)
			Result := context.is_parsed
				and then (a_argument.is_mandatory implies a_argument.is_set)
				and then (context.index = argument_count + 1 or else (context.is_short and then context.short_index = argument_count + 1))
		end

	make (a_argument: like cli_argument) is
		require
			a_argument /= Void
		do
			cli_argument := a_argument
			helper := agent default_helper
		ensure
			cli_argument = a_argument
		end

	cli_argument: COMMAND_LINE_ARGUMENT

	help_argument: COMMAND_LINE_ARGUMENT is
		local
			factory: COMMAND_LINE_ARGUMENT_FACTORY
		once
			Result := factory.option_boolean("h", "help", Void)
		end

	helper: PROCEDURE[TUPLE[COMMAND_LINE_ARGUMENTS]]

	default_helper (a_arguments: COMMAND_LINE_ARGUMENTS) is
		do
			check a_arguments = Current end
			a_arguments.usage(std_output)
			die_with_code(0)
		end

invariant
	cli_argument /= Void

end
