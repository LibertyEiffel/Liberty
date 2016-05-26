-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class IDTYPE_T_ENUM

-- Wrapper of enum idtype_t defined in file /usr/include/x86_64-linux-gnu/bits/waitflags.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = all_low_level)  or else
				(a_value = pgid_low_level)  or else
				(a_value = pid_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_all
               do
                       value := all_low_level
               end

	set_pgid
               do
                       value := pgid_low_level
               end

	set_pid
               do
                       value := pid_low_level
               end

feature {ANY} -- Queries
       is_all: BOOLEAN
               do
                       Result := (value=all_low_level)
               end

       is_pgid: BOOLEAN
               do
                       Result := (value=pgid_low_level)
               end

       is_pid: BOOLEAN
               do
                       Result := (value=pid_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     all_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "P_ALL"
                       }"
               end

     pgid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "P_PGID"
                       }"
               end

     pid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "P_PID"
                       }"
               end


end -- class IDTYPE_T_ENUM
