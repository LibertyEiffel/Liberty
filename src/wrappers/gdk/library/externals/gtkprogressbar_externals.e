-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESSBAR_EXTERNALS


inherit ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_progress_bar_pulse (a_pbar: POINTER) is
 		-- gtk_progress_bar_pulse (node at line 349)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_pulse"
		}"
		end

	gtk_progress_bar_get_orientation (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_orientation (node at line 1820)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_orientation"
		}"
		end

	gtk_progress_bar_get_ellipsize (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_ellipsize (node at line 2777)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_ellipsize"
		}"
		end

	gtk_progress_bar_get_text (a_pbar: POINTER): POINTER is
 		-- gtk_progress_bar_get_text (node at line 4761)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_text"
		}"
		end

	gtk_progress_bar_set_pulse_step (a_pbar: POINTER; a_fraction: REAL_64) is
 		-- gtk_progress_bar_set_pulse_step (node at line 5243)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_pulse_step"
		}"
		end

	gtk_progress_bar_set_discrete_blocks (a_pbar: POINTER; a_blocks: NATURAL_32) is
 		-- gtk_progress_bar_set_discrete_blocks (node at line 5553)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_discrete_blocks"
		}"
		end

	gtk_progress_bar_set_ellipsize (a_pbar: POINTER; a_mode: INTEGER) is
 		-- gtk_progress_bar_set_ellipsize (node at line 7069)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_ellipsize"
		}"
		end

	gtk_progress_bar_set_fraction (a_pbar: POINTER; a_fraction: REAL_64) is
 		-- gtk_progress_bar_set_fraction (node at line 7753)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_fraction"
		}"
		end

	gtk_progress_bar_get_fraction (a_pbar: POINTER): REAL_64 is
 		-- gtk_progress_bar_get_fraction (node at line 8763)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_fraction"
		}"
		end

	gtk_progress_bar_set_activity_blocks (a_pbar: POINTER; a_blocks: NATURAL_32) is
 		-- gtk_progress_bar_set_activity_blocks (node at line 9375)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_activity_blocks"
		}"
		end

	gtk_progress_bar_new: POINTER is
 		-- gtk_progress_bar_new (node at line 9807)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_new()"
		}"
		end

	gtk_progress_bar_update (a_pbar: POINTER; a_percentage: REAL_64) is
 		-- gtk_progress_bar_update (node at line 12768)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_update"
		}"
		end

	gtk_progress_bar_get_type: NATURAL_32 is
 		-- gtk_progress_bar_get_type (node at line 14921)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_type()"
		}"
		end

	gtk_progress_bar_set_text (a_pbar: POINTER; a_text: POINTER) is
 		-- gtk_progress_bar_set_text (node at line 18238)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_text"
		}"
		end

	gtk_progress_bar_set_bar_style (a_pbar: POINTER; a_style: INTEGER) is
 		-- gtk_progress_bar_set_bar_style (node at line 19826)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_bar_style"
		}"
		end

	gtk_progress_bar_new_with_adjustment (an_adjustment: POINTER): POINTER is
 		-- gtk_progress_bar_new_with_adjustment (node at line 26185)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_new_with_adjustment"
		}"
		end

	gtk_progress_bar_set_orientation (a_pbar: POINTER; an_orientation: INTEGER) is
 		-- gtk_progress_bar_set_orientation (node at line 26948)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_orientation"
		}"
		end

	gtk_progress_bar_set_activity_step (a_pbar: POINTER; a_step: NATURAL_32) is
 		-- gtk_progress_bar_set_activity_step (node at line 34180)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_activity_step"
		}"
		end

	gtk_progress_bar_get_pulse_step (a_pbar: POINTER): REAL_64 is
 		-- gtk_progress_bar_get_pulse_step (node at line 36961)
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_pulse_step"
		}"
		end


end -- class GTKPROGRESSBAR_EXTERNALS
