expanded class COMMAND_LINE_ARGUMENT_FACTORY

feature {ANY} -- Options
	option_string (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_STRING} Result.optional(short, long, name, usage)
		end

	option_strings (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_STRINGS} Result.optional(short, long, name, usage)
		end

	option_file (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_FILE} Result.optional(short, long, name, usage)
		end

	option_directory (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[DIRECTORY] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_DIRECTORY} Result.optional(short, long, name, usage)
		end

	option_integer (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_INTEGER} Result.optional(short, long, name, usage)
		end

	option_integers (short, long, name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[INTEGER]] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
		do
			create {CLARG_INTEGERS} Result.optional(short, long, name, usage)
		end

	option_boolean (short, long, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[BOOLEAN] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
		do
			create {CLARG_BOOLEAN} Result.make(short, long, usage)
		end

	option_counter (short, long, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
		do
			create {CLARG_COUNTER} Result.make(short, long, usage)
		end

feature {ANY} -- Positional
	positional_string (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[FIXED_STRING] is
		require
			name /= Void
		do
			create {CLARG_STRING} Result.positional(name, usage)
		end

	positional_strings (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[FIXED_STRING]] is
		require
			name /= Void
		do
			create {CLARG_STRINGS} Result.positional(name, usage)
		end

	positional_file (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[REGULAR_FILE] is
		require
			name /= Void
		do
			create {CLARG_FILE} Result.positional(name, usage)
		end

	positional_directory (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[DIRECTORY] is
		require
			name /= Void
		do
			create {CLARG_DIRECTORY} Result.positional(name, usage)
		end

	positional_integer (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[INTEGER] is
		require
			name /= Void
		do
			create {CLARG_INTEGER} Result.positional(name, usage)
		end

	positional_integers (name, usage: ABSTRACT_STRING): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[INTEGER]] is
		require
			name /= Void
		do
			create {CLARG_INTEGERS} Result.positional(name, usage)
		end

feature {ANY}
	no_parameters: COMMAND_LINE_ARGUMENT is
			-- useful to allow an empty command line.
		once
			create {CLARG_NOP} Result.make
		end

feature {ANY} -- Option names validity
	short_pattern: REGULAR_EXPRESSION is
		local
			re: REGULAR_EXPRESSION_BUILDER
		once
			Result := re.convert_posix_pattern("^[A-Za-z0-9]$")
		end

	long_pattern: REGULAR_EXPRESSION is
		local
			re: REGULAR_EXPRESSION_BUILDER
		once
			Result := re.convert_posix_pattern("^[A-Za-z0-9]([A-Za-z0-9_-]*[A-Za-z0-9])?$")
		end

end -- class COMMAND_LINE_ARGUMENT_FACTORY
