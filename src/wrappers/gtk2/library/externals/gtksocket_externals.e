-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSOCKET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_socket_add_id (a_socket: POINTER; a_window_id: NATURAL) is
 		-- gtk_socket_add_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_add_id"
		}"
		end

	gtk_socket_get_id (a_socket: POINTER): NATURAL is
 		-- gtk_socket_get_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_id"
		}"
		end

	gtk_socket_get_plug_window (a_socket: POINTER): POINTER is
 		-- gtk_socket_get_plug_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_plug_window"
		}"
		end

	gtk_socket_get_type: like long_unsigned is
 		-- gtk_socket_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_type()"
		}"
		end

	gtk_socket_new: POINTER is
 		-- gtk_socket_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_new()"
		}"
		end


end -- class GTKSOCKET_EXTERNALS
