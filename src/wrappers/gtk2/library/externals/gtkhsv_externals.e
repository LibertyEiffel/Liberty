-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHSV_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hsv_get_color (a_hsv: POINTER; a_h: POINTER; a_s: POINTER; a_v: POINTER) is
 		-- gtk_hsv_get_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_color"
		}"
		end

	gtk_hsv_get_metrics (a_hsv: POINTER; a_size: POINTER; a_ring_width: POINTER) is
 		-- gtk_hsv_get_metrics
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_metrics"
		}"
		end

	gtk_hsv_get_type: like long_unsigned is
 		-- gtk_hsv_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_type()"
		}"
		end

	gtk_hsv_is_adjusting (a_hsv: POINTER): INTEGER is
 		-- gtk_hsv_is_adjusting
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_is_adjusting"
		}"
		end

	gtk_hsv_new: POINTER is
 		-- gtk_hsv_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_new()"
		}"
		end

	gtk_hsv_set_color (a_hsv: POINTER; a_h: REAL; a_s: REAL; a_v: REAL) is
 		-- gtk_hsv_set_color
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_set_color"
		}"
		end

	gtk_hsv_set_metrics (a_hsv: POINTER; a_size: INTEGER; a_ring_width: INTEGER) is
 		-- gtk_hsv_set_metrics
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_set_metrics"
		}"
		end

	gtk_hsv_to_rgb (a_h: REAL; a_s: REAL; a_v: REAL; a_r: POINTER; a_g: POINTER; a_b: POINTER) is
 		-- gtk_hsv_to_rgb
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_to_rgb"
		}"
		end

	gtk_rgb_to_hsv (a_r: REAL; a_g: REAL; a_b: REAL; a_h: POINTER; a_s: POINTER; a_v: POINTER) is
 		-- gtk_rgb_to_hsv
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rgb_to_hsv"
		}"
		end


end -- class GTKHSV_EXTERNALS
