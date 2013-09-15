-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GISCOPE_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = async_low_level)  or else
				(a_value = call_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = notified_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_async is
		do
			value := async_low_level
		end

	set_call is
		do
			value := call_low_level
		end

	set_invalid is
		do
			value := invalid_low_level
		end

	set_notified is
		do
			value := notified_low_level
		end

feature {ANY} -- Queries
	is_async: BOOLEAN is
		do
			Result := (value=async_low_level)
		end

	is_call: BOOLEAN is
		do
			Result := (value=call_low_level)
		end

	is_invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	is_notified: BOOLEAN is
		do
			Result := (value=notified_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	async_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_ASYNC"
 			}"
 		end

	call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_CALL"
 			}"
 		end

	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_INVALID"
 			}"
 		end

	notified_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GI_SCOPE_TYPE_NOTIFIED"
 			}"
 		end


end -- class GISCOPE_TYPE_ENUM
