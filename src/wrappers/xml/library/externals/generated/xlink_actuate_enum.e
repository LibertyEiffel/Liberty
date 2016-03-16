-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XLINK_ACTUATE_ENUM

-- Wrapper of enum xlinkActuate defined in file /usr/include/libxml2/libxml/xlink.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = auto_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = onrequest_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_auto
               do
                       value := auto_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_onrequest
               do
                       value := onrequest_low_level
               end

feature {ANY} -- Queries
       is_auto: BOOLEAN
               do
                       Result := (value=auto_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_onrequest: BOOLEAN
               do
                       Result := (value=onrequest_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     auto_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_ACTUATE_AUTO"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_ACTUATE_NONE"
                       }"
               end

     onrequest_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_ACTUATE_ONREQUEST"
                       }"
               end


end -- class XLINK_ACTUATE_ENUM
