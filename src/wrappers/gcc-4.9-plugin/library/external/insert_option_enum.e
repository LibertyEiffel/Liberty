-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class INSERT_OPTION_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = insert_external_low_level)  or else
				(a_value = no_insert_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_insert_external
               do
                       value := insert_external_low_level
               end

	set_no_insert
               do
                       value := no_insert_low_level
               end

feature {ANY} -- Queries
       is_insert_external: BOOLEAN
               do
                       Result := (value=insert_external_low_level)
               end

       is_no_insert: BOOLEAN
               do
                       Result := (value=no_insert_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     insert_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "INSERT"
                       }"
               end

     no_insert_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "NO_INSERT"
                       }"
               end


end -- class INSERT_OPTION_ENUM
