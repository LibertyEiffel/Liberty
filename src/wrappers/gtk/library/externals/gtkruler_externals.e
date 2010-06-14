-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKRULER_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_ruler_draw_ticks (a_ruler: POINTER) is
 		-- gtk_ruler_draw_ticks (node at line 4930)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_draw_ticks"
		}"
		end

	gtk_ruler_get_metric (a_ruler: POINTER): INTEGER is
 		-- gtk_ruler_get_metric (node at line 16373)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_get_metric"
		}"
		end

	gtk_ruler_get_type: NATURAL_32 is
 		-- gtk_ruler_get_type (node at line 22232)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_get_type()"
		}"
		end

	gtk_ruler_get_range (a_ruler: POINTER; a_lower: POINTER; an_upper: POINTER; a_position: POINTER; a_max_size: POINTER) is
 		-- gtk_ruler_get_range (node at line 23002)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_get_range"
		}"
		end

	gtk_ruler_draw_pos (a_ruler: POINTER) is
 		-- gtk_ruler_draw_pos (node at line 23097)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_draw_pos"
		}"
		end

	gtk_ruler_set_range (a_ruler: POINTER; a_lower: REAL_64; an_upper: REAL_64; a_position: REAL_64; a_max_size: REAL_64) is
 		-- gtk_ruler_set_range (node at line 31636)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_set_range"
		}"
		end

	gtk_ruler_set_metric (a_ruler: POINTER; a_metric: INTEGER) is
 		-- gtk_ruler_set_metric (node at line 37394)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_ruler_set_metric"
		}"
		end


end -- class GTKRULER_EXTERNALS
