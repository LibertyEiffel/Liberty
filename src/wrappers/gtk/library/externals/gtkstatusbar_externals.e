-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTATUSBAR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_statusbar_set_has_resize_grip (a_statusbar: POINTER; a_setting: INTEGER_32) is
 		-- gtk_statusbar_set_has_resize_grip (node at line 10411)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_set_has_resize_grip"
		}"
		end

	gtk_statusbar_get_type: NATURAL_32 is
 		-- gtk_statusbar_get_type (node at line 12004)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_type()"
		}"
		end

	gtk_statusbar_new: POINTER is
 		-- gtk_statusbar_new (node at line 13760)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_new()"
		}"
		end

	gtk_statusbar_get_message_area (a_statusbar: POINTER): POINTER is
 		-- gtk_statusbar_get_message_area (node at line 14055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_message_area"
		}"
		end

	gtk_statusbar_get_has_resize_grip (a_statusbar: POINTER): INTEGER_32 is
 		-- gtk_statusbar_get_has_resize_grip (node at line 21935)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_has_resize_grip"
		}"
		end

	gtk_statusbar_get_context_id (a_statusbar: POINTER; a_context_description: POINTER): NATURAL_32 is
 		-- gtk_statusbar_get_context_id (node at line 23122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_context_id"
		}"
		end

	gtk_statusbar_remove (a_statusbar: POINTER; a_context_id: NATURAL_32; a_message_id: NATURAL_32) is
 		-- gtk_statusbar_remove (node at line 26478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_remove"
		}"
		end

	gtk_statusbar_pop (a_statusbar: POINTER; a_context_id: NATURAL_32) is
 		-- gtk_statusbar_pop (node at line 33824)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_pop"
		}"
		end

	gtk_statusbar_push (a_statusbar: POINTER; a_context_id: NATURAL_32; a_text: POINTER): NATURAL_32 is
 		-- gtk_statusbar_push (node at line 34073)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_push"
		}"
		end


end -- class GTKSTATUSBAR_EXTERNALS
