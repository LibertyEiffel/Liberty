-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPLUG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	-- `hidden' function _gtk_plug_add_to_socket skipped.
	gtk_plug_construct (a_plug: POINTER; a_socket_id: NATURAL) is
 		-- gtk_plug_construct
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_construct"
		}"
		end

	gtk_plug_construct_for_display (a_plug: POINTER; a_display: POINTER; a_socket_id: NATURAL) is
 		-- gtk_plug_construct_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_construct_for_display"
		}"
		end

	gtk_plug_get_embedded (a_plug: POINTER): INTEGER is
 		-- gtk_plug_get_embedded
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_embedded"
		}"
		end

	gtk_plug_get_id (a_plug: POINTER): NATURAL is
 		-- gtk_plug_get_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_id"
		}"
		end

	gtk_plug_get_socket_window (a_plug: POINTER): POINTER is
 		-- gtk_plug_get_socket_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_socket_window"
		}"
		end

	gtk_plug_get_type: like long_unsigned is
 		-- gtk_plug_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_type()"
		}"
		end

	gtk_plug_new (a_socket_id: NATURAL): POINTER is
 		-- gtk_plug_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_new"
		}"
		end

	gtk_plug_new_for_display (a_display: POINTER; a_socket_id: NATURAL): POINTER is
 		-- gtk_plug_new_for_display
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_new_for_display"
		}"
		end

	-- `hidden' function _gtk_plug_remove_from_socket skipped.

end -- class GTKPLUG_EXTERNALS
