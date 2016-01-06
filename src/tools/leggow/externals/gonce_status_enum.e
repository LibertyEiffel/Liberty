-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GONCE_STATUS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = notcalled_low_level)  or else
				(a_value = progress_low_level)  or else
				(a_value = ready_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_notcalled
               do
                       value := notcalled_low_level
               end

	set_progress
               do
                       value := progress_low_level
               end

	set_ready
               do
                       value := ready_low_level
               end

feature {ANY} -- Queries
       is_notcalled: BOOLEAN
               do
                       Result := (value=notcalled_low_level)
               end

       is_progress: BOOLEAN
               do
                       Result := (value=progress_low_level)
               end

       is_ready: BOOLEAN
               do
                       Result := (value=ready_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     notcalled_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ONCE_STATUS_NOTCALLED"
                       }"
               end

     progress_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ONCE_STATUS_PROGRESS"
                       }"
               end

     ready_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_ONCE_STATUS_READY"
                       }"
               end


end -- class GONCE_STATUS_ENUM
