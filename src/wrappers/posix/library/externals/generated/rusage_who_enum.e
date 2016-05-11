-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class RUSAGE_WHO_ENUM

-- Wrapper of enum __rusage_who defined in file /usr/include/x86_64-linux-gnu/bits/resource.h
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = children_low_level)  or else
				(a_value = self_low_level)  or else
				(a_value = thread_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_children
               do
                       value := children_low_level
               end

	set_self
               do
                       value := self_low_level
               end

	set_thread
               do
                       value := thread_low_level
               end

feature {ANY} -- Queries
       is_children: BOOLEAN
               do
                       Result := (value=children_low_level)
               end

       is_self: BOOLEAN
               do
                       Result := (value=self_low_level)
               end

       is_thread: BOOLEAN
               do
                       Result := (value=thread_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     children_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RUSAGE_CHILDREN"
                       }"
               end

     self_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RUSAGE_SELF"
                       }"
               end

     thread_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "RUSAGE_THREAD"
                       }"
               end


end -- class RUSAGE_WHO_ENUM
