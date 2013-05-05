-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GISCOPE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gi_scope_type_async_low_level)  or else
				(a_value = gi_scope_type_call_low_level)  or else
				(a_value = gi_scope_type_invalid_low_level)  or else
				(a_value = gi_scope_type_notified_low_level) )
		end

feature -- Setters
	default_create,
	set_gi_scope_type_async is
		do
			value := gi_scope_type_async_low_level
		end

	set_gi_scope_type_call is
		do
			value := gi_scope_type_call_low_level
		end

	set_gi_scope_type_invalid is
		do
			value := gi_scope_type_invalid_low_level
		end

	set_gi_scope_type_notified is
		do
			value := gi_scope_type_notified_low_level
		end

feature -- Queries
	is_gi_scope_type_async: BOOLEAN is
		do
			Result := (value=gi_scope_type_async_low_level)
		end

	is_gi_scope_type_call: BOOLEAN is
		do
			Result := (value=gi_scope_type_call_low_level)
		end

	is_gi_scope_type_invalid: BOOLEAN is
		do
			Result := (value=gi_scope_type_invalid_low_level)
		end

	is_gi_scope_type_notified: BOOLEAN is
		do
			Result := (value=gi_scope_type_notified_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gi_scope_type_async_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_ASYNC"
 			}"
 		end

	gi_scope_type_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_CALL"
 			}"
 		end

	gi_scope_type_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_INVALID"
 			}"
 		end

	gi_scope_type_notified_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_NOTIFIED"
 			}"
 		end


end -- class GISCOPE_TYPE_ENUM
