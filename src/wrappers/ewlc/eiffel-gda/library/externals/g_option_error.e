-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_OPTION_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_option_error_unknown_option) or else 
				(a_value = g_option_error_bad_value) or else 
				(a_value = g_option_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_g_option_error_unknown_option
		do
			value := g_option_error_unknown_option
		end

	set_g_option_error_bad_value
		do
			value := g_option_error_bad_value
		end

	set_g_option_error_failed
		do
			value := g_option_error_failed
		end


feature {ANY} -- Queries
	is_g_option_error_unknown_option: BOOLEAN
		do
			Result := (value=g_option_error_unknown_option)
		end

	is_g_option_error_bad_value: BOOLEAN
		do
			Result := (value=g_option_error_bad_value)
		end

	is_g_option_error_failed: BOOLEAN
		do
			Result := (value=g_option_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_error_unknown_option: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ERROR_UNKNOWN_OPTION"
		end

	g_option_error_bad_value: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ERROR_BAD_VALUE"
		end

	g_option_error_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ERROR_FAILED"
		end


end

