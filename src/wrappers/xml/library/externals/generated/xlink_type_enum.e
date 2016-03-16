-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XLINK_TYPE_ENUM

-- Wrapper of enum xlinkType defined in file /usr/include/libxml2/libxml/xlink.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = extended_low_level)  or else
				(a_value = extended_set_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = simple_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_extended
               do
                       value := extended_low_level
               end

	set_extended_set
               do
                       value := extended_set_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_simple
               do
                       value := simple_low_level
               end

feature {ANY} -- Queries
       is_extended: BOOLEAN
               do
                       Result := (value=extended_low_level)
               end

       is_extended_set: BOOLEAN
               do
                       Result := (value=extended_set_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_simple: BOOLEAN
               do
                       Result := (value=simple_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     extended_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_TYPE_EXTENDED"
                       }"
               end

     extended_set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_TYPE_EXTENDED_SET"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_TYPE_NONE"
                       }"
               end

     simple_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_TYPE_SIMPLE"
                       }"
               end


end -- class XLINK_TYPE_ENUM
