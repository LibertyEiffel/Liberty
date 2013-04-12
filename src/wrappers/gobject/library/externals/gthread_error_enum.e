-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTHREAD_ERROR_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_thread_error_again_low_level) )
		end

feature -- Setters
	default_create,
	set_g_thread_error_again is
		do
			value := g_thread_error_again_low_level
		end

feature -- Queries
	is_g_thread_error_again: BOOLEAN is
		do
			Result := (value=g_thread_error_again_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_thread_error_again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_THREAD_ERROR_AGAIN"
 			}"
 		end


end -- class GTHREAD_ERROR_ENUM
