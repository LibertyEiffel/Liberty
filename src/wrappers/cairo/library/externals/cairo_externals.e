-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class CAIRO_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	cairo_new_path (a_cr: POINTER) is
 		-- cairo_new_path (node at line 5)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_new_path"
		}"
		end

	cairo_recording_surface_get_extents (a_surface: POINTER; an_extents: POINTER): INTEGER_32 is
 		-- cairo_recording_surface_get_extents (node at line 8)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_recording_surface_get_extents"
		}"
		end

	cairo_region_intersect_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER is
 		-- cairo_region_intersect_rectangle (node at line 20)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_intersect_rectangle"
		}"
		end

	cairo_pattern_get_user_data (a_pattern: POINTER; a_key: POINTER): POINTER is
 		-- cairo_pattern_get_user_data (node at line 25)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_user_data"
		}"
		end

	cairo_pattern_set_user_data (a_pattern: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_pattern_set_user_data (node at line 29)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_set_user_data"
		}"
		end

	cairo_image_surface_create_from_png_stream (a_read_func: POINTER; a_closure: POINTER): POINTER is
 		-- cairo_image_surface_create_from_png_stream (node at line 35)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_create_from_png_stream"
		}"
		end

	cairo_get_fill_rule (a_cr: POINTER): INTEGER is
 		-- cairo_get_fill_rule (node at line 40)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_fill_rule"
		}"
		end

	cairo_arc (a_cr: POINTER; a_xc: REAL_64; a_yc: REAL_64; a_radius: REAL_64; an_angle1: REAL_64; an_angle2: REAL_64) is
 		-- cairo_arc (node at line 54)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_arc"
		}"
		end

	cairo_pattern_create_rgb (a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64): POINTER is
 		-- cairo_pattern_create_rgb (node at line 62)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_rgb"
		}"
		end

	cairo_region_destroy (a_region: POINTER) is
 		-- cairo_region_destroy (node at line 69)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_destroy"
		}"
		end

	cairo_device_observer_glyphs_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_glyphs_elapsed (node at line 72)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_glyphs_elapsed"
		}"
		end

	cairo_surface_create_for_rectangle (a_target: POINTER; a_x: REAL_64; a_y: REAL_64; a_width: REAL_64; a_height: REAL_64): POINTER is
 		-- cairo_surface_create_for_rectangle (node at line 75)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_create_for_rectangle"
		}"
		end

	cairo_mesh_pattern_get_path (a_pattern: POINTER; a_patch_num: NATURAL_32): POINTER is
 		-- cairo_mesh_pattern_get_path (node at line 95)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_get_path"
		}"
		end

	cairo_surface_observer_add_finish_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_finish_callback (node at line 99)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_finish_callback"
		}"
		end

	cairo_matrix_scale (a_matrix: POINTER; a_sx: REAL_64; a_sy: REAL_64) is
 		-- cairo_matrix_scale (node at line 104)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_scale"
		}"
		end

	cairo_pattern_get_type (a_pattern: POINTER): INTEGER is
 		-- cairo_pattern_get_type (node at line 109)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_type"
		}"
		end

	cairo_region_create: POINTER is
 		-- cairo_region_create (node at line 114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_create()"
		}"
		end

	cairo_rel_line_to (a_cr: POINTER; a_dx: REAL_64; a_dy: REAL_64) is
 		-- cairo_rel_line_to (node at line 116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rel_line_to"
		}"
		end

	cairo_get_user_data (a_cr: POINTER; a_key: POINTER): POINTER is
 		-- cairo_get_user_data (node at line 123)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_user_data"
		}"
		end

	cairo_raster_source_pattern_get_callback_data (a_pattern: POINTER): POINTER is
 		-- cairo_raster_source_pattern_get_callback_data (node at line 127)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_get_callback_data"
		}"
		end

	cairo_scaled_font_get_type (a_scaled_font: POINTER): INTEGER is
 		-- cairo_scaled_font_get_type (node at line 130)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_type"
		}"
		end

	cairo_matrix_init (a_matrix: POINTER; a_xx: REAL_64; a_yx: REAL_64; a_xy: REAL_64; a_yy: REAL_64; a_x0: REAL_64; a_y0: REAL_64) is
 		-- cairo_matrix_init (node at line 133)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_init"
		}"
		end

	cairo_get_dash_count (a_cr: POINTER): INTEGER_32 is
 		-- cairo_get_dash_count (node at line 142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_dash_count"
		}"
		end

	cairo_clip_preserve (a_cr: POINTER) is
 		-- cairo_clip_preserve (node at line 145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_clip_preserve"
		}"
		end

	cairo_reference (a_cr: POINTER): POINTER is
 		-- cairo_reference (node at line 150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_reference"
		}"
		end

	cairo_user_to_device (a_cr: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- cairo_user_to_device (node at line 153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_to_device"
		}"
		end

	cairo_stroke (a_cr: POINTER) is
 		-- cairo_stroke (node at line 158)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_stroke"
		}"
		end

	cairo_raster_source_pattern_get_copy (a_pattern: POINTER): POINTER is
 		-- cairo_raster_source_pattern_get_copy (node at line 161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_get_copy"
		}"
		end

	cairo_image_surface_get_height (a_surface: POINTER): INTEGER_32 is
 		-- cairo_image_surface_get_height (node at line 164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_get_height"
		}"
		end

	cairo_device_observer_print (a_device: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER is
 		-- cairo_device_observer_print (node at line 167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_print"
		}"
		end

	cairo_user_font_face_get_render_glyph_func (a_font_face: POINTER): POINTER is
 		-- cairo_user_font_face_get_render_glyph_func (node at line 172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_get_render_glyph_func"
		}"
		end

	cairo_scaled_font_get_font_matrix (a_scaled_font: POINTER; a_font_matrix: POINTER) is
 		-- cairo_scaled_font_get_font_matrix (node at line 176)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_font_matrix"
		}"
		end

	cairo_surface_get_reference_count (a_surface: POINTER): NATURAL_32 is
 		-- cairo_surface_get_reference_count (node at line 180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_reference_count"
		}"
		end

	cairo_pattern_get_radial_circles (a_pattern: POINTER; a_x0: POINTER; a_y0: POINTER; a_r0: POINTER; a_x1: POINTER; a_y1: POINTER; a_r1: POINTER): INTEGER is
 		-- cairo_pattern_get_radial_circles (node at line 198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_radial_circles"
		}"
		end

	cairo_device_finish (a_device: POINTER) is
 		-- cairo_device_finish (node at line 207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_finish"
		}"
		end

	cairo_matrix_rotate (a_matrix: POINTER; a_radians: REAL_64) is
 		-- cairo_matrix_rotate (node at line 210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_rotate"
		}"
		end

	cairo_matrix_invert (a_matrix: POINTER): INTEGER is
 		-- cairo_matrix_invert (node at line 214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_invert"
		}"
		end

	cairo_image_surface_create_for_data (a_data: POINTER; a_format: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32; a_stride: INTEGER_32): POINTER is
 		-- cairo_image_surface_create_for_data (node at line 218)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_create_for_data"
		}"
		end

	cairo_surface_observer_add_glyphs_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_glyphs_callback (node at line 225)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_glyphs_callback"
		}"
		end

	cairo_line_to (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_line_to (node at line 230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_line_to"
		}"
		end

	cairo_format_stride_for_width (a_format: INTEGER; a_width: INTEGER_32): INTEGER_32 is
 		-- cairo_format_stride_for_width (node at line 237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_format_stride_for_width"
		}"
		end

	cairo_raster_source_pattern_get_acquire (a_pattern: POINTER; an_acquire: POINTER; a_release: POINTER) is
 		-- cairo_raster_source_pattern_get_acquire (node at line 241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_get_acquire"
		}"
		end

	cairo_scaled_font_get_reference_count (a_scaled_font: POINTER): NATURAL_32 is
 		-- cairo_scaled_font_get_reference_count (node at line 252)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_reference_count"
		}"
		end

	cairo_set_user_data (a_cr: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_set_user_data (node at line 297)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_user_data"
		}"
		end

	cairo_matrix_init_rotate (a_matrix: POINTER; a_radians: REAL_64) is
 		-- cairo_matrix_init_rotate (node at line 303)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_init_rotate"
		}"
		end

	cairo_font_face_destroy (a_font_face: POINTER) is
 		-- cairo_font_face_destroy (node at line 314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_destroy"
		}"
		end

	cairo_close_path (a_cr: POINTER) is
 		-- cairo_close_path (node at line 317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_close_path"
		}"
		end

	cairo_move_to (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_move_to (node at line 320)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_move_to"
		}"
		end

	cairo_user_font_face_get_init_func (a_font_face: POINTER): POINTER is
 		-- cairo_user_font_face_get_init_func (node at line 325)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_get_init_func"
		}"
		end

	cairo_region_reference (a_region: POINTER): POINTER is
 		-- cairo_region_reference (node at line 328)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_reference"
		}"
		end

	cairo_set_scaled_font (a_cr: POINTER; a_scaled_font: POINTER) is
 		-- cairo_set_scaled_font (node at line 331)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_scaled_font"
		}"
		end

	cairo_region_get_rectangle (a_region: POINTER; a_nth: INTEGER_32; a_rectangle: POINTER) is
 		-- cairo_region_get_rectangle (node at line 335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_get_rectangle"
		}"
		end

	cairo_font_face_reference (a_font_face: POINTER): POINTER is
 		-- cairo_font_face_reference (node at line 340)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_reference"
		}"
		end

	cairo_pattern_create_radial (a_cx0: REAL_64; a_cy0: REAL_64; a_radius0: REAL_64; a_cx1: REAL_64; a_cy1: REAL_64; a_radius1: REAL_64): POINTER is
 		-- cairo_pattern_create_radial (node at line 343)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_radial"
		}"
		end

	cairo_device_observer_paint_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_paint_elapsed (node at line 351)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_paint_elapsed"
		}"
		end

	cairo_font_options_get_antialias (an_options: POINTER): INTEGER is
 		-- cairo_font_options_get_antialias (node at line 355)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_get_antialias"
		}"
		end

	cairo_scaled_font_set_user_data (a_scaled_font: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_scaled_font_set_user_data (node at line 360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_set_user_data"
		}"
		end

	cairo_pattern_add_color_stop_rgb (a_pattern: POINTER; an_offset: REAL_64; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64) is
 		-- cairo_pattern_add_color_stop_rgb (node at line 367)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_add_color_stop_rgb"
		}"
		end

	cairo_pattern_get_extend (a_pattern: POINTER): INTEGER is
 		-- cairo_pattern_get_extend (node at line 382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_extend"
		}"
		end

	cairo_pattern_get_matrix (a_pattern: POINTER; a_matrix: POINTER) is
 		-- cairo_pattern_get_matrix (node at line 385)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_matrix"
		}"
		end

	cairo_set_source_rgb (a_cr: POINTER; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64) is
 		-- cairo_set_source_rgb (node at line 389)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_source_rgb"
		}"
		end

	cairo_user_font_face_create: POINTER is
 		-- cairo_user_font_face_create (node at line 395)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_create()"
		}"
		end

	cairo_show_page (a_cr: POINTER) is
 		-- cairo_show_page (node at line 396)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_show_page"
		}"
		end

	cairo_surface_create_similar_image (an_other: POINTER; a_format: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32): POINTER is
 		-- cairo_surface_create_similar_image (node at line 399)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_create_similar_image"
		}"
		end

	cairo_region_intersect (a_dst: POINTER; an_other: POINTER): INTEGER is
 		-- cairo_region_intersect (node at line 413)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_intersect"
		}"
		end

	cairo_region_copy (an_original: POINTER): POINTER is
 		-- cairo_region_copy (node at line 417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_copy"
		}"
		end

	cairo_append_path (a_cr: POINTER; a_path: POINTER) is
 		-- cairo_append_path (node at line 420)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_append_path"
		}"
		end

	cairo_scaled_font_glyph_extents (a_scaled_font: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER_32; an_extents: POINTER) is
 		-- cairo_scaled_font_glyph_extents (node at line 426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_glyph_extents"
		}"
		end

	cairo_set_font_size (a_cr: POINTER; a_size: REAL_64) is
 		-- cairo_set_font_size (node at line 432)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_font_size"
		}"
		end

	cairo_region_status (a_region: POINTER): INTEGER is
 		-- cairo_region_status (node at line 436)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_status"
		}"
		end

	cairo_create (a_target: POINTER): POINTER is
 		-- cairo_create (node at line 445)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_create"
		}"
		end

	cairo_get_miter_limit (a_cr: POINTER): REAL_64 is
 		-- cairo_get_miter_limit (node at line 448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_miter_limit"
		}"
		end

	cairo_transform (a_cr: POINTER; a_matrix: POINTER) is
 		-- cairo_transform (node at line 451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_transform"
		}"
		end

	cairo_recording_surface_create (a_content: INTEGER; an_extents: POINTER): POINTER is
 		-- cairo_recording_surface_create (node at line 455)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_recording_surface_create"
		}"
		end

	cairo_device_observer_mask_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_mask_elapsed (node at line 459)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_mask_elapsed"
		}"
		end

	cairo_get_tolerance (a_cr: POINTER): REAL_64 is
 		-- cairo_get_tolerance (node at line 462)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_tolerance"
		}"
		end

	cairo_get_font_options (a_cr: POINTER; an_options: POINTER) is
 		-- cairo_get_font_options (node at line 465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_font_options"
		}"
		end

	cairo_mesh_pattern_move_to (a_pattern: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_mesh_pattern_move_to (node at line 469)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_move_to"
		}"
		end

	cairo_font_face_set_user_data (a_font_face: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_font_face_set_user_data (node at line 480)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_set_user_data"
		}"
		end

	cairo_glyph_allocate (a_num_glyphs: INTEGER_32): POINTER is
 		-- cairo_glyph_allocate (node at line 486)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_glyph_allocate"
		}"
		end

	cairo_surface_supports_mime_type (a_surface: POINTER; a_mime_type: POINTER): INTEGER_32 is
 		-- cairo_surface_supports_mime_type (node at line 489)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_supports_mime_type"
		}"
		end

	cairo_translate (a_cr: POINTER; a_tx: REAL_64; a_ty: REAL_64) is
 		-- cairo_translate (node at line 493)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_translate"
		}"
		end

	cairo_save (a_cr: POINTER) is
 		-- cairo_save (node at line 498)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_save"
		}"
		end

	cairo_region_equal (an_a: POINTER; a_b: POINTER): INTEGER_32 is
 		-- cairo_region_equal (node at line 501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_equal"
		}"
		end

	cairo_rotate (a_cr: POINTER; an_angle: REAL_64) is
 		-- cairo_rotate (node at line 505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rotate"
		}"
		end

	cairo_region_num_rectangles (a_region: POINTER): INTEGER_32 is
 		-- cairo_region_num_rectangles (node at line 509)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_num_rectangles"
		}"
		end

	cairo_get_line_join (a_cr: POINTER): INTEGER is
 		-- cairo_get_line_join (node at line 512)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_line_join"
		}"
		end

	cairo_scaled_font_reference (a_scaled_font: POINTER): POINTER is
 		-- cairo_scaled_font_reference (node at line 515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_reference"
		}"
		end

	cairo_version_string: POINTER is
 		-- cairo_version_string (node at line 518)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_version_string()"
		}"
		end

	cairo_surface_flush (a_surface: POINTER) is
 		-- cairo_surface_flush (node at line 519)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_flush"
		}"
		end

	cairo_get_line_width (a_cr: POINTER): REAL_64 is
 		-- cairo_get_line_width (node at line 522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_line_width"
		}"
		end

	cairo_surface_mark_dirty (a_surface: POINTER) is
 		-- cairo_surface_mark_dirty (node at line 525)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_mark_dirty"
		}"
		end

	cairo_font_options_get_hint_metrics (an_options: POINTER): INTEGER is
 		-- cairo_font_options_get_hint_metrics (node at line 528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_get_hint_metrics"
		}"
		end

	cairo_reset_clip (a_cr: POINTER) is
 		-- cairo_reset_clip (node at line 535)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_reset_clip"
		}"
		end

	cairo_mask (a_cr: POINTER; a_pattern: POINTER) is
 		-- cairo_mask (node at line 538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mask"
		}"
		end

	cairo_get_font_matrix (a_cr: POINTER; a_matrix: POINTER) is
 		-- cairo_get_font_matrix (node at line 542)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_font_matrix"
		}"
		end

	cairo_select_font_face (a_cr: POINTER; a_family: POINTER; a_slant: INTEGER; a_weight: INTEGER) is
 		-- cairo_select_font_face (node at line 546)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_select_font_face"
		}"
		end

	cairo_image_surface_create_from_png (a_filename: POINTER): POINTER is
 		-- cairo_image_surface_create_from_png (node at line 552)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_create_from_png"
		}"
		end

	cairo_surface_write_to_png_stream (a_surface: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER is
 		-- cairo_surface_write_to_png_stream (node at line 555)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_write_to_png_stream"
		}"
		end

	cairo_mesh_pattern_get_control_point (a_pattern: POINTER; a_patch_num: NATURAL_32; a_point_num: NATURAL_32; a_x: POINTER; a_y: POINTER): INTEGER is
 		-- cairo_mesh_pattern_get_control_point (node at line 562)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_get_control_point"
		}"
		end

	cairo_text_extents (a_cr: POINTER; an_utf8: POINTER; an_extents: POINTER) is
 		-- cairo_text_extents (node at line 569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_extents"
		}"
		end

	cairo_user_font_face_set_render_glyph_func (a_font_face: POINTER; a_render_glyph_func: POINTER) is
 		-- cairo_user_font_face_set_render_glyph_func (node at line 574)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_set_render_glyph_func"
		}"
		end

	cairo_region_contains_rectangle (a_region: POINTER; a_rectangle: POINTER): INTEGER is
 		-- cairo_region_contains_rectangle (node at line 578)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_contains_rectangle"
		}"
		end

	cairo_toy_font_face_get_family (a_font_face: POINTER): POINTER is
 		-- cairo_toy_font_face_get_family (node at line 582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_toy_font_face_get_family"
		}"
		end

	cairo_surface_has_show_text_glyphs (a_surface: POINTER): INTEGER_32 is
 		-- cairo_surface_has_show_text_glyphs (node at line 585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_has_show_text_glyphs"
		}"
		end

	cairo_toy_font_face_get_slant (a_font_face: POINTER): INTEGER is
 		-- cairo_toy_font_face_get_slant (node at line 588)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_toy_font_face_get_slant"
		}"
		end

	cairo_pattern_get_color_stop_rgba (a_pattern: POINTER; an_index: INTEGER_32; an_offset: POINTER; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER is
 		-- cairo_pattern_get_color_stop_rgba (node at line 591)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_color_stop_rgba"
		}"
		end

	cairo_pattern_reference (a_pattern: POINTER): POINTER is
 		-- cairo_pattern_reference (node at line 632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_reference"
		}"
		end

	cairo_mesh_pattern_set_corner_color_rgba (a_pattern: POINTER; a_corner_num: NATURAL_32; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64; an_alpha: REAL_64) is
 		-- cairo_mesh_pattern_set_corner_color_rgba (node at line 635)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_set_corner_color_rgba"
		}"
		end

	cairo_device_release (a_device: POINTER) is
 		-- cairo_device_release (node at line 648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_release"
		}"
		end

	cairo_pattern_get_filter (a_pattern: POINTER): INTEGER is
 		-- cairo_pattern_get_filter (node at line 652)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_filter"
		}"
		end

	cairo_scaled_font_text_to_glyphs (a_scaled_font: POINTER; a_x: REAL_64; a_y: REAL_64; an_utf8: POINTER; an_utf8_len: INTEGER_32; a_glyphs: POINTER; a_num_glyphs: POINTER; a_clusters: POINTER; a_num_clusters: POINTER; a_cluster_flags: POINTER): INTEGER is
 		-- cairo_scaled_font_text_to_glyphs (node at line 655)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_text_to_glyphs"
		}"
		end

	cairo_device_acquire (a_device: POINTER): INTEGER is
 		-- cairo_device_acquire (node at line 667)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_acquire"
		}"
		end

	cairo_surface_observer_add_fill_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_fill_callback (node at line 672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_fill_callback"
		}"
		end

	cairo_scaled_font_get_ctm (a_scaled_font: POINTER; a_ctm: POINTER) is
 		-- cairo_scaled_font_get_ctm (node at line 677)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_ctm"
		}"
		end

	cairo_fill_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) is
 		-- cairo_fill_extents (node at line 681)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_fill_extents"
		}"
		end

	cairo_font_options_hash (an_options: POINTER): NATURAL_64 is
 		-- cairo_font_options_hash (node at line 688)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_hash"
		}"
		end

	cairo_font_extents (a_cr: POINTER; an_extents: POINTER) is
 		-- cairo_font_extents (node at line 693)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_extents"
		}"
		end

	cairo_matrix_transform_point (a_matrix: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- cairo_matrix_transform_point (node at line 698)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_transform_point"
		}"
		end

	cairo_raster_source_pattern_get_finish (a_pattern: POINTER): POINTER is
 		-- cairo_raster_source_pattern_get_finish (node at line 703)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_get_finish"
		}"
		end

	cairo_user_font_face_get_unicode_to_glyph_func (a_font_face: POINTER): POINTER is
 		-- cairo_user_font_face_get_unicode_to_glyph_func (node at line 706)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_get_unicode_to_glyph_func"
		}"
		end

	cairo_paint_with_alpha (a_cr: POINTER; an_alpha: REAL_64) is
 		-- cairo_paint_with_alpha (node at line 709)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_paint_with_alpha"
		}"
		end

	cairo_push_group_with_content (a_cr: POINTER; a_content: INTEGER) is
 		-- cairo_push_group_with_content (node at line 713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_push_group_with_content"
		}"
		end

	cairo_region_subtract (a_dst: POINTER; an_other: POINTER): INTEGER is
 		-- cairo_region_subtract (node at line 717)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_subtract"
		}"
		end

	cairo_scaled_font_extents (a_scaled_font: POINTER; an_extents: POINTER) is
 		-- cairo_scaled_font_extents (node at line 721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_extents"
		}"
		end

	cairo_set_line_cap (a_cr: POINTER; a_line_cap: INTEGER) is
 		-- cairo_set_line_cap (node at line 725)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_line_cap"
		}"
		end

	cairo_get_antialias (a_cr: POINTER): INTEGER is
 		-- cairo_get_antialias (node at line 729)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_antialias"
		}"
		end

	cairo_surface_set_user_data (a_surface: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_surface_set_user_data (node at line 732)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_set_user_data"
		}"
		end

	cairo_surface_copy_page (a_surface: POINTER) is
 		-- cairo_surface_copy_page (node at line 739)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_copy_page"
		}"
		end

	cairo_scaled_font_get_font_face (a_scaled_font: POINTER): POINTER is
 		-- cairo_scaled_font_get_font_face (node at line 742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_font_face"
		}"
		end

	cairo_debug_reset_static_data is
 		-- cairo_debug_reset_static_data (node at line 745)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_debug_reset_static_data()"
		}"
		end

	cairo_region_create_rectangle (a_rectangle: POINTER): POINTER is
 		-- cairo_region_create_rectangle (node at line 747)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_create_rectangle"
		}"
		end

	cairo_device_observer_stroke_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_stroke_elapsed (node at line 750)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_stroke_elapsed"
		}"
		end

	cairo_image_surface_create (a_format: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32): POINTER is
 		-- cairo_image_surface_create (node at line 753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_create"
		}"
		end

	cairo_user_to_device_distance (a_cr: POINTER; a_dx: POINTER; a_dy: POINTER) is
 		-- cairo_user_to_device_distance (node at line 758)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_to_device_distance"
		}"
		end

	cairo_paint (a_cr: POINTER) is
 		-- cairo_paint (node at line 764)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_paint"
		}"
		end

	cairo_matrix_init_identity (a_matrix: POINTER) is
 		-- cairo_matrix_init_identity (node at line 767)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_init_identity"
		}"
		end

	cairo_status (a_cr: POINTER): INTEGER is
 		-- cairo_status (node at line 770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_status"
		}"
		end

	cairo_user_font_face_set_unicode_to_glyph_func (a_font_face: POINTER; an_unicode_to_glyph_func: POINTER) is
 		-- cairo_user_font_face_set_unicode_to_glyph_func (node at line 773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_set_unicode_to_glyph_func"
		}"
		end

	cairo_matrix_multiply (a_result: POINTER; an_a: POINTER; a_b: POINTER) is
 		-- cairo_matrix_multiply (node at line 777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_multiply"
		}"
		end

	cairo_device_get_type (a_device: POINTER): INTEGER is
 		-- cairo_device_get_type (node at line 782)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_get_type"
		}"
		end

	cairo_mesh_pattern_curve_to (a_pattern: POINTER; a_x1: REAL_64; a_y1: REAL_64; a_x2: REAL_64; a_y2: REAL_64; a_x3: REAL_64; a_y3: REAL_64) is
 		-- cairo_mesh_pattern_curve_to (node at line 785)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_curve_to"
		}"
		end

	cairo_region_is_empty (a_region: POINTER): INTEGER_32 is
 		-- cairo_region_is_empty (node at line 794)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_is_empty"
		}"
		end

	cairo_scaled_font_text_extents (a_scaled_font: POINTER; an_utf8: POINTER; an_extents: POINTER) is
 		-- cairo_scaled_font_text_extents (node at line 797)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_text_extents"
		}"
		end

	cairo_set_dash (a_cr: POINTER; a_dashes: POINTER; a_num_dashes: INTEGER_32; an_offset: REAL_64) is
 		-- cairo_set_dash (node at line 802)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_dash"
		}"
		end

	cairo_set_source_rgba (a_cr: POINTER; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64; an_alpha: REAL_64) is
 		-- cairo_set_source_rgba (node at line 808)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_source_rgba"
		}"
		end

	cairo_set_fill_rule (a_cr: POINTER; a_fill_rule: INTEGER) is
 		-- cairo_set_fill_rule (node at line 815)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_fill_rule"
		}"
		end

	cairo_device_observer_fill_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_fill_elapsed (node at line 819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_fill_elapsed"
		}"
		end

	cairo_in_stroke (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64): INTEGER_32 is
 		-- cairo_in_stroke (node at line 830)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_in_stroke"
		}"
		end

	cairo_raster_source_pattern_set_snapshot (a_pattern: POINTER; a_snapshot: POINTER) is
 		-- cairo_raster_source_pattern_set_snapshot (node at line 835)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_set_snapshot"
		}"
		end

	cairo_surface_map_to_image (a_surface: POINTER; an_extents: POINTER): POINTER is
 		-- cairo_surface_map_to_image (node at line 839)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_map_to_image"
		}"
		end

	cairo_surface_set_device_offset (a_surface: POINTER; a_x_offset: REAL_64; a_y_offset: REAL_64) is
 		-- cairo_surface_set_device_offset (node at line 843)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_set_device_offset"
		}"
		end

	cairo_pattern_create_linear (a_x0: REAL_64; a_y0: REAL_64; a_x1: REAL_64; a_y1: REAL_64): POINTER is
 		-- cairo_pattern_create_linear (node at line 848)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_linear"
		}"
		end

	cairo_get_source (a_cr: POINTER): POINTER is
 		-- cairo_get_source (node at line 854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_source"
		}"
		end

	cairo_font_options_copy (an_original: POINTER): POINTER is
 		-- cairo_font_options_copy (node at line 857)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_copy"
		}"
		end

	cairo_surface_destroy (a_surface: POINTER) is
 		-- cairo_surface_destroy (node at line 860)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_destroy"
		}"
		end

	cairo_device_get_user_data (a_device: POINTER; a_key: POINTER): POINTER is
 		-- cairo_device_get_user_data (node at line 890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_get_user_data"
		}"
		end

	cairo_image_surface_get_width (a_surface: POINTER): INTEGER_32 is
 		-- cairo_image_surface_get_width (node at line 894)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_get_width"
		}"
		end

	cairo_identity_matrix (a_cr: POINTER) is
 		-- cairo_identity_matrix (node at line 898)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_identity_matrix"
		}"
		end

	cairo_device_to_user_distance (a_cr: POINTER; a_dx: POINTER; a_dy: POINTER) is
 		-- cairo_device_to_user_distance (node at line 901)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_to_user_distance"
		}"
		end

	cairo_set_font_face (a_cr: POINTER; a_font_face: POINTER) is
 		-- cairo_set_font_face (node at line 906)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_font_face"
		}"
		end

	cairo_toy_font_face_create (a_family: POINTER; a_slant: INTEGER; a_weight: INTEGER): POINTER is
 		-- cairo_toy_font_face_create (node at line 910)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_toy_font_face_create"
		}"
		end

	cairo_pattern_create_mesh: POINTER is
 		-- cairo_pattern_create_mesh (node at line 915)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_mesh()"
		}"
		end

	cairo_surface_get_mime_data (a_surface: POINTER; a_mime_type: POINTER; a_data: POINTER; a_length: POINTER) is
 		-- cairo_surface_get_mime_data (node at line 916)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_mime_data"
		}"
		end

	cairo_pattern_get_reference_count (a_pattern: POINTER): NATURAL_32 is
 		-- cairo_pattern_get_reference_count (node at line 922)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_reference_count"
		}"
		end

	cairo_get_line_cap (a_cr: POINTER): INTEGER is
 		-- cairo_get_line_cap (node at line 925)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_line_cap"
		}"
		end

	cairo_pattern_get_rgba (a_pattern: POINTER; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER is
 		-- cairo_pattern_get_rgba (node at line 928)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_rgba"
		}"
		end

	cairo_get_target (a_cr: POINTER): POINTER is
 		-- cairo_get_target (node at line 940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_target"
		}"
		end

	cairo_device_observer_elapsed (a_device: POINTER): REAL_64 is
 		-- cairo_device_observer_elapsed (node at line 943)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_observer_elapsed"
		}"
		end

	cairo_glyph_extents (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER_32; an_extents: POINTER) is
 		-- cairo_glyph_extents (node at line 946)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_glyph_extents"
		}"
		end

	cairo_pattern_set_extend (a_pattern: POINTER; an_extend: INTEGER) is
 		-- cairo_pattern_set_extend (node at line 952)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_set_extend"
		}"
		end

	cairo_pattern_set_matrix (a_pattern: POINTER; a_matrix: POINTER) is
 		-- cairo_pattern_set_matrix (node at line 956)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_set_matrix"
		}"
		end

	cairo_pattern_create_raster_source (an_user_data: POINTER; a_content: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32): POINTER is
 		-- cairo_pattern_create_raster_source (node at line 960)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_raster_source"
		}"
		end

	cairo_surface_get_device (a_surface: POINTER): POINTER is
 		-- cairo_surface_get_device (node at line 966)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_device"
		}"
		end

	cairo_rectangle_list_destroy (a_rectangle_list: POINTER) is
 		-- cairo_rectangle_list_destroy (node at line 969)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle_list_destroy"
		}"
		end

	cairo_show_glyphs (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER_32) is
 		-- cairo_show_glyphs (node at line 972)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_show_glyphs"
		}"
		end

	cairo_destroy (a_cr: POINTER) is
 		-- cairo_destroy (node at line 977)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_destroy"
		}"
		end

	cairo_rel_move_to (a_cr: POINTER; a_dx: REAL_64; a_dy: REAL_64) is
 		-- cairo_rel_move_to (node at line 980)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rel_move_to"
		}"
		end

	cairo_get_scaled_font (a_cr: POINTER): POINTER is
 		-- cairo_get_scaled_font (node at line 985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_scaled_font"
		}"
		end

	cairo_copy_path (a_cr: POINTER): POINTER is
 		-- cairo_copy_path (node at line 988)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_copy_path"
		}"
		end

	cairo_surface_observer_add_paint_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_paint_callback (node at line 992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_paint_callback"
		}"
		end

	cairo_get_current_point (a_cr: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- cairo_get_current_point (node at line 997)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_current_point"
		}"
		end

	cairo_push_group (a_cr: POINTER) is
 		-- cairo_push_group (node at line 1012)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_push_group"
		}"
		end

	cairo_scaled_font_destroy (a_scaled_font: POINTER) is
 		-- cairo_scaled_font_destroy (node at line 1015)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_destroy"
		}"
		end

	cairo_surface_observer_elapsed (a_surface: POINTER): REAL_64 is
 		-- cairo_surface_observer_elapsed (node at line 1020)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_elapsed"
		}"
		end

	cairo_mesh_pattern_get_patch_count (a_pattern: POINTER; a_count: POINTER): INTEGER is
 		-- cairo_mesh_pattern_get_patch_count (node at line 1025)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_get_patch_count"
		}"
		end

	cairo_copy_page (a_cr: POINTER) is
 		-- cairo_copy_page (node at line 1029)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_copy_page"
		}"
		end

	cairo_user_font_face_set_init_func (a_font_face: POINTER; an_init_func: POINTER) is
 		-- cairo_user_font_face_set_init_func (node at line 1032)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_set_init_func"
		}"
		end

	cairo_in_clip (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64): INTEGER_32 is
 		-- cairo_in_clip (node at line 1036)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_in_clip"
		}"
		end

	cairo_font_options_get_subpixel_order (an_options: POINTER): INTEGER is
 		-- cairo_font_options_get_subpixel_order (node at line 1041)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_get_subpixel_order"
		}"
		end

	cairo_restore (a_cr: POINTER) is
 		-- cairo_restore (node at line 1044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_restore"
		}"
		end

	cairo_get_matrix (a_cr: POINTER; a_matrix: POINTER) is
 		-- cairo_get_matrix (node at line 1047)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_matrix"
		}"
		end

	cairo_surface_unmap_image (a_surface: POINTER; an_image: POINTER) is
 		-- cairo_surface_unmap_image (node at line 1051)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_unmap_image"
		}"
		end

	cairo_scaled_font_get_font_options (a_scaled_font: POINTER; an_options: POINTER) is
 		-- cairo_scaled_font_get_font_options (node at line 1055)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_font_options"
		}"
		end

	cairo_raster_source_pattern_get_snapshot (a_pattern: POINTER): POINTER is
 		-- cairo_raster_source_pattern_get_snapshot (node at line 1059)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_get_snapshot"
		}"
		end

	cairo_font_options_destroy (an_options: POINTER) is
 		-- cairo_font_options_destroy (node at line 1062)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_destroy"
		}"
		end

	cairo_font_options_equal (an_options: POINTER; an_other: POINTER): INTEGER_32 is
 		-- cairo_font_options_equal (node at line 1066)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_equal"
		}"
		end

	cairo_surface_create_similar (an_other: POINTER; a_content: INTEGER; a_width: INTEGER_32; a_height: INTEGER_32): POINTER is
 		-- cairo_surface_create_similar (node at line 1070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_create_similar"
		}"
		end

	cairo_font_options_set_antialias (an_options: POINTER; an_antialias: INTEGER) is
 		-- cairo_font_options_set_antialias (node at line 1076)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_set_antialias"
		}"
		end

	cairo_show_text_glyphs (a_cr: POINTER; an_utf8: POINTER; an_utf8_len: INTEGER_32; a_glyphs: POINTER; a_num_glyphs: INTEGER_32; a_clusters: POINTER; a_num_clusters: INTEGER_32; a_cluster_flags: INTEGER) is
 		-- cairo_show_text_glyphs (node at line 1080)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_show_text_glyphs"
		}"
		end

	cairo_set_source_surface (a_cr: POINTER; a_surface: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_set_source_surface (node at line 1090)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_source_surface"
		}"
		end

	cairo_scaled_font_create (a_font_face: POINTER; a_font_matrix: POINTER; a_ctm: POINTER; an_options: POINTER): POINTER is
 		-- cairo_scaled_font_create (node at line 1096)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_create"
		}"
		end

	cairo_region_translate (a_region: POINTER; a_dx: INTEGER_32; a_dy: INTEGER_32) is
 		-- cairo_region_translate (node at line 1111)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_translate"
		}"
		end

	cairo_image_surface_get_data (a_surface: POINTER): POINTER is
 		-- cairo_image_surface_get_data (node at line 1116)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_get_data"
		}"
		end

	cairo_user_font_face_get_text_to_glyphs_func (a_font_face: POINTER): POINTER is
 		-- cairo_user_font_face_get_text_to_glyphs_func (node at line 1119)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_get_text_to_glyphs_func"
		}"
		end

	cairo_pattern_status (a_pattern: POINTER): INTEGER is
 		-- cairo_pattern_status (node at line 1122)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_status"
		}"
		end

	cairo_rectangle (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64; a_width: REAL_64; a_height: REAL_64) is
 		-- cairo_rectangle (node at line 1125)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rectangle"
		}"
		end

	cairo_get_dash (a_cr: POINTER; a_dashes: POINTER; an_offset: POINTER) is
 		-- cairo_get_dash (node at line 1132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_dash"
		}"
		end

	cairo_region_union (a_dst: POINTER; an_other: POINTER): INTEGER is
 		-- cairo_region_union (node at line 1137)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_union"
		}"
		end

	cairo_surface_create_observer (a_target: POINTER; a_mode: INTEGER): POINTER is
 		-- cairo_surface_create_observer (node at line 1141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_create_observer"
		}"
		end

	cairo_font_options_set_hint_style (an_options: POINTER; a_hint_style: INTEGER) is
 		-- cairo_font_options_set_hint_style (node at line 1145)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_set_hint_style"
		}"
		end

	cairo_font_options_create: POINTER is
 		-- cairo_font_options_create (node at line 1149)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_create()"
		}"
		end

	cairo_mesh_pattern_begin_patch (a_pattern: POINTER) is
 		-- cairo_mesh_pattern_begin_patch (node at line 1150)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_begin_patch"
		}"
		end

	cairo_text_path (a_cr: POINTER; an_utf8: POINTER) is
 		-- cairo_text_path (node at line 1153)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_path"
		}"
		end

	cairo_pattern_get_linear_points (a_pattern: POINTER; a_x0: POINTER; a_y0: POINTER; a_x1: POINTER; a_y1: POINTER): INTEGER is
 		-- cairo_pattern_get_linear_points (node at line 1157)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_linear_points"
		}"
		end

	cairo_raster_source_pattern_set_callback_data (a_pattern: POINTER; a_data: POINTER) is
 		-- cairo_raster_source_pattern_set_callback_data (node at line 1164)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_set_callback_data"
		}"
		end

	cairo_set_tolerance (a_cr: POINTER; a_tolerance: REAL_64) is
 		-- cairo_set_tolerance (node at line 1174)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_tolerance"
		}"
		end

	cairo_surface_get_type (a_surface: POINTER): INTEGER is
 		-- cairo_surface_get_type (node at line 1178)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_type"
		}"
		end

	cairo_font_options_get_hint_style (an_options: POINTER): INTEGER is
 		-- cairo_font_options_get_hint_style (node at line 1182)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_get_hint_style"
		}"
		end

	cairo_mesh_pattern_set_corner_color_rgb (a_pattern: POINTER; a_corner_num: NATURAL_32; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64) is
 		-- cairo_mesh_pattern_set_corner_color_rgb (node at line 1185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_set_corner_color_rgb"
		}"
		end

	cairo_set_line_width (a_cr: POINTER; a_width: REAL_64) is
 		-- cairo_set_line_width (node at line 1192)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_line_width"
		}"
		end

	cairo_set_line_join (a_cr: POINTER; a_line_join: INTEGER) is
 		-- cairo_set_line_join (node at line 1202)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_line_join"
		}"
		end

	cairo_clip (a_cr: POINTER) is
 		-- cairo_clip (node at line 1207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_clip"
		}"
		end

	cairo_curve_to (a_cr: POINTER; a_x1: REAL_64; a_y1: REAL_64; a_x2: REAL_64; a_y2: REAL_64; a_x3: REAL_64; a_y3: REAL_64) is
 		-- cairo_curve_to (node at line 1210)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_curve_to"
		}"
		end

	cairo_scale (a_cr: POINTER; a_sx: REAL_64; a_sy: REAL_64) is
 		-- cairo_scale (node at line 1219)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scale"
		}"
		end

	cairo_region_contains_point (a_region: POINTER; a_x: INTEGER_32; a_y: INTEGER_32): INTEGER_32 is
 		-- cairo_region_contains_point (node at line 1224)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_contains_point"
		}"
		end

	cairo_get_group_target (a_cr: POINTER): POINTER is
 		-- cairo_get_group_target (node at line 1230)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_group_target"
		}"
		end

	cairo_region_get_extents (a_region: POINTER; an_extents: POINTER) is
 		-- cairo_region_get_extents (node at line 1233)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_get_extents"
		}"
		end

	cairo_raster_source_pattern_set_finish (a_pattern: POINTER; a_finish: POINTER) is
 		-- cairo_raster_source_pattern_set_finish (node at line 1237)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_set_finish"
		}"
		end

	cairo_pattern_get_surface (a_pattern: POINTER; a_surface: POINTER): INTEGER is
 		-- cairo_pattern_get_surface (node at line 1241)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_surface"
		}"
		end

	cairo_pattern_add_color_stop_rgba (a_pattern: POINTER; an_offset: REAL_64; a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64; an_alpha: REAL_64) is
 		-- cairo_pattern_add_color_stop_rgba (node at line 1245)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_add_color_stop_rgba"
		}"
		end

	cairo_surface_get_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch: POINTER; a_y_pixels_per_inch: POINTER) is
 		-- cairo_surface_get_fallback_resolution (node at line 1253)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_fallback_resolution"
		}"
		end

	cairo_user_font_face_set_text_to_glyphs_func (a_font_face: POINTER; a_text_to_glyphs_func: POINTER) is
 		-- cairo_user_font_face_set_text_to_glyphs_func (node at line 1261)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_user_font_face_set_text_to_glyphs_func"
		}"
		end

	cairo_mask_surface (a_cr: POINTER; a_surface: POINTER; a_surface_x: REAL_64; a_surface_y: REAL_64) is
 		-- cairo_mask_surface (node at line 1265)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mask_surface"
		}"
		end

	cairo_region_xor (a_dst: POINTER; an_other: POINTER): INTEGER is
 		-- cairo_region_xor (node at line 1271)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_xor"
		}"
		end

	cairo_path_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) is
 		-- cairo_path_extents (node at line 1275)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_extents"
		}"
		end

	cairo_surface_get_content (a_surface: POINTER): INTEGER is
 		-- cairo_surface_get_content (node at line 1282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_content"
		}"
		end

	cairo_scaled_font_get_user_data (a_scaled_font: POINTER; a_key: POINTER): POINTER is
 		-- cairo_scaled_font_get_user_data (node at line 1285)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_user_data"
		}"
		end

	cairo_copy_path_flat (a_cr: POINTER): POINTER is
 		-- cairo_copy_path_flat (node at line 1289)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_copy_path_flat"
		}"
		end

	cairo_pattern_create_rgba (a_red: REAL_64; a_green: REAL_64; a_blue: REAL_64; an_alpha: REAL_64): POINTER is
 		-- cairo_pattern_create_rgba (node at line 1292)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_rgba"
		}"
		end

	cairo_toy_font_face_get_weight (a_font_face: POINTER): INTEGER is
 		-- cairo_toy_font_face_get_weight (node at line 1298)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_toy_font_face_get_weight"
		}"
		end

	cairo_mesh_pattern_line_to (a_pattern: POINTER; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_mesh_pattern_line_to (node at line 1301)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_line_to"
		}"
		end

	cairo_surface_write_to_png (a_surface: POINTER; a_filename: POINTER): INTEGER is
 		-- cairo_surface_write_to_png (node at line 1306)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_write_to_png"
		}"
		end

	cairo_font_options_set_subpixel_order (an_options: POINTER; a_subpixel_order: INTEGER) is
 		-- cairo_font_options_set_subpixel_order (node at line 1310)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_set_subpixel_order"
		}"
		end

	cairo_surface_reference (a_surface: POINTER): POINTER is
 		-- cairo_surface_reference (node at line 1314)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_reference"
		}"
		end

	cairo_set_font_options (a_cr: POINTER; an_options: POINTER) is
 		-- cairo_set_font_options (node at line 1317)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_font_options"
		}"
		end

	cairo_raster_source_pattern_set_acquire (a_pattern: POINTER; an_acquire: POINTER; a_release: POINTER) is
 		-- cairo_raster_source_pattern_set_acquire (node at line 1321)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_set_acquire"
		}"
		end

	cairo_surface_status (a_surface: POINTER): INTEGER is
 		-- cairo_surface_status (node at line 1326)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_status"
		}"
		end

	cairo_show_text (a_cr: POINTER; an_utf8: POINTER) is
 		-- cairo_show_text (node at line 1329)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_show_text"
		}"
		end

	cairo_get_operator (a_cr: POINTER): INTEGER is
 		-- cairo_get_operator (node at line 1335)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_operator"
		}"
		end

	cairo_image_surface_get_stride (a_surface: POINTER): INTEGER_32 is
 		-- cairo_image_surface_get_stride (node at line 1338)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_get_stride"
		}"
		end

	cairo_scaled_font_status (a_scaled_font: POINTER): INTEGER is
 		-- cairo_scaled_font_status (node at line 1341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_status"
		}"
		end

	cairo_status_to_string (a_status: INTEGER): POINTER is
 		-- cairo_status_to_string (node at line 1347)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_status_to_string"
		}"
		end

	cairo_arc_negative (a_cr: POINTER; a_xc: REAL_64; a_yc: REAL_64; a_radius: REAL_64; an_angle1: REAL_64; an_angle2: REAL_64) is
 		-- cairo_arc_negative (node at line 1352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_arc_negative"
		}"
		end

	cairo_matrix_transform_distance (a_matrix: POINTER; a_dx: POINTER; a_dy: POINTER) is
 		-- cairo_matrix_transform_distance (node at line 1360)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_transform_distance"
		}"
		end

	cairo_mesh_pattern_get_corner_color_rgba (a_pattern: POINTER; a_patch_num: NATURAL_32; a_corner_num: NATURAL_32; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER is
 		-- cairo_mesh_pattern_get_corner_color_rgba (node at line 1365)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_get_corner_color_rgba"
		}"
		end

	cairo_font_options_set_hint_metrics (an_options: POINTER; a_hint_metrics: INTEGER) is
 		-- cairo_font_options_set_hint_metrics (node at line 1374)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_set_hint_metrics"
		}"
		end

	cairo_set_source (a_cr: POINTER; a_source: POINTER) is
 		-- cairo_set_source (node at line 1378)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_source"
		}"
		end

	cairo_set_antialias (a_cr: POINTER; an_antialias: INTEGER) is
 		-- cairo_set_antialias (node at line 1382)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_antialias"
		}"
		end

	cairo_device_get_reference_count (a_device: POINTER): NATURAL_32 is
 		-- cairo_device_get_reference_count (node at line 1386)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_get_reference_count"
		}"
		end

	cairo_font_face_get_user_data (a_font_face: POINTER; a_key: POINTER): POINTER is
 		-- cairo_font_face_get_user_data (node at line 1390)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_get_user_data"
		}"
		end

	cairo_pattern_get_color_stop_count (a_pattern: POINTER; a_count: POINTER): INTEGER is
 		-- cairo_pattern_get_color_stop_count (node at line 1394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_get_color_stop_count"
		}"
		end

	cairo_font_face_get_reference_count (a_font_face: POINTER): NATURAL_32 is
 		-- cairo_font_face_get_reference_count (node at line 1398)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_get_reference_count"
		}"
		end

	cairo_matrix_translate (a_matrix: POINTER; a_tx: REAL_64; a_ty: REAL_64) is
 		-- cairo_matrix_translate (node at line 1401)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_translate"
		}"
		end

	cairo_new_sub_path (a_cr: POINTER) is
 		-- cairo_new_sub_path (node at line 1406)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_new_sub_path"
		}"
		end

	cairo_glyph_path (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER_32) is
 		-- cairo_glyph_path (node at line 1409)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_glyph_path"
		}"
		end

	cairo_device_flush (a_device: POINTER) is
 		-- cairo_device_flush (node at line 1414)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_flush"
		}"
		end

	cairo_device_to_user (a_cr: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- cairo_device_to_user (node at line 1417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_to_user"
		}"
		end

	cairo_font_options_status (an_options: POINTER): INTEGER is
 		-- cairo_font_options_status (node at line 1422)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_status"
		}"
		end

	cairo_surface_set_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch: REAL_64; a_y_pixels_per_inch: REAL_64) is
 		-- cairo_surface_set_fallback_resolution (node at line 1425)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_set_fallback_resolution"
		}"
		end

	cairo_in_fill (a_cr: POINTER; a_x: REAL_64; a_y: REAL_64): INTEGER_32 is
 		-- cairo_in_fill (node at line 1430)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_in_fill"
		}"
		end

	cairo_pattern_create_for_surface (a_surface: POINTER): POINTER is
 		-- cairo_pattern_create_for_surface (node at line 1435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_create_for_surface"
		}"
		end

	cairo_text_cluster_allocate (a_num_clusters: INTEGER_32): POINTER is
 		-- cairo_text_cluster_allocate (node at line 1438)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_allocate"
		}"
		end

	cairo_surface_mark_dirty_rectangle (a_surface: POINTER; a_x: INTEGER_32; a_y: INTEGER_32; a_width: INTEGER_32; a_height: INTEGER_32) is
 		-- cairo_surface_mark_dirty_rectangle (node at line 1441)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_mark_dirty_rectangle"
		}"
		end

	cairo_glyph_free (a_glyphs: POINTER) is
 		-- cairo_glyph_free (node at line 1448)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_glyph_free"
		}"
		end

	cairo_set_miter_limit (a_cr: POINTER; a_limit: REAL_64) is
 		-- cairo_set_miter_limit (node at line 1451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_miter_limit"
		}"
		end

	cairo_surface_get_font_options (a_surface: POINTER; an_options: POINTER) is
 		-- cairo_surface_get_font_options (node at line 1457)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_font_options"
		}"
		end

	cairo_surface_get_device_offset (a_surface: POINTER; a_x_offset: POINTER; a_y_offset: POINTER) is
 		-- cairo_surface_get_device_offset (node at line 1463)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_device_offset"
		}"
		end

	cairo_region_union_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER is
 		-- cairo_region_union_rectangle (node at line 1468)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_union_rectangle"
		}"
		end

	cairo_pop_group (a_cr: POINTER): POINTER is
 		-- cairo_pop_group (node at line 1472)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pop_group"
		}"
		end

	cairo_get_font_face (a_cr: POINTER): POINTER is
 		-- cairo_get_font_face (node at line 1475)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_font_face"
		}"
		end

	cairo_set_operator (a_cr: POINTER; an_op: INTEGER) is
 		-- cairo_set_operator (node at line 1478)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_operator"
		}"
		end

	cairo_has_current_point (a_cr: POINTER): INTEGER_32 is
 		-- cairo_has_current_point (node at line 1482)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_has_current_point"
		}"
		end

	cairo_surface_observer_add_mask_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_mask_callback (node at line 1485)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_mask_callback"
		}"
		end

	cairo_raster_source_pattern_set_copy (a_pattern: POINTER; a_copy_external: POINTER) is
 		-- cairo_raster_source_pattern_set_copy (node at line 1490)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_raster_source_pattern_set_copy"
		}"
		end

	cairo_stroke_preserve (a_cr: POINTER) is
 		-- cairo_stroke_preserve (node at line 1494)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_stroke_preserve"
		}"
		end

	cairo_scaled_font_get_scale_matrix (a_scaled_font: POINTER; a_scale_matrix: POINTER) is
 		-- cairo_scaled_font_get_scale_matrix (node at line 1497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_scaled_font_get_scale_matrix"
		}"
		end

	cairo_region_xor_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER is
 		-- cairo_region_xor_rectangle (node at line 1501)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_xor_rectangle"
		}"
		end

	cairo_matrix_init_scale (a_matrix: POINTER; a_sx: REAL_64; a_sy: REAL_64) is
 		-- cairo_matrix_init_scale (node at line 1505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_init_scale"
		}"
		end

	cairo_surface_show_page (a_surface: POINTER) is
 		-- cairo_surface_show_page (node at line 1510)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_show_page"
		}"
		end

	cairo_device_set_user_data (a_device: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER is
 		-- cairo_device_set_user_data (node at line 1516)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_set_user_data"
		}"
		end

	cairo_get_reference_count (a_cr: POINTER): NATURAL_32 is
 		-- cairo_get_reference_count (node at line 1522)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_get_reference_count"
		}"
		end

	cairo_mesh_pattern_set_control_point (a_pattern: POINTER; a_point_num: NATURAL_32; a_x: REAL_64; a_y: REAL_64) is
 		-- cairo_mesh_pattern_set_control_point (node at line 1527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_set_control_point"
		}"
		end

	cairo_set_font_matrix (a_cr: POINTER; a_matrix: POINTER) is
 		-- cairo_set_font_matrix (node at line 1533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_font_matrix"
		}"
		end

	cairo_surface_set_mime_data (a_surface: POINTER; a_mime_type: POINTER; a_data: POINTER; a_length: NATURAL_64; a_destroy: POINTER; a_closure: POINTER): INTEGER is
 		-- cairo_surface_set_mime_data (node at line 1537)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_set_mime_data"
		}"
		end

	cairo_fill_preserve (a_cr: POINTER) is
 		-- cairo_fill_preserve (node at line 1545)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_fill_preserve"
		}"
		end

	cairo_set_matrix (a_cr: POINTER; a_matrix: POINTER) is
 		-- cairo_set_matrix (node at line 1548)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_set_matrix"
		}"
		end

	cairo_path_destroy (a_path: POINTER) is
 		-- cairo_path_destroy (node at line 1553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_path_destroy"
		}"
		end

	cairo_pop_group_to_source (a_cr: POINTER) is
 		-- cairo_pop_group_to_source (node at line 1556)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pop_group_to_source"
		}"
		end

	cairo_font_options_merge (an_options: POINTER; an_other: POINTER) is
 		-- cairo_font_options_merge (node at line 1559)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_options_merge"
		}"
		end

	cairo_font_face_get_type (a_font_face: POINTER): INTEGER is
 		-- cairo_font_face_get_type (node at line 1563)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_get_type"
		}"
		end

	cairo_device_status (a_device: POINTER): INTEGER is
 		-- cairo_device_status (node at line 1566)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_status"
		}"
		end

	cairo_region_create_rectangles (a_rects: POINTER; a_count: INTEGER_32): POINTER is
 		-- cairo_region_create_rectangles (node at line 1569)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_create_rectangles"
		}"
		end

	cairo_pattern_set_filter (a_pattern: POINTER; a_filter: INTEGER) is
 		-- cairo_pattern_set_filter (node at line 1573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_set_filter"
		}"
		end

	cairo_surface_observer_add_flush_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_flush_callback (node at line 1577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_flush_callback"
		}"
		end

	cairo_mesh_pattern_end_patch (a_pattern: POINTER) is
 		-- cairo_mesh_pattern_end_patch (node at line 1582)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_mesh_pattern_end_patch"
		}"
		end

	cairo_matrix_init_translate (a_matrix: POINTER; a_tx: REAL_64; a_ty: REAL_64) is
 		-- cairo_matrix_init_translate (node at line 1585)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_matrix_init_translate"
		}"
		end

	cairo_surface_finish (a_surface: POINTER) is
 		-- cairo_surface_finish (node at line 1590)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_finish"
		}"
		end

	cairo_recording_surface_ink_extents (a_surface: POINTER; a_x0: POINTER; a_y0: POINTER; a_width: POINTER; a_height: POINTER) is
 		-- cairo_recording_surface_ink_extents (node at line 1593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_recording_surface_ink_extents"
		}"
		end

	cairo_region_subtract_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER is
 		-- cairo_region_subtract_rectangle (node at line 1600)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_region_subtract_rectangle"
		}"
		end

	cairo_clip_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) is
 		-- cairo_clip_extents (node at line 1604)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_clip_extents"
		}"
		end

	cairo_device_reference (a_device: POINTER): POINTER is
 		-- cairo_device_reference (node at line 1611)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_reference"
		}"
		end

	cairo_pattern_destroy (a_pattern: POINTER) is
 		-- cairo_pattern_destroy (node at line 1614)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_pattern_destroy"
		}"
		end

	cairo_surface_observer_print (a_surface: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER is
 		-- cairo_surface_observer_print (node at line 1617)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_print"
		}"
		end

	cairo_fill (a_cr: POINTER) is
 		-- cairo_fill (node at line 1622)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_fill"
		}"
		end

	cairo_surface_get_user_data (a_surface: POINTER; a_key: POINTER): POINTER is
 		-- cairo_surface_get_user_data (node at line 1625)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_get_user_data"
		}"
		end

	cairo_rel_curve_to (a_cr: POINTER; a_dx1: REAL_64; a_dy1: REAL_64; a_dx2: REAL_64; a_dy2: REAL_64; a_dx3: REAL_64; a_dy3: REAL_64) is
 		-- cairo_rel_curve_to (node at line 1629)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_rel_curve_to"
		}"
		end

	cairo_device_destroy (a_device: POINTER) is
 		-- cairo_device_destroy (node at line 1638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_device_destroy"
		}"
		end

	cairo_stroke_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) is
 		-- cairo_stroke_extents (node at line 1641)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_stroke_extents"
		}"
		end

	cairo_version: INTEGER_32 is
 		-- cairo_version (node at line 1648)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_version()"
		}"
		end

	cairo_surface_observer_add_stroke_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER is
 		-- cairo_surface_observer_add_stroke_callback (node at line 1649)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_surface_observer_add_stroke_callback"
		}"
		end

	cairo_image_surface_get_format (a_surface: POINTER): INTEGER is
 		-- cairo_image_surface_get_format (node at line 1654)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_image_surface_get_format"
		}"
		end

	cairo_text_cluster_free (a_clusters: POINTER) is
 		-- cairo_text_cluster_free (node at line 1659)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_text_cluster_free"
		}"
		end

	cairo_font_face_status (a_font_face: POINTER): INTEGER is
 		-- cairo_font_face_status (node at line 1662)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_font_face_status"
		}"
		end

	cairo_copy_clip_rectangle_list (a_cr: POINTER): POINTER is
 		-- cairo_copy_clip_rectangle_list (node at line 1665)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "cairo_copy_clip_rectangle_list"
		}"
		end


end -- class CAIRO_EXTERNALS
