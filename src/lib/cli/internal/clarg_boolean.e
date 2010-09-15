class CLARG_BOOLEAN

inherit
	COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN]
		redefine
			out_in_tagged_out_memory
		end

insert
	ARGUMENTS
		redefine
			out_in_tagged_out_memory
		end

create {COMMAND_LINE_ARGUMENT_FACTORY}
	make

feature {ANY}
	item: BOOLEAN

	short: FIXED_STRING
	long: FIXED_STRING
	usage: FIXED_STRING

	is_mandatory: BOOLEAN is False
	can_be_mandatory: BOOLEAN is False
	is_optional: BOOLEAN is True
	can_be_optional: BOOLEAN is True
	is_positional: BOOLEAN is False

	is_set: BOOLEAN is
		do
			Result := item
		end

	force_index (a_index: INTEGER) is
		do
			check False end
		end

	out_in_tagged_out_memory is
		do
			if long /= Void then
				tagged_out_memory.append(once "--")
				tagged_out_memory.append(long)
			else
				tagged_out_memory.append(once "-")
				tagged_out_memory.append(short)
			end
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	prepare_parse is
		do
			item := False
		end

	parse_command_line (context: COMMAND_LINE_CONTEXT): COMMAND_LINE_CONTEXT is
		local
			arg: STRING
		do
			Result := context
			if context.is_short then
				if is_short(argument(context.index), context.short_option_index) then
					item := True
					Result.set_index(context.index)
					Result.set_short(context.short_index, context.short_option_index + 1)
				elseif argument_count >= context.short_index and then is_long(argument(context.short_index)) then
					item := True
					Result.set_index(context.short_index + 1)
				end
			elseif argument_count >= context.index then
				arg := argument(context.index)
				if is_short(arg, 1) then
					item := True
					Result.set_index(context.index)
					Result.set_short(context.index + 1, context.short_option_index + 1)
				elseif is_long(arg) then
					item := True
					Result.set_index(context.index + 1)
				end
			end
		end

	usage_summary (stream: OUTPUT_STREAM) is
		do
			if short /= Void then
				if long /= Void then
					stream.put_character('(')
					put_short(stream)
					stream.put_character('|')
					put_long(stream)
					stream.put_character(')')
				else
					put_short(stream)
				end
			elseif long /= Void then
				put_long(stream)
			end
			detailed := False
		end

	usage_details (stream: OUTPUT_STREAM) is
		do
			if not detailed then
				usage_summary(stream)
				stream.put_character(':')
				stream.put_character(' ')
				if usage /= Void then
					stream.put_line(usage)
				else
					stream.put_line(once "Set the flag.")
				end
				detailed := True
			end
		end

	set_mandatory (parent_option: like Current; enable: BOOLEAN) is
		do
			check False end
		end

feature {}
	make (a_short, a_long, a_usage: ABSTRACT_STRING) is
		require
			a_short /= Void implies a_short.count = 1
			a_short /= Void or else a_long /= Void
		do
			if a_short /= Void then
				short := a_short.intern
			end
			if a_long /= Void then
				long := a_long.intern
			end
			if a_usage /= Void then
				usage := a_usage.intern
			end
		ensure
			a_short /= Void implies short.is_equal(a_short)
			a_long /= Void implies long.is_equal(a_long)
			a_usage /= Void implies usage.is_equal(a_usage)
		end

	parent: like Current

invariant
	parent = Void
	is_optional

end -- class CLARG_TYPED
