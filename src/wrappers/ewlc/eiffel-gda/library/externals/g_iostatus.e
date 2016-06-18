-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_IOSTATUS
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN
		do
			Result := ((a_value = g_io_status_error) or else 
				(a_value = g_io_status_normal) or else 
				(a_value = g_io_status_eof) or else 
				(a_value = g_io_status_again))
		end


feature {ANY} -- Setters
	default_create, set_error
		do
			value := g_io_status_error
		end

	set_normal
		do
			value := g_io_status_normal
		end

	set_eof
		do
			value := g_io_status_eof
		end

	set_again
		do
			value := g_io_status_again
		end


feature {ANY} -- Queries
	is_error: BOOLEAN
		do
			Result := (value=g_io_status_error)
		end

	is_normal: BOOLEAN
		do
			Result := (value=g_io_status_normal)
		end

	is_eof: BOOLEAN
		do
			Result := (value=g_io_status_eof)
		end

	is_again: BOOLEAN
		do
			Result := (value=g_io_status_again)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_status_error: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_STATUS_ERROR"
		end

	g_io_status_normal: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_STATUS_NORMAL"
		end

	g_io_status_eof: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_STATUS_EOF"
		end

	g_io_status_again: INTEGER
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_STATUS_AGAIN"
		end


end

