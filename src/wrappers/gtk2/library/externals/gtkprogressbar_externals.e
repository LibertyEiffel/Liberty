-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESSBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_progress_bar_pulse (a_pbar: POINTER) is
 		-- gtk_progress_bar_pulse (node at line 342)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_pulse"
		}"
		end

	gtk_progress_bar_get_orientation (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_orientation (node at line 1723)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_orientation"
		}"
		end

	gtk_progress_bar_get_ellipsize (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_ellipsize (node at line 2731)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_ellipsize"
		}"
		end

	gtk_progress_bar_get_text (a_pbar: POINTER): POINTER is
 		-- gtk_progress_bar_get_text (node at line 4986)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_text"
		}"
		end

	gtk_progress_bar_set_pulse_step (a_pbar: POINTER; a_fraction: REAL_64) is
 		-- gtk_progress_bar_set_pulse_step (node at line 5504)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_pulse_step"
		}"
		end

	gtk_progress_bar_set_ellipsize (a_pbar: POINTER; a_mode: INTEGER) is
 		-- gtk_progress_bar_set_ellipsize (node at line 7724)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_ellipsize"
		}"
		end

	gtk_progress_bar_set_fraction (a_pbar: POINTER; a_fraction: REAL_64) is
 		-- gtk_progress_bar_set_fraction (node at line 8465)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_fraction"
		}"
		end

	gtk_progress_bar_new: POINTER is
 		-- gtk_progress_bar_new (node at line 9161)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_new()"
		}"
		end

	gtk_progress_bar_get_fraction (a_pbar: POINTER): REAL_64 is
 		-- gtk_progress_bar_get_fraction (node at line 9515)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_fraction"
		}"
		end

	gtk_progress_bar_get_type: NATURAL_64 is
 		-- gtk_progress_bar_get_type (node at line 16172)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_type()"
		}"
		end

	gtk_progress_bar_set_text (a_pbar: POINTER; a_text: POINTER) is
 		-- gtk_progress_bar_set_text (node at line 19940)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_text"
		}"
		end

	gtk_progress_bar_get_pulse_step (a_pbar: POINTER): REAL_64 is
 		-- gtk_progress_bar_get_pulse_step (node at line 26721)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_pulse_step"
		}"
		end

	gtk_progress_bar_set_orientation (a_pbar: POINTER; an_orientation: INTEGER) is
 		-- gtk_progress_bar_set_orientation (node at line 29749)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_orientation"
		}"
		end


end -- class GTKPROGRESSBAR_EXTERNALS
