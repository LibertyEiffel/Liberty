deferred class COMMAND_LINE_TYPED_ARGUMENT[E_]

inherit
	COMMAND_LINE_ARGUMENT

feature {ANY}
	item: E_ is
		deferred
		end

	as_mandatory, prefix "+": like Current is
			-- make the option mandatory
		require
			can_be_mandatory
		do
			if is_mandatory then
				Result := Current
			else
				Result := twin
				Result.set_mandatory(Current, True)
			end
		ensure
			Result.is_mandatory
		end

	as_optional, prefix "-": like Current is
			-- make the option optional (default)
		require
			can_be_optional
		do
			if is_optional then
				Result := Current
			else
				Result := twin
				Result.set_mandatory(Current, False)
			end
		ensure
			not Result.is_mandatory
		end

feature {ANY}
	is_mandatory: BOOLEAN is
		deferred
		ensure
			Result implies can_be_mandatory
		end

	is_optional: BOOLEAN is
		deferred
		ensure
			Result implies not is_positional
			is_mandatory implies not Result
			Result implies can_be_optional
		end

	is_positional: BOOLEAN is
		deferred
		ensure
			Result implies not is_optional
			Result implies is_mandatory
		end

	can_be_mandatory: BOOLEAN is
		deferred
		end

	can_be_optional: BOOLEAN is
		deferred
		end

feature {ANY}
	short: FIXED_STRING is
		deferred
		end

	long: FIXED_STRING is
		deferred
		end

	usage: FIXED_STRING is
		deferred
		end

	force_index (a_index: INTEGER) is
			-- Force a positional parameter to be valid only at the given index
		require
			a_index > 0
			is_positional
		deferred
		end

feature {COMMAND_LINE_ARGUMENTS, COMMAND_LINE_ARGUMENT}
	set_mandatory (parent_option: like Current; enable: BOOLEAN) is
		require
			parent_option /= Void
			enable /= is_mandatory
			enable implies can_be_mandatory
			;(not enable) implies can_be_optional
		deferred
		ensure
			parent = parent_option
			is_mandatory = enable
		end

feature {}
	parent: like Current is
		deferred
		end

feature {} -- usage output helpers
	put_short (stream: OUTPUT_STREAM) is
		require
			short /= Void
		do
			stream.put_character('-')
			stream.put_character(short.first)
		end

	put_long (stream: OUTPUT_STREAM) is
		require
			long /= Void
		do
			stream.put_character('-')
			stream.put_character('-')
			stream.put_string(long)
		end

feature {} -- patterns
	short_pattern: REGULAR_EXPRESSION is
		local
			re: REGULAR_EXPRESSION_BUILDER
		once
			Result := re.convert_python_pattern("^(?:-|/)(?P<options>[A-Za-z0-9]+)$")
		end

	long_pattern: REGULAR_EXPRESSION is
		local
			re: REGULAR_EXPRESSION_BUILDER
		once
			Result := re.convert_python_pattern("^(?:--)(?P<name>[A-Za-z0-9]([A-Za-z0-9_-]*[A-Za-z0-9])?)$")
		end

	is_short (arg: STRING; index: INTEGER): BOOLEAN is
		require
			short /= Void
		local
			options: STRING
		do
			if short_pattern.match(arg) and then short_pattern.named_group_matched(once "options") then
				options := short_pattern.named_group_value(arg, once "options")
				if options.valid_index(index) then
					Result := options.item(index) = short.first
				end
			end
		end

	is_long (arg: STRING): BOOLEAN is
		require
			long /= Void
		local
			name_: FIXED_STRING
		do
			if long_pattern.match(arg) and then long_pattern.named_group_matched(once "name") then
				name_ := long_pattern.named_group_value(arg, once "name").intern
				Result := name_ = long
			end
		end

invariant
	is_optional or else is_positional or else is_mandatory

end -- class COMMAND_LINE_TYPED_ARGUMENT
