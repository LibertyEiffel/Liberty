-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTHREAD_PRIORITY_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = high_low_level)  or else
				(a_value = low_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = urgent_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_high
               do
                       value := high_low_level
               end

	set_low
               do
                       value := low_low_level
               end

	set_normal
               do
                       value := normal_low_level
               end

	set_urgent
               do
                       value := urgent_low_level
               end

feature {ANY} -- Queries
       is_high: BOOLEAN
               do
                       Result := (value=high_low_level)
               end

       is_low: BOOLEAN
               do
                       Result := (value=low_low_level)
               end

       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

       is_urgent: BOOLEAN
               do
                       Result := (value=urgent_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     high_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_THREAD_PRIORITY_HIGH"
                       }"
               end

     low_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_THREAD_PRIORITY_LOW"
                       }"
               end

     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_THREAD_PRIORITY_NORMAL"
                       }"
               end

     urgent_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_THREAD_PRIORITY_URGENT"
                       }"
               end


end -- class GTHREAD_PRIORITY_ENUM
