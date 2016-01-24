-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class ACTION_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = enter_low_level)  or else
				(a_value = find_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_enter
               do
                       value := enter_low_level
               end

	set_find
               do
                       value := find_low_level
               end

feature {ANY} -- Queries
       is_enter: BOOLEAN
               do
                       Result := (value=enter_low_level)
               end

       is_find: BOOLEAN
               do
                       Result := (value=find_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     enter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "ENTER"
                       }"
               end

     find_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "FIND"
                       }"
               end


end -- class ACTION_ENUM
