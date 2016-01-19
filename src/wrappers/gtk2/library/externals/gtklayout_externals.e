-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKLAYOUT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_layout_get_bin_window (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_bin_window
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_bin_window"
		}"
		end

	gtk_layout_get_hadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_hadjustment"
		}"
		end

	gtk_layout_get_size (a_layout: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_layout_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_size"
		}"
		end

	gtk_layout_get_type: like long_unsigned is
 		-- gtk_layout_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_type()"
		}"
		end

	gtk_layout_get_vadjustment (a_layout: POINTER): POINTER is
 		-- gtk_layout_get_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_get_vadjustment"
		}"
		end

	gtk_layout_move (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_layout_move
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_move"
		}"
		end

	gtk_layout_new (a_hadjustment: POINTER; a_vadjustment: POINTER): POINTER is
 		-- gtk_layout_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_new"
		}"
		end

	gtk_layout_put (a_layout: POINTER; a_child_widget: POINTER; a_x: INTEGER; a_y: INTEGER) is
 		-- gtk_layout_put
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_put"
		}"
		end

	gtk_layout_set_hadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_hadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_hadjustment"
		}"
		end

	gtk_layout_set_size (a_layout: POINTER; a_width: NATURAL; a_height: NATURAL) is
 		-- gtk_layout_set_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_size"
		}"
		end

	gtk_layout_set_vadjustment (a_layout: POINTER; an_adjustment: POINTER) is
 		-- gtk_layout_set_vadjustment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_layout_set_vadjustment"
		}"
		end


end -- class GTKLAYOUT_EXTERNALS
