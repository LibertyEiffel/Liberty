-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class IR_TYPE_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = gimple_low_level)  or else
				(a_value = rtl_cfglayout_low_level)  or else
				(a_value = rtl_cfgrtl_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gimple
               do
                       value := gimple_low_level
               end

	set_rtl_cfglayout
               do
                       value := rtl_cfglayout_low_level
               end

	set_rtl_cfgrtl
               do
                       value := rtl_cfgrtl_low_level
               end

feature {ANY} -- Queries
       is_gimple: BOOLEAN
               do
                       Result := (value=gimple_low_level)
               end

       is_rtl_cfglayout: BOOLEAN
               do
                       Result := (value=rtl_cfglayout_low_level)
               end

       is_rtl_cfgrtl: BOOLEAN
               do
                       Result := (value=rtl_cfgrtl_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     gimple_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "IR_GIMPLE"
                       }"
               end

     rtl_cfglayout_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "IR_RTL_CFGLAYOUT"
                       }"
               end

     rtl_cfgrtl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "IR_RTL_CFGRTL"
                       }"
               end


end -- class IR_TYPE_ENUM
