-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGOATTRTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_attr_absolute_size_low_level)  or else
				(a_value = pango_attr_background_low_level)  or else
				(a_value = pango_attr_fallback_low_level)  or else
				(a_value = pango_attr_family_low_level)  or else
				(a_value = pango_attr_font_desc_low_level)  or else
				(a_value = pango_attr_foreground_low_level)  or else
				(a_value = pango_attr_gravity_low_level)  or else
				(a_value = pango_attr_gravity_hint_low_level)  or else
				(a_value = pango_attr_invalid_low_level)  or else
				(a_value = pango_attr_language_low_level)  or else
				(a_value = pango_attr_letter_spacing_low_level)  or else
				(a_value = pango_attr_rise_low_level)  or else
				(a_value = pango_attr_scale_low_level)  or else
				(a_value = pango_attr_shape_low_level)  or else
				(a_value = pango_attr_size_low_level)  or else
				(a_value = pango_attr_stretch_low_level)  or else
				(a_value = pango_attr_strikethrough_low_level)  or else
				(a_value = pango_attr_strikethrough_color_low_level)  or else
				(a_value = pango_attr_style_low_level)  or else
				(a_value = pango_attr_underline_low_level)  or else
				(a_value = pango_attr_underline_color_low_level)  or else
				(a_value = pango_attr_variant_low_level)  or else
				(a_value = pango_attr_weight_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_pango_attr_absolute_size is
		do
			value := pango_attr_absolute_size_low_level
		end

	set_pango_attr_background is
		do
			value := pango_attr_background_low_level
		end

	set_pango_attr_fallback is
		do
			value := pango_attr_fallback_low_level
		end

	set_pango_attr_family is
		do
			value := pango_attr_family_low_level
		end

	set_pango_attr_font_desc is
		do
			value := pango_attr_font_desc_low_level
		end

	set_pango_attr_foreground is
		do
			value := pango_attr_foreground_low_level
		end

	set_pango_attr_gravity is
		do
			value := pango_attr_gravity_low_level
		end

	set_pango_attr_gravity_hint is
		do
			value := pango_attr_gravity_hint_low_level
		end

	set_pango_attr_invalid is
		do
			value := pango_attr_invalid_low_level
		end

	set_pango_attr_language is
		do
			value := pango_attr_language_low_level
		end

	set_pango_attr_letter_spacing is
		do
			value := pango_attr_letter_spacing_low_level
		end

	set_pango_attr_rise is
		do
			value := pango_attr_rise_low_level
		end

	set_pango_attr_scale is
		do
			value := pango_attr_scale_low_level
		end

	set_pango_attr_shape is
		do
			value := pango_attr_shape_low_level
		end

	set_pango_attr_size is
		do
			value := pango_attr_size_low_level
		end

	set_pango_attr_stretch is
		do
			value := pango_attr_stretch_low_level
		end

	set_pango_attr_strikethrough is
		do
			value := pango_attr_strikethrough_low_level
		end

	set_pango_attr_strikethrough_color is
		do
			value := pango_attr_strikethrough_color_low_level
		end

	set_pango_attr_style is
		do
			value := pango_attr_style_low_level
		end

	set_pango_attr_underline is
		do
			value := pango_attr_underline_low_level
		end

	set_pango_attr_underline_color is
		do
			value := pango_attr_underline_color_low_level
		end

	set_pango_attr_variant is
		do
			value := pango_attr_variant_low_level
		end

	set_pango_attr_weight is
		do
			value := pango_attr_weight_low_level
		end

feature {ANY} -- Queries
	is_pango_attr_absolute_size: BOOLEAN is
		do
			Result := (value=pango_attr_absolute_size_low_level)
		end

	is_pango_attr_background: BOOLEAN is
		do
			Result := (value=pango_attr_background_low_level)
		end

	is_pango_attr_fallback: BOOLEAN is
		do
			Result := (value=pango_attr_fallback_low_level)
		end

	is_pango_attr_family: BOOLEAN is
		do
			Result := (value=pango_attr_family_low_level)
		end

	is_pango_attr_font_desc: BOOLEAN is
		do
			Result := (value=pango_attr_font_desc_low_level)
		end

	is_pango_attr_foreground: BOOLEAN is
		do
			Result := (value=pango_attr_foreground_low_level)
		end

	is_pango_attr_gravity: BOOLEAN is
		do
			Result := (value=pango_attr_gravity_low_level)
		end

	is_pango_attr_gravity_hint: BOOLEAN is
		do
			Result := (value=pango_attr_gravity_hint_low_level)
		end

	is_pango_attr_invalid: BOOLEAN is
		do
			Result := (value=pango_attr_invalid_low_level)
		end

	is_pango_attr_language: BOOLEAN is
		do
			Result := (value=pango_attr_language_low_level)
		end

	is_pango_attr_letter_spacing: BOOLEAN is
		do
			Result := (value=pango_attr_letter_spacing_low_level)
		end

	is_pango_attr_rise: BOOLEAN is
		do
			Result := (value=pango_attr_rise_low_level)
		end

	is_pango_attr_scale: BOOLEAN is
		do
			Result := (value=pango_attr_scale_low_level)
		end

	is_pango_attr_shape: BOOLEAN is
		do
			Result := (value=pango_attr_shape_low_level)
		end

	is_pango_attr_size: BOOLEAN is
		do
			Result := (value=pango_attr_size_low_level)
		end

	is_pango_attr_stretch: BOOLEAN is
		do
			Result := (value=pango_attr_stretch_low_level)
		end

	is_pango_attr_strikethrough: BOOLEAN is
		do
			Result := (value=pango_attr_strikethrough_low_level)
		end

	is_pango_attr_strikethrough_color: BOOLEAN is
		do
			Result := (value=pango_attr_strikethrough_color_low_level)
		end

	is_pango_attr_style: BOOLEAN is
		do
			Result := (value=pango_attr_style_low_level)
		end

	is_pango_attr_underline: BOOLEAN is
		do
			Result := (value=pango_attr_underline_low_level)
		end

	is_pango_attr_underline_color: BOOLEAN is
		do
			Result := (value=pango_attr_underline_color_low_level)
		end

	is_pango_attr_variant: BOOLEAN is
		do
			Result := (value=pango_attr_variant_low_level)
		end

	is_pango_attr_weight: BOOLEAN is
		do
			Result := (value=pango_attr_weight_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_attr_absolute_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_ABSOLUTE_SIZE"
 			}"
 		end

	pango_attr_background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_BACKGROUND"
 			}"
 		end

	pango_attr_fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FALLBACK"
 			}"
 		end

	pango_attr_family_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FAMILY"
 			}"
 		end

	pango_attr_font_desc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FONT_DESC"
 			}"
 		end

	pango_attr_foreground_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FOREGROUND"
 			}"
 		end

	pango_attr_gravity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_GRAVITY"
 			}"
 		end

	pango_attr_gravity_hint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_GRAVITY_HINT"
 			}"
 		end

	pango_attr_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_INVALID"
 			}"
 		end

	pango_attr_language_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_LANGUAGE"
 			}"
 		end

	pango_attr_letter_spacing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_LETTER_SPACING"
 			}"
 		end

	pango_attr_rise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_RISE"
 			}"
 		end

	pango_attr_scale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SCALE"
 			}"
 		end

	pango_attr_shape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SHAPE"
 			}"
 		end

	pango_attr_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SIZE"
 			}"
 		end

	pango_attr_stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRETCH"
 			}"
 		end

	pango_attr_strikethrough_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRIKETHROUGH"
 			}"
 		end

	pango_attr_strikethrough_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRIKETHROUGH_COLOR"
 			}"
 		end

	pango_attr_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STYLE"
 			}"
 		end

	pango_attr_underline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_UNDERLINE"
 			}"
 		end

	pango_attr_underline_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_UNDERLINE_COLOR"
 			}"
 		end

	pango_attr_variant_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_VARIANT"
 			}"
 		end

	pango_attr_weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_WEIGHT"
 			}"
 		end


end -- class PANGOATTRTYPE_ENUM
