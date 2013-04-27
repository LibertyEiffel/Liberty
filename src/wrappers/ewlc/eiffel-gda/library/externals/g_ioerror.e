-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_IOERROR
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_io_error_none) or else 
				(a_value = g_io_error_again) or else 
				(a_value = g_io_error_inval) or else 
				(a_value = g_io_error_unknown))
		end


feature {ANY} -- Setters
	default_create, set_none is
		do
			value := g_io_error_none
		end

	set_again is
		do
			value := g_io_error_again
		end

	set_inval is
		do
			value := g_io_error_inval
		end

	set_unknown is
		do
			value := g_io_error_unknown
		end


feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=g_io_error_none)
		end

	is_again: BOOLEAN is
		do
			Result := (value=g_io_error_again)
		end

	is_inval: BOOLEAN is
		do
			Result := (value=g_io_error_inval)
		end

	is_unknown: BOOLEAN is
		do
			Result := (value=g_io_error_unknown)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_error_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERROR_NONE"
		end

	g_io_error_again: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERROR_AGAIN"
		end

	g_io_error_inval: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERROR_INVAL"
		end

	g_io_error_unknown: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_IO_ERROR_UNKNOWN"
		end


end

