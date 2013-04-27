-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKICONSIZE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_icon_size_button_low_level)  or else
				(a_value = gtk_icon_size_dialog_low_level)  or else
				(a_value = gtk_icon_size_dnd_low_level)  or else
				(a_value = gtk_icon_size_invalid_low_level)  or else
				(a_value = gtk_icon_size_large_toolbar_low_level)  or else
				(a_value = gtk_icon_size_menu_low_level)  or else
				(a_value = gtk_icon_size_small_toolbar_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_icon_size_button is
		do
			value := gtk_icon_size_button_low_level
		end

	set_gtk_icon_size_dialog is
		do
			value := gtk_icon_size_dialog_low_level
		end

	set_gtk_icon_size_dnd is
		do
			value := gtk_icon_size_dnd_low_level
		end

	set_gtk_icon_size_invalid is
		do
			value := gtk_icon_size_invalid_low_level
		end

	set_gtk_icon_size_large_toolbar is
		do
			value := gtk_icon_size_large_toolbar_low_level
		end

	set_gtk_icon_size_menu is
		do
			value := gtk_icon_size_menu_low_level
		end

	set_gtk_icon_size_small_toolbar is
		do
			value := gtk_icon_size_small_toolbar_low_level
		end

feature {ANY} -- Queries
	is_gtk_icon_size_button: BOOLEAN is
		do
			Result := (value=gtk_icon_size_button_low_level)
		end

	is_gtk_icon_size_dialog: BOOLEAN is
		do
			Result := (value=gtk_icon_size_dialog_low_level)
		end

	is_gtk_icon_size_dnd: BOOLEAN is
		do
			Result := (value=gtk_icon_size_dnd_low_level)
		end

	is_gtk_icon_size_invalid: BOOLEAN is
		do
			Result := (value=gtk_icon_size_invalid_low_level)
		end

	is_gtk_icon_size_large_toolbar: BOOLEAN is
		do
			Result := (value=gtk_icon_size_large_toolbar_low_level)
		end

	is_gtk_icon_size_menu: BOOLEAN is
		do
			Result := (value=gtk_icon_size_menu_low_level)
		end

	is_gtk_icon_size_small_toolbar: BOOLEAN is
		do
			Result := (value=gtk_icon_size_small_toolbar_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_icon_size_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_BUTTON"
 			}"
 		end

	gtk_icon_size_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_DIALOG"
 			}"
 		end

	gtk_icon_size_dnd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_DND"
 			}"
 		end

	gtk_icon_size_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_INVALID"
 			}"
 		end

	gtk_icon_size_large_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_LARGE_TOOLBAR"
 			}"
 		end

	gtk_icon_size_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_MENU"
 			}"
 		end

	gtk_icon_size_small_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_SMALL_TOOLBAR"
 			}"
 		end


end -- class GTKICONSIZE_ENUM
