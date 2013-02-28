-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCROLLEDWINDOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scrolled_window_get_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: POINTER; a_vscrollbar_policy: POINTER) is
 		-- gtk_scrolled_window_get_policy (node at line 3381)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_policy"
		}"
		end

	gtk_scrolled_window_unset_placement (a_scrolled_window: POINTER) is
 		-- gtk_scrolled_window_unset_placement (node at line 5185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_unset_placement"
		}"
		end

	gtk_scrolled_window_add_with_viewport (a_scrolled_window: POINTER; a_child: POINTER) is
 		-- gtk_scrolled_window_add_with_viewport (node at line 8887)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_add_with_viewport"
		}"
		end

	gtk_scrolled_window_get_vadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vadjustment (node at line 16533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vadjustment"
		}"
		end

	gtk_scrolled_window_set_shadow_type (a_scrolled_window: POINTER; a_type: INTEGER) is
 		-- gtk_scrolled_window_set_shadow_type (node at line 20757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_shadow_type"
		}"
		end

	gtk_scrolled_window_set_hadjustment (a_scrolled_window: POINTER; a_hadjustment: POINTER) is
 		-- gtk_scrolled_window_set_hadjustment (node at line 22934)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_hadjustment"
		}"
		end

	gtk_scrolled_window_set_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: INTEGER; a_vscrollbar_policy: INTEGER) is
 		-- gtk_scrolled_window_set_policy (node at line 23204)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_policy"
		}"
		end

	gtk_scrolled_window_set_placement (a_scrolled_window: POINTER; a_window_placement: INTEGER) is
 		-- gtk_scrolled_window_set_placement (node at line 23336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_placement"
		}"
		end

	gtk_scrolled_window_get_placement (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_placement (node at line 25317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_placement"
		}"
		end

	gtk_scrolled_window_get_hscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hscrollbar (node at line 27860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hscrollbar"
		}"
		end

	gtk_scrolled_window_get_vscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vscrollbar (node at line 28462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vscrollbar"
		}"
		end

	gtk_scrolled_window_get_hadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hadjustment (node at line 29817)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hadjustment"
		}"
		end

	gtk_scrolled_window_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_scrolled_window_new (node at line 34049)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_new"
		}"
		end

	gtk_scrolled_window_get_shadow_type (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_shadow_type (node at line 34977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_shadow_type"
		}"
		end

	gtk_scrolled_window_set_vadjustment (a_scrolled_window: POINTER; a_vadjustment: POINTER) is
 		-- gtk_scrolled_window_set_vadjustment (node at line 38685)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_vadjustment"
		}"
		end

	-- `hidden' function _gtk_scrolled_window_get_scrollbar_spacing skipped.
	gtk_scrolled_window_get_type: NATURAL_64 is
 		-- gtk_scrolled_window_get_type (node at line 40711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_type()"
		}"
		end


end -- class GTKSCROLLEDWINDOW_EXTERNALS
