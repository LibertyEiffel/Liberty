deferred class COMMAND_LINE_ARGUMENT

feature {ANY}
	infix "or", infix "or else" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT is
		require
			other /= Void
		do
			create {CLARG_OR} Result.make(Current, other)
		ensure
			Result /= Void
		end

	infix "and", infix "and then" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT is
		require
			other /= Void
		do
			create {CLARG_AND} Result.make(Current, other)
		ensure
			Result /= Void
		end

	prefix "not": COMMAND_LINE_ARGUMENT is
		do
			create {CLARG_NOT} Result.make(Current)
		ensure
			Result /= Void
		end

feature {ANY}
	is_set: BOOLEAN is
			-- True if the option is present and correct.
		deferred
		end

	is_mandatory: BOOLEAN is
			-- True if the argument must be present.
		deferred
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		deferred
		ensure
			not is_set
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		require
			context.is_parsed
		deferred
		end

	usage_summary (stream: OUTPUT_STREAM) is
		deferred
		ensure
			not detailed
		end

	usage_details (stream: OUTPUT_STREAM) is
		deferred
		ensure
			detailed
		end

feature {}
	detailed: BOOLEAN

end -- class COMMAND_LINE_ARGUMENT
