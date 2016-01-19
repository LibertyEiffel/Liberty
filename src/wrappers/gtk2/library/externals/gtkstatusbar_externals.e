-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSTATUSBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_statusbar_get_context_id (a_statusbar: POINTER; a_context_description: POINTER): NATURAL is
 		-- gtk_statusbar_get_context_id
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_context_id"
		}"
		end

	gtk_statusbar_get_has_resize_grip (a_statusbar: POINTER): INTEGER is
 		-- gtk_statusbar_get_has_resize_grip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_has_resize_grip"
		}"
		end

	gtk_statusbar_get_message_area (a_statusbar: POINTER): POINTER is
 		-- gtk_statusbar_get_message_area
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_message_area"
		}"
		end

	gtk_statusbar_get_type: like long_unsigned is
 		-- gtk_statusbar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_get_type()"
		}"
		end

	gtk_statusbar_new: POINTER is
 		-- gtk_statusbar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_new()"
		}"
		end

	gtk_statusbar_pop (a_statusbar: POINTER; a_context_id: NATURAL) is
 		-- gtk_statusbar_pop
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_pop"
		}"
		end

	gtk_statusbar_push (a_statusbar: POINTER; a_context_id: NATURAL; a_text: POINTER): NATURAL is
 		-- gtk_statusbar_push
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_push"
		}"
		end

	gtk_statusbar_remove (a_statusbar: POINTER; a_context_id: NATURAL; a_message_id: NATURAL) is
 		-- gtk_statusbar_remove
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_remove"
		}"
		end

	gtk_statusbar_remove_all (a_statusbar: POINTER; a_context_id: NATURAL) is
 		-- gtk_statusbar_remove_all
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_remove_all"
		}"
		end

	gtk_statusbar_set_has_resize_grip (a_statusbar: POINTER; a_setting: INTEGER) is
 		-- gtk_statusbar_set_has_resize_grip
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_statusbar_set_has_resize_grip"
		}"
		end


end -- class GTKSTATUSBAR_EXTERNALS
