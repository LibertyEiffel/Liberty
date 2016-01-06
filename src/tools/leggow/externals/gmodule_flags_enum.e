-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GMODULE_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = lazy_low_level)  or else
				(a_value = local_external_low_level)  or else
				(a_value = mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_lazy
               do
                       value := lazy_low_level
               end

	set_local_external
               do
                       value := local_external_low_level
               end

	set_mask
               do
                       value := mask_low_level
               end

feature {ANY} -- Queries
       is_lazy: BOOLEAN
               do
                       Result := (value=lazy_low_level)
               end

       is_local_external: BOOLEAN
               do
                       Result := (value=local_external_low_level)
               end

       is_mask: BOOLEAN
               do
                       Result := (value=mask_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     lazy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MODULE_BIND_LAZY"
                       }"
               end

     local_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MODULE_BIND_LOCAL"
                       }"
               end

     mask_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_MODULE_BIND_MASK"
                       }"
               end


end -- class GMODULE_FLAGS_ENUM
