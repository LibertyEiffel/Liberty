-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_MATRIX_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_matrix_concat (a_matrix: POINTER; a_new_matrix: POINTER) is
 		-- pango_matrix_concat (node at line 1083)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_concat"
		}"
		end

	pango_matrix_free (a_matrix: POINTER) is
 		-- pango_matrix_free (node at line 1191)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_free"
		}"
		end

	pango_matrix_transform_rectangle (a_matrix: POINTER; a_rect: POINTER) is
 		-- pango_matrix_transform_rectangle (node at line 2193)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_transform_rectangle"
		}"
		end

	pango_matrix_rotate (a_matrix: POINTER; a_degrees: REAL_64) is
 		-- pango_matrix_rotate (node at line 3844)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_rotate"
		}"
		end

	pango_matrix_transform_point (a_matrix: POINTER; a_x: POINTER; a_y: POINTER) is
 		-- pango_matrix_transform_point (node at line 4114)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_transform_point"
		}"
		end

	pango_matrix_translate (a_matrix: POINTER; a_tx: REAL_64; a_ty: REAL_64) is
 		-- pango_matrix_translate (node at line 4451)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_translate"
		}"
		end

	pango_matrix_copy (a_matrix: POINTER): POINTER is
 		-- pango_matrix_copy (node at line 5058)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_copy"
		}"
		end

	pango_matrix_transform_pixel_rectangle (a_matrix: POINTER; a_rect: POINTER) is
 		-- pango_matrix_transform_pixel_rectangle (node at line 6833)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_transform_pixel_rectangle"
		}"
		end

	pango_matrix_get_type: NATURAL_64 is
 		-- pango_matrix_get_type (node at line 7046)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_get_type()"
		}"
		end

	pango_matrix_scale (a_matrix: POINTER; a_scale_x: REAL_64; a_scale_y: REAL_64) is
 		-- pango_matrix_scale (node at line 7084)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_scale"
		}"
		end

	pango_matrix_transform_distance (a_matrix: POINTER; a_dx: POINTER; a_dy: POINTER) is
 		-- pango_matrix_transform_distance (node at line 8024)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_transform_distance"
		}"
		end

	pango_matrix_get_font_scale_factor (a_matrix: POINTER): REAL_64 is
 		-- pango_matrix_get_font_scale_factor (node at line 9198)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_matrix_get_font_scale_factor"
		}"
		end


end -- class PANGO_MATRIX_EXTERNALS
