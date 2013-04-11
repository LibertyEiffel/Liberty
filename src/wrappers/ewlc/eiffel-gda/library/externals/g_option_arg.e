-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.
expanded class G_OPTION_ARG
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_option_arg_none) or else 
				(a_value = g_option_arg_string) or else 
				(a_value = g_option_arg_int) or else 
				(a_value = g_option_arg_callback) or else 
				(a_value = g_option_arg_filename) or else 
				(a_value = g_option_arg_string_array) or else 
				(a_value = g_option_arg_filename_array) or else 
				(a_value = g_option_arg_double) or else 
				(a_value = g_option_arg_int64))
		end


feature {ANY} -- Setters
	default_create, set_none is
		do
			value := g_option_arg_none
		end

	set_string is
		do
			value := g_option_arg_string
		end

	set_int is
		do
			value := g_option_arg_int
		end

	set_callback is
		do
			value := g_option_arg_callback
		end

	set_filename is
		do
			value := g_option_arg_filename
		end

	set_string_array is
		do
			value := g_option_arg_string_array
		end

	set_filename_array is
		do
			value := g_option_arg_filename_array
		end

	set_double is
		do
			value := g_option_arg_double
		end

	set_int64 is
		do
			value := g_option_arg_int64
		end


feature {ANY} -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=g_option_arg_none)
		end

	is_string: BOOLEAN is
		do
			Result := (value=g_option_arg_string)
		end

	is_int: BOOLEAN is
		do
			Result := (value=g_option_arg_int)
		end

	is_callback: BOOLEAN is
		do
			Result := (value=g_option_arg_callback)
		end

	is_filename: BOOLEAN is
		do
			Result := (value=g_option_arg_filename)
		end

	is_string_array: BOOLEAN is
		do
			Result := (value=g_option_arg_string_array)
		end

	is_filename_array: BOOLEAN is
		do
			Result := (value=g_option_arg_filename_array)
		end

	is_double: BOOLEAN is
		do
			Result := (value=g_option_arg_double)
		end

	is_int64: BOOLEAN is
		do
			Result := (value=g_option_arg_int64)
		end


feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_option_arg_none: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_NONE"
		end

	g_option_arg_string: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_STRING"
		end

	g_option_arg_int: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_INT"
		end

	g_option_arg_callback: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_CALLBACK"
		end

	g_option_arg_filename: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_FILENAME"
		end

	g_option_arg_string_array: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_STRING_ARRAY"
		end

	g_option_arg_filename_array: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_FILENAME_ARRAY"
		end

	g_option_arg_double: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_DOUBLE"
		end

	g_option_arg_int64: INTEGER is
		external "C macro use <library/externals/all-gda-includes.h>"
		alias "G_OPTION_ARG_INT64"
		end


end

