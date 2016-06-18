-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SHELL_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_shell_error_bad_quoting) or else 
				(a_value = g_shell_error_empty_string) or else 
				(a_value = g_shell_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_g_shell_error_bad_quoting
		do
			value := g_shell_error_bad_quoting
		end

	set_g_shell_error_empty_string
		do
			value := g_shell_error_empty_string
		end

	set_g_shell_error_failed
		do
			value := g_shell_error_failed
		end


feature {ANY} -- Queries
	is_g_shell_error_bad_quoting: BOOLEAN
		do
			Result := (value=g_shell_error_bad_quoting)
		end

	is_g_shell_error_empty_string: BOOLEAN
		do
			Result := (value=g_shell_error_empty_string)
		end

	is_g_shell_error_failed: BOOLEAN
		do
			Result := (value=g_shell_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_shell_error_bad_quoting: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_BAD_QUOTING"
		end

	g_shell_error_empty_string: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_EMPTY_STRING"
		end

	g_shell_error_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_FAILED"
		end


end

