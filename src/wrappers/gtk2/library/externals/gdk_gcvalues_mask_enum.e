-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_GCVALUES_MASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (foreground_low_level | 
				font_low_level | 
				function_low_level | 
				fill_low_level | 
				tile_low_level | 
				stipple_low_level | 
				clip_mask_low_level | 
				subwindow_low_level | 
				ts_x_origin_low_level | 
				ts_y_origin_low_level | 
				clip_x_origin_low_level | 
				clip_y_origin_low_level | 
				exposures_low_level | 
				line_width_low_level | 
				line_style_low_level | 
				cap_style_low_level | 
				join_style_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_foreground is
		do
			value := value.bit_or(foreground_low_level)
		end

	unset_foreground is
		do
			value := value.bit_xor(foreground_low_level)
		end

	set_font is
		do
			value := value.bit_or(font_low_level)
		end

	unset_font is
		do
			value := value.bit_xor(font_low_level)
		end

	set_function is
		do
			value := value.bit_or(function_low_level)
		end

	unset_function is
		do
			value := value.bit_xor(function_low_level)
		end

	set_fill is
		do
			value := value.bit_or(fill_low_level)
		end

	unset_fill is
		do
			value := value.bit_xor(fill_low_level)
		end

	set_tile is
		do
			value := value.bit_or(tile_low_level)
		end

	unset_tile is
		do
			value := value.bit_xor(tile_low_level)
		end

	set_stipple is
		do
			value := value.bit_or(stipple_low_level)
		end

	unset_stipple is
		do
			value := value.bit_xor(stipple_low_level)
		end

	set_clip_mask is
		do
			value := value.bit_or(clip_mask_low_level)
		end

	unset_clip_mask is
		do
			value := value.bit_xor(clip_mask_low_level)
		end

	set_subwindow is
		do
			value := value.bit_or(subwindow_low_level)
		end

	unset_subwindow is
		do
			value := value.bit_xor(subwindow_low_level)
		end

	set_ts_x_origin is
		do
			value := value.bit_or(ts_x_origin_low_level)
		end

	unset_ts_x_origin is
		do
			value := value.bit_xor(ts_x_origin_low_level)
		end

	set_ts_y_origin is
		do
			value := value.bit_or(ts_y_origin_low_level)
		end

	unset_ts_y_origin is
		do
			value := value.bit_xor(ts_y_origin_low_level)
		end

	set_clip_x_origin is
		do
			value := value.bit_or(clip_x_origin_low_level)
		end

	unset_clip_x_origin is
		do
			value := value.bit_xor(clip_x_origin_low_level)
		end

	set_clip_y_origin is
		do
			value := value.bit_or(clip_y_origin_low_level)
		end

	unset_clip_y_origin is
		do
			value := value.bit_xor(clip_y_origin_low_level)
		end

	set_exposures is
		do
			value := value.bit_or(exposures_low_level)
		end

	unset_exposures is
		do
			value := value.bit_xor(exposures_low_level)
		end

	set_line_width is
		do
			value := value.bit_or(line_width_low_level)
		end

	unset_line_width is
		do
			value := value.bit_xor(line_width_low_level)
		end

	set_line_style is
		do
			value := value.bit_or(line_style_low_level)
		end

	unset_line_style is
		do
			value := value.bit_xor(line_style_low_level)
		end

	set_cap_style is
		do
			value := value.bit_or(cap_style_low_level)
		end

	unset_cap_style is
		do
			value := value.bit_xor(cap_style_low_level)
		end

	set_join_style is
		do
			value := value.bit_or(join_style_low_level)
		end

	unset_join_style is
		do
			value := value.bit_xor(join_style_low_level)
		end

feature -- Queries
	is_foreground: BOOLEAN is
		do
			Result := (value=foreground_low_level)
		end

	is_font: BOOLEAN is
		do
			Result := (value=font_low_level)
		end

	is_function: BOOLEAN is
		do
			Result := (value=function_low_level)
		end

	is_fill: BOOLEAN is
		do
			Result := (value=fill_low_level)
		end

	is_tile: BOOLEAN is
		do
			Result := (value=tile_low_level)
		end

	is_stipple: BOOLEAN is
		do
			Result := (value=stipple_low_level)
		end

	is_clip_mask: BOOLEAN is
		do
			Result := (value=clip_mask_low_level)
		end

	is_subwindow: BOOLEAN is
		do
			Result := (value=subwindow_low_level)
		end

	is_ts_x_origin: BOOLEAN is
		do
			Result := (value=ts_x_origin_low_level)
		end

	is_ts_y_origin: BOOLEAN is
		do
			Result := (value=ts_y_origin_low_level)
		end

	is_clip_x_origin: BOOLEAN is
		do
			Result := (value=clip_x_origin_low_level)
		end

	is_clip_y_origin: BOOLEAN is
		do
			Result := (value=clip_y_origin_low_level)
		end

	is_exposures: BOOLEAN is
		do
			Result := (value=exposures_low_level)
		end

	is_line_width: BOOLEAN is
		do
			Result := (value=line_width_low_level)
		end

	is_line_style: BOOLEAN is
		do
			Result := (value=line_style_low_level)
		end

	is_cap_style: BOOLEAN is
		do
			Result := (value=cap_style_low_level)
		end

	is_join_style: BOOLEAN is
		do
			Result := (value=join_style_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	foreground_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FOREGROUND"
 			}"
 		end

	font_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FONT"
 			}"
 		end

	function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FUNCTION"
 			}"
 		end

	fill_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FILL"
 			}"
 		end

	tile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TILE"
 			}"
 		end

	stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_STIPPLE"
 			}"
 		end

	clip_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_MASK"
 			}"
 		end

	subwindow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_SUBWINDOW"
 			}"
 		end

	ts_x_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TS_X_ORIGIN"
 			}"
 		end

	ts_y_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TS_Y_ORIGIN"
 			}"
 		end

	clip_x_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_X_ORIGIN"
 			}"
 		end

	clip_y_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_Y_ORIGIN"
 			}"
 		end

	exposures_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_EXPOSURES"
 			}"
 		end

	line_width_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_LINE_WIDTH"
 			}"
 		end

	line_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_LINE_STYLE"
 			}"
 		end

	cap_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CAP_STYLE"
 			}"
 		end

	join_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_JOIN_STYLE"
 			}"
 		end


end -- class GDK_GCVALUES_MASK_ENUM
