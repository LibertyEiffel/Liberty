-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class PANGO_ATTRIBUTES_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	pango_attr_iterator_get_font (an_iterator: POINTER; a_desc: POINTER; a_language: POINTER; an_extra_attrs: POINTER) is
 		-- pango_attr_iterator_get_font (node at line 79)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_get_font"
		}"
		end

	pango_attr_style_new (a_style: INTEGER): POINTER is
 		-- pango_attr_style_new (node at line 424)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_style_new"
		}"
		end

	pango_attr_letter_spacing_new (a_letter_spacing: INTEGER_32): POINTER is
 		-- pango_attr_letter_spacing_new (node at line 477)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_letter_spacing_new"
		}"
		end

	pango_color_get_type: NATURAL_64 is
 		-- pango_color_get_type (node at line 584)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_get_type()"
		}"
		end

	pango_attr_underline_new (an_underline: INTEGER): POINTER is
 		-- pango_attr_underline_new (node at line 1207)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_underline_new"
		}"
		end

	pango_attribute_destroy (an_attr: POINTER) is
 		-- pango_attribute_destroy (node at line 1391)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_destroy"
		}"
		end

	pango_attr_list_change (a_list: POINTER; an_attr: POINTER) is
 		-- pango_attr_list_change (node at line 2142)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_change"
		}"
		end

	pango_color_free (a_color: POINTER) is
 		-- pango_color_free (node at line 2146)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_free"
		}"
		end

	pango_attr_list_unref (a_list: POINTER) is
 		-- pango_attr_list_unref (node at line 2243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_unref"
		}"
		end

	pango_attr_list_insert_before (a_list: POINTER; an_attr: POINTER) is
 		-- pango_attr_list_insert_before (node at line 2394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_insert_before"
		}"
		end

	pango_attr_shape_new (an_ink_rect: POINTER; a_logical_rect: POINTER): POINTER is
 		-- pango_attr_shape_new (node at line 2599)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_new"
		}"
		end

	pango_attr_gravity_hint_new (a_hint: INTEGER): POINTER is
 		-- pango_attr_gravity_hint_new (node at line 2773)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_gravity_hint_new"
		}"
		end

	pango_attribute_copy (an_attr: POINTER): POINTER is
 		-- pango_attribute_copy (node at line 2793)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_copy"
		}"
		end

	pango_attribute_equal (an_attr1: POINTER; an_attr2: POINTER): INTEGER_32 is
 		-- pango_attribute_equal (node at line 3044)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_equal"
		}"
		end

	pango_attr_size_new (a_size: INTEGER_32): POINTER is
 		-- pango_attr_size_new (node at line 3075)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_new"
		}"
		end

	pango_attr_stretch_new (a_stretch: INTEGER): POINTER is
 		-- pango_attr_stretch_new (node at line 3126)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_stretch_new"
		}"
		end

	pango_attr_family_new (a_family: POINTER): POINTER is
 		-- pango_attr_family_new (node at line 3141)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_family_new"
		}"
		end

	pango_attr_language_new (a_language: POINTER): POINTER is
 		-- pango_attr_language_new (node at line 3670)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_language_new"
		}"
		end

	pango_attr_iterator_range (an_iterator: POINTER; a_start: POINTER; an_end_external: POINTER) is
 		-- pango_attr_iterator_range (node at line 3828)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_range"
		}"
		end

	pango_attr_list_insert (a_list: POINTER; an_attr: POINTER) is
 		-- pango_attr_list_insert (node at line 3862)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_insert"
		}"
		end

	pango_color_copy (a_src: POINTER): POINTER is
 		-- pango_color_copy (node at line 3886)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_copy"
		}"
		end

	pango_attr_font_desc_new (a_desc: POINTER): POINTER is
 		-- pango_attr_font_desc_new (node at line 3890)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_font_desc_new"
		}"
		end

	pango_attr_foreground_new (a_red: NATURAL_16; a_green: NATURAL_16; a_blue: NATURAL_16): POINTER is
 		-- pango_attr_foreground_new (node at line 4708)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_foreground_new"
		}"
		end

	pango_attr_fallback_new (an_enable_fallback: INTEGER_32): POINTER is
 		-- pango_attr_fallback_new (node at line 4939)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_fallback_new"
		}"
		end

	pango_attr_iterator_copy (an_iterator: POINTER): POINTER is
 		-- pango_attr_iterator_copy (node at line 5027)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_copy"
		}"
		end

	pango_color_parse (a_color: POINTER; a_spec: POINTER): INTEGER_32 is
 		-- pango_color_parse (node at line 5034)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_parse"
		}"
		end

	pango_attr_variant_new (a_variant_external: INTEGER): POINTER is
 		-- pango_attr_variant_new (node at line 5132)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_variant_new"
		}"
		end

	pango_attr_background_new (a_red: NATURAL_16; a_green: NATURAL_16; a_blue: NATURAL_16): POINTER is
 		-- pango_attr_background_new (node at line 5274)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_background_new"
		}"
		end

	pango_attr_size_new_absolute (a_size: INTEGER_32): POINTER is
 		-- pango_attr_size_new_absolute (node at line 5437)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_size_new_absolute"
		}"
		end

	pango_parse_markup (a_markup_text: POINTER; a_length: INTEGER_32; an_accel_marker: NATURAL_32; an_attr_list: POINTER; a_text: POINTER; an_accel_char: POINTER; an_error: POINTER): INTEGER_32 is
 		-- pango_parse_markup (node at line 5506)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_parse_markup"
		}"
		end

	pango_attribute_init (an_attr: POINTER; a_klass: POINTER) is
 		-- pango_attribute_init (node at line 5538)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attribute_init"
		}"
		end

	pango_attr_gravity_new (a_gravity: INTEGER): POINTER is
 		-- pango_attr_gravity_new (node at line 5620)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_gravity_new"
		}"
		end

	pango_attr_list_new: POINTER is
 		-- pango_attr_list_new (node at line 6528)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_new()"
		}"
		end

	pango_attr_rise_new (a_rise: INTEGER_32): POINTER is
 		-- pango_attr_rise_new (node at line 6540)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_rise_new"
		}"
		end

	pango_attr_underline_color_new (a_red: NATURAL_16; a_green: NATURAL_16; a_blue: NATURAL_16): POINTER is
 		-- pango_attr_underline_color_new (node at line 7050)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_underline_color_new"
		}"
		end

	pango_attr_list_ref (a_list: POINTER): POINTER is
 		-- pango_attr_list_ref (node at line 7526)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_ref"
		}"
		end

	pango_attr_list_splice (a_list: POINTER; an_other: POINTER; a_pos: INTEGER_32; a_len: INTEGER_32) is
 		-- pango_attr_list_splice (node at line 7713)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_splice"
		}"
		end

	pango_attr_iterator_next (an_iterator: POINTER): INTEGER_32 is
 		-- pango_attr_iterator_next (node at line 8337)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_next"
		}"
		end

	pango_attr_scale_new (a_scale_factor: REAL_64): POINTER is
 		-- pango_attr_scale_new (node at line 8439)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_scale_new"
		}"
		end

	pango_color_to_string (a_color: POINTER): POINTER is
 		-- pango_color_to_string (node at line 8476)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_color_to_string"
		}"
		end

	pango_attr_iterator_get_attrs (an_iterator: POINTER): POINTER is
 		-- pango_attr_iterator_get_attrs (node at line 8505)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_get_attrs"
		}"
		end

	pango_attr_list_get_iterator (a_list: POINTER): POINTER is
 		-- pango_attr_list_get_iterator (node at line 8577)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_get_iterator"
		}"
		end

	pango_attr_iterator_get (an_iterator: POINTER; a_type: INTEGER): POINTER is
 		-- pango_attr_iterator_get (node at line 8615)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_get"
		}"
		end

	pango_attr_type_register (a_name: POINTER): INTEGER is
 		-- pango_attr_type_register (node at line 9235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_type_register"
		}"
		end

	pango_attr_strikethrough_color_new (a_red: NATURAL_16; a_green: NATURAL_16; a_blue: NATURAL_16): POINTER is
 		-- pango_attr_strikethrough_color_new (node at line 9242)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_strikethrough_color_new"
		}"
		end

	pango_attr_strikethrough_new (a_strikethrough: INTEGER_32): POINTER is
 		-- pango_attr_strikethrough_new (node at line 9657)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_strikethrough_new"
		}"
		end

	pango_attr_type_get_name (a_type: INTEGER): POINTER is
 		-- pango_attr_type_get_name (node at line 9672)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_type_get_name"
		}"
		end

	pango_attr_list_get_type: NATURAL_64 is
 		-- pango_attr_list_get_type (node at line 9858)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_get_type()"
		}"
		end

	pango_attr_list_copy (a_list: POINTER): POINTER is
 		-- pango_attr_list_copy (node at line 9967)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_copy"
		}"
		end

	pango_attr_shape_new_with_data (an_ink_rect: POINTER; a_logical_rect: POINTER; a_data: POINTER; a_copy_func: POINTER; a_destroy_func: POINTER): POINTER is
 		-- pango_attr_shape_new_with_data (node at line 10005)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_shape_new_with_data"
		}"
		end

	pango_attr_iterator_destroy (an_iterator: POINTER) is
 		-- pango_attr_iterator_destroy (node at line 10363)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_iterator_destroy"
		}"
		end

	pango_attr_list_filter (a_list: POINTER; a_func: POINTER; a_data: POINTER): POINTER is
 		-- pango_attr_list_filter (node at line 10593)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_list_filter"
		}"
		end

	pango_attr_weight_new (a_weight: INTEGER): POINTER is
 		-- pango_attr_weight_new (node at line 10919)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "pango_attr_weight_new"
		}"
		end


end -- class PANGO_ATTRIBUTES_EXTERNALS
