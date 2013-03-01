-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_TEXT_ATTRIBUTE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = left_margin_low_level)  or else
				(a_value = right_margin_low_level)  or else
				(a_value = indent_low_level)  or else
				(a_value = invisible_low_level)  or else
				(a_value = editable_low_level)  or else
				(a_value = pixels_above_lines_low_level)  or else
				(a_value = pixels_below_lines_low_level)  or else
				(a_value = pixels_inside_wrap_low_level)  or else
				(a_value = bg_full_height_low_level)  or else
				(a_value = rise_low_level)  or else
				(a_value = underline_low_level)  or else
				(a_value = strikethrough_low_level)  or else
				(a_value = size_low_level)  or else
				(a_value = scale_low_level)  or else
				(a_value = weight_low_level)  or else
				(a_value = language_low_level)  or else
				(a_value = family_name_low_level)  or else
				(a_value = bg_color_low_level)  or else
				(a_value = fg_color_low_level)  or else
				(a_value = bg_stipple_low_level)  or else
				(a_value = fg_stipple_low_level)  or else
				(a_value = wrap_mode_low_level)  or else
				(a_value = direction_low_level)  or else
				(a_value = justification_low_level)  or else
				(a_value = stretch_low_level)  or else
				(a_value = variant_external_low_level)  or else
				(a_value = style_low_level)  or else
				(a_value = last_defined_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_left_margin is
		do
			value := left_margin_low_level
		end

	set_right_margin is
		do
			value := right_margin_low_level
		end

	set_indent is
		do
			value := indent_low_level
		end

	set_invisible is
		do
			value := invisible_low_level
		end

	set_editable is
		do
			value := editable_low_level
		end

	set_pixels_above_lines is
		do
			value := pixels_above_lines_low_level
		end

	set_pixels_below_lines is
		do
			value := pixels_below_lines_low_level
		end

	set_pixels_inside_wrap is
		do
			value := pixels_inside_wrap_low_level
		end

	set_bg_full_height is
		do
			value := bg_full_height_low_level
		end

	set_rise is
		do
			value := rise_low_level
		end

	set_underline is
		do
			value := underline_low_level
		end

	set_strikethrough is
		do
			value := strikethrough_low_level
		end

	set_size is
		do
			value := size_low_level
		end

	set_scale is
		do
			value := scale_low_level
		end

	set_weight is
		do
			value := weight_low_level
		end

	set_language is
		do
			value := language_low_level
		end

	set_family_name is
		do
			value := family_name_low_level
		end

	set_bg_color is
		do
			value := bg_color_low_level
		end

	set_fg_color is
		do
			value := fg_color_low_level
		end

	set_bg_stipple is
		do
			value := bg_stipple_low_level
		end

	set_fg_stipple is
		do
			value := fg_stipple_low_level
		end

	set_wrap_mode is
		do
			value := wrap_mode_low_level
		end

	set_direction is
		do
			value := direction_low_level
		end

	set_justification is
		do
			value := justification_low_level
		end

	set_stretch is
		do
			value := stretch_low_level
		end

	set_variant_external is
		do
			value := variant_external_low_level
		end

	set_style is
		do
			value := style_low_level
		end

	set_last_defined is
		do
			value := last_defined_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	left_margin: BOOLEAN is
		do
			Result := (value=left_margin_low_level)
		end

	right_margin: BOOLEAN is
		do
			Result := (value=right_margin_low_level)
		end

	indent: BOOLEAN is
		do
			Result := (value=indent_low_level)
		end

	invisible: BOOLEAN is
		do
			Result := (value=invisible_low_level)
		end

	editable: BOOLEAN is
		do
			Result := (value=editable_low_level)
		end

	pixels_above_lines: BOOLEAN is
		do
			Result := (value=pixels_above_lines_low_level)
		end

	pixels_below_lines: BOOLEAN is
		do
			Result := (value=pixels_below_lines_low_level)
		end

	pixels_inside_wrap: BOOLEAN is
		do
			Result := (value=pixels_inside_wrap_low_level)
		end

	bg_full_height: BOOLEAN is
		do
			Result := (value=bg_full_height_low_level)
		end

	rise: BOOLEAN is
		do
			Result := (value=rise_low_level)
		end

	underline: BOOLEAN is
		do
			Result := (value=underline_low_level)
		end

	strikethrough: BOOLEAN is
		do
			Result := (value=strikethrough_low_level)
		end

	size: BOOLEAN is
		do
			Result := (value=size_low_level)
		end

	scale: BOOLEAN is
		do
			Result := (value=scale_low_level)
		end

	weight: BOOLEAN is
		do
			Result := (value=weight_low_level)
		end

	language: BOOLEAN is
		do
			Result := (value=language_low_level)
		end

	family_name: BOOLEAN is
		do
			Result := (value=family_name_low_level)
		end

	bg_color: BOOLEAN is
		do
			Result := (value=bg_color_low_level)
		end

	fg_color: BOOLEAN is
		do
			Result := (value=fg_color_low_level)
		end

	bg_stipple: BOOLEAN is
		do
			Result := (value=bg_stipple_low_level)
		end

	fg_stipple: BOOLEAN is
		do
			Result := (value=fg_stipple_low_level)
		end

	wrap_mode: BOOLEAN is
		do
			Result := (value=wrap_mode_low_level)
		end

	direction: BOOLEAN is
		do
			Result := (value=direction_low_level)
		end

	justification: BOOLEAN is
		do
			Result := (value=justification_low_level)
		end

	stretch: BOOLEAN is
		do
			Result := (value=stretch_low_level)
		end

	variant_external: BOOLEAN is
		do
			Result := (value=variant_external_low_level)
		end

	style: BOOLEAN is
		do
			Result := (value=style_low_level)
		end

	last_defined: BOOLEAN is
		do
			Result := (value=last_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INVALID"
 			}"
 		end

	left_margin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LEFT_MARGIN"
 			}"
 		end

	right_margin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_RIGHT_MARGIN"
 			}"
 		end

	indent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INDENT"
 			}"
 		end

	invisible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_INVISIBLE"
 			}"
 		end

	editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_EDITABLE"
 			}"
 		end

	pixels_above_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_ABOVE_LINES"
 			}"
 		end

	pixels_below_lines_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_BELOW_LINES"
 			}"
 		end

	pixels_inside_wrap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_PIXELS_INSIDE_WRAP"
 			}"
 		end

	bg_full_height_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_FULL_HEIGHT"
 			}"
 		end

	rise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_RISE"
 			}"
 		end

	underline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_UNDERLINE"
 			}"
 		end

	strikethrough_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STRIKETHROUGH"
 			}"
 		end

	size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_SIZE"
 			}"
 		end

	scale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_SCALE"
 			}"
 		end

	weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_WEIGHT"
 			}"
 		end

	language_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LANGUAGE"
 			}"
 		end

	family_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FAMILY_NAME"
 			}"
 		end

	bg_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_COLOR"
 			}"
 		end

	fg_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FG_COLOR"
 			}"
 		end

	bg_stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_BG_STIPPLE"
 			}"
 		end

	fg_stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_FG_STIPPLE"
 			}"
 		end

	wrap_mode_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_WRAP_MODE"
 			}"
 		end

	direction_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_DIRECTION"
 			}"
 		end

	justification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_JUSTIFICATION"
 			}"
 		end

	stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STRETCH"
 			}"
 		end

	variant_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_VARIANT"
 			}"
 		end

	style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_STYLE"
 			}"
 		end

	last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_TEXT_ATTR_LAST_DEFINED"
 			}"
 		end


end -- class ATK_TEXT_ATTRIBUTE_ENUM
