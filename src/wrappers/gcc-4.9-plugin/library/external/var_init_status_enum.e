-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class VAR_INIT_STATUS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = initialized_low_level)  or else
				(a_value = uninitialized_low_level)  or else
				(a_value = unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_initialized
               do
                       value := initialized_low_level
               end

	set_uninitialized
               do
                       value := uninitialized_low_level
               end

	set_unknown
               do
                       value := unknown_low_level
               end

feature {ANY} -- Queries
       is_initialized: BOOLEAN
               do
                       Result := (value=initialized_low_level)
               end

       is_uninitialized: BOOLEAN
               do
                       Result := (value=uninitialized_low_level)
               end

       is_unknown: BOOLEAN
               do
                       Result := (value=unknown_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     initialized_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "VAR_INIT_STATUS_INITIALIZED"
                       }"
               end

     uninitialized_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "VAR_INIT_STATUS_UNINITIALIZED"
                       }"
               end

     unknown_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "VAR_INIT_STATUS_UNKNOWN"
                       }"
               end


end -- class VAR_INIT_STATUS_ENUM
