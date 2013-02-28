-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_get_size (a_cell: POINTER; a_widget: POINTER; a_cell_area: POINTER; a_x_offset: POINTER; a_y_offset: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_cell_renderer_get_size (node at line 807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_size"
		}"
		end

	gtk_cell_renderer_set_visible (a_cell: POINTER; a_visible: INTEGER_32) is
 		-- gtk_cell_renderer_set_visible (node at line 1313)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_visible"
		}"
		end

	gtk_cell_renderer_get_sensitive (a_cell: POINTER): INTEGER_32 is
 		-- gtk_cell_renderer_get_sensitive (node at line 6893)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_sensitive"
		}"
		end

	gtk_cell_renderer_get_type: NATURAL_64 is
 		-- gtk_cell_renderer_get_type (node at line 7773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_type()"
		}"
		end

	gtk_cell_renderer_stop_editing (a_cell: POINTER; a_canceled: INTEGER_32) is
 		-- gtk_cell_renderer_stop_editing (node at line 9698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_stop_editing"
		}"
		end

	gtk_cell_renderer_set_sensitive (a_cell: POINTER; a_sensitive: INTEGER_32) is
 		-- gtk_cell_renderer_set_sensitive (node at line 11610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_sensitive"
		}"
		end

	gtk_cell_renderer_get_fixed_size (a_cell: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_cell_renderer_get_fixed_size (node at line 17152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_fixed_size"
		}"
		end

	gtk_cell_renderer_activate (a_cell: POINTER; an_event: POINTER; a_widget: POINTER; a_path: POINTER; a_background_area: POINTER; a_cell_area: POINTER; a_flags: INTEGER): INTEGER_32 is
 		-- gtk_cell_renderer_activate (node at line 19697)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_activate"
		}"
		end

	gtk_cell_renderer_set_fixed_size (a_cell: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_cell_renderer_set_fixed_size (node at line 23233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_fixed_size"
		}"
		end

	gtk_cell_renderer_get_padding (a_cell: POINTER; a_xpad: POINTER; a_ypad: POINTER) is
 		-- gtk_cell_renderer_get_padding (node at line 31992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_padding"
		}"
		end

	gtk_cell_renderer_get_alignment (a_cell: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_cell_renderer_get_alignment (node at line 35240)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_alignment"
		}"
		end

	gtk_cell_renderer_get_visible (a_cell: POINTER): INTEGER_32 is
 		-- gtk_cell_renderer_get_visible (node at line 36531)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_visible"
		}"
		end

	gtk_cell_renderer_start_editing (a_cell: POINTER; an_event: POINTER; a_widget: POINTER; a_path: POINTER; a_background_area: POINTER; a_cell_area: POINTER; a_flags: INTEGER): POINTER is
 		-- gtk_cell_renderer_start_editing (node at line 36896)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_start_editing"
		}"
		end

	gtk_cell_renderer_set_padding (a_cell: POINTER; a_xpad: INTEGER_32; a_ypad: INTEGER_32) is
 		-- gtk_cell_renderer_set_padding (node at line 38147)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_padding"
		}"
		end

	gtk_cell_renderer_set_alignment (a_cell: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_cell_renderer_set_alignment (node at line 39060)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_alignment"
		}"
		end

	gtk_cell_renderer_render (a_cell: POINTER; a_window: POINTER; a_widget: POINTER; a_background_area: POINTER; a_cell_area: POINTER; an_expose_area: POINTER; a_flags: INTEGER) is
 		-- gtk_cell_renderer_render (node at line 39303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_render"
		}"
		end


end -- class GTKCELLRENDERER_EXTERNALS
