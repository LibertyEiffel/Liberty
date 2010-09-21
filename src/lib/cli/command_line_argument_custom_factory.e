expanded class COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY[D_ -> COMMAND_LINE_DATA]

insert
	COMMAND_LINE_ARGUMENT_FACTORY

feature {ANY} -- Options
	option_custom (short, long, name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[D_] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
			decode /= Void
		do
			create {CLARG_CUSTOM[D_]} Result.optional(short, long, name, usage, validate, decode)
		end

	option_customs (short, long, name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[D_]] is
		require
			short /= Void implies short_pattern.match(short.out)
			long /= Void implies long_pattern.match(long.out)
			short /= Void or else long /= Void
			name /= Void
			decode /= Void
		do
			create {CLARG_CUSTOMS[D_]} Result.optional(short, long, name, usage, validate, decode)
		end

feature {ANY} -- Positional
	positional_custom (name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[D_] is
		require
			name /= Void
			decode /= Void
		do
			create {CLARG_CUSTOM[D_]} Result.positional(name, usage, validate, decode)
		end

	positional_customs (name, usage: ABSTRACT_STRING; validate: PREDICATE[TUPLE[STRING]]; decode: FUNCTION[TUPLE[STRING], D_]): COMMAND_LINE_TYPED_ARGUMENT[TRAVERSABLE[D_]] is
		require
			name /= Void
			decode /= Void
		do
			create {CLARG_CUSTOMS[D_]} Result.positional(name, usage, validate, decode)
		end

end -- class COMMAND_LINE_ARGUMENT_CUSTOM_FACTORY
