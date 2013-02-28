-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPLUG_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_plug_get_socket_window (a_plug: POINTER): POINTER is
 		-- gtk_plug_get_socket_window (node at line 2548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_socket_window"
		}"
		end

	-- `hidden' function _gtk_plug_add_to_socket skipped.
	gtk_plug_get_id (a_plug: POINTER): NATURAL_32 is
 		-- gtk_plug_get_id (node at line 26820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_id"
		}"
		end

	gtk_plug_new_for_display (a_display: POINTER; a_socket_id: NATURAL_32): POINTER is
 		-- gtk_plug_new_for_display (node at line 27353)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_new_for_display"
		}"
		end

	gtk_plug_construct (a_plug: POINTER; a_socket_id: NATURAL_32) is
 		-- gtk_plug_construct (node at line 28224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_construct"
		}"
		end

	-- `hidden' function _gtk_plug_remove_from_socket skipped.
	gtk_plug_construct_for_display (a_plug: POINTER; a_display: POINTER; a_socket_id: NATURAL_32) is
 		-- gtk_plug_construct_for_display (node at line 31218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_construct_for_display"
		}"
		end

	gtk_plug_get_type: NATURAL_64 is
 		-- gtk_plug_get_type (node at line 36084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_type()"
		}"
		end

	gtk_plug_get_embedded (a_plug: POINTER): INTEGER_32 is
 		-- gtk_plug_get_embedded (node at line 37797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_get_embedded"
		}"
		end

	gtk_plug_new (a_socket_id: NATURAL_32): POINTER is
 		-- gtk_plug_new (node at line 40648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_plug_new"
		}"
		end


end -- class GTKPLUG_EXTERNALS
