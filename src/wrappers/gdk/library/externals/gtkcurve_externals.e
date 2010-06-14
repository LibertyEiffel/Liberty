-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKCURVE_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_curve_set_curve_type (a_curve: POINTER; a_type: INTEGER) is
 		-- gtk_curve_set_curve_type (node at line 6383)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_set_curve_type"
		}"
		end

	gtk_curve_get_vector (a_curve: POINTER; a_veclen: INTEGER_32; a_vector: POINTER) is
 		-- gtk_curve_get_vector (node at line 8309)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_get_vector"
		}"
		end

	gtk_curve_set_gamma (a_curve: POINTER; a_gamma: REAL_32) is
 		-- gtk_curve_set_gamma (node at line 9638)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_set_gamma"
		}"
		end

	gtk_curve_reset (a_curve: POINTER) is
 		-- gtk_curve_reset (node at line 11139)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_reset"
		}"
		end

	gtk_curve_set_range (a_curve: POINTER; a_min_x: REAL_32; a_max_x: REAL_32; a_min_y: REAL_32; a_max_y: REAL_32) is
 		-- gtk_curve_set_range (node at line 24300)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_set_range"
		}"
		end

	gtk_curve_new: POINTER is
 		-- gtk_curve_new (node at line 24364)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_new()"
		}"
		end

	gtk_curve_get_type: NATURAL_32 is
 		-- gtk_curve_get_type (node at line 24586)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_get_type()"
		}"
		end

	gtk_curve_set_vector (a_curve: POINTER; a_veclen: INTEGER_32; a_vector: POINTER) is
 		-- gtk_curve_set_vector (node at line 37177)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_curve_set_vector"
		}"
		end


end -- class GTKCURVE_EXTERNALS
