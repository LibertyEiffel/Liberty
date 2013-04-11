-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GHOOKFLAGMASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_hook_flag_active_low_level)  or else
				(a_value = g_hook_flag_in_call_low_level)  or else
				(a_value = g_hook_flag_mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_hook_flag_active is
		do
			value := g_hook_flag_active_low_level
		end

	set_g_hook_flag_in_call is
		do
			value := g_hook_flag_in_call_low_level
		end

	set_g_hook_flag_mask is
		do
			value := g_hook_flag_mask_low_level
		end

feature {ANY} -- Queries
	is_g_hook_flag_active: BOOLEAN is
		do
			Result := (value=g_hook_flag_active_low_level)
		end

	is_g_hook_flag_in_call: BOOLEAN is
		do
			Result := (value=g_hook_flag_in_call_low_level)
		end

	is_g_hook_flag_mask: BOOLEAN is
		do
			Result := (value=g_hook_flag_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_hook_flag_active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_HOOK_FLAG_ACTIVE"
 			}"
 		end

	g_hook_flag_in_call_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_HOOK_FLAG_IN_CALL"
 			}"
 		end

	g_hook_flag_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_HOOK_FLAG_MASK"
 			}"
 		end


end -- class GHOOKFLAGMASK_ENUM
