class CLARG_CUSTOMS[D_ -> COMMAND_LINE_DATA]

inherit
	CLARG_WITH_ARGS[D_]
		rename
			optional as clarg_optional
			positional as clarg_positional
			decode as decode_
		end

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {CLARG_PARSER}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			if validate /= Void then
				Result := validate.item([arg])
			else
				Result := decode.item([arg]) /= Void
			end
		end

feature {}
	decode_ (arg: STRING): D_ is
		do
			Result := decode.item([arg])
		end

feature {}
	optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING; a_validate: like validate; a_decode: like decode) is
		require
			a_short /= Void implies a_short.count = 1
			a_short /= Void or else a_long /= Void
			a_name /= Void
			a_decode /= Void
		do
			clarg_optional(a_short, a_long, a_name, a_usage)
			validate := a_validate
			decode := a_decode
		ensure
			is_optional
			a_short /= Void implies short.is_equal(a_short)
			a_long /= Void implies long.is_equal(a_long)
			name.is_equal(a_name)
			a_usage /= Void implies usage.is_equal(a_usage)
			validate = a_validate
			decode = a_decode
		end

	positional (a_name, a_usage: ABSTRACT_STRING; a_validate: like validate; a_decode: like decode) is
		require
			a_name /= Void
			a_decode /= Void
		do
			clarg_positional(a_name, a_usage)
			validate := a_validate
			decode := a_decode
		ensure
			is_positional
			name.is_equal(a_name)
			a_usage /= Void implies usage.is_equal(a_usage)
			validate = a_validate
			decode = a_decode
		end

	validate: PREDICATE[TUPLE[STRING]]
	decode: FUNCTION[TUPLE[STRING], D_]

invariant
	decode /= Void

end -- CLARG_CUSTOMS
