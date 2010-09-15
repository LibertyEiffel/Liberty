class CLARG_CUSTOM

inherit
	CLARG_WITH_ARG[COMMAND_LINE_DATA]
		rename
			optional as clarg_optional
			positional as clarg_positional
		end

create {COMMAND_LINE_ARGUMENT_FACTORY}
	optional, positional

feature {ANY}
	item: COMMAND_LINE_DATA
	is_set: BOOLEAN

feature {CLARG_WITH_ARG}
	is_valid_data (arg: STRING): BOOLEAN is
		do
			Result := customize.item([arg]) /= Void
		end

feature {}
	set_data (arg: STRING) is
		do
			item := customize.item([arg])
			is_set := True
		end

	unset is
		do
			item := Void
			is_set := False
		end

feature {}
	optional (a_short, a_long, a_name, a_usage: ABSTRACT_STRING; a_customize: like customize) is
		require
			a_short /= Void implies a_short.count = 1
			a_short /= Void or else a_long /= Void
			a_name /= Void
			a_customize /= Void
		do
			clarg_optional(a_short, a_long, a_name, a_usage)
			customize := a_customize
		ensure
			is_optional
			a_short /= Void implies short.is_equal(a_short)
			a_long /= Void implies long.is_equal(a_long)
			name.is_equal(a_name)
			a_usage /= Void implies usage.is_equal(a_usage)
			customize = a_customize
		end

	positional (a_name, a_usage: ABSTRACT_STRING; a_customize: like customize) is
		require
			a_name /= Void
			a_customize /= Void
		do
			clarg_positional(a_name, a_usage)
			customize := a_customize
		ensure
			is_positional
			name.is_equal(a_name)
			a_usage /= Void implies usage.is_equal(a_usage)
			customize = a_customize
		end

	customize: FUNCTION[TUPLE[STRING], COMMAND_LINE_DATA]

invariant
	customize /= Void

end -- CLARG_CUSTOM
