-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSOCKET_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_socket_get_id (a_socket: POINTER): NATURAL_32 is
 		-- gtk_socket_get_id (node at line 4632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_id"
		}"
		end

	gtk_socket_new: POINTER is
 		-- gtk_socket_new (node at line 20423)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_new()"
		}"
		end

	gtk_socket_add_id (a_socket: POINTER; a_window_id: NATURAL_32) is
 		-- gtk_socket_add_id (node at line 23765)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_add_id"
		}"
		end

	gtk_socket_get_plug_window (a_socket: POINTER): POINTER is
 		-- gtk_socket_get_plug_window (node at line 38094)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_plug_window"
		}"
		end

	gtk_socket_get_type: NATURAL_64 is
 		-- gtk_socket_get_type (node at line 39022)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_type()"
		}"
		end


end -- class GTKSOCKET_EXTERNALS
