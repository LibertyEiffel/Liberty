-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLAYOUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_layout_get_size (a_layout: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_layout_get_size (node at line 6936)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_size"
		}"
		end

	gtk_layout_move (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_layout_move (node at line 16016)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_move"
		}"
		end

	gtk_layout_put (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER_32; a_y: INTEGER_32) is
 		-- gtk_layout_put (node at line 16791)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_put"
		}"
		end

	gtk_layout_set_vadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_vadjustment (node at line 17995)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_vadjustment"
		}"
		end

	gtk_layout_set_hadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_hadjustment (node at line 20535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_hadjustment"
		}"
		end

	gtk_layout_set_size (a_layout: POINTER; a_width: NATURAL_32; a_height: NATURAL_32) is
 		-- gtk_layout_set_size (node at line 25792)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_size"
		}"
		end

	gtk_layout_get_bin_window (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_bin_window (node at line 33884)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_bin_window"
		}"
		end

	gtk_layout_get_hadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_hadjustment (node at line 34834)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_hadjustment"
		}"
		end

	gtk_layout_get_vadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_vadjustment (node at line 35721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_vadjustment"
		}"
		end

	gtk_layout_get_type: NATURAL_64 is
 		-- gtk_layout_get_type (node at line 37513)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_type()"
		}"
		end

	gtk_layout_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_layout_new (node at line 40845)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_new"
		}"
		end


end -- class GTKLAYOUT_EXTERNALS
