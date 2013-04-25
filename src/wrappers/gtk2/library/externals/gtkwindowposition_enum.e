-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKWINDOWPOSITION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_win_pos_center_low_level)  or else
				(a_value = gtk_win_pos_center_always_low_level)  or else
				(a_value = gtk_win_pos_center_on_parent_low_level)  or else
				(a_value = gtk_win_pos_mouse_low_level)  or else
				(a_value = gtk_win_pos_none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_win_pos_center is
		do
			value := gtk_win_pos_center_low_level
		end

	set_gtk_win_pos_center_always is
		do
			value := gtk_win_pos_center_always_low_level
		end

	set_gtk_win_pos_center_on_parent is
		do
			value := gtk_win_pos_center_on_parent_low_level
		end

	set_gtk_win_pos_mouse is
		do
			value := gtk_win_pos_mouse_low_level
		end

	set_gtk_win_pos_none is
		do
			value := gtk_win_pos_none_low_level
		end

feature {ANY} -- Queries
	is_gtk_win_pos_center: BOOLEAN is
		do
			Result := (value=gtk_win_pos_center_low_level)
		end

	is_gtk_win_pos_center_always: BOOLEAN is
		do
			Result := (value=gtk_win_pos_center_always_low_level)
		end

	is_gtk_win_pos_center_on_parent: BOOLEAN is
		do
			Result := (value=gtk_win_pos_center_on_parent_low_level)
		end

	is_gtk_win_pos_mouse: BOOLEAN is
		do
			Result := (value=gtk_win_pos_mouse_low_level)
		end

	is_gtk_win_pos_none: BOOLEAN is
		do
			Result := (value=gtk_win_pos_none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_win_pos_center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER"
 			}"
 		end

	gtk_win_pos_center_always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER_ALWAYS"
 			}"
 		end

	gtk_win_pos_center_on_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_CENTER_ON_PARENT"
 			}"
 		end

	gtk_win_pos_mouse_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_MOUSE"
 			}"
 		end

	gtk_win_pos_none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_WIN_POS_NONE"
 			}"
 		end


end -- class GTKWINDOWPOSITION_ENUM
