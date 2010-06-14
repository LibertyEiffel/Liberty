-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKHSV_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_hsv_new: POINTER is
 		-- gtk_hsv_new (node at line 2632)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_new()"
		}"
		end

	gtk_rgb_to_hsv (a_r: REAL_64; a_g: REAL_64; a_b: REAL_64; a_h: POINTER; a_s: POINTER; a_v: POINTER) is
 		-- gtk_rgb_to_hsv (node at line 6282)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_rgb_to_hsv"
		}"
		end

	gtk_hsv_get_metrics (a_hsv: POINTER; a_size: POINTER; a_ring_width: POINTER) is
 		-- gtk_hsv_get_metrics (node at line 18564)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_metrics"
		}"
		end

	gtk_hsv_is_adjusting (a_hsv: POINTER): INTEGER_32 is
 		-- gtk_hsv_is_adjusting (node at line 23642)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_is_adjusting"
		}"
		end

	gtk_hsv_set_metrics (a_hsv: POINTER; a_size: INTEGER_32; a_ring_width: INTEGER_32) is
 		-- gtk_hsv_set_metrics (node at line 24341)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_set_metrics"
		}"
		end

	gtk_hsv_get_color (a_hsv: POINTER; a_h: POINTER; a_s: POINTER; a_v: POINTER) is
 		-- gtk_hsv_get_color (node at line 29417)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_color"
		}"
		end

	gtk_hsv_set_color (a_hsv: POINTER; a_h: REAL_64; a_s: REAL_64; a_v: REAL_64) is
 		-- gtk_hsv_set_color (node at line 33011)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_set_color"
		}"
		end

	gtk_hsv_get_type: NATURAL_32 is
 		-- gtk_hsv_get_type (node at line 35117)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_get_type()"
		}"
		end

	gtk_hsv_to_rgb (a_h: REAL_64; a_s: REAL_64; a_v: REAL_64; a_r: POINTER; a_g: POINTER; a_b: POINTER) is
 		-- gtk_hsv_to_rgb (node at line 37235)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_hsv_to_rgb"
		}"
		end


end -- class GTKHSV_EXTERNALS
