-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOSTATUS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_io_status_again_low_level)  or else
				(a_value = g_io_status_eof_low_level)  or else
				(a_value = g_io_status_error_low_level)  or else
				(a_value = g_io_status_normal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_io_status_again
		do
			value := g_io_status_again_low_level
		end

	set_g_io_status_eof
		do
			value := g_io_status_eof_low_level
		end

	set_g_io_status_error
		do
			value := g_io_status_error_low_level
		end

	set_g_io_status_normal
		do
			value := g_io_status_normal_low_level
		end

feature {ANY} -- Queries
	is_g_io_status_again: BOOLEAN
		do
			Result := (value=g_io_status_again_low_level)
		end

	is_g_io_status_eof: BOOLEAN
		do
			Result := (value=g_io_status_eof_low_level)
		end

	is_g_io_status_error: BOOLEAN
		do
			Result := (value=g_io_status_error_low_level)
		end

	is_g_io_status_normal: BOOLEAN
		do
			Result := (value=g_io_status_normal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_status_again_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_AGAIN"
 			}"
 		end

	g_io_status_eof_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_EOF"
 			}"
 		end

	g_io_status_error_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_ERROR"
 			}"
 		end

	g_io_status_normal_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_NORMAL"
 			}"
 		end


end -- class GIOSTATUS_ENUM
