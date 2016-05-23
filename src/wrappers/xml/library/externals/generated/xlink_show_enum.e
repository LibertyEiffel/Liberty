-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class XLINK_SHOW_ENUM

-- Wrapper of enum xlinkShow defined in file /usr/include/libxml2/libxml/xlink.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = embed_low_level)  or else
				(a_value = new_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = replace_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_embed
               do
                       value := embed_low_level
               end

	set_new
               do
                       value := new_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_replace
               do
                       value := replace_low_level
               end

feature {ANY} -- Queries
       is_embed: BOOLEAN
               do
                       Result := (value=embed_low_level)
               end

       is_new: BOOLEAN
               do
                       Result := (value=new_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_replace: BOOLEAN
               do
                       Result := (value=replace_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     embed_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_SHOW_EMBED"
                       }"
               end

     new_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_SHOW_NEW"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_SHOW_NONE"
                       }"
               end

     replace_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "XLINK_SHOW_REPLACE"
                       }"
               end


end -- class XLINK_SHOW_ENUM
