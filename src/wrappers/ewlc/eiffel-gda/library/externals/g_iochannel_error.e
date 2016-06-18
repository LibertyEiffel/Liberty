-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_IOCHANNEL_ERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_io_channel_error_fbig) or else 
				(a_value = g_io_channel_error_inval) or else 
				(a_value = g_io_channel_error_io) or else 
				(a_value = g_io_channel_error_isdir) or else 
				(a_value = g_io_channel_error_nospc) or else 
				(a_value = g_io_channel_error_nxio) or else 
				(a_value = g_io_channel_error_overflow) or else 
				(a_value = g_io_channel_error_pipe) or else 
				(a_value = g_io_channel_error_failed))
		end


feature {ANY} -- Setters
	default_create, set_fbig
		do
			value := g_io_channel_error_fbig
		end

	set_inval
		do
			value := g_io_channel_error_inval
		end

	set_io
		do
			value := g_io_channel_error_io
		end

	set_isdir
		do
			value := g_io_channel_error_isdir
		end

	set_nospc
		do
			value := g_io_channel_error_nospc
		end

	set_nxio
		do
			value := g_io_channel_error_nxio
		end

	set_overflow
		do
			value := g_io_channel_error_overflow
		end

	set_pipe
		do
			value := g_io_channel_error_pipe
		end

	set_failed
		do
			value := g_io_channel_error_failed
		end


feature {ANY} -- Queries
	is_fbig: BOOLEAN
		do
			Result := (value=g_io_channel_error_fbig)
		end

	is_inval: BOOLEAN
		do
			Result := (value=g_io_channel_error_inval)
		end

	is_io: BOOLEAN
		do
			Result := (value=g_io_channel_error_io)
		end

	is_isdir: BOOLEAN
		do
			Result := (value=g_io_channel_error_isdir)
		end

	is_nospc: BOOLEAN
		do
			Result := (value=g_io_channel_error_nospc)
		end

	is_nxio: BOOLEAN
		do
			Result := (value=g_io_channel_error_nxio)
		end

	is_overflow: BOOLEAN
		do
			Result := (value=g_io_channel_error_overflow)
		end

	is_pipe: BOOLEAN
		do
			Result := (value=g_io_channel_error_pipe)
		end

	is_failed: BOOLEAN
		do
			Result := (value=g_io_channel_error_failed)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_channel_error_fbig: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_FBIG"
		end

	g_io_channel_error_inval: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_INVAL"
		end

	g_io_channel_error_io: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_IO"
		end

	g_io_channel_error_isdir: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_ISDIR"
		end

	g_io_channel_error_nospc: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_NOSPC"
		end

	g_io_channel_error_nxio: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_NXIO"
		end

	g_io_channel_error_overflow: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_OVERFLOW"
		end

	g_io_channel_error_pipe: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_PIPE"
		end

	g_io_channel_error_failed: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_CHANNEL_ERROR_FAILED"
		end


end

