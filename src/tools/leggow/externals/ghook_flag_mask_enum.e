-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GHOOK_FLAG_MASK_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = active_low_level)  or else
				(a_value = in_call_low_level)  or else
				(a_value = mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_active
               do
                       value := active_low_level
               end

	set_in_call
               do
                       value := in_call_low_level
               end

	set_mask
               do
                       value := mask_low_level
               end

feature {ANY} -- Queries
       is_active: BOOLEAN
               do
                       Result := (value=active_low_level)
               end

       is_in_call: BOOLEAN
               do
                       Result := (value=in_call_low_level)
               end

       is_mask: BOOLEAN
               do
                       Result := (value=mask_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     active_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_HOOK_FLAG_ACTIVE"
                       }"
               end

     in_call_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_HOOK_FLAG_IN_CALL"
                       }"
               end

     mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_HOOK_FLAG_MASK"
                       }"
               end


end -- class GHOOK_FLAG_MASK_ENUM
