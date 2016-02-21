-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_OPERATOR_T_ENUM

-- Wrapper of enum _cairo_operator defined in file /usr/include/cairo/cairo.h line 605
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = add_low_level)  or else
				(a_value = atop_low_level)  or else
				(a_value = clear_low_level)  or else
				(a_value = color_burn_low_level)  or else
				(a_value = color_dodge_low_level)  or else
				(a_value = darken_low_level)  or else
				(a_value = dest_low_level)  or else
				(a_value = dest_atop_low_level)  or else
				(a_value = dest_in_low_level)  or else
				(a_value = dest_out_low_level)  or else
				(a_value = dest_over_low_level)  or else
				(a_value = difference_low_level)  or else
				(a_value = exclusion_low_level)  or else
				(a_value = hard_light_low_level)  or else
				(a_value = hsl_color_low_level)  or else
				(a_value = hsl_hue_low_level)  or else
				(a_value = hsl_luminosity_low_level)  or else
				(a_value = hsl_saturation_low_level)  or else
				(a_value = in_low_level)  or else
				(a_value = lighten_low_level)  or else
				(a_value = multiply_low_level)  or else
				(a_value = out_external_low_level)  or else
				(a_value = over_low_level)  or else
				(a_value = overlay_low_level)  or else
				(a_value = saturate_low_level)  or else
				(a_value = screen_low_level)  or else
				(a_value = soft_light_low_level)  or else
				(a_value = source_low_level)  or else
				(a_value = xor_external_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_add
               do
                       value := add_low_level
               end

	set_atop
               do
                       value := atop_low_level
               end

	set_clear
               do
                       value := clear_low_level
               end

	set_color_burn
               do
                       value := color_burn_low_level
               end

	set_color_dodge
               do
                       value := color_dodge_low_level
               end

	set_darken
               do
                       value := darken_low_level
               end

	set_dest
               do
                       value := dest_low_level
               end

	set_dest_atop
               do
                       value := dest_atop_low_level
               end

	set_dest_in
               do
                       value := dest_in_low_level
               end

	set_dest_out
               do
                       value := dest_out_low_level
               end

	set_dest_over
               do
                       value := dest_over_low_level
               end

	set_difference
               do
                       value := difference_low_level
               end

	set_exclusion
               do
                       value := exclusion_low_level
               end

	set_hard_light
               do
                       value := hard_light_low_level
               end

	set_hsl_color
               do
                       value := hsl_color_low_level
               end

	set_hsl_hue
               do
                       value := hsl_hue_low_level
               end

	set_hsl_luminosity
               do
                       value := hsl_luminosity_low_level
               end

	set_hsl_saturation
               do
                       value := hsl_saturation_low_level
               end

	set_in
               do
                       value := in_low_level
               end

	set_lighten
               do
                       value := lighten_low_level
               end

	set_multiply
               do
                       value := multiply_low_level
               end

	set_out_external
               do
                       value := out_external_low_level
               end

	set_over
               do
                       value := over_low_level
               end

	set_overlay
               do
                       value := overlay_low_level
               end

	set_saturate
               do
                       value := saturate_low_level
               end

	set_screen
               do
                       value := screen_low_level
               end

	set_soft_light
               do
                       value := soft_light_low_level
               end

	set_source
               do
                       value := source_low_level
               end

	set_xor_external
               do
                       value := xor_external_low_level
               end

feature {ANY} -- Queries
       is_add: BOOLEAN
               do
                       Result := (value=add_low_level)
               end

       is_atop: BOOLEAN
               do
                       Result := (value=atop_low_level)
               end

       is_clear: BOOLEAN
               do
                       Result := (value=clear_low_level)
               end

       is_color_burn: BOOLEAN
               do
                       Result := (value=color_burn_low_level)
               end

       is_color_dodge: BOOLEAN
               do
                       Result := (value=color_dodge_low_level)
               end

       is_darken: BOOLEAN
               do
                       Result := (value=darken_low_level)
               end

       is_dest: BOOLEAN
               do
                       Result := (value=dest_low_level)
               end

       is_dest_atop: BOOLEAN
               do
                       Result := (value=dest_atop_low_level)
               end

       is_dest_in: BOOLEAN
               do
                       Result := (value=dest_in_low_level)
               end

       is_dest_out: BOOLEAN
               do
                       Result := (value=dest_out_low_level)
               end

       is_dest_over: BOOLEAN
               do
                       Result := (value=dest_over_low_level)
               end

       is_difference: BOOLEAN
               do
                       Result := (value=difference_low_level)
               end

       is_exclusion: BOOLEAN
               do
                       Result := (value=exclusion_low_level)
               end

       is_hard_light: BOOLEAN
               do
                       Result := (value=hard_light_low_level)
               end

       is_hsl_color: BOOLEAN
               do
                       Result := (value=hsl_color_low_level)
               end

       is_hsl_hue: BOOLEAN
               do
                       Result := (value=hsl_hue_low_level)
               end

       is_hsl_luminosity: BOOLEAN
               do
                       Result := (value=hsl_luminosity_low_level)
               end

       is_hsl_saturation: BOOLEAN
               do
                       Result := (value=hsl_saturation_low_level)
               end

       is_in: BOOLEAN
               do
                       Result := (value=in_low_level)
               end

       is_lighten: BOOLEAN
               do
                       Result := (value=lighten_low_level)
               end

       is_multiply: BOOLEAN
               do
                       Result := (value=multiply_low_level)
               end

       is_out_external: BOOLEAN
               do
                       Result := (value=out_external_low_level)
               end

       is_over: BOOLEAN
               do
                       Result := (value=over_low_level)
               end

       is_overlay: BOOLEAN
               do
                       Result := (value=overlay_low_level)
               end

       is_saturate: BOOLEAN
               do
                       Result := (value=saturate_low_level)
               end

       is_screen: BOOLEAN
               do
                       Result := (value=screen_low_level)
               end

       is_soft_light: BOOLEAN
               do
                       Result := (value=soft_light_low_level)
               end

       is_source: BOOLEAN
               do
                       Result := (value=source_low_level)
               end

       is_xor_external: BOOLEAN
               do
                       Result := (value=xor_external_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     add_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_ADD"
                       }"
               end

     atop_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_ATOP"
                       }"
               end

     clear_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_CLEAR"
                       }"
               end

     color_burn_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_COLOR_BURN"
                       }"
               end

     color_dodge_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_COLOR_DODGE"
                       }"
               end

     darken_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DARKEN"
                       }"
               end

     dest_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DEST"
                       }"
               end

     dest_atop_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DEST_ATOP"
                       }"
               end

     dest_in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DEST_IN"
                       }"
               end

     dest_out_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DEST_OUT"
                       }"
               end

     dest_over_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DEST_OVER"
                       }"
               end

     difference_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_DIFFERENCE"
                       }"
               end

     exclusion_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_EXCLUSION"
                       }"
               end

     hard_light_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_HARD_LIGHT"
                       }"
               end

     hsl_color_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_HSL_COLOR"
                       }"
               end

     hsl_hue_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_HSL_HUE"
                       }"
               end

     hsl_luminosity_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_HSL_LUMINOSITY"
                       }"
               end

     hsl_saturation_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_HSL_SATURATION"
                       }"
               end

     in_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_IN"
                       }"
               end

     lighten_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_LIGHTEN"
                       }"
               end

     multiply_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_MULTIPLY"
                       }"
               end

     out_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_OUT"
                       }"
               end

     over_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_OVER"
                       }"
               end

     overlay_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_OVERLAY"
                       }"
               end

     saturate_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_SATURATE"
                       }"
               end

     screen_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_SCREEN"
                       }"
               end

     soft_light_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_SOFT_LIGHT"
                       }"
               end

     source_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_SOURCE"
                       }"
               end

     xor_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_OPERATOR_XOR"
                       }"
               end


end -- class CAIRO_OPERATOR_T_ENUM
