-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSHELL_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_shell_error_bad_quoting_low_level)  or else
				(a_value = g_shell_error_empty_string_low_level)  or else
				(a_value = g_shell_error_failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_shell_error_bad_quoting
		do
			value := g_shell_error_bad_quoting_low_level
		end

	set_g_shell_error_empty_string
		do
			value := g_shell_error_empty_string_low_level
		end

	set_g_shell_error_failed
		do
			value := g_shell_error_failed_low_level
		end

feature {ANY} -- Queries
	is_g_shell_error_bad_quoting: BOOLEAN
		do
			Result := (value=g_shell_error_bad_quoting_low_level)
		end

	is_g_shell_error_empty_string: BOOLEAN
		do
			Result := (value=g_shell_error_empty_string_low_level)
		end

	is_g_shell_error_failed: BOOLEAN
		do
			Result := (value=g_shell_error_failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_shell_error_bad_quoting_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_BAD_QUOTING"
 			}"
 		end

	g_shell_error_empty_string_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_EMPTY_STRING"
 			}"
 		end

	g_shell_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_FAILED"
 			}"
 		end


end -- class GSHELL_ERROR_ENUM
