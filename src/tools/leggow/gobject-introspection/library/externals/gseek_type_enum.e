-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GSEEK_TYPE_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cur_low_level)  or else
				(a_value = end_external_low_level)  or else
				(a_value = set_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cur
               do
                       value := cur_low_level
               end

	set_end_external
               do
                       value := end_external_low_level
               end

	set_set
               do
                       value := set_low_level
               end

feature {ANY} -- Queries
       is_cur: BOOLEAN
               do
                       Result := (value=cur_low_level)
               end

       is_end_external: BOOLEAN
               do
                       Result := (value=end_external_low_level)
               end

       is_set: BOOLEAN
               do
                       Result := (value=set_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cur_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SEEK_CUR"
                       }"
               end

     end_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SEEK_END"
                       }"
               end

     set_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_SEEK_SET"
                       }"
               end


end -- class GSEEK_TYPE_ENUM
