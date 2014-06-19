-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = g_io_error_again_low_level)  or else
				(a_value = g_io_error_inval_low_level)  or else
				(a_value = g_io_error_none_low_level)  or else
				(a_value = g_io_error_unknown_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_io_error_again
		do
			value := g_io_error_again_low_level
		end

	set_g_io_error_inval
		do
			value := g_io_error_inval_low_level
		end

	set_g_io_error_none
		do
			value := g_io_error_none_low_level
		end

	set_g_io_error_unknown
		do
			value := g_io_error_unknown_low_level
		end

feature {ANY} -- Queries
	is_g_io_error_again: BOOLEAN
		do
			Result := (value=g_io_error_again_low_level)
		end

	is_g_io_error_inval: BOOLEAN
		do
			Result := (value=g_io_error_inval_low_level)
		end

	is_g_io_error_none: BOOLEAN
		do
			Result := (value=g_io_error_none_low_level)
		end

	is_g_io_error_unknown: BOOLEAN
		do
			Result := (value=g_io_error_unknown_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_error_again_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_AGAIN"
 			}"
 		end

	g_io_error_inval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_INVAL"
 			}"
 		end

	g_io_error_none_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_NONE"
 			}"
 		end

	g_io_error_unknown_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_ERROR_UNKNOWN"
 			}"
 		end


end -- class GIOERROR_ENUM
