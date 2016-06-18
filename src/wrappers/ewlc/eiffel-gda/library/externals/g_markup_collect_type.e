-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_MARKUP_COLLECT_TYPE
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_markup_collect_invalid) or else 
				(a_value = g_markup_collect_string) or else 
				(a_value = g_markup_collect_strdup) or else 
				(a_value = g_markup_collect_boolean) or else 
				(a_value = g_markup_collect_tristate) or else 
				(a_value = g_markup_collect_optional))
		end


feature {ANY} -- Setters
	default_create, set_invalid
		do
			value := g_markup_collect_invalid
		end

	set_string
		do
			value := g_markup_collect_string
		end

	set_strdup
		do
			value := g_markup_collect_strdup
		end

	set_boolean
		do
			value := g_markup_collect_boolean
		end

	set_tristate
		do
			value := g_markup_collect_tristate
		end

	set_optional
		do
			value := g_markup_collect_optional
		end


feature {ANY} -- Queries
	is_invalid: BOOLEAN
		do
			Result := (value=g_markup_collect_invalid)
		end

	is_string: BOOLEAN
		do
			Result := (value=g_markup_collect_string)
		end

	is_strdup: BOOLEAN
		do
			Result := (value=g_markup_collect_strdup)
		end

	is_boolean: BOOLEAN
		do
			Result := (value=g_markup_collect_boolean)
		end

	is_tristate: BOOLEAN
		do
			Result := (value=g_markup_collect_tristate)
		end

	is_optional: BOOLEAN
		do
			Result := (value=g_markup_collect_optional)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_markup_collect_invalid: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_INVALID"
		end

	g_markup_collect_string: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_STRING"
		end

	g_markup_collect_strdup: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_STRDUP"
		end

	g_markup_collect_boolean: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_BOOLEAN"
		end

	g_markup_collect_tristate: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_TRISTATE"
		end

	g_markup_collect_optional: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_MARKUP_COLLECT_OPTIONAL"
		end


end

