-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKFRAME_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_frame_get_label (a_frame: POINTER): POINTER is
 		-- gtk_frame_get_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_get_label"
		}"
		end

	gtk_frame_get_label_align (a_frame: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_frame_get_label_align
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_get_label_align"
		}"
		end

	gtk_frame_get_label_widget (a_frame: POINTER): POINTER is
 		-- gtk_frame_get_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_get_label_widget"
		}"
		end

	gtk_frame_get_shadow_type (a_frame: POINTER): INTEGER is
 		-- gtk_frame_get_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_get_shadow_type"
		}"
		end

	gtk_frame_get_type: like long_unsigned is
 		-- gtk_frame_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_get_type()"
		}"
		end

	gtk_frame_new (a_label: POINTER): POINTER is
 		-- gtk_frame_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_new"
		}"
		end

	gtk_frame_set_label (a_frame: POINTER; a_label: POINTER) is
 		-- gtk_frame_set_label
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_set_label"
		}"
		end

	gtk_frame_set_label_align (a_frame: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_frame_set_label_align
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_set_label_align"
		}"
		end

	gtk_frame_set_label_widget (a_frame: POINTER; a_label_widget: POINTER) is
 		-- gtk_frame_set_label_widget
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_set_label_widget"
		}"
		end

	gtk_frame_set_shadow_type (a_frame: POINTER; a_type: INTEGER) is
 		-- gtk_frame_set_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_frame_set_shadow_type"
		}"
		end


end -- class GTKFRAME_EXTERNALS
