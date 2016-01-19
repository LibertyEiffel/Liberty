-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_ATTRIBUTE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_text_attr_bg_color_low_level)  or else
				(a_value = atk_text_attr_bg_full_height_low_level)  or else
				(a_value = atk_text_attr_bg_stipple_low_level)  or else
				(a_value = atk_text_attr_direction_low_level)  or else
				(a_value = atk_text_attr_editable_low_level)  or else
				(a_value = atk_text_attr_family_name_low_level)  or else
				(a_value = atk_text_attr_fg_color_low_level)  or else
				(a_value = atk_text_attr_fg_stipple_low_level)  or else
				(a_value = atk_text_attr_indent_low_level)  or else
				(a_value = atk_text_attr_invalid_low_level)  or else
				(a_value = atk_text_attr_invisible_low_level)  or else
				(a_value = atk_text_attr_justification_low_level)  or else
				(a_value = atk_text_attr_language_low_level)  or else
				(a_value = atk_text_attr_last_defined_low_level)  or else
				(a_value = atk_text_attr_left_margin_low_level)  or else
				(a_value = atk_text_attr_pixels_above_lines_low_level)  or else
				(a_value = atk_text_attr_pixels_below_lines_low_level)  or else
				(a_value = atk_text_attr_pixels_inside_wrap_low_level)  or else
				(a_value = atk_text_attr_right_margin_low_level)  or else
				(a_value = atk_text_attr_rise_low_level)  or else
				(a_value = atk_text_attr_scale_low_level)  or else
				(a_value = atk_text_attr_size_low_level)  or else
				(a_value = atk_text_attr_stretch_low_level)  or else
				(a_value = atk_text_attr_strikethrough_low_level)  or else
				(a_value = atk_text_attr_style_low_level)  or else
				(a_value = atk_text_attr_underline_low_level)  or else
				(a_value = atk_text_attr_variant_low_level)  or else
				(a_value = atk_text_attr_weight_low_level)  or else
				(a_value = atk_text_attr_wrap_mode_low_level) )
		end

feature -- Setters
	default_create,
	set_atk_text_attr_bg_color is
		do
			value := atk_text_attr_bg_color_low_level
		end

	set_atk_text_attr_bg_full_height is
		do
			value := atk_text_attr_bg_full_height_low_level
		end

	set_atk_text_attr_bg_stipple is
		do
			value := atk_text_attr_bg_stipple_low_level
		end

	set_atk_text_attr_direction is
		do
			value := atk_text_attr_direction_low_level
		end

	set_atk_text_attr_editable is
		do
			value := atk_text_attr_editable_low_level
		end

	set_atk_text_attr_family_name is
		do
			value := atk_text_attr_family_name_low_level
		end

	set_atk_text_attr_fg_color is
		do
			value := atk_text_attr_fg_color_low_level
		end

	set_atk_text_attr_fg_stipple is
		do
			value := atk_text_attr_fg_stipple_low_level
		end

	set_atk_text_attr_indent is
		do
			value := atk_text_attr_indent_low_level
		end

	set_atk_text_attr_invalid is
		do
			value := atk_text_attr_invalid_low_level
		end

	set_atk_text_attr_invisible is
		do
			value := atk_text_attr_invisible_low_level
		end

	set_atk_text_attr_justification is
		do
			value := atk_text_attr_justification_low_level
		end

	set_atk_text_attr_language is
		do
			value := atk_text_attr_language_low_level
		end

	set_atk_text_attr_last_defined is
		do
			value := atk_text_attr_last_defined_low_level
		end

	set_atk_text_attr_left_margin is
		do
			value := atk_text_attr_left_margin_low_level
		end

	set_atk_text_attr_pixels_above_lines is
		do
			value := atk_text_attr_pixels_above_lines_low_level
		end

	set_atk_text_attr_pixels_below_lines is
		do
			value := atk_text_attr_pixels_below_lines_low_level
		end

	set_atk_text_attr_pixels_inside_wrap is
		do
			value := atk_text_attr_pixels_inside_wrap_low_level
		end

	set_atk_text_attr_right_margin is
		do
			value := atk_text_attr_right_margin_low_level
		end

	set_atk_text_attr_rise is
		do
			value := atk_text_attr_rise_low_level
		end

	set_atk_text_attr_scale is
		do
			value := atk_text_attr_scale_low_level
		end

	set_atk_text_attr_size is
		do
			value := atk_text_attr_size_low_level
		end

	set_atk_text_attr_stretch is
		do
			value := atk_text_attr_stretch_low_level
		end

	set_atk_text_attr_strikethrough is
		do
			value := atk_text_attr_strikethrough_low_level
		end

	set_atk_text_attr_style is
		do
			value := atk_text_attr_style_low_level
		end

	set_atk_text_attr_underline is
		do
			value := atk_text_attr_underline_low_level
		end

	set_atk_text_attr_variant is
		do
			value := atk_text_attr_variant_low_level
		end

	set_atk_text_attr_weight is
		do
			value := atk_text_attr_weight_low_level
		end

	set_atk_text_attr_wrap_mode is
		do
			value := atk_text_attr_wrap_mode_low_level
		end

feature -- Queries
	is_atk_text_attr_bg_color: BOOLEAN is
		do
			Result := (value=atk_text_attr_bg_color_low_level)
		end

	is_atk_text_attr_bg_full_height: BOOLEAN is
		do
			Result := (value=atk_text_attr_bg_full_height_low_level)
		end

	is_atk_text_attr_bg_stipple: BOOLEAN is
		do
			Result := (value=atk_text_attr_bg_stipple_low_level)
		end

	is_atk_text_attr_direction: BOOLEAN is
		do
			Result := (value=atk_text_attr_direction_low_level)
		end

	is_atk_text_attr_editable: BOOLEAN is
		do
			Result := (value=atk_text_attr_editable_low_level)
		end

	is_atk_text_attr_family_name: BOOLEAN is
		do
			Result := (value=atk_text_attr_family_name_low_level)
		end

	is_atk_text_attr_fg_color: BOOLEAN is
		do
			Result := (value=atk_text_attr_fg_color_low_level)
		end

	is_atk_text_attr_fg_stipple: BOOLEAN is
		do
			Result := (value=atk_text_attr_fg_stipple_low_level)
		end

	is_atk_text_attr_indent: BOOLEAN is
		do
			Result := (value=atk_text_attr_indent_low_level)
		end

	is_atk_text_attr_invalid: BOOLEAN is
		do
			Result := (value=atk_text_attr_invalid_low_level)
		end

	is_atk_text_attr_invisible: BOOLEAN is
		do
			Result := (value=atk_text_attr_invisible_low_level)
		end

	is_atk_text_attr_justification: BOOLEAN is
		do
			Result := (value=atk_text_attr_justification_low_level)
		end

	is_atk_text_attr_language: BOOLEAN is
		do
			Result := (value=atk_text_attr_language_low_level)
		end

	is_atk_text_attr_last_defined: BOOLEAN is
		do
			Result := (value=atk_text_attr_last_defined_low_level)
		end

	is_atk_text_attr_left_margin: BOOLEAN is
		do
			Result := (value=atk_text_attr_left_margin_low_level)
		end

	is_atk_text_attr_pixels_above_lines: BOOLEAN is
		do
			Result := (value=atk_text_attr_pixels_above_lines_low_level)
		end

	is_atk_text_attr_pixels_below_lines: BOOLEAN is
		do
			Result := (value=atk_text_attr_pixels_below_lines_low_level)
		end

	is_atk_text_attr_pixels_inside_wrap: BOOLEAN is
		do
			Result := (value=atk_text_attr_pixels_inside_wrap_low_level)
		end

	is_atk_text_attr_right_margin: BOOLEAN is
		do
			Result := (value=atk_text_attr_right_margin_low_level)
		end

	is_atk_text_attr_rise: BOOLEAN is
		do
			Result := (value=atk_text_attr_rise_low_level)
		end

	is_atk_text_attr_scale: BOOLEAN is
		do
			Result := (value=atk_text_attr_scale_low_level)
		end

	is_atk_text_attr_size: BOOLEAN is
		do
			Result := (value=atk_text_attr_size_low_level)
		end

	is_atk_text_attr_stretch: BOOLEAN is
		do
			Result := (value=atk_text_attr_stretch_low_level)
		end

	is_atk_text_attr_strikethrough: BOOLEAN is
		do
			Result := (value=atk_text_attr_strikethrough_low_level)
		end

	is_atk_text_attr_style: BOOLEAN is
		do
			Result := (value=atk_text_attr_style_low_level)
		end

	is_atk_text_attr_underline: BOOLEAN is
		do
			Result := (value=atk_text_attr_underline_low_level)
		end

	is_atk_text_attr_variant: BOOLEAN is
		do
			Result := (value=atk_text_attr_variant_low_level)
		end

	is_atk_text_attr_weight: BOOLEAN is
		do
			Result := (value=atk_text_attr_weight_low_level)
		end

	is_atk_text_attr_wrap_mode: BOOLEAN is
		do
			Result := (value=atk_text_attr_wrap_mode_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_text_attr_bg_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_COLOR"
 			}"
 		end

	atk_text_attr_bg_full_height_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_FULL_HEIGHT"
 			}"
 		end

	atk_text_attr_bg_stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_STIPPLE"
 			}"
 		end

	atk_text_attr_direction_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_DIRECTION"
 			}"
 		end

	atk_text_attr_editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_EDITABLE"
 			}"
 		end

	atk_text_attr_family_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FAMILY_NAME"
 			}"
 		end

	atk_text_attr_fg_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FG_COLOR"
 			}"
 		end

	atk_text_attr_fg_stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FG_STIPPLE"
 			}"
 		end

	atk_text_attr_indent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INDENT"
 			}"
 		end

	atk_text_attr_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INVALID"
 			}"
 		end

	atk_text_attr_invisible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INVISIBLE"
 			}"
 		end

	atk_text_attr_justification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_JUSTIFICATION"
 			}"
 		end

	atk_text_attr_language_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LANGUAGE"
 			}"
 		end

	atk_text_attr_last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LAST_DEFINED"
 			}"
 		end

	atk_text_attr_left_margin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LEFT_MARGIN"
 			}"
 		end

	atk_text_attr_pixels_above_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_ABOVE_LINES"
 			}"
 		end

	atk_text_attr_pixels_below_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_BELOW_LINES"
 			}"
 		end

	atk_text_attr_pixels_inside_wrap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_INSIDE_WRAP"
 			}"
 		end

	atk_text_attr_right_margin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_RIGHT_MARGIN"
 			}"
 		end

	atk_text_attr_rise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_RISE"
 			}"
 		end

	atk_text_attr_scale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_SCALE"
 			}"
 		end

	atk_text_attr_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_SIZE"
 			}"
 		end

	atk_text_attr_stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STRETCH"
 			}"
 		end

	atk_text_attr_strikethrough_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STRIKETHROUGH"
 			}"
 		end

	atk_text_attr_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STYLE"
 			}"
 		end

	atk_text_attr_underline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_UNDERLINE"
 			}"
 		end

	atk_text_attr_variant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_VARIANT"
 			}"
 		end

	atk_text_attr_weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_WEIGHT"
 			}"
 		end

	atk_text_attr_wrap_mode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_WRAP_MODE"
 			}"
 		end


end -- class ATK_TEXT_ATTRIBUTE_ENUM
