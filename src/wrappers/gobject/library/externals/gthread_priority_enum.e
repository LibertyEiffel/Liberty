-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTHREAD_PRIORITY_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_thread_priority_high_low_level)  or else
				(a_value = g_thread_priority_low_low_level)  or else
				(a_value = g_thread_priority_normal_low_level)  or else
				(a_value = g_thread_priority_urgent_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_thread_priority_high
		do
			value := g_thread_priority_high_low_level
		end

	set_g_thread_priority_low
		do
			value := g_thread_priority_low_low_level
		end

	set_g_thread_priority_normal
		do
			value := g_thread_priority_normal_low_level
		end

	set_g_thread_priority_urgent
		do
			value := g_thread_priority_urgent_low_level
		end

feature {ANY} -- Queries
	is_g_thread_priority_high: BOOLEAN
		do
			Result := (value=g_thread_priority_high_low_level)
		end

	is_g_thread_priority_low: BOOLEAN
		do
			Result := (value=g_thread_priority_low_low_level)
		end

	is_g_thread_priority_normal: BOOLEAN
		do
			Result := (value=g_thread_priority_normal_low_level)
		end

	is_g_thread_priority_urgent: BOOLEAN
		do
			Result := (value=g_thread_priority_urgent_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_thread_priority_high_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_HIGH"
 			}"
 		end

	g_thread_priority_low_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_LOW"
 			}"
 		end

	g_thread_priority_normal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_NORMAL"
 			}"
 		end

	g_thread_priority_urgent_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_URGENT"
 			}"
 		end


end -- class GTHREAD_PRIORITY_ENUM
