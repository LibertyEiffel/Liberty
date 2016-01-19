-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SPIN_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_spin_end_low_level)  or else
				(a_value = gtk_spin_home_low_level)  or else
				(a_value = gtk_spin_page_backward_low_level)  or else
				(a_value = gtk_spin_page_forward_low_level)  or else
				(a_value = gtk_spin_step_backward_low_level)  or else
				(a_value = gtk_spin_step_forward_low_level)  or else
				(a_value = gtk_spin_user_defined_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_spin_end is
		do
			value := gtk_spin_end_low_level
		end

	set_gtk_spin_home is
		do
			value := gtk_spin_home_low_level
		end

	set_gtk_spin_page_backward is
		do
			value := gtk_spin_page_backward_low_level
		end

	set_gtk_spin_page_forward is
		do
			value := gtk_spin_page_forward_low_level
		end

	set_gtk_spin_step_backward is
		do
			value := gtk_spin_step_backward_low_level
		end

	set_gtk_spin_step_forward is
		do
			value := gtk_spin_step_forward_low_level
		end

	set_gtk_spin_user_defined is
		do
			value := gtk_spin_user_defined_low_level
		end

feature -- Queries
	is_gtk_spin_end: BOOLEAN is
		do
			Result := (value=gtk_spin_end_low_level)
		end

	is_gtk_spin_home: BOOLEAN is
		do
			Result := (value=gtk_spin_home_low_level)
		end

	is_gtk_spin_page_backward: BOOLEAN is
		do
			Result := (value=gtk_spin_page_backward_low_level)
		end

	is_gtk_spin_page_forward: BOOLEAN is
		do
			Result := (value=gtk_spin_page_forward_low_level)
		end

	is_gtk_spin_step_backward: BOOLEAN is
		do
			Result := (value=gtk_spin_step_backward_low_level)
		end

	is_gtk_spin_step_forward: BOOLEAN is
		do
			Result := (value=gtk_spin_step_forward_low_level)
		end

	is_gtk_spin_user_defined: BOOLEAN is
		do
			Result := (value=gtk_spin_user_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_spin_end_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_END"
 			}"
 		end

	gtk_spin_home_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_HOME"
 			}"
 		end

	gtk_spin_page_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_PAGE_BACKWARD"
 			}"
 		end

	gtk_spin_page_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_PAGE_FORWARD"
 			}"
 		end

	gtk_spin_step_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_STEP_BACKWARD"
 			}"
 		end

	gtk_spin_step_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_STEP_FORWARD"
 			}"
 		end

	gtk_spin_user_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SPIN_USER_DEFINED"
 			}"
 		end


end -- class GTK_SPIN_TYPE_ENUM
