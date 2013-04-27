-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_UIMANAGER_ITEM_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_ui_manager_accelerator_low_level)  or else
				(a_value = gtk_ui_manager_auto_low_level)  or else
				(a_value = gtk_ui_manager_menu_low_level)  or else
				(a_value = gtk_ui_manager_menubar_low_level)  or else
				(a_value = gtk_ui_manager_menuitem_low_level)  or else
				(a_value = gtk_ui_manager_placeholder_low_level)  or else
				(a_value = gtk_ui_manager_popup_low_level)  or else
				(a_value = gtk_ui_manager_popup_with_accels_low_level)  or else
				(a_value = gtk_ui_manager_separator_low_level)  or else
				(a_value = gtk_ui_manager_toolbar_low_level)  or else
				(a_value = gtk_ui_manager_toolitem_low_level) )
		end

feature -- Setters
	default_create,
	set_gtk_ui_manager_accelerator is
		do
			value := gtk_ui_manager_accelerator_low_level
		end

	set_gtk_ui_manager_auto is
		do
			value := gtk_ui_manager_auto_low_level
		end

	set_gtk_ui_manager_menu is
		do
			value := gtk_ui_manager_menu_low_level
		end

	set_gtk_ui_manager_menubar is
		do
			value := gtk_ui_manager_menubar_low_level
		end

	set_gtk_ui_manager_menuitem is
		do
			value := gtk_ui_manager_menuitem_low_level
		end

	set_gtk_ui_manager_placeholder is
		do
			value := gtk_ui_manager_placeholder_low_level
		end

	set_gtk_ui_manager_popup is
		do
			value := gtk_ui_manager_popup_low_level
		end

	set_gtk_ui_manager_popup_with_accels is
		do
			value := gtk_ui_manager_popup_with_accels_low_level
		end

	set_gtk_ui_manager_separator is
		do
			value := gtk_ui_manager_separator_low_level
		end

	set_gtk_ui_manager_toolbar is
		do
			value := gtk_ui_manager_toolbar_low_level
		end

	set_gtk_ui_manager_toolitem is
		do
			value := gtk_ui_manager_toolitem_low_level
		end

feature -- Queries
	is_gtk_ui_manager_accelerator: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_accelerator_low_level)
		end

	is_gtk_ui_manager_auto: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_auto_low_level)
		end

	is_gtk_ui_manager_menu: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_menu_low_level)
		end

	is_gtk_ui_manager_menubar: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_menubar_low_level)
		end

	is_gtk_ui_manager_menuitem: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_menuitem_low_level)
		end

	is_gtk_ui_manager_placeholder: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_placeholder_low_level)
		end

	is_gtk_ui_manager_popup: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_popup_low_level)
		end

	is_gtk_ui_manager_popup_with_accels: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_popup_with_accels_low_level)
		end

	is_gtk_ui_manager_separator: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_separator_low_level)
		end

	is_gtk_ui_manager_toolbar: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_toolbar_low_level)
		end

	is_gtk_ui_manager_toolitem: BOOLEAN is
		do
			Result := (value=gtk_ui_manager_toolitem_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_ui_manager_accelerator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_ACCELERATOR"
 			}"
 		end

	gtk_ui_manager_auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_AUTO"
 			}"
 		end

	gtk_ui_manager_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENU"
 			}"
 		end

	gtk_ui_manager_menubar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENUBAR"
 			}"
 		end

	gtk_ui_manager_menuitem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_MENUITEM"
 			}"
 		end

	gtk_ui_manager_placeholder_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_PLACEHOLDER"
 			}"
 		end

	gtk_ui_manager_popup_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_POPUP"
 			}"
 		end

	gtk_ui_manager_popup_with_accels_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_POPUP_WITH_ACCELS"
 			}"
 		end

	gtk_ui_manager_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_SEPARATOR"
 			}"
 		end

	gtk_ui_manager_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_TOOLBAR"
 			}"
 		end

	gtk_ui_manager_toolitem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UI_MANAGER_TOOLITEM"
 			}"
 		end


end -- class GTK_UIMANAGER_ITEM_TYPE_ENUM
