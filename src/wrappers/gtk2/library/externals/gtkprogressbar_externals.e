-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

deferred class GTKPROGRESSBAR_EXTERNALS


insert ANY undefine is_equal, copy end

		-- TODO: insert typedefs class
feature {} -- External calls

	gtk_progress_bar_get_ellipsize (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_ellipsize"
		}"
		end

	gtk_progress_bar_get_fraction (a_pbar: POINTER): REAL is
 		-- gtk_progress_bar_get_fraction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_fraction"
		}"
		end

	gtk_progress_bar_get_orientation (a_pbar: POINTER): INTEGER is
 		-- gtk_progress_bar_get_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_orientation"
		}"
		end

	gtk_progress_bar_get_pulse_step (a_pbar: POINTER): REAL is
 		-- gtk_progress_bar_get_pulse_step
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_pulse_step"
		}"
		end

	gtk_progress_bar_get_text (a_pbar: POINTER): POINTER is
 		-- gtk_progress_bar_get_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_text"
		}"
		end

	gtk_progress_bar_get_type: like long_unsigned is
 		-- gtk_progress_bar_get_type
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_get_type()"
		}"
		end

	gtk_progress_bar_new: POINTER is
 		-- gtk_progress_bar_new
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_new()"
		}"
		end

	gtk_progress_bar_pulse (a_pbar: POINTER) is
 		-- gtk_progress_bar_pulse
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_pulse"
		}"
		end

	gtk_progress_bar_set_ellipsize (a_pbar: POINTER; a_mode: INTEGER) is
 		-- gtk_progress_bar_set_ellipsize
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_ellipsize"
		}"
		end

	gtk_progress_bar_set_fraction (a_pbar: POINTER; a_fraction: REAL) is
 		-- gtk_progress_bar_set_fraction
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_fraction"
		}"
		end

	gtk_progress_bar_set_orientation (a_pbar: POINTER; an_orientation: INTEGER) is
 		-- gtk_progress_bar_set_orientation
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_orientation"
		}"
		end

	gtk_progress_bar_set_pulse_step (a_pbar: POINTER; a_fraction: REAL) is
 		-- gtk_progress_bar_set_pulse_step
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_pulse_step"
		}"
		end

	gtk_progress_bar_set_text (a_pbar: POINTER; a_text: POINTER) is
 		-- gtk_progress_bar_set_text
		external "plug_in"
		alias "{
			location: "."
			module_name: "plugin"
			feature_name: "gtk_progress_bar_set_text"
		}"
		end


end -- class GTKPROGRESSBAR_EXTERNALS
