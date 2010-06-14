-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLAYOUT_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_layout_get_size (a_layout: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_layout_get_size (node at line 6351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_size"
		}"
		end

	gtk_layout_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_layout_new (node at line 9567)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_new"
		}"
		end

	gtk_layout_freeze (a_layout: POINTER) is
 		-- gtk_layout_freeze (node at line 11819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_freeze"
		}"
		end

	gtk_layout_move (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_layout_move (node at line 14784)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_move"
		}"
		end

	gtk_layout_put (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_layout_put (node at line 15473)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_put"
		}"
		end

	gtk_layout_set_hadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_hadjustment (node at line 18812)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_hadjustment"
		}"
		end

	gtk_layout_set_vadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_vadjustment (node at line 19748)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_vadjustment"
		}"
		end

	gtk_layout_set_size (a_layout: POINTER; a_width: NATURAL_32; a_height: NATURAL_32) is
 		-- gtk_layout_set_size (node at line 23431)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_size"
		}"
		end

	gtk_layout_get_bin_window (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_bin_window (node at line 29651)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_bin_window"
		}"
		end

	gtk_layout_get_hadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_hadjustment (node at line 31497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_hadjustment"
		}"
		end

	gtk_layout_get_type: NATURAL_32 is
 		-- gtk_layout_get_type (node at line 31772)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_type()"
		}"
		end

	gtk_layout_get_vadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_vadjustment (node at line 32349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_vadjustment"
		}"
		end

	gtk_layout_thaw (a_layout: POINTER) is
 		-- gtk_layout_thaw (node at line 37307)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_thaw"
		}"
		end


end -- class GTKLAYOUT_EXTERNALS
