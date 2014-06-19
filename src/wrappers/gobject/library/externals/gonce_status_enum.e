-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GONCE_STATUS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_once_status_notcalled_low_level)  or else
				(a_value = g_once_status_progress_low_level)  or else
				(a_value = g_once_status_ready_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_once_status_notcalled
		do
			value := g_once_status_notcalled_low_level
		end

	set_g_once_status_progress
		do
			value := g_once_status_progress_low_level
		end

	set_g_once_status_ready
		do
			value := g_once_status_ready_low_level
		end

feature {ANY} -- Queries
	is_g_once_status_notcalled: BOOLEAN
		do
			Result := (value=g_once_status_notcalled_low_level)
		end

	is_g_once_status_progress: BOOLEAN
		do
			Result := (value=g_once_status_progress_low_level)
		end

	is_g_once_status_ready: BOOLEAN
		do
			Result := (value=g_once_status_ready_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_once_status_notcalled_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ONCE_STATUS_NOTCALLED"
 			}"
 		end

	g_once_status_progress_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ONCE_STATUS_PROGRESS"
 			}"
 		end

	g_once_status_ready_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_ONCE_STATUS_READY"
 			}"
 		end


end -- class GONCE_STATUS_ENUM
