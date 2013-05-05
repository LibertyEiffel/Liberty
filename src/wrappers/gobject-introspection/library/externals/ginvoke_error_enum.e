-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GINVOKE_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_invoke_error_argument_mismatch_low_level)  or else
				(a_value = g_invoke_error_failed_low_level)  or else
				(a_value = g_invoke_error_symbol_not_found_low_level) )
		end

feature -- Setters
	default_create,
	set_g_invoke_error_argument_mismatch is
		do
			value := g_invoke_error_argument_mismatch_low_level
		end

	set_g_invoke_error_failed is
		do
			value := g_invoke_error_failed_low_level
		end

	set_g_invoke_error_symbol_not_found is
		do
			value := g_invoke_error_symbol_not_found_low_level
		end

feature -- Queries
	is_g_invoke_error_argument_mismatch: BOOLEAN is
		do
			Result := (value=g_invoke_error_argument_mismatch_low_level)
		end

	is_g_invoke_error_failed: BOOLEAN is
		do
			Result := (value=g_invoke_error_failed_low_level)
		end

	is_g_invoke_error_symbol_not_found: BOOLEAN is
		do
			Result := (value=g_invoke_error_symbol_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_invoke_error_argument_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_ARGUMENT_MISMATCH"
 			}"
 		end

	g_invoke_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_FAILED"
 			}"
 		end

	g_invoke_error_symbol_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_SYMBOL_NOT_FOUND"
 			}"
 		end


end -- class GINVOKE_ERROR_ENUM
