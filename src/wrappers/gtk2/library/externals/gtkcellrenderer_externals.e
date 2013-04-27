-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCELLRENDERER_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_cell_renderer_activate (a_cell: POINTER; an_event: POINTER; a_widget: POINTER; a_path: POINTER; a_background_area: POINTER; a_cell_area: POINTER; a_flags: INTEGER): INTEGER is
 		-- gtk_cell_renderer_activate
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_activate"
		}"
		end

	gtk_cell_renderer_get_alignment (a_cell: POINTER; a_xalign: POINTER; a_yalign: POINTER) is
 		-- gtk_cell_renderer_get_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_alignment"
		}"
		end

	gtk_cell_renderer_get_fixed_size (a_cell: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_cell_renderer_get_fixed_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_fixed_size"
		}"
		end

	gtk_cell_renderer_get_padding (a_cell: POINTER; a_xpad: POINTER; a_ypad: POINTER) is
 		-- gtk_cell_renderer_get_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_padding"
		}"
		end

	gtk_cell_renderer_get_sensitive (a_cell: POINTER): INTEGER is
 		-- gtk_cell_renderer_get_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_sensitive"
		}"
		end

	gtk_cell_renderer_get_size (a_cell: POINTER; a_widget: POINTER; a_cell_area: POINTER; a_x_offset: POINTER; a_y_offset: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- gtk_cell_renderer_get_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_size"
		}"
		end

	gtk_cell_renderer_get_type: like long_unsigned is
 		-- gtk_cell_renderer_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_type()"
		}"
		end

	gtk_cell_renderer_get_visible (a_cell: POINTER): INTEGER is
 		-- gtk_cell_renderer_get_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_get_visible"
		}"
		end

	gtk_cell_renderer_render (a_cell: POINTER; a_window: POINTER; a_widget: POINTER; a_background_area: POINTER; a_cell_area: POINTER; an_expose_area: POINTER; a_flags: INTEGER) is
 		-- gtk_cell_renderer_render
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_render"
		}"
		end

	gtk_cell_renderer_set_alignment (a_cell: POINTER; a_xalign: REAL_32; a_yalign: REAL_32) is
 		-- gtk_cell_renderer_set_alignment
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_alignment"
		}"
		end

	gtk_cell_renderer_set_fixed_size (a_cell: POINTER; a_width: INTEGER; a_height: INTEGER) is
 		-- gtk_cell_renderer_set_fixed_size
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_fixed_size"
		}"
		end

	gtk_cell_renderer_set_padding (a_cell: POINTER; a_xpad: INTEGER; a_ypad: INTEGER) is
 		-- gtk_cell_renderer_set_padding
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_padding"
		}"
		end

	gtk_cell_renderer_set_sensitive (a_cell: POINTER; a_sensitive: INTEGER) is
 		-- gtk_cell_renderer_set_sensitive
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_sensitive"
		}"
		end

	gtk_cell_renderer_set_visible (a_cell: POINTER; a_visible: INTEGER) is
 		-- gtk_cell_renderer_set_visible
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_set_visible"
		}"
		end

	gtk_cell_renderer_start_editing (a_cell: POINTER; an_event: POINTER; a_widget: POINTER; a_path: POINTER; a_background_area: POINTER; a_cell_area: POINTER; a_flags: INTEGER): POINTER is
 		-- gtk_cell_renderer_start_editing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_start_editing"
		}"
		end

	gtk_cell_renderer_stop_editing (a_cell: POINTER; a_canceled: INTEGER) is
 		-- gtk_cell_renderer_stop_editing
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_cell_renderer_stop_editing"
		}"
		end


end -- class GTKCELLRENDERER_EXTERNALS
