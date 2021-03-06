-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_HOOK_FLAG_MASK
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_hook_flag_active) or else 
				(a_value = g_hook_flag_in_call) or else 
				(a_value = g_hook_flag_mask))
		end


feature {ANY} -- Setters
	default_create, set_g_hook_flag_active
		do
			value := g_hook_flag_active
		end

	set_g_hook_flag_in_call
		do
			value := g_hook_flag_in_call
		end

	set_g_hook_flag_mask
		do
			value := g_hook_flag_mask
		end


feature {ANY} -- Queries
	is_g_hook_flag_active: BOOLEAN
		do
			Result := (value=g_hook_flag_active)
		end

	is_g_hook_flag_in_call: BOOLEAN
		do
			Result := (value=g_hook_flag_in_call)
		end

	is_g_hook_flag_mask: BOOLEAN
		do
			Result := (value=g_hook_flag_mask)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_hook_flag_active: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_HOOK_FLAG_ACTIVE"
		end

	g_hook_flag_in_call: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_HOOK_FLAG_IN_CALL"
		end

	g_hook_flag_mask: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_HOOK_FLAG_MASK"
		end


end

