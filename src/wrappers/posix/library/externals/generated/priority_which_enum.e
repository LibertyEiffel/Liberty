-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class PRIORITY_WHICH_ENUM

-- Wrapper of enum __priority_which defined in file /usr/include/x86_64-linux-gnu/bits/resource.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = pgrp_low_level)  or else
				(a_value = process_low_level)  or else
				(a_value = user_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pgrp
               do
                       value := pgrp_low_level
               end

	set_process
               do
                       value := process_low_level
               end

	set_user
               do
                       value := user_low_level
               end

feature {ANY} -- Queries
       is_pgrp: BOOLEAN
               do
                       Result := (value=pgrp_low_level)
               end

       is_process: BOOLEAN
               do
                       Result := (value=process_low_level)
               end

       is_user: BOOLEAN
               do
                       Result := (value=user_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     pgrp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PRIO_PGRP"
                       }"
               end

     process_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PRIO_PROCESS"
                       }"
               end

     user_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "PRIO_USER"
                       }"
               end


end -- class PRIORITY_WHICH_ENUM
