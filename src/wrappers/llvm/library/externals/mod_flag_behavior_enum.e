-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class MOD_FLAG_BEHAVIOR_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = error_low_level)  or else
				(a_value = override_low_level)  or else
				(a_value = require_external_low_level)  or else
				(a_value = warning_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_error is
		do
			value := error_low_level
		end

	set_override is
		do
			value := override_low_level
		end

	set_require_external is
		do
			value := require_external_low_level
		end

	set_warning is
		do
			value := warning_low_level
		end

feature {ANY} -- Queries
	is_error: BOOLEAN is
		do
			Result := (value=error_low_level)
		end

	is_override: BOOLEAN is
		do
			Result := (value=override_low_level)
		end

	is_require_external: BOOLEAN is
		do
			Result := (value=require_external_low_level)
		end

	is_warning: BOOLEAN is
		do
			Result := (value=warning_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Error"
 			}"
 		end

	override_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Override"
 			}"
 		end

	require_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Require"
 			}"
 		end

	warning_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "Warning"
 			}"
 		end


end -- class MOD_FLAG_BEHAVIOR_ENUM
