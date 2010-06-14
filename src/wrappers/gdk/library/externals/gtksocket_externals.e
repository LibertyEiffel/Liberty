-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSOCKET_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_socket_get_id (a_socket: POINTER): NATURAL_32 is
 		-- gtk_socket_get_id (node at line 4407)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_id"
		}"
		end

	gtk_socket_new: POINTER is
 		-- gtk_socket_new (node at line 18709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_new()"
		}"
		end

	gtk_socket_get_type: NATURAL_32 is
 		-- gtk_socket_get_type (node at line 20343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_type()"
		}"
		end

	gtk_socket_add_id (a_socket: POINTER; a_window_id: NATURAL_32) is
 		-- gtk_socket_add_id (node at line 21548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_add_id"
		}"
		end

	gtk_socket_steal (a_socket: POINTER; a_wid: NATURAL_32) is
 		-- gtk_socket_steal (node at line 25244)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_steal"
		}"
		end

	gtk_socket_get_plug_window (a_socket: POINTER): POINTER is
 		-- gtk_socket_get_plug_window (node at line 34567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_socket_get_plug_window"
		}"
		end


end -- class GTKSOCKET_EXTERNALS
