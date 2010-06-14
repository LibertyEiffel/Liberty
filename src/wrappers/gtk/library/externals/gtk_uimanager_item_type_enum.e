-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_UIMANAGER_ITEM_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = auto_low_level)  or else
				(a_value = menubar_low_level)  or else
				(a_value = menu_low_level)  or else
				(a_value = toolbar_low_level)  or else
				(a_value = placeholder_low_level)  or else
				(a_value = popup_low_level)  or else
				(a_value = menuitem_low_level)  or else
				(a_value = toolitem_low_level)  or else
				(a_value = separator_low_level)  or else
				(a_value = accelerator_low_level)  or else
				(a_value = popup_with_accels_low_level) )
		end

feature -- Setters
	default_create,
	set_auto is
		do
			value := auto_low_level
		end

	set_menubar is
		do
			value := menubar_low_level
		end

	set_menu is
		do
			value := menu_low_level
		end

	set_toolbar is
		do
			value := toolbar_low_level
		end

	set_placeholder is
		do
			value := placeholder_low_level
		end

	set_popup is
		do
			value := popup_low_level
		end

	set_menuitem is
		do
			value := menuitem_low_level
		end

	set_toolitem is
		do
			value := toolitem_low_level
		end

	set_separator is
		do
			value := separator_low_level
		end

	set_accelerator is
		do
			value := accelerator_low_level
		end

	set_popup_with_accels is
		do
			value := popup_with_accels_low_level
		end

feature -- Queries
	is_auto: BOOLEAN is
		do
			Result := (value=auto_low_level)
		end

	is_menubar: BOOLEAN is
		do
			Result := (value=menubar_low_level)
		end

	is_menu: BOOLEAN is
		do
			Result := (value=menu_low_level)
		end

	is_toolbar: BOOLEAN is
		do
			Result := (value=toolbar_low_level)
		end

	is_placeholder: BOOLEAN is
		do
			Result := (value=placeholder_low_level)
		end

	is_popup: BOOLEAN is
		do
			Result := (value=popup_low_level)
		end

	is_menuitem: BOOLEAN is
		do
			Result := (value=menuitem_low_level)
		end

	is_toolitem: BOOLEAN is
		do
			Result := (value=toolitem_low_level)
		end

	is_separator: BOOLEAN is
		do
			Result := (value=separator_low_level)
		end

	is_accelerator: BOOLEAN is
		do
			Result := (value=accelerator_low_level)
		end

	is_popup_with_accels: BOOLEAN is
		do
			Result := (value=popup_with_accels_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_AUTO"
 			}"
 		end

	menubar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENUBAR"
 			}"
 		end

	menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENU"
 			}"
 		end

	toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_TOOLBAR"
 			}"
 		end

	placeholder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_PLACEHOLDER"
 			}"
 		end

	popup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_POPUP"
 			}"
 		end

	menuitem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENUITEM"
 			}"
 		end

	toolitem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_TOOLITEM"
 			}"
 		end

	separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_SEPARATOR"
 			}"
 		end

	accelerator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_ACCELERATOR"
 			}"
 		end

	popup_with_accels_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_POPUP_WITH_ACCELS"
 			}"
 		end


end -- class GTK_UIMANAGER_ITEM_TYPE_ENUM
