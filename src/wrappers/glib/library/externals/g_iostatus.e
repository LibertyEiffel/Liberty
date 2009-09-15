-- This file have been created by eiffel-gcc-xml.
-- Any change will be lost by the next execution of the tool.

expanded class G_IOSTATUS

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = g_io_status_error) or else 
				(a_value = g_io_status_normal) or else 
				(a_value = g_io_status_eof) or else 
				(a_value = g_io_status_again))
		end

feature -- Setters
	default_create,  set_rror is
	
		do
			value := g_io_status_error
		end

	 set_ormal is
	
		do
			value := g_io_status_normal
		end

	 set_of is
	
		do
			value := g_io_status_eof
		end

	 set_gain is
	
		do
			value := g_io_status_again
		end

feature -- Queries
	is_rror: BOOLEAN is
		
		do
			Result := (value=g_io_status_error)
		end

	is_ormal: BOOLEAN is
		
		do
			Result := (value=g_io_status_normal)
		end

	is_of: BOOLEAN is
		
		do
			Result := (value=g_io_status_eof)
		end

	is_gain: BOOLEAN is
		
		do
			Result := (value=g_io_status_again)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_io_status_error: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_STATUS_ERROR"
 			}"
 		end

	g_io_status_normal: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_STATUS_NORMAL"
 			}"
 		end

	g_io_status_eof: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_STATUS_EOF"
 			}"
 		end

	g_io_status_again: INTEGER is
		external "plug_in"
 		alias "{
 			location: "../../../plugins"
 			module: "glib"
 			feature_name: "G_IO_STATUS_AGAIN"
 			}"
 		end

end

