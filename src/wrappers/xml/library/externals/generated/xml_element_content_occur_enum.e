-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XML_ELEMENT_CONTENT_OCCUR_ENUM

-- Wrapper of enum xmlElementContentOccur defined in file /usr/include/libxml2/libxml/tree.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = mult_low_level)  or else
				(a_value = once_external_low_level)  or else
				(a_value = opt_low_level)  or else
				(a_value = plus_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_mult
               do
                       value := mult_low_level
               end

	set_once_external
               do
                       value := once_external_low_level
               end

	set_opt
               do
                       value := opt_low_level
               end

	set_plus
               do
                       value := plus_low_level
               end

feature {ANY} -- Queries
       is_mult: BOOLEAN
               do
                       Result := (value=mult_low_level)
               end

       is_once_external: BOOLEAN
               do
                       Result := (value=once_external_low_level)
               end

       is_opt: BOOLEAN
               do
                       Result := (value=opt_low_level)
               end

       is_plus: BOOLEAN
               do
                       Result := (value=plus_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     mult_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_CONTENT_MULT"
                       }"
               end

     once_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_CONTENT_ONCE"
                       }"
               end

     opt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_CONTENT_OPT"
                       }"
               end

     plus_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XML_ELEMENT_CONTENT_PLUS"
                       }"
               end


end -- class XML_ELEMENT_CONTENT_OCCUR_ENUM
