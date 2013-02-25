-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ICON_SIZE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = menu_low_level)  or else
				(a_value = small_toolbar_low_level)  or else
				(a_value = large_toolbar_low_level)  or else
				(a_value = button_low_level)  or else
				(a_value = dnd_low_level)  or else
				(a_value = dialog_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_menu is
		do
			value := menu_low_level
		end

	set_small_toolbar is
		do
			value := small_toolbar_low_level
		end

	set_large_toolbar is
		do
			value := large_toolbar_low_level
		end

	set_button is
		do
			value := button_low_level
		end

	set_dnd is
		do
			value := dnd_low_level
		end

	set_dialog is
		do
			value := dialog_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	menu: BOOLEAN is
		do
			Result := (value=menu_low_level)
		end

	small_toolbar: BOOLEAN is
		do
			Result := (value=small_toolbar_low_level)
		end

	large_toolbar: BOOLEAN is
		do
			Result := (value=large_toolbar_low_level)
		end

	button: BOOLEAN is
		do
			Result := (value=button_low_level)
		end

	dnd: BOOLEAN is
		do
			Result := (value=dnd_low_level)
		end

	dialog: BOOLEAN is
		do
			Result := (value=dialog_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_INVALID"
 			}"
 		end

	menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_MENU"
 			}"
 		end

	small_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_SMALL_TOOLBAR"
 			}"
 		end

	large_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_LARGE_TOOLBAR"
 			}"
 		end

	button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_BUTTON"
 			}"
 		end

	dnd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_DND"
 			}"
 		end

	dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_SIZE_DIALOG"
 			}"
 		end


end -- class GTK_ICON_SIZE_ENUM
