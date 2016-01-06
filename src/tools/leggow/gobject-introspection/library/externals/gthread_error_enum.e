-- This file has been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.
expanded class GTHREAD_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_thread_error_again_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_thread_error_again
               do
                       value := g_thread_error_again_low_level
               end

feature {ANY} -- Queries
       is_g_thread_error_again: BOOLEAN
               do
                       Result := (value=g_thread_error_again_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     g_thread_error_again_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "G_THREAD_ERROR_AGAIN"
                       }"
               end


end -- class GTHREAD_ERROR_ENUM
