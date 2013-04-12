-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOSTATUS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_status_again_low_level)  or else
				(a_value = g_io_status_eof_low_level)  or else
				(a_value = g_io_status_error_low_level)  or else
				(a_value = g_io_status_normal_low_level) )
		end

feature -- Setters
	default_create,
	set_g_io_status_again is
		do
			value := g_io_status_again_low_level
		end

	set_g_io_status_eof is
		do
			value := g_io_status_eof_low_level
		end

	set_g_io_status_error is
		do
			value := g_io_status_error_low_level
		end

	set_g_io_status_normal is
		do
			value := g_io_status_normal_low_level
		end

feature -- Queries
	is_g_io_status_again: BOOLEAN is
		do
			Result := (value=g_io_status_again_low_level)
		end

	is_g_io_status_eof: BOOLEAN is
		do
			Result := (value=g_io_status_eof_low_level)
		end

	is_g_io_status_error: BOOLEAN is
		do
			Result := (value=g_io_status_error_low_level)
		end

	is_g_io_status_normal: BOOLEAN is
		do
			Result := (value=g_io_status_normal_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_status_again_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_AGAIN"
 			}"
 		end

	g_io_status_eof_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_EOF"
 			}"
 		end

	g_io_status_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_ERROR"
 			}"
 		end

	g_io_status_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_STATUS_NORMAL"
 			}"
 		end


end -- class GIOSTATUS_ENUM
