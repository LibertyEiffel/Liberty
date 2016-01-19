-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOCHANNELERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_io_channel_error_failed_low_level)  or else
				(a_value = g_io_channel_error_fbig_low_level)  or else
				(a_value = g_io_channel_error_inval_low_level)  or else
				(a_value = g_io_channel_error_io_low_level)  or else
				(a_value = g_io_channel_error_isdir_low_level)  or else
				(a_value = g_io_channel_error_nospc_low_level)  or else
				(a_value = g_io_channel_error_nxio_low_level)  or else
				(a_value = g_io_channel_error_overflow_low_level)  or else
				(a_value = g_io_channel_error_pipe_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_io_channel_error_failed is
		do
			value := g_io_channel_error_failed_low_level
		end

	set_g_io_channel_error_fbig is
		do
			value := g_io_channel_error_fbig_low_level
		end

	set_g_io_channel_error_inval is
		do
			value := g_io_channel_error_inval_low_level
		end

	set_g_io_channel_error_io is
		do
			value := g_io_channel_error_io_low_level
		end

	set_g_io_channel_error_isdir is
		do
			value := g_io_channel_error_isdir_low_level
		end

	set_g_io_channel_error_nospc is
		do
			value := g_io_channel_error_nospc_low_level
		end

	set_g_io_channel_error_nxio is
		do
			value := g_io_channel_error_nxio_low_level
		end

	set_g_io_channel_error_overflow is
		do
			value := g_io_channel_error_overflow_low_level
		end

	set_g_io_channel_error_pipe is
		do
			value := g_io_channel_error_pipe_low_level
		end

feature {ANY} -- Queries
	is_g_io_channel_error_failed: BOOLEAN is
		do
			Result := (value=g_io_channel_error_failed_low_level)
		end

	is_g_io_channel_error_fbig: BOOLEAN is
		do
			Result := (value=g_io_channel_error_fbig_low_level)
		end

	is_g_io_channel_error_inval: BOOLEAN is
		do
			Result := (value=g_io_channel_error_inval_low_level)
		end

	is_g_io_channel_error_io: BOOLEAN is
		do
			Result := (value=g_io_channel_error_io_low_level)
		end

	is_g_io_channel_error_isdir: BOOLEAN is
		do
			Result := (value=g_io_channel_error_isdir_low_level)
		end

	is_g_io_channel_error_nospc: BOOLEAN is
		do
			Result := (value=g_io_channel_error_nospc_low_level)
		end

	is_g_io_channel_error_nxio: BOOLEAN is
		do
			Result := (value=g_io_channel_error_nxio_low_level)
		end

	is_g_io_channel_error_overflow: BOOLEAN is
		do
			Result := (value=g_io_channel_error_overflow_low_level)
		end

	is_g_io_channel_error_pipe: BOOLEAN is
		do
			Result := (value=g_io_channel_error_pipe_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_channel_error_failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FAILED"
 			}"
 		end

	g_io_channel_error_fbig_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FBIG"
 			}"
 		end

	g_io_channel_error_inval_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_INVAL"
 			}"
 		end

	g_io_channel_error_io_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_IO"
 			}"
 		end

	g_io_channel_error_isdir_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_ISDIR"
 			}"
 		end

	g_io_channel_error_nospc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NOSPC"
 			}"
 		end

	g_io_channel_error_nxio_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NXIO"
 			}"
 		end

	g_io_channel_error_overflow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_OVERFLOW"
 			}"
 		end

	g_io_channel_error_pipe_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_PIPE"
 			}"
 		end


end -- class GIOCHANNELERROR_ENUM
