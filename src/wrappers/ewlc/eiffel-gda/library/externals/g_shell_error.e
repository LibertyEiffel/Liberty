-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_SHELL_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_shell_error_bad_quoting) or else 
				(a_value = g_shell_error_empty_string) or else 
				(a_value = g_shell_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_g_shell_error_bad_quoting is
		do
			value := g_shell_error_bad_quoting
		end

	set_g_shell_error_empty_string is
		do
			value := g_shell_error_empty_string
		end

	set_g_shell_error_failed is
		do
			value := g_shell_error_failed
		end


feature {ANY} -- Queries
	is_g_shell_error_bad_quoting: BOOLEAN is
		do
			Result := (value=g_shell_error_bad_quoting)
		end

	is_g_shell_error_empty_string: BOOLEAN is
		do
			Result := (value=g_shell_error_empty_string)
		end

	is_g_shell_error_failed: BOOLEAN is
		do
			Result := (value=g_shell_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_shell_error_bad_quoting: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_BAD_QUOTING"
		end

	g_shell_error_empty_string: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_EMPTY_STRING"
		end

	g_shell_error_failed: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_SHELL_ERROR_FAILED"
		end


end

