-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class PID_TYPE_ENUM

-- Wrapper of enum __pid_type defined in file /usr/include/x86_64-linux-gnu/bits/fcntl-linux.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = gid_low_level)  or else
				(a_value = pgrp_low_level)  or else
				(a_value = pid_low_level)  or else
				(a_value = tid_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gid
               do
                       value := gid_low_level
               end

	set_pgrp
               do
                       value := pgrp_low_level
               end

	set_pid
               do
                       value := pid_low_level
               end

	set_tid
               do
                       value := tid_low_level
               end

feature {ANY} -- Queries
       is_gid: BOOLEAN
               do
                       Result := (value=gid_low_level)
               end

       is_pgrp: BOOLEAN
               do
                       Result := (value=pgrp_low_level)
               end

       is_pid: BOOLEAN
               do
                       Result := (value=pid_low_level)
               end

       is_tid: BOOLEAN
               do
                       Result := (value=tid_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     gid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "F_OWNER_GID"
                       }"
               end

     pgrp_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "F_OWNER_PGRP"
                       }"
               end

     pid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "F_OWNER_PID"
                       }"
               end

     tid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "F_OWNER_TID"
                       }"
               end


end -- class PID_TYPE_ENUM
