-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKDIRECTIONTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_dir_down_low_level)  or else
				(a_value = gtk_dir_left_low_level)  or else
				(a_value = gtk_dir_right_low_level)  or else
				(a_value = gtk_dir_tab_backward_low_level)  or else
				(a_value = gtk_dir_tab_forward_low_level)  or else
				(a_value = gtk_dir_up_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_dir_down is
		do
			value := gtk_dir_down_low_level
		end

	set_gtk_dir_left is
		do
			value := gtk_dir_left_low_level
		end

	set_gtk_dir_right is
		do
			value := gtk_dir_right_low_level
		end

	set_gtk_dir_tab_backward is
		do
			value := gtk_dir_tab_backward_low_level
		end

	set_gtk_dir_tab_forward is
		do
			value := gtk_dir_tab_forward_low_level
		end

	set_gtk_dir_up is
		do
			value := gtk_dir_up_low_level
		end

feature {ANY} -- Queries
	is_gtk_dir_down: BOOLEAN is
		do
			Result := (value=gtk_dir_down_low_level)
		end

	is_gtk_dir_left: BOOLEAN is
		do
			Result := (value=gtk_dir_left_low_level)
		end

	is_gtk_dir_right: BOOLEAN is
		do
			Result := (value=gtk_dir_right_low_level)
		end

	is_gtk_dir_tab_backward: BOOLEAN is
		do
			Result := (value=gtk_dir_tab_backward_low_level)
		end

	is_gtk_dir_tab_forward: BOOLEAN is
		do
			Result := (value=gtk_dir_tab_forward_low_level)
		end

	is_gtk_dir_up: BOOLEAN is
		do
			Result := (value=gtk_dir_up_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_dir_down_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_DOWN"
 			}"
 		end

	gtk_dir_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_LEFT"
 			}"
 		end

	gtk_dir_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_RIGHT"
 			}"
 		end

	gtk_dir_tab_backward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_TAB_BACKWARD"
 			}"
 		end

	gtk_dir_tab_forward_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_TAB_FORWARD"
 			}"
 		end

	gtk_dir_up_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_DIR_UP"
 			}"
 		end


end -- class GTKDIRECTIONTYPE_ENUM
