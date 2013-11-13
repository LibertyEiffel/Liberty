-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GINVOKE_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = argument_mismatch_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = symbol_not_found_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_argument_mismatch is
		do
			value := argument_mismatch_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

	set_symbol_not_found is
		do
			value := symbol_not_found_low_level
		end

feature {ANY} -- Queries
	is_argument_mismatch: BOOLEAN is
		do
			Result := (value=argument_mismatch_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

	is_symbol_not_found: BOOLEAN is
		do
			Result := (value=symbol_not_found_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	argument_mismatch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_ARGUMENT_MISMATCH"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_FAILED"
 			}"
 		end

	symbol_not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_INVOKE_ERROR_SYMBOL_NOT_FOUND"
 			}"
 		end


end -- class GINVOKE_ERROR_ENUM
