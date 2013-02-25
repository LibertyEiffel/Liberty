-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_ATTR_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = language_low_level)  or else
				(a_value = family_low_level)  or else
				(a_value = style_low_level)  or else
				(a_value = weight_low_level)  or else
				(a_value = variant_external_low_level)  or else
				(a_value = stretch_low_level)  or else
				(a_value = size_low_level)  or else
				(a_value = font_desc_low_level)  or else
				(a_value = foreground_low_level)  or else
				(a_value = background_low_level)  or else
				(a_value = underline_low_level)  or else
				(a_value = strikethrough_low_level)  or else
				(a_value = rise_low_level)  or else
				(a_value = shape_low_level)  or else
				(a_value = scale_low_level)  or else
				(a_value = fallback_low_level)  or else
				(a_value = letter_spacing_low_level)  or else
				(a_value = underline_color_low_level)  or else
				(a_value = strikethrough_color_low_level)  or else
				(a_value = absolute_size_low_level)  or else
				(a_value = gravity_low_level)  or else
				(a_value = gravity_hint_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_language is
		do
			value := language_low_level
		end

	set_family is
		do
			value := family_low_level
		end

	set_style is
		do
			value := style_low_level
		end

	set_weight is
		do
			value := weight_low_level
		end

	set_variant_external is
		do
			value := variant_external_low_level
		end

	set_stretch is
		do
			value := stretch_low_level
		end

	set_size is
		do
			value := size_low_level
		end

	set_font_desc is
		do
			value := font_desc_low_level
		end

	set_foreground is
		do
			value := foreground_low_level
		end

	set_background is
		do
			value := background_low_level
		end

	set_underline is
		do
			value := underline_low_level
		end

	set_strikethrough is
		do
			value := strikethrough_low_level
		end

	set_rise is
		do
			value := rise_low_level
		end

	set_shape is
		do
			value := shape_low_level
		end

	set_scale is
		do
			value := scale_low_level
		end

	set_fallback is
		do
			value := fallback_low_level
		end

	set_letter_spacing is
		do
			value := letter_spacing_low_level
		end

	set_underline_color is
		do
			value := underline_color_low_level
		end

	set_strikethrough_color is
		do
			value := strikethrough_color_low_level
		end

	set_absolute_size is
		do
			value := absolute_size_low_level
		end

	set_gravity is
		do
			value := gravity_low_level
		end

	set_gravity_hint is
		do
			value := gravity_hint_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	language: BOOLEAN is
		do
			Result := (value=language_low_level)
		end

	family: BOOLEAN is
		do
			Result := (value=family_low_level)
		end

	style: BOOLEAN is
		do
			Result := (value=style_low_level)
		end

	weight: BOOLEAN is
		do
			Result := (value=weight_low_level)
		end

	variant_external: BOOLEAN is
		do
			Result := (value=variant_external_low_level)
		end

	stretch: BOOLEAN is
		do
			Result := (value=stretch_low_level)
		end

	size: BOOLEAN is
		do
			Result := (value=size_low_level)
		end

	font_desc: BOOLEAN is
		do
			Result := (value=font_desc_low_level)
		end

	foreground: BOOLEAN is
		do
			Result := (value=foreground_low_level)
		end

	background: BOOLEAN is
		do
			Result := (value=background_low_level)
		end

	underline: BOOLEAN is
		do
			Result := (value=underline_low_level)
		end

	strikethrough: BOOLEAN is
		do
			Result := (value=strikethrough_low_level)
		end

	rise: BOOLEAN is
		do
			Result := (value=rise_low_level)
		end

	shape: BOOLEAN is
		do
			Result := (value=shape_low_level)
		end

	scale: BOOLEAN is
		do
			Result := (value=scale_low_level)
		end

	fallback: BOOLEAN is
		do
			Result := (value=fallback_low_level)
		end

	letter_spacing: BOOLEAN is
		do
			Result := (value=letter_spacing_low_level)
		end

	underline_color: BOOLEAN is
		do
			Result := (value=underline_color_low_level)
		end

	strikethrough_color: BOOLEAN is
		do
			Result := (value=strikethrough_color_low_level)
		end

	absolute_size: BOOLEAN is
		do
			Result := (value=absolute_size_low_level)
		end

	gravity: BOOLEAN is
		do
			Result := (value=gravity_low_level)
		end

	gravity_hint: BOOLEAN is
		do
			Result := (value=gravity_hint_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_INVALID"
 			}"
 		end

	language_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_LANGUAGE"
 			}"
 		end

	family_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FAMILY"
 			}"
 		end

	style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STYLE"
 			}"
 		end

	weight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_WEIGHT"
 			}"
 		end

	variant_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_VARIANT"
 			}"
 		end

	stretch_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRETCH"
 			}"
 		end

	size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SIZE"
 			}"
 		end

	font_desc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FONT_DESC"
 			}"
 		end

	foreground_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FOREGROUND"
 			}"
 		end

	background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_BACKGROUND"
 			}"
 		end

	underline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_UNDERLINE"
 			}"
 		end

	strikethrough_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRIKETHROUGH"
 			}"
 		end

	rise_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_RISE"
 			}"
 		end

	shape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SHAPE"
 			}"
 		end

	scale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_SCALE"
 			}"
 		end

	fallback_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_FALLBACK"
 			}"
 		end

	letter_spacing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_LETTER_SPACING"
 			}"
 		end

	underline_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_UNDERLINE_COLOR"
 			}"
 		end

	strikethrough_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_STRIKETHROUGH_COLOR"
 			}"
 		end

	absolute_size_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_ABSOLUTE_SIZE"
 			}"
 		end

	gravity_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_GRAVITY"
 			}"
 		end

	gravity_hint_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_ATTR_GRAVITY_HINT"
 			}"
 		end


end -- class PANGO_ATTR_TYPE_ENUM
