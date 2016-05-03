-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ATTRIBUTE_DEFAULT_ENUM

-- Wrapper of enum xmlAttributeDefault defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = fixed_low_level)  or else
				(a_value = implied_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = required_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_fixed
               do
                       value := fixed_low_level
               end

	set_implied
               do
                       value := implied_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_required
               do
                       value := required_low_level
               end

feature {ANY} -- Queries
       is_fixed: BOOLEAN
               do
                       Result := (value=fixed_low_level)
               end

       is_implied: BOOLEAN
               do
                       Result := (value=implied_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_required: BOOLEAN
               do
                       Result := (value=required_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     fixed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_FIXED"
                       }"
               end

     implied_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_IMPLIED"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_NONE"
                       }"
               end

     required_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ATTRIBUTE_REQUIRED"
                       }"
               end


end -- class XML_ATTRIBUTE_DEFAULT_ENUM
