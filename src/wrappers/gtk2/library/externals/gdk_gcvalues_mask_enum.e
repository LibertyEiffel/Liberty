-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_GCVALUES_MASK_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gdk_gc_background_low_level | 
				gdk_gc_clip_mask_low_level | 
				gdk_gc_clip_x_origin_low_level | 
				gdk_gc_clip_y_origin_low_level | 
				gdk_gc_exposures_low_level | 
				gdk_gc_fill_low_level | 
				gdk_gc_font_low_level | 
				gdk_gc_foreground_low_level | 
				gdk_gc_function_low_level | 
				gdk_gc_join_style_low_level | 
				gdk_gc_line_style_low_level | 
				gdk_gc_line_width_low_level | 
				gdk_gc_stipple_low_level | 
				gdk_gc_subwindow_low_level | 
				gdk_gc_tile_low_level | 
				gdk_gc_ts_x_origin_low_level | 
				gdk_gc_ts_y_origin_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gdk_gc_background is
		do
			value := value.bit_or(gdk_gc_background_low_level)
		end

	unset_gdk_gc_background is
		do
			value := value.bit_xor(gdk_gc_background_low_level)
		end

	set_gdk_gc_clip_mask is
		do
			value := value.bit_or(gdk_gc_clip_mask_low_level)
		end

	unset_gdk_gc_clip_mask is
		do
			value := value.bit_xor(gdk_gc_clip_mask_low_level)
		end

	set_gdk_gc_clip_x_origin is
		do
			value := value.bit_or(gdk_gc_clip_x_origin_low_level)
		end

	unset_gdk_gc_clip_x_origin is
		do
			value := value.bit_xor(gdk_gc_clip_x_origin_low_level)
		end

	set_gdk_gc_clip_y_origin is
		do
			value := value.bit_or(gdk_gc_clip_y_origin_low_level)
		end

	unset_gdk_gc_clip_y_origin is
		do
			value := value.bit_xor(gdk_gc_clip_y_origin_low_level)
		end

	set_gdk_gc_exposures is
		do
			value := value.bit_or(gdk_gc_exposures_low_level)
		end

	unset_gdk_gc_exposures is
		do
			value := value.bit_xor(gdk_gc_exposures_low_level)
		end

	set_gdk_gc_fill is
		do
			value := value.bit_or(gdk_gc_fill_low_level)
		end

	unset_gdk_gc_fill is
		do
			value := value.bit_xor(gdk_gc_fill_low_level)
		end

	set_gdk_gc_font is
		do
			value := value.bit_or(gdk_gc_font_low_level)
		end

	unset_gdk_gc_font is
		do
			value := value.bit_xor(gdk_gc_font_low_level)
		end

	set_gdk_gc_foreground is
		do
			value := value.bit_or(gdk_gc_foreground_low_level)
		end

	unset_gdk_gc_foreground is
		do
			value := value.bit_xor(gdk_gc_foreground_low_level)
		end

	set_gdk_gc_function is
		do
			value := value.bit_or(gdk_gc_function_low_level)
		end

	unset_gdk_gc_function is
		do
			value := value.bit_xor(gdk_gc_function_low_level)
		end

	set_gdk_gc_join_style is
		do
			value := value.bit_or(gdk_gc_join_style_low_level)
		end

	unset_gdk_gc_join_style is
		do
			value := value.bit_xor(gdk_gc_join_style_low_level)
		end

	set_gdk_gc_line_style is
		do
			value := value.bit_or(gdk_gc_line_style_low_level)
		end

	unset_gdk_gc_line_style is
		do
			value := value.bit_xor(gdk_gc_line_style_low_level)
		end

	set_gdk_gc_line_width is
		do
			value := value.bit_or(gdk_gc_line_width_low_level)
		end

	unset_gdk_gc_line_width is
		do
			value := value.bit_xor(gdk_gc_line_width_low_level)
		end

	set_gdk_gc_stipple is
		do
			value := value.bit_or(gdk_gc_stipple_low_level)
		end

	unset_gdk_gc_stipple is
		do
			value := value.bit_xor(gdk_gc_stipple_low_level)
		end

	set_gdk_gc_subwindow is
		do
			value := value.bit_or(gdk_gc_subwindow_low_level)
		end

	unset_gdk_gc_subwindow is
		do
			value := value.bit_xor(gdk_gc_subwindow_low_level)
		end

	set_gdk_gc_tile is
		do
			value := value.bit_or(gdk_gc_tile_low_level)
		end

	unset_gdk_gc_tile is
		do
			value := value.bit_xor(gdk_gc_tile_low_level)
		end

	set_gdk_gc_ts_x_origin is
		do
			value := value.bit_or(gdk_gc_ts_x_origin_low_level)
		end

	unset_gdk_gc_ts_x_origin is
		do
			value := value.bit_xor(gdk_gc_ts_x_origin_low_level)
		end

	set_gdk_gc_ts_y_origin is
		do
			value := value.bit_or(gdk_gc_ts_y_origin_low_level)
		end

	unset_gdk_gc_ts_y_origin is
		do
			value := value.bit_xor(gdk_gc_ts_y_origin_low_level)
		end

feature -- Queries
	is_gdk_gc_background: BOOLEAN is
		do
			Result := (value=gdk_gc_background_low_level)
		end

	is_gdk_gc_clip_mask: BOOLEAN is
		do
			Result := (value=gdk_gc_clip_mask_low_level)
		end

	is_gdk_gc_clip_x_origin: BOOLEAN is
		do
			Result := (value=gdk_gc_clip_x_origin_low_level)
		end

	is_gdk_gc_clip_y_origin: BOOLEAN is
		do
			Result := (value=gdk_gc_clip_y_origin_low_level)
		end

	is_gdk_gc_exposures: BOOLEAN is
		do
			Result := (value=gdk_gc_exposures_low_level)
		end

	is_gdk_gc_fill: BOOLEAN is
		do
			Result := (value=gdk_gc_fill_low_level)
		end

	is_gdk_gc_font: BOOLEAN is
		do
			Result := (value=gdk_gc_font_low_level)
		end

	is_gdk_gc_foreground: BOOLEAN is
		do
			Result := (value=gdk_gc_foreground_low_level)
		end

	is_gdk_gc_function: BOOLEAN is
		do
			Result := (value=gdk_gc_function_low_level)
		end

	is_gdk_gc_join_style: BOOLEAN is
		do
			Result := (value=gdk_gc_join_style_low_level)
		end

	is_gdk_gc_line_style: BOOLEAN is
		do
			Result := (value=gdk_gc_line_style_low_level)
		end

	is_gdk_gc_line_width: BOOLEAN is
		do
			Result := (value=gdk_gc_line_width_low_level)
		end

	is_gdk_gc_stipple: BOOLEAN is
		do
			Result := (value=gdk_gc_stipple_low_level)
		end

	is_gdk_gc_subwindow: BOOLEAN is
		do
			Result := (value=gdk_gc_subwindow_low_level)
		end

	is_gdk_gc_tile: BOOLEAN is
		do
			Result := (value=gdk_gc_tile_low_level)
		end

	is_gdk_gc_ts_x_origin: BOOLEAN is
		do
			Result := (value=gdk_gc_ts_x_origin_low_level)
		end

	is_gdk_gc_ts_y_origin: BOOLEAN is
		do
			Result := (value=gdk_gc_ts_y_origin_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_gc_background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_BACKGROUND"
 			}"
 		end

	gdk_gc_clip_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_MASK"
 			}"
 		end

	gdk_gc_clip_x_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_X_ORIGIN"
 			}"
 		end

	gdk_gc_clip_y_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_CLIP_Y_ORIGIN"
 			}"
 		end

	gdk_gc_exposures_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_EXPOSURES"
 			}"
 		end

	gdk_gc_fill_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FILL"
 			}"
 		end

	gdk_gc_font_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FONT"
 			}"
 		end

	gdk_gc_foreground_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FOREGROUND"
 			}"
 		end

	gdk_gc_function_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_FUNCTION"
 			}"
 		end

	gdk_gc_join_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_JOIN_STYLE"
 			}"
 		end

	gdk_gc_line_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_LINE_STYLE"
 			}"
 		end

	gdk_gc_line_width_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_LINE_WIDTH"
 			}"
 		end

	gdk_gc_stipple_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_STIPPLE"
 			}"
 		end

	gdk_gc_subwindow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_SUBWINDOW"
 			}"
 		end

	gdk_gc_tile_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TILE"
 			}"
 		end

	gdk_gc_ts_x_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TS_X_ORIGIN"
 			}"
 		end

	gdk_gc_ts_y_origin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GDK_GC_TS_Y_ORIGIN"
 			}"
 		end


end -- class GDK_GCVALUES_MASK_ENUM
