-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_TYPE_VAL_ENUM

-- Wrapper of enum xmlElementTypeVal defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = any_low_level)  or else
				(a_value = element_low_level)  or else
				(a_value = empty_low_level)  or else
				(a_value = mixed_low_level)  or else
				(a_value = undefined_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_any
               do
                       value := any_low_level
               end

	set_element
               do
                       value := element_low_level
               end

	set_empty
               do
                       value := empty_low_level
               end

	set_mixed
               do
                       value := mixed_low_level
               end

	set_undefined
               do
                       value := undefined_low_level
               end

feature {ANY} -- Queries
       is_any: BOOLEAN
               do
                       Result := (value=any_low_level)
               end

       is_element: BOOLEAN
               do
                       Result := (value=element_low_level)
               end

       is_empty: BOOLEAN
               do
                       Result := (value=empty_low_level)
               end

       is_mixed: BOOLEAN
               do
                       Result := (value=mixed_low_level)
               end

       is_undefined: BOOLEAN
               do
                       Result := (value=undefined_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     any_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_TYPE_ANY"
                       }"
               end

     element_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_TYPE_ELEMENT"
                       }"
               end

     empty_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_TYPE_EMPTY"
                       }"
               end

     mixed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_TYPE_MIXED"
                       }"
               end

     undefined_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_TYPE_UNDEFINED"
                       }"
               end


end -- class XML_ELEMENT_TYPE_VAL_ENUM
