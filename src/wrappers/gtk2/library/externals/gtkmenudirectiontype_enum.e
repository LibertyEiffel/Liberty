-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKMENUDIRECTIONTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_menu_dir_child_low_level)  or else
				(a_value = gtk_menu_dir_next_low_level)  or else
				(a_value = gtk_menu_dir_parent_low_level)  or else
				(a_value = gtk_menu_dir_prev_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_menu_dir_child is
		do
			value := gtk_menu_dir_child_low_level
		end

	set_gtk_menu_dir_next is
		do
			value := gtk_menu_dir_next_low_level
		end

	set_gtk_menu_dir_parent is
		do
			value := gtk_menu_dir_parent_low_level
		end

	set_gtk_menu_dir_prev is
		do
			value := gtk_menu_dir_prev_low_level
		end

feature {ANY} -- Queries
	is_gtk_menu_dir_child: BOOLEAN is
		do
			Result := (value=gtk_menu_dir_child_low_level)
		end

	is_gtk_menu_dir_next: BOOLEAN is
		do
			Result := (value=gtk_menu_dir_next_low_level)
		end

	is_gtk_menu_dir_parent: BOOLEAN is
		do
			Result := (value=gtk_menu_dir_parent_low_level)
		end

	is_gtk_menu_dir_prev: BOOLEAN is
		do
			Result := (value=gtk_menu_dir_prev_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_menu_dir_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_CHILD"
 			}"
 		end

	gtk_menu_dir_next_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_NEXT"
 			}"
 		end

	gtk_menu_dir_parent_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_PARENT"
 			}"
 		end

	gtk_menu_dir_prev_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_MENU_DIR_PREV"
 			}"
 		end


end -- class GTKMENUDIRECTIONTYPE_ENUM
