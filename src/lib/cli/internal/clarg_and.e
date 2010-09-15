class CLARG_AND

inherit
	COMMAND_LINE_ARGUMENT
		redefine
			infix "and", infix "and then"
		end

create {COMMAND_LINE_ARGUMENT}
	make

feature {ANY}
	infix "and", infix "and then" (other: COMMAND_LINE_ARGUMENT): COMMAND_LINE_ARGUMENT is
		do
			args.add_last(other)
			mandatory_count_memory := -1
			Result := Current
		end

	is_set: BOOLEAN

	is_mandatory: BOOLEAN is
		do
			Result := args.exists(agent {COMMAND_LINE_ARGUMENT}.is_mandatory)
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			is_set := False
			set_count := 0
			args.do_all(agent {COMMAND_LINE_ARGUMENT}.prepare_parse)
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		do
			Result := parse_cli(context)
			is_set := set_count = mandatory_count
		end

	usage_summary (stream: OUTPUT_STREAM) is
		local
			i: INTEGER
		do
			from
				i := args.lower
			until
				i > args.upper
			loop
				if i > args.lower then
					stream.put_character(' ')
				end
				args.item(i).usage_summary(stream)
				i := i + 1
			end
			detailed := False
		end

	usage_details (stream: OUTPUT_STREAM) is
		do
			if not detailed then
				args.do_all(agent {COMMAND_LINE_ARGUMENT}.usage_details(stream))
				detailed := True
			end
		end

feature {}
	parse_cli (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		local
			i: INTEGER; arg: COMMAND_LINE_ARGUMENT; ctx: COMMAND_LINE_CONTEXT
		do
			from
				Result := context
				i := args.lower
			until
				not Result.is_parsed or else i > args.upper
			loop
				arg := args.item(i)
				if not arg.is_set then
					ctx := arg.parse_command_line(Result)
					if ctx.is_parsed and then arg.is_set then
						ctx := parse_cli(ctx)
						check
							arg.is_set
						end
						if ctx.is_parsed then
							Result := ctx
							if arg.is_mandatory then
								set_count := set_count + 1
							end
						else
							arg.prepare_parse
						end
					end
				end
				i := i + 1
			end
		end

	mandatory_count: INTEGER is
		local
			i: INTEGER
		do
			Result := mandatory_count_memory
			if Result < 0 then
				from
					Result := 0
					i := args.lower
				invariant
				variant
					(args.upper - args.lower + 1) - i
				until
					i > args.upper
				loop
					if args.item(i).is_mandatory then
						Result := Result + 1
					end
					i := i + 1
				end
				mandatory_count_memory := Result
			end
		end

feature {}
	args: FAST_ARRAY[COMMAND_LINE_ARGUMENT]
	set_count: INTEGER
	mandatory_count_memory: INTEGER

	make (a_left, a_right: COMMAND_LINE_ARGUMENT) is
		require
			a_left /= Void
			a_right /= Void
		do
			args := {FAST_ARRAY[COMMAND_LINE_ARGUMENT] << a_left, a_right >> }
			mandatory_count_memory := -1
		end

invariant
	args.count >= 2

end -- class CLARG_AND
