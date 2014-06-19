-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GIOCHANNEL_ERROR_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_io_channel_error_failed
		do
			value := g_io_channel_error_failed_low_level
		end

	set_g_io_channel_error_fbig
		do
			value := g_io_channel_error_fbig_low_level
		end

	set_g_io_channel_error_inval
		do
			value := g_io_channel_error_inval_low_level
		end

	set_g_io_channel_error_io
		do
			value := g_io_channel_error_io_low_level
		end

	set_g_io_channel_error_isdir
		do
			value := g_io_channel_error_isdir_low_level
		end

	set_g_io_channel_error_nospc
		do
			value := g_io_channel_error_nospc_low_level
		end

	set_g_io_channel_error_nxio
		do
			value := g_io_channel_error_nxio_low_level
		end

	set_g_io_channel_error_overflow
		do
			value := g_io_channel_error_overflow_low_level
		end

	set_g_io_channel_error_pipe
		do
			value := g_io_channel_error_pipe_low_level
		end

feature {ANY} -- Queries
	is_g_io_channel_error_failed: BOOLEAN
		do
			Result := (value=g_io_channel_error_failed_low_level)
		end

	is_g_io_channel_error_fbig: BOOLEAN
		do
			Result := (value=g_io_channel_error_fbig_low_level)
		end

	is_g_io_channel_error_inval: BOOLEAN
		do
			Result := (value=g_io_channel_error_inval_low_level)
		end

	is_g_io_channel_error_io: BOOLEAN
		do
			Result := (value=g_io_channel_error_io_low_level)
		end

	is_g_io_channel_error_isdir: BOOLEAN
		do
			Result := (value=g_io_channel_error_isdir_low_level)
		end

	is_g_io_channel_error_nospc: BOOLEAN
		do
			Result := (value=g_io_channel_error_nospc_low_level)
		end

	is_g_io_channel_error_nxio: BOOLEAN
		do
			Result := (value=g_io_channel_error_nxio_low_level)
		end

	is_g_io_channel_error_overflow: BOOLEAN
		do
			Result := (value=g_io_channel_error_overflow_low_level)
		end

	is_g_io_channel_error_pipe: BOOLEAN
		do
			Result := (value=g_io_channel_error_pipe_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_channel_error_failed_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FAILED"
 			}"
 		end

	g_io_channel_error_fbig_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_FBIG"
 			}"
 		end

	g_io_channel_error_inval_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_INVAL"
 			}"
 		end

	g_io_channel_error_io_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_IO"
 			}"
 		end

	g_io_channel_error_isdir_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_ISDIR"
 			}"
 		end

	g_io_channel_error_nospc_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NOSPC"
 			}"
 		end

	g_io_channel_error_nxio_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_NXIO"
 			}"
 		end

	g_io_channel_error_overflow_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_OVERFLOW"
 			}"
 		end

	g_io_channel_error_pipe_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_IO_CHANNEL_ERROR_PIPE"
 			}"
 		end


end -- class GIOCHANNEL_ERROR_ENUM
