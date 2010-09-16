class CLARG_OR

inherit
	COMMAND_LINE_ARGUMENT
		redefine
			infix "or", infix "or else"
		end

create {COMMAND_LINE_ARGUMENT}
	make

feature {ANY}
	is_repeatable: BOOLEAN is False

	infix "or", infix "or else" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT is
		do
			args.add_last(other)
			Result := Current
		end

	is_set: BOOLEAN

	is_mandatory: BOOLEAN is
		do
			Result := args.for_all(agent {COMMAND_LINE_ARGUMENT}.is_mandatory)
		end

	is_set_at (context: COMMAND_LINE_CONTEXT): BOOLEAN is
		do
			Result := args.exists(agent {COMMAND_LINE_ARGUMENT}.is_set_at(context))
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			is_set := False
			args.do_all(agent {COMMAND_LINE_ARGUMENT}.prepare_parse)
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		local
			i: INTEGER
		do
			from
				Result := args.first.parse_command_line(context)
				i := args.lower + 1
			until
				is_set or else i > args.upper
			loop
				Result := args.item(i).parse_command_line(Result)
				if Result.is_parsed then
					is_set := args.item(i).is_set
				end
				i := i + 1
			end
		end

	usage_summary (stream: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			stream.put_character('[')
			from
				i := args.lower
			until
				i > args.upper
			loop
				if i > args.lower then
					stream.put_character('|')
				end
				args.item(i).usage_summary(stream)
				i := i + 1
			end
			stream.put_character(']')
			detailed := False
		end

	usage_details (stream: OUTPUT_STREAM) is
		do
			if not detailed then
				args.do_all(agent {COMMAND_LINE_ARGUMENT}.usage_details(stream))
				detailed := True
			end
		end

	undo_parse (context: COMMAND_LINE_CONTEXT) is
		do
			args.do_all(agent {COMMAND_LINE_ARGUMENT}.undo_parse(context))
		end

feature {}
	args: FAST_ARRAY[COMMAND_LINE_ARGUMENT]

	make (a_left, a_right: COMMAND_LINE_ARGUMENT) is
		require
			a_left /= Void
			a_right /= Void
		do
			args := {FAST_ARRAY[COMMAND_LINE_ARGUMENT] << a_left, a_right >> }
		end

	detailed: BOOLEAN

invariant
	args.count >= 2

end -- class CLARG_OR
