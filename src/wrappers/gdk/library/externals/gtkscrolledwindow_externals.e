-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCROLLEDWINDOW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scrolled_window_unset_placement (a_scrolled_window: POINTER) is
 		-- gtk_scrolled_window_unset_placement (node at line 4961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_unset_placement"
		}"
		end

	gtk_scrolled_window_set_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: INTEGER; a_vscrollbar_policy: INTEGER) is
 		-- gtk_scrolled_window_set_policy (node at line 6573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_policy"
		}"
		end

	gtk_scrolled_window_add_with_viewport (a_scrolled_window: POINTER; a_child: POINTER) is
 		-- gtk_scrolled_window_add_with_viewport (node at line 8213)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_add_with_viewport"
		}"
		end

	gtk_scrolled_window_set_placement (a_scrolled_window: POINTER; a_window_placement: INTEGER) is
 		-- gtk_scrolled_window_set_placement (node at line 13233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_placement"
		}"
		end

	gtk_scrolled_window_set_shadow_type (a_scrolled_window: POINTER; a_type: INTEGER) is
 		-- gtk_scrolled_window_set_shadow_type (node at line 19006)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_shadow_type"
		}"
		end

	gtk_scrolled_window_set_hadjustment (a_scrolled_window: POINTER; a_hadjustment: POINTER) is
 		-- gtk_scrolled_window_set_hadjustment (node at line 20818)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_hadjustment"
		}"
		end

	gtk_scrolled_window_set_vadjustment (a_scrolled_window: POINTER; a_vadjustment: POINTER) is
 		-- gtk_scrolled_window_set_vadjustment (node at line 21718)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_vadjustment"
		}"
		end

	gtk_scrolled_window_get_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: POINTER; a_vscrollbar_policy: POINTER) is
 		-- gtk_scrolled_window_get_policy (node at line 22448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_policy"
		}"
		end

	gtk_scrolled_window_get_hscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hscrollbar (node at line 25134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hscrollbar"
		}"
		end

	gtk_scrolled_window_get_vscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vscrollbar (node at line 25645)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vscrollbar"
		}"
		end

	gtk_scrolled_window_get_placement (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_placement (node at line 30387)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_placement"
		}"
		end

	gtk_scrolled_window_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_scrolled_window_new (node at line 30839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_new"
		}"
		end

	gtk_scrolled_window_get_shadow_type (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_shadow_type (node at line 31622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_shadow_type"
		}"
		end

	gtk_scrolled_window_get_hadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hadjustment (node at line 33289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hadjustment"
		}"
		end

	gtk_scrolled_window_get_vadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vadjustment (node at line 34134)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vadjustment"
		}"
		end

	-- `hidden' function _gtk_scrolled_window_get_scrollbar_spacing skipped.
	gtk_scrolled_window_get_type: NATURAL_32 is
 		-- gtk_scrolled_window_get_type (node at line 37002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_type()"
		}"
		end


end -- class GTKSCROLLEDWINDOW_EXTERNALS
