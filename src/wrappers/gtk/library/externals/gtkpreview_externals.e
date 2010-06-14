-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPREVIEW_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_preview_put (a_preview: POINTER; a_window: POINTER; a_gc: POINTER; a_srcx: INTEGER_32; a_srcy: INTEGER_32; a_destx: INTEGER_32; a_desty: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_preview_put (node at line 81)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_put"
		}"
		end

	gtk_preview_set_gamma (a_gamma: REAL_64) is
 		-- gtk_preview_set_gamma (node at line 3366)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_gamma"
		}"
		end

	gtk_preview_get_info: POINTER is
 		-- gtk_preview_get_info (node at line 4757)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_get_info()"
		}"
		end

	gtk_preview_size (a_preview: POINTER; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- gtk_preview_size (node at line 9849)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_size"
		}"
		end

	gtk_preview_reset is
 		-- gtk_preview_reset (node at line 10895)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_reset()"
		}"
		end

	gtk_preview_get_type: NATURAL_32 is
 		-- gtk_preview_get_type (node at line 14516)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_get_type()"
		}"
		end

	gtk_preview_set_reserved (a_nreserved: INTEGER_32) is
 		-- gtk_preview_set_reserved (node at line 18336)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_reserved"
		}"
		end

	gtk_preview_uninit is
 		-- gtk_preview_uninit (node at line 19152)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_uninit()"
		}"
		end

	gtk_preview_get_cmap: POINTER is
 		-- gtk_preview_get_cmap (node at line 19939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_get_cmap()"
		}"
		end

	gtk_preview_set_expand (a_preview: POINTER; an_expand: INTEGER_32) is
 		-- gtk_preview_set_expand (node at line 21469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_expand"
		}"
		end

	gtk_preview_get_visual: POINTER is
 		-- gtk_preview_get_visual (node at line 24037)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_get_visual()"
		}"
		end

	gtk_preview_set_color_cube (a_nred_shades: NATURAL_32; a_ngreen_shades: NATURAL_32; a_nblue_shades: NATURAL_32; a_ngray_shades: NATURAL_32) is
 		-- gtk_preview_set_color_cube (node at line 25973)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_color_cube"
		}"
		end

	gtk_preview_draw_row (a_preview: POINTER; a_data: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_w: INTEGER_32) is
 		-- gtk_preview_draw_row (node at line 31956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_draw_row"
		}"
		end

	gtk_preview_set_install_cmap (an_install_cmap: INTEGER_32) is
 		-- gtk_preview_set_install_cmap (node at line 34053)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_install_cmap"
		}"
		end

	gtk_preview_set_dither (a_preview: POINTER; a_dither: INTEGER) is
 		-- gtk_preview_set_dither (node at line 36703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_set_dither"
		}"
		end

	gtk_preview_new (a_type: INTEGER): POINTER is
 		-- gtk_preview_new (node at line 37202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_preview_new"
		}"
		end


end -- class GTKPREVIEW_EXTERNALS
