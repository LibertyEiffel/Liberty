-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
deferred class CAIRO_EXTERNALS


insert ANY undefine is_equal, copy end

		STANDARD_C_LIBRARY_TYPES
feature {} -- External calls

	cairo_append_path (a_cr: POINTER; a_path: POINTER) 

		-- function cairo_append_path (in 2087 at line /usr/include/cairo/cairo.h)i
               -- cairo_append_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_append_path"
               }"
               end

	cairo_arc (a_cr: POINTER; a_xc: REAL; a_yc: REAL; a_radius: REAL; an_angle1: REAL; an_angle2: REAL) 

		-- function cairo_arc (in 862 at line /usr/include/cairo/cairo.h)i
               -- cairo_arc
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_arc"
               }"
               end

	cairo_arc_negative (a_cr: POINTER; a_xc: REAL; a_yc: REAL; a_radius: REAL; an_angle1: REAL; an_angle2: REAL) 

		-- function cairo_arc_negative (in 868 at line /usr/include/cairo/cairo.h)i
               -- cairo_arc_negative
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_arc_negative"
               }"
               end

	cairo_clip (a_cr: POINTER) 

		-- function cairo_clip (in 973 at line /usr/include/cairo/cairo.h)i
               -- cairo_clip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_clip"
               }"
               end

	cairo_clip_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) 

		-- function cairo_clip_extents (in 979 at line /usr/include/cairo/cairo.h)i
               -- cairo_clip_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_clip_extents"
               }"
               end

	cairo_clip_preserve (a_cr: POINTER) 

		-- function cairo_clip_preserve (in 976 at line /usr/include/cairo/cairo.h)i
               -- cairo_clip_preserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_clip_preserve"
               }"
               end

	cairo_close_path (a_cr: POINTER) 

		-- function cairo_close_path (in 904 at line /usr/include/cairo/cairo.h)i
               -- cairo_close_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_close_path"
               }"
               end

	cairo_copy_clip_rectangle_list (a_cr: POINTER): POINTER 

		-- function cairo_copy_clip_rectangle_list (in 1016 at line /usr/include/cairo/cairo.h)i
               -- cairo_copy_clip_rectangle_list
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_copy_clip_rectangle_list"
               }"
               end

	cairo_copy_page (a_cr: POINTER) 

		-- function cairo_copy_page (in 942 at line /usr/include/cairo/cairo.h)i
               -- cairo_copy_page
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_copy_page"
               }"
               end

	cairo_copy_path (a_cr: POINTER): POINTER 

		-- function cairo_copy_path (in 2081 at line /usr/include/cairo/cairo.h)i
               -- cairo_copy_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_copy_path"
               }"
               end

	cairo_copy_path_flat (a_cr: POINTER): POINTER 

		-- function cairo_copy_path_flat (in 2084 at line /usr/include/cairo/cairo.h)i
               -- cairo_copy_path_flat
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_copy_path_flat"
               }"
               end

	cairo_create (a_target: POINTER): POINTER 

		-- function cairo_create (in 483 at line /usr/include/cairo/cairo.h)i
               -- cairo_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_create"
               }"
               end

	cairo_curve_to (a_cr: POINTER; a_x1: REAL; a_y1: REAL; a_x2: REAL; a_y2: REAL; a_x3: REAL; a_y3: REAL) 

		-- function cairo_curve_to (in 856 at line /usr/include/cairo/cairo.h)i
               -- cairo_curve_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_curve_to"
               }"
               end

	cairo_debug_reset_static_data 

		-- function cairo_debug_reset_static_data (in 3148 at line /usr/include/cairo/cairo.h)i
               -- cairo_debug_reset_static_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_debug_reset_static_data"
               }"
               end

	cairo_destroy (a_cr: POINTER) 

		-- function cairo_destroy (in 489 at line /usr/include/cairo/cairo.h)i
               -- cairo_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_destroy"
               }"
               end

	cairo_device_acquire (a_device: POINTER): INTEGER 

		-- function cairo_device_acquire (in 2157 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_acquire
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_acquire"
               }"
               end

	cairo_device_destroy (a_device: POINTER) 

		-- function cairo_device_destroy (in 2169 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_destroy"
               }"
               end

	cairo_device_finish (a_device: POINTER) 

		-- function cairo_device_finish (in 2166 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_finish"
               }"
               end

	cairo_device_flush (a_device: POINTER) 

		-- function cairo_device_flush (in 2163 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_flush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_flush"
               }"
               end

	cairo_device_get_reference_count (a_device: POINTER): NATURAL 

		-- function cairo_device_get_reference_count (in 2172 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_get_reference_count"
               }"
               end

	cairo_device_get_type (a_device: POINTER): INTEGER 

		-- function cairo_device_get_type (in 2151 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_get_type"
               }"
               end

	cairo_device_get_user_data (a_device: POINTER; a_key: POINTER): POINTER 

		-- function cairo_device_get_user_data (in 2175 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_get_user_data"
               }"
               end

	cairo_device_observer_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_elapsed (in 2284 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_elapsed"
               }"
               end

	cairo_device_observer_fill_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_fill_elapsed (in 2293 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_fill_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_fill_elapsed"
               }"
               end

	cairo_device_observer_glyphs_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_glyphs_elapsed (in 2299 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_glyphs_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_glyphs_elapsed"
               }"
               end

	cairo_device_observer_mask_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_mask_elapsed (in 2290 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_mask_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_mask_elapsed"
               }"
               end

	cairo_device_observer_paint_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_paint_elapsed (in 2287 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_paint_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_paint_elapsed"
               }"
               end

	cairo_device_observer_print (a_device: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER 

		-- function cairo_device_observer_print (in 2279 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_print
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_print"
               }"
               end

	cairo_device_observer_stroke_elapsed (a_device: POINTER): REAL 

		-- function cairo_device_observer_stroke_elapsed (in 2296 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_observer_stroke_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_observer_stroke_elapsed"
               }"
               end

	cairo_device_reference (a_device: POINTER): POINTER 

		-- function cairo_device_reference (in 2104 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_reference"
               }"
               end

	cairo_device_release (a_device: POINTER) 

		-- function cairo_device_release (in 2160 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_release
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_release"
               }"
               end

	cairo_device_set_user_data (a_device: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_device_set_user_data (in 2179 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_set_user_data"
               }"
               end

	cairo_device_status (a_device: POINTER): INTEGER 

		-- function cairo_device_status (in 2154 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_status"
               }"
               end

	cairo_device_to_user (a_cr: POINTER; a_x: POINTER; a_y: POINTER) 

		-- function cairo_device_to_user (in 837 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_to_user
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_to_user"
               }"
               end

	cairo_device_to_user_distance (a_cr: POINTER; a_dx: POINTER; a_dy: POINTER) 

		-- function cairo_device_to_user_distance (in 840 at line /usr/include/cairo/cairo.h)i
               -- cairo_device_to_user_distance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_device_to_user_distance"
               }"
               end

	cairo_fill (a_cr: POINTER) 

		-- function cairo_fill (in 936 at line /usr/include/cairo/cairo.h)i
               -- cairo_fill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_fill"
               }"
               end

	cairo_fill_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) 

		-- function cairo_fill_extents (in 964 at line /usr/include/cairo/cairo.h)i
               -- cairo_fill_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_fill_extents"
               }"
               end

	cairo_fill_preserve (a_cr: POINTER) 

		-- function cairo_fill_preserve (in 939 at line /usr/include/cairo/cairo.h)i
               -- cairo_fill_preserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_fill_preserve"
               }"
               end

	cairo_font_extents (a_cr: POINTER; an_extents: POINTER) 

		-- function cairo_font_extents (in 1489 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_extents"
               }"
               end

	cairo_font_face_destroy (a_font_face: POINTER) 

		-- function cairo_font_face_destroy (in 1498 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_destroy"
               }"
               end

	cairo_font_face_get_reference_count (a_font_face: POINTER): NATURAL 

		-- function cairo_font_face_get_reference_count (in 1501 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_get_reference_count"
               }"
               end

	cairo_font_face_get_type (a_font_face: POINTER): INTEGER 

		-- function cairo_font_face_get_type (in 1555 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_get_type"
               }"
               end

	cairo_font_face_get_user_data (a_font_face: POINTER; a_key: POINTER): POINTER 

		-- function cairo_font_face_get_user_data (in 1558 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_get_user_data"
               }"
               end

	cairo_font_face_reference (a_font_face: POINTER): POINTER 

		-- function cairo_font_face_reference (in 1495 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_reference"
               }"
               end

	cairo_font_face_set_user_data (a_font_face: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_font_face_set_user_data (in 1562 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_set_user_data"
               }"
               end

	cairo_font_face_status (a_font_face: POINTER): INTEGER 

		-- function cairo_font_face_status (in 1504 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_face_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_face_status"
               }"
               end

	cairo_font_options_copy (an_original: POINTER): POINTER 

		-- function cairo_font_options_copy (in 1372 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_copy"
               }"
               end

	cairo_font_options_create: POINTER 

		-- function cairo_font_options_create (in 1369 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_create"
               }"
               end

	cairo_font_options_destroy (an_options: POINTER) 

		-- function cairo_font_options_destroy (in 1375 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_destroy"
               }"
               end

	cairo_font_options_equal (an_options: POINTER; an_other: POINTER): INTEGER 

		-- function cairo_font_options_equal (in 1384 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_equal"
               }"
               end

	cairo_font_options_get_antialias (an_options: POINTER): INTEGER 

		-- function cairo_font_options_get_antialias (in 1394 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_get_antialias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_get_antialias"
               }"
               end

	cairo_font_options_get_hint_metrics (an_options: POINTER): INTEGER 

		-- function cairo_font_options_get_hint_metrics (in 1412 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_get_hint_metrics
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_get_hint_metrics"
               }"
               end

	cairo_font_options_get_hint_style (an_options: POINTER): INTEGER 

		-- function cairo_font_options_get_hint_style (in 1406 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_get_hint_style
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_get_hint_style"
               }"
               end

	cairo_font_options_get_subpixel_order (an_options: POINTER): INTEGER 

		-- function cairo_font_options_get_subpixel_order (in 1400 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_get_subpixel_order
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_get_subpixel_order"
               }"
               end

	cairo_font_options_hash (an_options: POINTER): like long_unsigned 

		-- function cairo_font_options_hash (in 1388 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_hash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_hash"
               }"
               end

	cairo_font_options_merge (an_options: POINTER; an_other: POINTER) 

		-- function cairo_font_options_merge (in 1381 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_merge
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_merge"
               }"
               end

	cairo_font_options_set_antialias (an_options: POINTER; an_antialias: INTEGER) 

		-- function cairo_font_options_set_antialias (in 1391 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_set_antialias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_set_antialias"
               }"
               end

	cairo_font_options_set_hint_metrics (an_options: POINTER; a_hint_metrics: INTEGER) 

		-- function cairo_font_options_set_hint_metrics (in 1409 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_set_hint_metrics
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_set_hint_metrics"
               }"
               end

	cairo_font_options_set_hint_style (an_options: POINTER; a_hint_style: INTEGER) 

		-- function cairo_font_options_set_hint_style (in 1403 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_set_hint_style
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_set_hint_style"
               }"
               end

	cairo_font_options_set_subpixel_order (an_options: POINTER; a_subpixel_order: INTEGER) 

		-- function cairo_font_options_set_subpixel_order (in 1397 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_set_subpixel_order
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_set_subpixel_order"
               }"
               end

	cairo_font_options_status (an_options: POINTER): INTEGER 

		-- function cairo_font_options_status (in 1378 at line /usr/include/cairo/cairo.h)i
               -- cairo_font_options_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_font_options_status"
               }"
               end

	cairo_format_stride_for_width (a_format: INTEGER; a_width: INTEGER): INTEGER 

		-- function cairo_format_stride_for_width (in 2520 at line /usr/include/cairo/cairo.h)i
               -- cairo_format_stride_for_width
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_format_stride_for_width"
               }"
               end

	cairo_get_antialias (a_cr: POINTER): INTEGER 

		-- function cairo_get_antialias (in 1916 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_antialias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_antialias"
               }"
               end

	cairo_get_current_point (a_cr: POINTER; a_x: POINTER; a_y: POINTER) 

		-- function cairo_get_current_point (in 1922 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_current_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_current_point"
               }"
               end

	cairo_get_dash (a_cr: POINTER; a_dashes: POINTER; an_offset: POINTER) 

		-- function cairo_get_dash (in 1943 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_dash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_dash"
               }"
               end

	cairo_get_dash_count (a_cr: POINTER): INTEGER 

		-- function cairo_get_dash_count (in 1940 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_dash_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_dash_count"
               }"
               end

	cairo_get_fill_rule (a_cr: POINTER): INTEGER 

		-- function cairo_get_fill_rule (in 1925 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_fill_rule
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_fill_rule"
               }"
               end

	cairo_get_font_face (a_cr: POINTER): POINTER 

		-- function cairo_get_font_face (in 1446 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_font_face
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_font_face"
               }"
               end

	cairo_get_font_matrix (a_cr: POINTER; a_matrix: POINTER) 

		-- function cairo_get_font_matrix (in 1431 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_font_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_font_matrix"
               }"
               end

	cairo_get_font_options (a_cr: POINTER; an_options: POINTER) 

		-- function cairo_get_font_options (in 1439 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_font_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_font_options"
               }"
               end

	cairo_get_group_target (a_cr: POINTER): POINTER 

		-- function cairo_get_group_target (in 1952 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_group_target
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_group_target"
               }"
               end

	cairo_get_line_cap (a_cr: POINTER): INTEGER 

		-- function cairo_get_line_cap (in 1931 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_line_cap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_line_cap"
               }"
               end

	cairo_get_line_join (a_cr: POINTER): INTEGER 

		-- function cairo_get_line_join (in 1934 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_line_join
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_line_join"
               }"
               end

	cairo_get_line_width (a_cr: POINTER): REAL 

		-- function cairo_get_line_width (in 1928 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_line_width
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_line_width"
               }"
               end

	cairo_get_matrix (a_cr: POINTER; a_matrix: POINTER) 

		-- function cairo_get_matrix (in 1946 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_matrix"
               }"
               end

	cairo_get_miter_limit (a_cr: POINTER): REAL 

		-- function cairo_get_miter_limit (in 1937 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_miter_limit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_miter_limit"
               }"
               end

	cairo_get_operator (a_cr: POINTER): INTEGER 

		-- function cairo_get_operator (in 1907 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_operator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_operator"
               }"
               end

	cairo_get_reference_count (a_cr: POINTER): NATURAL 

		-- function cairo_get_reference_count (in 492 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_reference_count"
               }"
               end

	cairo_get_scaled_font (a_cr: POINTER): POINTER 

		-- function cairo_get_scaled_font (in 1453 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_scaled_font
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_scaled_font"
               }"
               end

	cairo_get_source (a_cr: POINTER): POINTER 

		-- function cairo_get_source (in 1910 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_source"
               }"
               end

	cairo_get_target (a_cr: POINTER): POINTER 

		-- function cairo_get_target (in 1949 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_target
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_target"
               }"
               end

	cairo_get_tolerance (a_cr: POINTER): REAL 

		-- function cairo_get_tolerance (in 1913 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_tolerance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_tolerance"
               }"
               end

	cairo_get_user_data (a_cr: POINTER; a_key: POINTER): POINTER 

		-- function cairo_get_user_data (in 495 at line /usr/include/cairo/cairo.h)i
               -- cairo_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_get_user_data"
               }"
               end

	cairo_glyph_allocate (a_num_glyphs: INTEGER): POINTER 

		-- function cairo_glyph_allocate (in 1096 at line /usr/include/cairo/cairo.h)i
               -- cairo_glyph_allocate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_glyph_allocate"
               }"
               end

	cairo_glyph_extents (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER; an_extents: POINTER) 

		-- function cairo_glyph_extents (in 1483 at line /usr/include/cairo/cairo.h)i
               -- cairo_glyph_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_glyph_extents"
               }"
               end

	cairo_glyph_free (a_glyphs: POINTER) 

		-- function cairo_glyph_free (in 1099 at line /usr/include/cairo/cairo.h)i
               -- cairo_glyph_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_glyph_free"
               }"
               end

	cairo_glyph_path (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER) 

		-- function cairo_glyph_path (in 1475 at line /usr/include/cairo/cairo.h)i
               -- cairo_glyph_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_glyph_path"
               }"
               end

	cairo_has_current_point (a_cr: POINTER): INTEGER 

		-- function cairo_has_current_point (in 1919 at line /usr/include/cairo/cairo.h)i
               -- cairo_has_current_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_has_current_point"
               }"
               end

	cairo_identity_matrix (a_cr: POINTER) 

		-- function cairo_identity_matrix (in 828 at line /usr/include/cairo/cairo.h)i
               -- cairo_identity_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_identity_matrix"
               }"
               end

	cairo_image_surface_create (a_format: INTEGER; a_width: INTEGER; a_height: INTEGER): POINTER 

		-- function cairo_image_surface_create (in 2515 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_create"
               }"
               end

	cairo_image_surface_create_for_data (a_data: POINTER; a_format: INTEGER; a_width: INTEGER; a_height: INTEGER; a_stride: INTEGER): POINTER 

		-- function cairo_image_surface_create_for_data (in 2524 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_create_for_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_create_for_data"
               }"
               end

	cairo_image_surface_create_from_png (a_filename: POINTER): POINTER 

		-- function cairo_image_surface_create_from_png (in 2548 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_create_from_png
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_create_from_png"
               }"
               end

	cairo_image_surface_create_from_png_stream (a_read_func: POINTER; a_closure: POINTER): POINTER 

		-- function cairo_image_surface_create_from_png_stream (in 2551 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_create_from_png_stream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_create_from_png_stream"
               }"
               end

	cairo_image_surface_get_data (a_surface: POINTER): POINTER 

		-- function cairo_image_surface_get_data (in 2531 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_get_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_get_data"
               }"
               end

	cairo_image_surface_get_format (a_surface: POINTER): INTEGER 

		-- function cairo_image_surface_get_format (in 2534 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_get_format
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_get_format"
               }"
               end

	cairo_image_surface_get_height (a_surface: POINTER): INTEGER 

		-- function cairo_image_surface_get_height (in 2540 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_get_height
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_get_height"
               }"
               end

	cairo_image_surface_get_stride (a_surface: POINTER): INTEGER 

		-- function cairo_image_surface_get_stride (in 2543 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_get_stride
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_get_stride"
               }"
               end

	cairo_image_surface_get_width (a_surface: POINTER): INTEGER 

		-- function cairo_image_surface_get_width (in 2537 at line /usr/include/cairo/cairo.h)i
               -- cairo_image_surface_get_width
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_image_surface_get_width"
               }"
               end

	cairo_in_clip (a_cr: POINTER; a_x: REAL; a_y: REAL): INTEGER 

		-- function cairo_in_clip (in 955 at line /usr/include/cairo/cairo.h)i
               -- cairo_in_clip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_in_clip"
               }"
               end

	cairo_in_fill (a_cr: POINTER; a_x: REAL; a_y: REAL): INTEGER 

		-- function cairo_in_fill (in 952 at line /usr/include/cairo/cairo.h)i
               -- cairo_in_fill
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_in_fill"
               }"
               end

	cairo_in_stroke (a_cr: POINTER; a_x: REAL; a_y: REAL): INTEGER 

		-- function cairo_in_stroke (in 949 at line /usr/include/cairo/cairo.h)i
               -- cairo_in_stroke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_in_stroke"
               }"
               end

	cairo_line_to (a_cr: POINTER; a_x: REAL; a_y: REAL) 

		-- function cairo_line_to (in 853 at line /usr/include/cairo/cairo.h)i
               -- cairo_line_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_line_to"
               }"
               end

	cairo_mask (a_cr: POINTER; a_pattern: POINTER) 

		-- function cairo_mask (in 920 at line /usr/include/cairo/cairo.h)i
               -- cairo_mask
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mask"
               }"
               end

	cairo_mask_surface (a_cr: POINTER; a_surface: POINTER; a_surface_x: REAL; a_surface_y: REAL) 

		-- function cairo_mask_surface (in 924 at line /usr/include/cairo/cairo.h)i
               -- cairo_mask_surface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mask_surface"
               }"
               end

	cairo_matrix_init (a_matrix: POINTER; a_xx: REAL; a_yx: REAL; a_xy: REAL; a_yy: REAL; a_x0: REAL; a_y0: REAL) 

		-- function cairo_matrix_init (in 2989 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_init
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_init"
               }"
               end

	cairo_matrix_init_identity (a_matrix: POINTER) 

		-- function cairo_matrix_init_identity (in 2995 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_init_identity
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_init_identity"
               }"
               end

	cairo_matrix_init_rotate (a_matrix: POINTER; a_radians: REAL) 

		-- function cairo_matrix_init_rotate (in 3006 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_init_rotate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_init_rotate"
               }"
               end

	cairo_matrix_init_scale (a_matrix: POINTER; a_sx: REAL; a_sy: REAL) 

		-- function cairo_matrix_init_scale (in 3002 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_init_scale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_init_scale"
               }"
               end

	cairo_matrix_init_translate (a_matrix: POINTER; a_tx: REAL; a_ty: REAL) 

		-- function cairo_matrix_init_translate (in 2998 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_init_translate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_init_translate"
               }"
               end

	cairo_matrix_invert (a_matrix: POINTER): INTEGER 

		-- function cairo_matrix_invert (in 3019 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_invert
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_invert"
               }"
               end

	cairo_matrix_multiply (a_result: POINTER; an_a: POINTER; a_b: POINTER) 

		-- function cairo_matrix_multiply (in 3022 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_multiply
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_multiply"
               }"
               end

	cairo_matrix_rotate (a_matrix: POINTER; a_radians: REAL) 

		-- function cairo_matrix_rotate (in 3016 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_rotate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_rotate"
               }"
               end

	cairo_matrix_scale (a_matrix: POINTER; a_sx: REAL; a_sy: REAL) 

		-- function cairo_matrix_scale (in 3013 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_scale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_scale"
               }"
               end

	cairo_matrix_transform_distance (a_matrix: POINTER; a_dx: POINTER; a_dy: POINTER) 

		-- function cairo_matrix_transform_distance (in 3027 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_transform_distance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_transform_distance"
               }"
               end

	cairo_matrix_transform_point (a_matrix: POINTER; a_x: POINTER; a_y: POINTER) 

		-- function cairo_matrix_transform_point (in 3031 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_transform_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_transform_point"
               }"
               end

	cairo_matrix_translate (a_matrix: POINTER; a_tx: REAL; a_ty: REAL) 

		-- function cairo_matrix_translate (in 3010 at line /usr/include/cairo/cairo.h)i
               -- cairo_matrix_translate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_matrix_translate"
               }"
               end

	cairo_mesh_pattern_begin_patch (a_pattern: POINTER) 

		-- function cairo_mesh_pattern_begin_patch (in 2819 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_begin_patch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_begin_patch"
               }"
               end

	cairo_mesh_pattern_curve_to (a_pattern: POINTER; a_x1: REAL; a_y1: REAL; a_x2: REAL; a_y2: REAL; a_x3: REAL; a_y3: REAL) 

		-- function cairo_mesh_pattern_curve_to (in 2825 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_curve_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_curve_to"
               }"
               end

	cairo_mesh_pattern_end_patch (a_pattern: POINTER) 

		-- function cairo_mesh_pattern_end_patch (in 2822 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_end_patch
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_end_patch"
               }"
               end

	cairo_mesh_pattern_get_control_point (a_pattern: POINTER; a_patch_num: NATURAL; a_point_num: NATURAL; a_x: POINTER; a_y: POINTER): INTEGER 

		-- function cairo_mesh_pattern_get_control_point (in 2981 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_get_control_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_get_control_point"
               }"
               end

	cairo_mesh_pattern_get_corner_color_rgba (a_pattern: POINTER; a_patch_num: NATURAL; a_corner_num: NATURAL; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER 

		-- function cairo_mesh_pattern_get_corner_color_rgba (in 2974 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_get_corner_color_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_get_corner_color_rgba"
               }"
               end

	cairo_mesh_pattern_get_patch_count (a_pattern: POINTER; a_count: POINTER): INTEGER 

		-- function cairo_mesh_pattern_get_patch_count (in 2966 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_get_patch_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_get_patch_count"
               }"
               end

	cairo_mesh_pattern_get_path (a_pattern: POINTER; a_patch_num: NATURAL): POINTER 

		-- function cairo_mesh_pattern_get_path (in 2970 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_get_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_get_path"
               }"
               end

	cairo_mesh_pattern_line_to (a_pattern: POINTER; a_x: REAL; a_y: REAL) 

		-- function cairo_mesh_pattern_line_to (in 2831 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_line_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_line_to"
               }"
               end

	cairo_mesh_pattern_move_to (a_pattern: POINTER; a_x: REAL; a_y: REAL) 

		-- function cairo_mesh_pattern_move_to (in 2835 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_move_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_move_to"
               }"
               end

	cairo_mesh_pattern_set_control_point (a_pattern: POINTER; a_point_num: NATURAL; a_x: REAL; a_y: REAL) 

		-- function cairo_mesh_pattern_set_control_point (in 2839 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_set_control_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_set_control_point"
               }"
               end

	cairo_mesh_pattern_set_corner_color_rgb (a_pattern: POINTER; a_corner_num: NATURAL; a_red: REAL; a_green: REAL; a_blue: REAL) 

		-- function cairo_mesh_pattern_set_corner_color_rgb (in 2844 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_set_corner_color_rgb
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_set_corner_color_rgb"
               }"
               end

	cairo_mesh_pattern_set_corner_color_rgba (a_pattern: POINTER; a_corner_num: NATURAL; a_red: REAL; a_green: REAL; a_blue: REAL; an_alpha: REAL) 

		-- function cairo_mesh_pattern_set_corner_color_rgba (in 2849 at line /usr/include/cairo/cairo.h)i
               -- cairo_mesh_pattern_set_corner_color_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_mesh_pattern_set_corner_color_rgba"
               }"
               end

	cairo_move_to (a_cr: POINTER; a_x: REAL; a_y: REAL) 

		-- function cairo_move_to (in 847 at line /usr/include/cairo/cairo.h)i
               -- cairo_move_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_move_to"
               }"
               end

	cairo_new_path (a_cr: POINTER) 

		-- function cairo_new_path (in 844 at line /usr/include/cairo/cairo.h)i
               -- cairo_new_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_new_path"
               }"
               end

	cairo_new_sub_path (a_cr: POINTER) 

		-- function cairo_new_sub_path (in 850 at line /usr/include/cairo/cairo.h)i
               -- cairo_new_sub_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_new_sub_path"
               }"
               end

	cairo_paint (a_cr: POINTER) 

		-- function cairo_paint (in 913 at line /usr/include/cairo/cairo.h)i
               -- cairo_paint
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_paint"
               }"
               end

	cairo_paint_with_alpha (a_cr: POINTER; an_alpha: REAL) 

		-- function cairo_paint_with_alpha (in 916 at line /usr/include/cairo/cairo.h)i
               -- cairo_paint_with_alpha
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_paint_with_alpha"
               }"
               end

	cairo_path_destroy (a_path: POINTER) 

		-- function cairo_path_destroy (in 2091 at line /usr/include/cairo/cairo.h)i
               -- cairo_path_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_path_destroy"
               }"
               end

	cairo_path_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) 

		-- function cairo_path_extents (in 907 at line /usr/include/cairo/cairo.h)i
               -- cairo_path_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_path_extents"
               }"
               end

	cairo_pattern_add_color_stop_rgb (a_pattern: POINTER; an_offset: REAL; a_red: REAL; a_green: REAL; a_blue: REAL) 

		-- function cairo_pattern_add_color_stop_rgb (in 2808 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_add_color_stop_rgb
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_add_color_stop_rgb"
               }"
               end

	cairo_pattern_add_color_stop_rgba (a_pattern: POINTER; an_offset: REAL; a_red: REAL; a_green: REAL; a_blue: REAL; an_alpha: REAL) 

		-- function cairo_pattern_add_color_stop_rgba (in 2813 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_add_color_stop_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_add_color_stop_rgba"
               }"
               end

	cairo_pattern_create_for_surface (a_surface: POINTER): POINTER 

		-- function cairo_pattern_create_for_surface (in 2728 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_for_surface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_for_surface"
               }"
               end

	cairo_pattern_create_linear (a_x0: REAL; a_y0: REAL; a_x1: REAL; a_y1: REAL): POINTER 

		-- function cairo_pattern_create_linear (in 2731 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_linear
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_linear"
               }"
               end

	cairo_pattern_create_mesh: POINTER 

		-- function cairo_pattern_create_mesh (in 2739 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_mesh
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_mesh"
               }"
               end

	cairo_pattern_create_radial (a_cx0: REAL; a_cy0: REAL; a_radius0: REAL; a_cx1: REAL; a_cy1: REAL; a_radius1: REAL): POINTER 

		-- function cairo_pattern_create_radial (in 2735 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_radial
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_radial"
               }"
               end

	cairo_pattern_create_raster_source (an_user_data: POINTER; a_content: INTEGER; a_width: INTEGER; a_height: INTEGER): POINTER 

		-- function cairo_pattern_create_raster_source (in 2677 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_raster_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_raster_source"
               }"
               end

	cairo_pattern_create_rgb (a_red: REAL; a_green: REAL; a_blue: REAL): POINTER 

		-- function cairo_pattern_create_rgb (in 2721 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_rgb
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_rgb"
               }"
               end

	cairo_pattern_create_rgba (a_red: REAL; a_green: REAL; a_blue: REAL; an_alpha: REAL): POINTER 

		-- function cairo_pattern_create_rgba (in 2724 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_create_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_create_rgba"
               }"
               end

	cairo_pattern_destroy (a_pattern: POINTER) 

		-- function cairo_pattern_destroy (in 2745 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_destroy"
               }"
               end

	cairo_pattern_get_color_stop_count (a_pattern: POINTER; a_count: POINTER): INTEGER 

		-- function cairo_pattern_get_color_stop_count (in 2952 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_color_stop_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_color_stop_count"
               }"
               end

	cairo_pattern_get_color_stop_rgba (a_pattern: POINTER; an_index: INTEGER; an_offset: POINTER; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER 

		-- function cairo_pattern_get_color_stop_rgba (in 2946 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_color_stop_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_color_stop_rgba"
               }"
               end

	cairo_pattern_get_extend (a_pattern: POINTER): INTEGER 

		-- function cairo_pattern_get_extend (in 2898 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_extend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_extend"
               }"
               end

	cairo_pattern_get_filter (a_pattern: POINTER): INTEGER 

		-- function cairo_pattern_get_filter (in 2933 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_filter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_filter"
               }"
               end

	cairo_pattern_get_linear_points (a_pattern: POINTER; a_x0: POINTER; a_y0: POINTER; a_x1: POINTER; a_y1: POINTER): INTEGER 

		-- function cairo_pattern_get_linear_points (in 2956 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_linear_points
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_linear_points"
               }"
               end

	cairo_pattern_get_matrix (a_pattern: POINTER; a_matrix: POINTER) 

		-- function cairo_pattern_get_matrix (in 2859 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_matrix"
               }"
               end

	cairo_pattern_get_radial_circles (a_pattern: POINTER; a_x0: POINTER; a_y0: POINTER; a_r0: POINTER; a_x1: POINTER; a_y1: POINTER; a_r1: POINTER): INTEGER 

		-- function cairo_pattern_get_radial_circles (in 2961 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_radial_circles
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_radial_circles"
               }"
               end

	cairo_pattern_get_reference_count (a_pattern: POINTER): NATURAL 

		-- function cairo_pattern_get_reference_count (in 2748 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_reference_count"
               }"
               end

	cairo_pattern_get_rgba (a_pattern: POINTER; a_red: POINTER; a_green: POINTER; a_blue: POINTER; an_alpha: POINTER): INTEGER 

		-- function cairo_pattern_get_rgba (in 2936 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_rgba"
               }"
               end

	cairo_pattern_get_surface (a_pattern: POINTER; a_surface: POINTER): INTEGER 

		-- function cairo_pattern_get_surface (in 2941 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_surface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_surface"
               }"
               end

	cairo_pattern_get_type (a_pattern: POINTER): INTEGER 

		-- function cairo_pattern_get_type (in 2805 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_type"
               }"
               end

	cairo_pattern_get_user_data (a_pattern: POINTER; a_key: POINTER): POINTER 

		-- function cairo_pattern_get_user_data (in 2754 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_get_user_data"
               }"
               end

	cairo_pattern_reference (a_pattern: POINTER): POINTER 

		-- function cairo_pattern_reference (in 2742 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_reference"
               }"
               end

	cairo_pattern_set_extend (a_pattern: POINTER; an_extend: INTEGER) 

		-- function cairo_pattern_set_extend (in 2895 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_set_extend
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_set_extend"
               }"
               end

	cairo_pattern_set_filter (a_pattern: POINTER; a_filter: INTEGER) 

		-- function cairo_pattern_set_filter (in 2930 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_set_filter
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_set_filter"
               }"
               end

	cairo_pattern_set_matrix (a_pattern: POINTER; a_matrix: POINTER) 

		-- function cairo_pattern_set_matrix (in 2855 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_set_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_set_matrix"
               }"
               end

	cairo_pattern_set_user_data (a_pattern: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_pattern_set_user_data (in 2758 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_set_user_data"
               }"
               end

	cairo_pattern_status (a_pattern: POINTER): INTEGER 

		-- function cairo_pattern_status (in 2751 at line /usr/include/cairo/cairo.h)i
               -- cairo_pattern_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pattern_status"
               }"
               end

	cairo_pop_group (a_cr: POINTER): POINTER 

		-- function cairo_pop_group (in 517 at line /usr/include/cairo/cairo.h)i
               -- cairo_pop_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pop_group"
               }"
               end

	cairo_pop_group_to_source (a_cr: POINTER) 

		-- function cairo_pop_group_to_source (in 520 at line /usr/include/cairo/cairo.h)i
               -- cairo_pop_group_to_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_pop_group_to_source"
               }"
               end

	cairo_push_group (a_cr: POINTER) 

		-- function cairo_push_group (in 511 at line /usr/include/cairo/cairo.h)i
               -- cairo_push_group
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_push_group"
               }"
               end

	cairo_push_group_with_content (a_cr: POINTER; a_content: INTEGER) 

		-- function cairo_push_group_with_content (in 514 at line /usr/include/cairo/cairo.h)i
               -- cairo_push_group_with_content
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_push_group_with_content"
               }"
               end

	cairo_raster_source_pattern_get_acquire (a_pattern: POINTER; an_acquire: POINTER; a_release: POINTER) 

		-- function cairo_raster_source_pattern_get_acquire (in 2694 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_get_acquire
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_get_acquire"
               }"
               end

	cairo_raster_source_pattern_get_callback_data (a_pattern: POINTER): POINTER 

		-- function cairo_raster_source_pattern_get_callback_data (in 2686 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_get_callback_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_get_callback_data"
               }"
               end

	cairo_raster_source_pattern_get_copy (a_pattern: POINTER): POINTER 

		-- function cairo_raster_source_pattern_get_copy (in 2709 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_get_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_get_copy"
               }"
               end

	cairo_raster_source_pattern_get_finish (a_pattern: POINTER): POINTER 

		-- function cairo_raster_source_pattern_get_finish (in 2716 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_get_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_get_finish"
               }"
               end

	cairo_raster_source_pattern_get_snapshot (a_pattern: POINTER): POINTER 

		-- function cairo_raster_source_pattern_get_snapshot (in 2702 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_get_snapshot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_get_snapshot"
               }"
               end

	cairo_raster_source_pattern_set_acquire (a_pattern: POINTER; an_acquire: POINTER; a_release: POINTER) 

		-- function cairo_raster_source_pattern_set_acquire (in 2689 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_set_acquire
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_set_acquire"
               }"
               end

	cairo_raster_source_pattern_set_callback_data (a_pattern: POINTER; a_data: POINTER) 

		-- function cairo_raster_source_pattern_set_callback_data (in 2682 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_set_callback_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_set_callback_data"
               }"
               end

	cairo_raster_source_pattern_set_copy (a_pattern: POINTER; a_copy_external: POINTER) 

		-- function cairo_raster_source_pattern_set_copy (in 2705 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_set_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_set_copy"
               }"
               end

	cairo_raster_source_pattern_set_finish (a_pattern: POINTER; a_finish: POINTER) 

		-- function cairo_raster_source_pattern_set_finish (in 2712 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_set_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_set_finish"
               }"
               end

	cairo_raster_source_pattern_set_snapshot (a_pattern: POINTER; a_snapshot: POINTER) 

		-- function cairo_raster_source_pattern_set_snapshot (in 2698 at line /usr/include/cairo/cairo.h)i
               -- cairo_raster_source_pattern_set_snapshot
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_raster_source_pattern_set_snapshot"
               }"
               end

	cairo_recording_surface_create (a_content: INTEGER; an_extents: POINTER): POINTER 

		-- function cairo_recording_surface_create (in 2559 at line /usr/include/cairo/cairo.h)i
               -- cairo_recording_surface_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_recording_surface_create"
               }"
               end

	cairo_recording_surface_get_extents (a_surface: POINTER; an_extents: POINTER): INTEGER 

		-- function cairo_recording_surface_get_extents (in 2570 at line /usr/include/cairo/cairo.h)i
               -- cairo_recording_surface_get_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_recording_surface_get_extents"
               }"
               end

	cairo_recording_surface_ink_extents (a_surface: POINTER; a_x0: POINTER; a_y0: POINTER; a_width: POINTER; a_height: POINTER) 

		-- function cairo_recording_surface_ink_extents (in 2563 at line /usr/include/cairo/cairo.h)i
               -- cairo_recording_surface_ink_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_recording_surface_ink_extents"
               }"
               end

	cairo_rectangle (a_cr: POINTER; a_x: REAL; a_y: REAL; a_width: REAL; a_height: REAL) 

		-- function cairo_rectangle (in 894 at line /usr/include/cairo/cairo.h)i
               -- cairo_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rectangle"
               }"
               end

	cairo_rectangle_list_destroy (a_rectangle_list: POINTER) 

		-- function cairo_rectangle_list_destroy (in 1019 at line /usr/include/cairo/cairo.h)i
               -- cairo_rectangle_list_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rectangle_list_destroy"
               }"
               end

	cairo_reference (a_cr: POINTER): POINTER 

		-- function cairo_reference (in 486 at line /usr/include/cairo/cairo.h)i
               -- cairo_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_reference"
               }"
               end

	cairo_region_contains_point (a_region: POINTER; a_x: INTEGER; a_y: INTEGER): INTEGER 

		-- function cairo_region_contains_point (in 3113 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_contains_point
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_contains_point"
               }"
               end

	cairo_region_contains_rectangle (a_region: POINTER; a_rectangle: POINTER): INTEGER 

		-- function cairo_region_contains_rectangle (in 3109 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_contains_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_contains_rectangle"
               }"
               end

	cairo_region_copy (an_original: POINTER): POINTER 

		-- function cairo_region_copy (in 3079 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_copy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_copy"
               }"
               end

	cairo_region_create: POINTER 

		-- function cairo_region_create (in 3069 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_create"
               }"
               end

	cairo_region_create_rectangle (a_rectangle: POINTER): POINTER 

		-- function cairo_region_create_rectangle (in 3072 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_create_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_create_rectangle"
               }"
               end

	cairo_region_create_rectangles (a_rects: POINTER; a_count: INTEGER): POINTER 

		-- function cairo_region_create_rectangles (in 3075 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_create_rectangles
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_create_rectangles"
               }"
               end

	cairo_region_destroy (a_region: POINTER) 

		-- function cairo_region_destroy (in 3085 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_destroy"
               }"
               end

	cairo_region_equal (an_a: POINTER; a_b: POINTER): INTEGER 

		-- function cairo_region_equal (in 3088 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_equal
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_equal"
               }"
               end

	cairo_region_get_extents (a_region: POINTER; an_extents: POINTER) 

		-- function cairo_region_get_extents (in 3094 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_get_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_get_extents"
               }"
               end

	cairo_region_get_rectangle (a_region: POINTER; a_nth: INTEGER; a_rectangle: POINTER) 

		-- function cairo_region_get_rectangle (in 3101 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_get_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_get_rectangle"
               }"
               end

	cairo_region_intersect (a_dst: POINTER; an_other: POINTER): INTEGER 

		-- function cairo_region_intersect (in 3126 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_intersect
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_intersect"
               }"
               end

	cairo_region_intersect_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER 

		-- function cairo_region_intersect_rectangle (in 3129 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_intersect_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_intersect_rectangle"
               }"
               end

	cairo_region_is_empty (a_region: POINTER): INTEGER 

		-- function cairo_region_is_empty (in 3106 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_is_empty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_is_empty"
               }"
               end

	cairo_region_num_rectangles (a_region: POINTER): INTEGER 

		-- function cairo_region_num_rectangles (in 3098 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_num_rectangles
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_num_rectangles"
               }"
               end

	cairo_region_reference (a_region: POINTER): POINTER 

		-- function cairo_region_reference (in 3082 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_reference"
               }"
               end

	cairo_region_status (a_region: POINTER): INTEGER 

		-- function cairo_region_status (in 3091 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_status"
               }"
               end

	cairo_region_subtract (a_dst: POINTER; an_other: POINTER): INTEGER 

		-- function cairo_region_subtract (in 3119 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_subtract
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_subtract"
               }"
               end

	cairo_region_subtract_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER 

		-- function cairo_region_subtract_rectangle (in 3122 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_subtract_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_subtract_rectangle"
               }"
               end

	cairo_region_translate (a_region: POINTER; a_dx: INTEGER; a_dy: INTEGER) 

		-- function cairo_region_translate (in 3116 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_translate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_translate"
               }"
               end

	cairo_region_union (a_dst: POINTER; an_other: POINTER): INTEGER 

		-- function cairo_region_union (in 3133 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_union
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_union"
               }"
               end

	cairo_region_union_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER 

		-- function cairo_region_union_rectangle (in 3136 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_union_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_union_rectangle"
               }"
               end

	cairo_region_xor (a_dst: POINTER; an_other: POINTER): INTEGER 

		-- function cairo_region_xor (in 3140 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_xor
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_xor"
               }"
               end

	cairo_region_xor_rectangle (a_dst: POINTER; a_rectangle: POINTER): INTEGER 

		-- function cairo_region_xor_rectangle (in 3143 at line /usr/include/cairo/cairo.h)i
               -- cairo_region_xor_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_region_xor_rectangle"
               }"
               end

	cairo_rel_curve_to (a_cr: POINTER; a_dx1: REAL; a_dy1: REAL; a_dx2: REAL; a_dy2: REAL; a_dx3: REAL; a_dy3: REAL) 

		-- function cairo_rel_curve_to (in 888 at line /usr/include/cairo/cairo.h)i
               -- cairo_rel_curve_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rel_curve_to"
               }"
               end

	cairo_rel_line_to (a_cr: POINTER; a_dx: REAL; a_dy: REAL) 

		-- function cairo_rel_line_to (in 885 at line /usr/include/cairo/cairo.h)i
               -- cairo_rel_line_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rel_line_to"
               }"
               end

	cairo_rel_move_to (a_cr: POINTER; a_dx: REAL; a_dy: REAL) 

		-- function cairo_rel_move_to (in 882 at line /usr/include/cairo/cairo.h)i
               -- cairo_rel_move_to
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rel_move_to"
               }"
               end

	cairo_reset_clip (a_cr: POINTER) 

		-- function cairo_reset_clip (in 970 at line /usr/include/cairo/cairo.h)i
               -- cairo_reset_clip
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_reset_clip"
               }"
               end

	cairo_restore (a_cr: POINTER) 

		-- function cairo_restore (in 508 at line /usr/include/cairo/cairo.h)i
               -- cairo_restore
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_restore"
               }"
               end

	cairo_rotate (a_cr: POINTER; an_angle: REAL) 

		-- function cairo_rotate (in 817 at line /usr/include/cairo/cairo.h)i
               -- cairo_rotate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_rotate"
               }"
               end

	cairo_save (a_cr: POINTER) 

		-- function cairo_save (in 505 at line /usr/include/cairo/cairo.h)i
               -- cairo_save
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_save"
               }"
               end

	cairo_scale (a_cr: POINTER; a_sx: REAL; a_sy: REAL) 

		-- function cairo_scale (in 814 at line /usr/include/cairo/cairo.h)i
               -- cairo_scale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scale"
               }"
               end

	cairo_scaled_font_create (a_font_face: POINTER; a_font_matrix: POINTER; a_ctm: POINTER; an_options: POINTER): POINTER 

		-- function cairo_scaled_font_create (in 1570 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_create"
               }"
               end

	cairo_scaled_font_destroy (a_scaled_font: POINTER) 

		-- function cairo_scaled_font_destroy (in 1579 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_destroy"
               }"
               end

	cairo_scaled_font_extents (a_scaled_font: POINTER; an_extents: POINTER) 

		-- function cairo_scaled_font_extents (in 1601 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_extents"
               }"
               end

	cairo_scaled_font_get_ctm (a_scaled_font: POINTER; a_ctm: POINTER) 

		-- function cairo_scaled_font_get_ctm (in 1635 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_ctm
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_ctm"
               }"
               end

	cairo_scaled_font_get_font_face (a_scaled_font: POINTER): POINTER 

		-- function cairo_scaled_font_get_font_face (in 1628 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_font_face
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_font_face"
               }"
               end

	cairo_scaled_font_get_font_matrix (a_scaled_font: POINTER; a_font_matrix: POINTER) 

		-- function cairo_scaled_font_get_font_matrix (in 1631 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_font_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_font_matrix"
               }"
               end

	cairo_scaled_font_get_font_options (a_scaled_font: POINTER; an_options: POINTER) 

		-- function cairo_scaled_font_get_font_options (in 1643 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_font_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_font_options"
               }"
               end

	cairo_scaled_font_get_reference_count (a_scaled_font: POINTER): NATURAL 

		-- function cairo_scaled_font_get_reference_count (in 1582 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_reference_count"
               }"
               end

	cairo_scaled_font_get_scale_matrix (a_scaled_font: POINTER; a_scale_matrix: POINTER) 

		-- function cairo_scaled_font_get_scale_matrix (in 1639 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_scale_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_scale_matrix"
               }"
               end

	cairo_scaled_font_get_type (a_scaled_font: POINTER): INTEGER 

		-- function cairo_scaled_font_get_type (in 1588 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_type"
               }"
               end

	cairo_scaled_font_get_user_data (a_scaled_font: POINTER; a_key: POINTER): POINTER 

		-- function cairo_scaled_font_get_user_data (in 1591 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_get_user_data"
               }"
               end

	cairo_scaled_font_glyph_extents (a_scaled_font: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER; an_extents: POINTER) 

		-- function cairo_scaled_font_glyph_extents (in 1610 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_glyph_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_glyph_extents"
               }"
               end

	cairo_scaled_font_reference (a_scaled_font: POINTER): POINTER 

		-- function cairo_scaled_font_reference (in 1576 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_reference"
               }"
               end

	cairo_scaled_font_set_user_data (a_scaled_font: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_scaled_font_set_user_data (in 1595 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_set_user_data"
               }"
               end

	cairo_scaled_font_status (a_scaled_font: POINTER): INTEGER 

		-- function cairo_scaled_font_status (in 1585 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_status"
               }"
               end

	cairo_scaled_font_text_extents (a_scaled_font: POINTER; an_utf8: POINTER; an_extents: POINTER) 

		-- function cairo_scaled_font_text_extents (in 1605 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_text_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_text_extents"
               }"
               end

	cairo_scaled_font_text_to_glyphs (a_scaled_font: POINTER; a_x: REAL; a_y: REAL; an_utf8: POINTER; an_utf8_len: INTEGER; a_glyphs: POINTER; a_num_glyphs: POINTER; a_clusters: POINTER; a_num_clusters: POINTER; a_cluster_flags: POINTER): INTEGER 

		-- function cairo_scaled_font_text_to_glyphs (in 1616 at line /usr/include/cairo/cairo.h)i
               -- cairo_scaled_font_text_to_glyphs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_scaled_font_text_to_glyphs"
               }"
               end

	cairo_select_font_face (a_cr: POINTER; a_family: POINTER; a_slant: INTEGER; a_weight: INTEGER) 

		-- function cairo_select_font_face (in 1418 at line /usr/include/cairo/cairo.h)i
               -- cairo_select_font_face
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_select_font_face"
               }"
               end

	cairo_set_antialias (a_cr: POINTER; an_antialias: INTEGER) 

		-- function cairo_set_antialias (in 716 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_antialias
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_antialias"
               }"
               end

	cairo_set_dash (a_cr: POINTER; a_dashes: POINTER; a_num_dashes: INTEGER; an_offset: REAL) 

		-- function cairo_set_dash (in 802 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_dash
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_dash"
               }"
               end

	cairo_set_fill_rule (a_cr: POINTER; a_fill_rule: INTEGER) 

		-- function cairo_set_fill_rule (in 751 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_fill_rule
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_fill_rule"
               }"
               end

	cairo_set_font_face (a_cr: POINTER; a_font_face: POINTER) 

		-- function cairo_set_font_face (in 1443 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_font_face
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_font_face"
               }"
               end

	cairo_set_font_matrix (a_cr: POINTER; a_matrix: POINTER) 

		-- function cairo_set_font_matrix (in 1427 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_font_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_font_matrix"
               }"
               end

	cairo_set_font_options (a_cr: POINTER; an_options: POINTER) 

		-- function cairo_set_font_options (in 1435 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_font_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_font_options"
               }"
               end

	cairo_set_font_size (a_cr: POINTER; a_size: REAL) 

		-- function cairo_set_font_size (in 1424 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_font_size
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_font_size"
               }"
               end

	cairo_set_line_cap (a_cr: POINTER; a_line_cap: INTEGER) 

		-- function cairo_set_line_cap (in 775 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_line_cap
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_line_cap"
               }"
               end

	cairo_set_line_join (a_cr: POINTER; a_line_join: INTEGER) 

		-- function cairo_set_line_join (in 799 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_line_join
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_line_join"
               }"
               end

	cairo_set_line_width (a_cr: POINTER; a_width: REAL) 

		-- function cairo_set_line_width (in 754 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_line_width
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_line_width"
               }"
               end

	cairo_set_matrix (a_cr: POINTER; a_matrix: POINTER) 

		-- function cairo_set_matrix (in 824 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_matrix
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_matrix"
               }"
               end

	cairo_set_miter_limit (a_cr: POINTER; a_limit: REAL) 

		-- function cairo_set_miter_limit (in 808 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_miter_limit
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_miter_limit"
               }"
               end

	cairo_set_operator (a_cr: POINTER; an_op: INTEGER) 

		-- function cairo_set_operator (in 642 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_operator
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_operator"
               }"
               end

	cairo_set_scaled_font (a_cr: POINTER; a_scaled_font: POINTER) 

		-- function cairo_set_scaled_font (in 1449 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_scaled_font
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_scaled_font"
               }"
               end

	cairo_set_source (a_cr: POINTER; a_source: POINTER) 

		-- function cairo_set_source (in 645 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_source
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_source"
               }"
               end

	cairo_set_source_rgb (a_cr: POINTER; a_red: REAL; a_green: REAL; a_blue: REAL) 

		-- function cairo_set_source_rgb (in 648 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_source_rgb
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_source_rgb"
               }"
               end

	cairo_set_source_rgba (a_cr: POINTER; a_red: REAL; a_green: REAL; a_blue: REAL; an_alpha: REAL) 

		-- function cairo_set_source_rgba (in 651 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_source_rgba
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_source_rgba"
               }"
               end

	cairo_set_source_surface (a_cr: POINTER; a_surface: POINTER; a_x: REAL; a_y: REAL) 

		-- function cairo_set_source_surface (in 656 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_source_surface
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_source_surface"
               }"
               end

	cairo_set_tolerance (a_cr: POINTER; a_tolerance: REAL) 

		-- function cairo_set_tolerance (in 662 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_tolerance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_tolerance"
               }"
               end

	cairo_set_user_data (a_cr: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_set_user_data (in 499 at line /usr/include/cairo/cairo.h)i
               -- cairo_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_set_user_data"
               }"
               end

	cairo_show_glyphs (a_cr: POINTER; a_glyphs: POINTER; a_num_glyphs: INTEGER) 

		-- function cairo_show_glyphs (in 1459 at line /usr/include/cairo/cairo.h)i
               -- cairo_show_glyphs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_show_glyphs"
               }"
               end

	cairo_show_page (a_cr: POINTER) 

		-- function cairo_show_page (in 945 at line /usr/include/cairo/cairo.h)i
               -- cairo_show_page
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_show_page"
               }"
               end

	cairo_show_text (a_cr: POINTER; an_utf8: POINTER) 

		-- function cairo_show_text (in 1456 at line /usr/include/cairo/cairo.h)i
               -- cairo_show_text
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_show_text"
               }"
               end

	cairo_show_text_glyphs (a_cr: POINTER; an_utf8: POINTER; an_utf8_len: INTEGER; a_glyphs: POINTER; a_num_glyphs: INTEGER; a_clusters: POINTER; a_num_clusters: INTEGER; a_cluster_flags: INTEGER) 

		-- function cairo_show_text_glyphs (in 1462 at line /usr/include/cairo/cairo.h)i
               -- cairo_show_text_glyphs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_show_text_glyphs"
               }"
               end

	cairo_status (a_cr: POINTER): INTEGER 

		-- function cairo_status (in 2096 at line /usr/include/cairo/cairo.h)i
               -- cairo_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_status"
               }"
               end

	cairo_status_to_string (a_status: INTEGER): POINTER 

		-- function cairo_status_to_string (in 2099 at line /usr/include/cairo/cairo.h)i
               -- cairo_status_to_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_status_to_string"
               }"
               end

	cairo_stroke (a_cr: POINTER) 

		-- function cairo_stroke (in 930 at line /usr/include/cairo/cairo.h)i
               -- cairo_stroke
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_stroke"
               }"
               end

	cairo_stroke_extents (a_cr: POINTER; a_x1: POINTER; a_y1: POINTER; a_x2: POINTER; a_y2: POINTER) 

		-- function cairo_stroke_extents (in 959 at line /usr/include/cairo/cairo.h)i
               -- cairo_stroke_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_stroke_extents"
               }"
               end

	cairo_stroke_preserve (a_cr: POINTER) 

		-- function cairo_stroke_preserve (in 933 at line /usr/include/cairo/cairo.h)i
               -- cairo_stroke_preserve
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_stroke_preserve"
               }"
               end

	cairo_surface_copy_page (a_surface: POINTER) 

		-- function cairo_surface_copy_page (in 2504 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_copy_page
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_copy_page"
               }"
               end

	cairo_surface_create_for_rectangle (a_target: POINTER; a_x: REAL; a_y: REAL; a_width: REAL; a_height: REAL): POINTER 

		-- function cairo_surface_create_for_rectangle (in 2208 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_create_for_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_create_for_rectangle"
               }"
               end

	cairo_surface_create_observer (a_target: POINTER; a_mode: INTEGER): POINTER 

		-- function cairo_surface_create_observer (in 2229 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_create_observer
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_create_observer"
               }"
               end

	cairo_surface_create_similar (an_other: POINTER; a_content: INTEGER; a_width: INTEGER; a_height: INTEGER): POINTER 

		-- function cairo_surface_create_similar (in 2188 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_create_similar
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_create_similar"
               }"
               end

	cairo_surface_create_similar_image (an_other: POINTER; a_format: INTEGER; a_width: INTEGER; a_height: INTEGER): POINTER 

		-- function cairo_surface_create_similar_image (in 2194 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_create_similar_image
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_create_similar_image"
               }"
               end

	cairo_surface_destroy (a_surface: POINTER) 

		-- function cairo_surface_destroy (in 2308 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_destroy
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_destroy"
               }"
               end

	cairo_surface_finish (a_surface: POINTER) 

		-- function cairo_surface_finish (in 2305 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_finish
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_finish"
               }"
               end

	cairo_surface_flush (a_surface: POINTER) 

		-- function cairo_surface_flush (in 2461 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_flush
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_flush"
               }"
               end

	cairo_surface_get_content (a_surface: POINTER): INTEGER 

		-- function cairo_surface_get_content (in 2404 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_content
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_content"
               }"
               end

	cairo_surface_get_device (a_surface: POINTER): POINTER 

		-- function cairo_surface_get_device (in 2311 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_device
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_device"
               }"
               end

	cairo_surface_get_device_offset (a_surface: POINTER; a_x_offset: POINTER; a_y_offset: POINTER) 

		-- function cairo_surface_get_device_offset (in 2489 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_device_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_device_offset"
               }"
               end

	cairo_surface_get_device_scale (a_surface: POINTER; a_x_scale: POINTER; a_y_scale: POINTER) 

		-- function cairo_surface_get_device_scale (in 2479 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_device_scale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_device_scale"
               }"
               end

	cairo_surface_get_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch: POINTER; a_y_pixels_per_inch: POINTER) 

		-- function cairo_surface_get_fallback_resolution (in 2499 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_fallback_resolution
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_fallback_resolution"
               }"
               end

	cairo_surface_get_font_options (a_surface: POINTER; an_options: POINTER) 

		-- function cairo_surface_get_font_options (in 2457 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_font_options
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_font_options"
               }"
               end

	cairo_surface_get_mime_data (a_surface: POINTER; a_mime_type: POINTER; a_data: POINTER; a_length: POINTER) 

		-- function cairo_surface_get_mime_data (in 2439 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_mime_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_mime_data"
               }"
               end

	cairo_surface_get_reference_count (a_surface: POINTER): NATURAL 

		-- function cairo_surface_get_reference_count (in 2314 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_reference_count
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_reference_count"
               }"
               end

	cairo_surface_get_type (a_surface: POINTER): INTEGER 

		-- function cairo_surface_get_type (in 2401 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_type"
               }"
               end

	cairo_surface_get_user_data (a_surface: POINTER; a_key: POINTER): POINTER 

		-- function cairo_surface_get_user_data (in 2420 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_get_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_get_user_data"
               }"
               end

	cairo_surface_has_show_text_glyphs (a_surface: POINTER): INTEGER 

		-- function cairo_surface_has_show_text_glyphs (in 2510 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_has_show_text_glyphs
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_has_show_text_glyphs"
               }"
               end

	cairo_surface_map_to_image (a_surface: POINTER; an_extents: POINTER): POINTER 

		-- function cairo_surface_map_to_image (in 2200 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_map_to_image
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_map_to_image"
               }"
               end

	cairo_surface_mark_dirty (a_surface: POINTER) 

		-- function cairo_surface_mark_dirty (in 2464 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_mark_dirty
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_mark_dirty"
               }"
               end

	cairo_surface_mark_dirty_rectangle (a_surface: POINTER; a_x: INTEGER; a_y: INTEGER; a_width: INTEGER; a_height: INTEGER) 

		-- function cairo_surface_mark_dirty_rectangle (in 2467 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_mark_dirty_rectangle
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_mark_dirty_rectangle"
               }"
               end

	cairo_surface_observer_add_fill_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_fill_callback (in 2247 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_fill_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_fill_callback"
               }"
               end

	cairo_surface_observer_add_finish_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_finish_callback (in 2267 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_finish_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_finish_callback"
               }"
               end

	cairo_surface_observer_add_flush_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_flush_callback (in 2262 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_flush_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_flush_callback"
               }"
               end

	cairo_surface_observer_add_glyphs_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_glyphs_callback (in 2257 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_glyphs_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_glyphs_callback"
               }"
               end

	cairo_surface_observer_add_mask_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_mask_callback (in 2242 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_mask_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_mask_callback"
               }"
               end

	cairo_surface_observer_add_paint_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_paint_callback (in 2237 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_paint_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_paint_callback"
               }"
               end

	cairo_surface_observer_add_stroke_callback (an_abstract_surface: POINTER; a_func: POINTER; a_data: POINTER): INTEGER 

		-- function cairo_surface_observer_add_stroke_callback (in 2252 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_add_stroke_callback
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_add_stroke_callback"
               }"
               end

	cairo_surface_observer_elapsed (a_surface: POINTER): REAL 

		-- function cairo_surface_observer_elapsed (in 2276 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_elapsed
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_elapsed"
               }"
               end

	cairo_surface_observer_print (a_surface: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER 

		-- function cairo_surface_observer_print (in 2272 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_observer_print
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_observer_print"
               }"
               end

	cairo_surface_reference (a_surface: POINTER): POINTER 

		-- function cairo_surface_reference (in 2302 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_reference
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_reference"
               }"
               end

	cairo_surface_set_device_offset (a_surface: POINTER; a_x_offset: REAL; a_y_offset: REAL) 

		-- function cairo_surface_set_device_offset (in 2484 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_set_device_offset
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_set_device_offset"
               }"
               end

	cairo_surface_set_device_scale (a_surface: POINTER; a_x_scale: REAL; a_y_scale: REAL) 

		-- function cairo_surface_set_device_scale (in 2474 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_set_device_scale
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_set_device_scale"
               }"
               end

	cairo_surface_set_fallback_resolution (a_surface: POINTER; a_x_pixels_per_inch: REAL; a_y_pixels_per_inch: REAL) 

		-- function cairo_surface_set_fallback_resolution (in 2494 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_set_fallback_resolution
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_set_fallback_resolution"
               }"
               end

	cairo_surface_set_mime_data (a_surface: POINTER; a_mime_type: POINTER; a_data: POINTER; a_length: like long_unsigned; a_destroy: POINTER; a_closure: POINTER): INTEGER 

		-- function cairo_surface_set_mime_data (in 2445 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_set_mime_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_set_mime_data"
               }"
               end

	cairo_surface_set_user_data (a_surface: POINTER; a_key: POINTER; an_user_data: POINTER; a_destroy: POINTER): INTEGER 

		-- function cairo_surface_set_user_data (in 2424 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_set_user_data
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_set_user_data"
               }"
               end

	cairo_surface_show_page (a_surface: POINTER) 

		-- function cairo_surface_show_page (in 2507 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_show_page
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_show_page"
               }"
               end

	cairo_surface_status (a_surface: POINTER): INTEGER 

		-- function cairo_surface_status (in 2317 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_status
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_status"
               }"
               end

	cairo_surface_supports_mime_type (a_surface: POINTER; a_mime_type: POINTER): INTEGER 

		-- function cairo_surface_supports_mime_type (in 2453 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_supports_mime_type
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_supports_mime_type"
               }"
               end

	cairo_surface_unmap_image (a_surface: POINTER; an_image: POINTER) 

		-- function cairo_surface_unmap_image (in 2204 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_unmap_image
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_unmap_image"
               }"
               end

	cairo_surface_write_to_png (a_surface: POINTER; a_filename: POINTER): INTEGER 

		-- function cairo_surface_write_to_png (in 2409 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_write_to_png
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_write_to_png"
               }"
               end

	cairo_surface_write_to_png_stream (a_surface: POINTER; a_write_func: POINTER; a_closure: POINTER): INTEGER 

		-- function cairo_surface_write_to_png_stream (in 2413 at line /usr/include/cairo/cairo.h)i
               -- cairo_surface_write_to_png_stream
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_surface_write_to_png_stream"
               }"
               end

	cairo_text_cluster_allocate (a_num_clusters: INTEGER): POINTER 

		-- function cairo_text_cluster_allocate (in 1127 at line /usr/include/cairo/cairo.h)i
               -- cairo_text_cluster_allocate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_text_cluster_allocate"
               }"
               end

	cairo_text_cluster_free (a_clusters: POINTER) 

		-- function cairo_text_cluster_free (in 1130 at line /usr/include/cairo/cairo.h)i
               -- cairo_text_cluster_free
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_text_cluster_free"
               }"
               end

	cairo_text_extents (a_cr: POINTER; an_utf8: POINTER; an_extents: POINTER) 

		-- function cairo_text_extents (in 1478 at line /usr/include/cairo/cairo.h)i
               -- cairo_text_extents
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_text_extents"
               }"
               end

	cairo_text_path (a_cr: POINTER; an_utf8: POINTER) 

		-- function cairo_text_path (in 1472 at line /usr/include/cairo/cairo.h)i
               -- cairo_text_path
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_text_path"
               }"
               end

	cairo_toy_font_face_create (a_family: POINTER; a_slant: INTEGER; a_weight: INTEGER): POINTER 

		-- function cairo_toy_font_face_create (in 1650 at line /usr/include/cairo/cairo.h)i
               -- cairo_toy_font_face_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_toy_font_face_create"
               }"
               end

	cairo_toy_font_face_get_family (a_font_face: POINTER): POINTER 

		-- function cairo_toy_font_face_get_family (in 1655 at line /usr/include/cairo/cairo.h)i
               -- cairo_toy_font_face_get_family
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_toy_font_face_get_family"
               }"
               end

	cairo_toy_font_face_get_slant (a_font_face: POINTER): INTEGER 

		-- function cairo_toy_font_face_get_slant (in 1658 at line /usr/include/cairo/cairo.h)i
               -- cairo_toy_font_face_get_slant
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_toy_font_face_get_slant"
               }"
               end

	cairo_toy_font_face_get_weight (a_font_face: POINTER): INTEGER 

		-- function cairo_toy_font_face_get_weight (in 1661 at line /usr/include/cairo/cairo.h)i
               -- cairo_toy_font_face_get_weight
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_toy_font_face_get_weight"
               }"
               end

	cairo_transform (a_cr: POINTER; a_matrix: POINTER) 

		-- function cairo_transform (in 820 at line /usr/include/cairo/cairo.h)i
               -- cairo_transform
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_transform"
               }"
               end

	cairo_translate (a_cr: POINTER; a_tx: REAL; a_ty: REAL) 

		-- function cairo_translate (in 811 at line /usr/include/cairo/cairo.h)i
               -- cairo_translate
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_translate"
               }"
               end

	cairo_user_font_face_create: POINTER 

		-- function cairo_user_font_face_create (in 1667 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_create
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_create"
               }"
               end

	cairo_user_font_face_get_init_func (a_font_face: POINTER): POINTER 

		-- function cairo_user_font_face_get_init_func (in 1892 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_get_init_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_get_init_func"
               }"
               end

	cairo_user_font_face_get_render_glyph_func (a_font_face: POINTER): POINTER 

		-- function cairo_user_font_face_get_render_glyph_func (in 1895 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_get_render_glyph_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_get_render_glyph_func"
               }"
               end

	cairo_user_font_face_get_text_to_glyphs_func (a_font_face: POINTER): POINTER 

		-- function cairo_user_font_face_get_text_to_glyphs_func (in 1898 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_get_text_to_glyphs_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_get_text_to_glyphs_func"
               }"
               end

	cairo_user_font_face_get_unicode_to_glyph_func (a_font_face: POINTER): POINTER 

		-- function cairo_user_font_face_get_unicode_to_glyph_func (in 1901 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_get_unicode_to_glyph_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_get_unicode_to_glyph_func"
               }"
               end

	cairo_user_font_face_set_init_func (a_font_face: POINTER; an_init_func: POINTER) 

		-- function cairo_user_font_face_set_init_func (in 1874 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_set_init_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_set_init_func"
               }"
               end

	cairo_user_font_face_set_render_glyph_func (a_font_face: POINTER; a_render_glyph_func: POINTER) 

		-- function cairo_user_font_face_set_render_glyph_func (in 1878 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_set_render_glyph_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_set_render_glyph_func"
               }"
               end

	cairo_user_font_face_set_text_to_glyphs_func (a_font_face: POINTER; a_text_to_glyphs_func: POINTER) 

		-- function cairo_user_font_face_set_text_to_glyphs_func (in 1882 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_set_text_to_glyphs_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_set_text_to_glyphs_func"
               }"
               end

	cairo_user_font_face_set_unicode_to_glyph_func (a_font_face: POINTER; an_unicode_to_glyph_func: POINTER) 

		-- function cairo_user_font_face_set_unicode_to_glyph_func (in 1886 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_font_face_set_unicode_to_glyph_func
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_font_face_set_unicode_to_glyph_func"
               }"
               end

	cairo_user_to_device (a_cr: POINTER; a_x: POINTER; a_y: POINTER) 

		-- function cairo_user_to_device (in 831 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_to_device
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_to_device"
               }"
               end

	cairo_user_to_device_distance (a_cr: POINTER; a_dx: POINTER; a_dy: POINTER) 

		-- function cairo_user_to_device_distance (in 834 at line /usr/include/cairo/cairo.h)i
               -- cairo_user_to_device_distance
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_user_to_device_distance"
               }"
               end

	cairo_version: INTEGER 

		-- function cairo_version (in 86 at line /usr/include/cairo/cairo.h)i
               -- cairo_version
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_version"
               }"
               end

	cairo_version_string: POINTER 

		-- function cairo_version_string (in 89 at line /usr/include/cairo/cairo.h)i
               -- cairo_version_string
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "cairo_version_string"
               }"
               end


end -- class CAIRO_EXTERNALS
