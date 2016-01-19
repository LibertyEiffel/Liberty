-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKSCROLLEDWINDOW_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_scrolled_window_add_with_viewport (a_scrolled_window: POINTER; a_child: POINTER) is
 		-- gtk_scrolled_window_add_with_viewport
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_add_with_viewport"
		}"
		end

	gtk_scrolled_window_get_hadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hadjustment"
		}"
		end

	gtk_scrolled_window_get_hscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_hscrollbar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_hscrollbar"
		}"
		end

	gtk_scrolled_window_get_placement (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_placement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_placement"
		}"
		end

	gtk_scrolled_window_get_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: POINTER; a_vscrollbar_policy: POINTER) is
 		-- gtk_scrolled_window_get_policy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_policy"
		}"
		end

	-- `hidden' function _gtk_scrolled_window_get_scrollbar_spacing skipped.
	gtk_scrolled_window_get_shadow_type (a_scrolled_window: POINTER): INTEGER is
 		-- gtk_scrolled_window_get_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_shadow_type"
		}"
		end

	gtk_scrolled_window_get_type: like long_unsigned is
 		-- gtk_scrolled_window_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_type()"
		}"
		end

	gtk_scrolled_window_get_vadjustment (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vadjustment"
		}"
		end

	gtk_scrolled_window_get_vscrollbar (a_scrolled_window: POINTER): POINTER is
 		-- gtk_scrolled_window_get_vscrollbar
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_get_vscrollbar"
		}"
		end

	gtk_scrolled_window_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_scrolled_window_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_new"
		}"
		end

	gtk_scrolled_window_set_hadjustment (a_scrolled_window: POINTER; a_hadjustment: POINTER) is
 		-- gtk_scrolled_window_set_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_hadjustment"
		}"
		end

	gtk_scrolled_window_set_placement (a_scrolled_window: POINTER; a_window_placement: INTEGER) is
 		-- gtk_scrolled_window_set_placement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_placement"
		}"
		end

	gtk_scrolled_window_set_policy (a_scrolled_window: POINTER; a_hscrollbar_policy: INTEGER; a_vscrollbar_policy: INTEGER) is
 		-- gtk_scrolled_window_set_policy
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_policy"
		}"
		end

	gtk_scrolled_window_set_shadow_type (a_scrolled_window: POINTER; a_type: INTEGER) is
 		-- gtk_scrolled_window_set_shadow_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_shadow_type"
		}"
		end

	gtk_scrolled_window_set_vadjustment (a_scrolled_window: POINTER; a_vadjustment: POINTER) is
 		-- gtk_scrolled_window_set_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_set_vadjustment"
		}"
		end

	gtk_scrolled_window_unset_placement (a_scrolled_window: POINTER) is
 		-- gtk_scrolled_window_unset_placement
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_scrolled_window_unset_placement"
		}"
		end


end -- class GTKSCROLLEDWINDOW_EXTERNALS
