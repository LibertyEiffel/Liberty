-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_FONT_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_font_describe (a_font: POINTER): POINTER is
 		-- pango_font_describe (node at line 85)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_describe"
		}"
		end

	pango_font_description_copy_static (a_desc: POINTER): POINTER is
 		-- pango_font_description_copy_static (node at line 115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_copy_static"
		}"
		end

	pango_font_metrics_unref (a_metrics: POINTER) is
 		-- pango_font_metrics_unref (node at line 167)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_unref"
		}"
		end

	pango_font_description_merge_static (a_desc: POINTER; a_desc_to_merge: POINTER; a_replace_existing: INTEGER_32) is
 		-- pango_font_description_merge_static (node at line 676)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_merge_static"
		}"
		end

	pango_font_face_get_type: NATURAL_64 is
 		-- pango_font_face_get_type (node at line 795)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_face_get_type()"
		}"
		end

	pango_font_family_is_monospace (a_family: POINTER): INTEGER_32 is
 		-- pango_font_family_is_monospace (node at line 992)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_family_is_monospace"
		}"
		end

	pango_font_description_merge (a_desc: POINTER; a_desc_to_merge: POINTER; a_replace_existing: INTEGER_32) is
 		-- pango_font_description_merge (node at line 1057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_merge"
		}"
		end

	pango_font_description_get_size_is_absolute (a_desc: POINTER): INTEGER_32 is
 		-- pango_font_description_get_size_is_absolute (node at line 1098)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_size_is_absolute"
		}"
		end

	pango_font_description_set_stretch (a_desc: POINTER; a_stretch: INTEGER) is
 		-- pango_font_description_set_stretch (node at line 1426)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_stretch"
		}"
		end

	pango_font_description_hash (a_desc: POINTER): NATURAL_32 is
 		-- pango_font_description_hash (node at line 1533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_hash"
		}"
		end

	pango_font_face_list_sizes (a_face: POINTER; a_sizes: POINTER; a_n_sizes: POINTER) is
 		-- pango_font_face_list_sizes (node at line 1592)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_face_list_sizes"
		}"
		end

	pango_font_description_get_style (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_style (node at line 2105)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_style"
		}"
		end

	pango_font_description_set_family_static (a_desc: POINTER; a_family: POINTER) is
 		-- pango_font_description_set_family_static (node at line 2189)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_family_static"
		}"
		end

	pango_font_description_to_string (a_desc: POINTER): POINTER is
 		-- pango_font_description_to_string (node at line 2464)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_to_string"
		}"
		end

	pango_font_description_free (a_desc: POINTER) is
 		-- pango_font_description_free (node at line 2508)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_free"
		}"
		end

	pango_font_description_get_type: NATURAL_64 is
 		-- pango_font_description_get_type (node at line 2527)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_type()"
		}"
		end

	pango_font_description_better_match (a_desc: POINTER; an_old_match: POINTER; a_new_match: POINTER): INTEGER_32 is
 		-- pango_font_description_better_match (node at line 2711)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_better_match"
		}"
		end

	pango_font_metrics_get_strikethrough_position (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_strikethrough_position (node at line 2770)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_strikethrough_position"
		}"
		end

	pango_font_metrics_get_underline_position (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_underline_position (node at line 2800)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_underline_position"
		}"
		end

	pango_font_description_set_variant (a_desc: POINTER; a_variant_external: INTEGER) is
 		-- pango_font_description_set_variant (node at line 2854)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_variant"
		}"
		end

	pango_font_face_describe (a_face: POINTER): POINTER is
 		-- pango_font_face_describe (node at line 2916)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_face_describe"
		}"
		end

	pango_font_description_from_string (a_str: POINTER): POINTER is
 		-- pango_font_description_from_string (node at line 2950)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_from_string"
		}"
		end

	pango_font_metrics_get_approximate_digit_width (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_approximate_digit_width (node at line 3402)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_approximate_digit_width"
		}"
		end

	pango_font_description_new: POINTER is
 		-- pango_font_description_new (node at line 3405)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_new()"
		}"
		end

	pango_font_metrics_get_descent (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_descent (node at line 3428)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_descent"
		}"
		end

	pango_font_description_get_family (a_desc: POINTER): POINTER is
 		-- pango_font_description_get_family (node at line 3461)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_family"
		}"
		end

	pango_font_description_set_family (a_desc: POINTER; a_family: POINTER) is
 		-- pango_font_description_set_family (node at line 3773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_family"
		}"
		end

	pango_font_metrics_get_type: NATURAL_64 is
 		-- pango_font_metrics_get_type (node at line 4533)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_type()"
		}"
		end

	pango_font_descriptions_free (a_descs: POINTER; a_n_descs: INTEGER_32) is
 		-- pango_font_descriptions_free (node at line 4540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_descriptions_free"
		}"
		end

	pango_font_description_set_gravity (a_desc: POINTER; a_gravity: INTEGER) is
 		-- pango_font_description_set_gravity (node at line 4754)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_gravity"
		}"
		end

	pango_font_describe_with_absolute_size (a_font: POINTER): POINTER is
 		-- pango_font_describe_with_absolute_size (node at line 5115)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_describe_with_absolute_size"
		}"
		end

	pango_font_face_get_face_name (a_face: POINTER): POINTER is
 		-- pango_font_face_get_face_name (node at line 5467)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_face_get_face_name"
		}"
		end

	pango_font_metrics_ref (a_metrics: POINTER): POINTER is
 		-- pango_font_metrics_ref (node at line 5497)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_ref"
		}"
		end

	pango_font_description_get_size (a_desc: POINTER): INTEGER_32 is
 		-- pango_font_description_get_size (node at line 5780)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_size"
		}"
		end

	pango_font_get_coverage (a_font: POINTER; a_language: POINTER): POINTER is
 		-- pango_font_get_coverage (node at line 6057)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_get_coverage"
		}"
		end

	pango_font_face_is_synthesized (a_face: POINTER): INTEGER_32 is
 		-- pango_font_face_is_synthesized (node at line 6061)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_face_is_synthesized"
		}"
		end

	pango_font_description_unset_fields (a_desc: POINTER; a_to_unset: INTEGER) is
 		-- pango_font_description_unset_fields (node at line 6085)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_unset_fields"
		}"
		end

	pango_font_description_get_variant (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_variant (node at line 6110)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_variant"
		}"
		end

	pango_font_get_font_map (a_font: POINTER): POINTER is
 		-- pango_font_get_font_map (node at line 6214)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_get_font_map"
		}"
		end

	pango_font_metrics_get_underline_thickness (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_underline_thickness (node at line 6379)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_underline_thickness"
		}"
		end

	pango_font_find_shaper (a_font: POINTER; a_language: POINTER; a_ch: NATURAL_32): POINTER is
 		-- pango_font_find_shaper (node at line 6610)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_find_shaper"
		}"
		end

	pango_font_metrics_get_approximate_char_width (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_approximate_char_width (node at line 6986)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_approximate_char_width"
		}"
		end

	pango_font_family_get_type: NATURAL_64 is
 		-- pango_font_family_get_type (node at line 7070)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_family_get_type()"
		}"
		end

	pango_font_family_list_faces (a_family: POINTER; a_faces: POINTER; a_n_faces: POINTER) is
 		-- pango_font_family_list_faces (node at line 7264)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_family_list_faces"
		}"
		end

	pango_font_metrics_get_strikethrough_thickness (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_strikethrough_thickness (node at line 7316)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_strikethrough_thickness"
		}"
		end

	pango_font_description_get_weight (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_weight (node at line 7408)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_weight"
		}"
		end

	pango_font_description_set_style (a_desc: POINTER; a_style: INTEGER) is
 		-- pango_font_description_set_style (node at line 7753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_style"
		}"
		end

	pango_font_description_set_size (a_desc: POINTER; a_size: INTEGER_32) is
 		-- pango_font_description_set_size (node at line 7819)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_size"
		}"
		end

	pango_font_family_get_name (a_family: POINTER): POINTER is
 		-- pango_font_family_get_name (node at line 7926)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_family_get_name"
		}"
		end

	pango_font_description_set_absolute_size (a_desc: POINTER; a_size: REAL_64) is
 		-- pango_font_description_set_absolute_size (node at line 8121)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_absolute_size"
		}"
		end

	pango_font_get_metrics (a_font: POINTER; a_language: POINTER): POINTER is
 		-- pango_font_get_metrics (node at line 8220)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_get_metrics"
		}"
		end

	pango_font_description_equal (a_desc1: POINTER; a_desc2: POINTER): INTEGER_32 is
 		-- pango_font_description_equal (node at line 8435)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_equal"
		}"
		end

	pango_font_description_get_gravity (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_gravity (node at line 8511)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_gravity"
		}"
		end

	pango_font_get_type: NATURAL_64 is
 		-- pango_font_get_type (node at line 9238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_get_type()"
		}"
		end

	pango_font_description_to_filename (a_desc: POINTER): POINTER is
 		-- pango_font_description_to_filename (node at line 9712)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_to_filename"
		}"
		end

	pango_font_metrics_get_ascent (a_metrics: POINTER): INTEGER_32 is
 		-- pango_font_metrics_get_ascent (node at line 10352)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_metrics_get_ascent"
		}"
		end

	pango_font_description_get_stretch (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_stretch (node at line 10573)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_stretch"
		}"
		end

	pango_font_description_copy (a_desc: POINTER): POINTER is
 		-- pango_font_description_copy (node at line 10598)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_copy"
		}"
		end

	pango_font_description_get_set_fields (a_desc: POINTER): INTEGER is
 		-- pango_font_description_get_set_fields (node at line 10742)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_get_set_fields"
		}"
		end

	pango_font_get_glyph_extents (a_font: POINTER; a_glyph: NATURAL_32; an_ink_rect: POINTER; a_logical_rect: POINTER) is
 		-- pango_font_get_glyph_extents (node at line 10958)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_get_glyph_extents"
		}"
		end

	pango_font_description_set_weight (a_desc: POINTER; a_weight: INTEGER) is
 		-- pango_font_description_set_weight (node at line 10985)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_font_description_set_weight"
		}"
		end


end -- class PANGO_FONT_EXTERNALS
