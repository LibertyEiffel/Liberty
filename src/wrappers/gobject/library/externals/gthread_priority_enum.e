-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTHREAD_PRIORITY_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_thread_priority_high_low_level)  or else
				(a_value = g_thread_priority_low_low_level)  or else
				(a_value = g_thread_priority_normal_low_level)  or else
				(a_value = g_thread_priority_urgent_low_level) )
		end

feature -- Setters
	default_create,
	set_g_thread_priority_high is
		do
			value := g_thread_priority_high_low_level
		end

	set_g_thread_priority_low is
		do
			value := g_thread_priority_low_low_level
		end

	set_g_thread_priority_normal is
		do
			value := g_thread_priority_normal_low_level
		end

	set_g_thread_priority_urgent is
		do
			value := g_thread_priority_urgent_low_level
		end

feature -- Queries
	is_g_thread_priority_high: BOOLEAN is
		do
			Result := (value=g_thread_priority_high_low_level)
		end

	is_g_thread_priority_low: BOOLEAN is
		do
			Result := (value=g_thread_priority_low_low_level)
		end

	is_g_thread_priority_normal: BOOLEAN is
		do
			Result := (value=g_thread_priority_normal_low_level)
		end

	is_g_thread_priority_urgent: BOOLEAN is
		do
			Result := (value=g_thread_priority_urgent_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_thread_priority_high_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_HIGH"
 			}"
 		end

	g_thread_priority_low_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_LOW"
 			}"
 		end

	g_thread_priority_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_NORMAL"
 			}"
 		end

	g_thread_priority_urgent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_PRIORITY_URGENT"
 			}"
 		end


end -- class GTHREAD_PRIORITY_ENUM
