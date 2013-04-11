-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_WINDOW_TYPE_HINT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = dialog_low_level)  or else
				(a_value = menu_low_level)  or else
				(a_value = toolbar_low_level)  or else
				(a_value = splashscreen_low_level)  or else
				(a_value = utility_low_level)  or else
				(a_value = dock_low_level)  or else
				(a_value = desktop_low_level)  or else
				(a_value = dropdown_menu_low_level)  or else
				(a_value = popup_menu_low_level)  or else
				(a_value = tooltip_low_level)  or else
				(a_value = notification_low_level)  or else
				(a_value = combo_low_level)  or else
				(a_value = dnd_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_dialog is
		do
			value := dialog_low_level
		end

	set_menu is
		do
			value := menu_low_level
		end

	set_toolbar is
		do
			value := toolbar_low_level
		end

	set_splashscreen is
		do
			value := splashscreen_low_level
		end

	set_utility is
		do
			value := utility_low_level
		end

	set_dock is
		do
			value := dock_low_level
		end

	set_desktop is
		do
			value := desktop_low_level
		end

	set_dropdown_menu is
		do
			value := dropdown_menu_low_level
		end

	set_popup_menu is
		do
			value := popup_menu_low_level
		end

	set_tooltip is
		do
			value := tooltip_low_level
		end

	set_notification is
		do
			value := notification_low_level
		end

	set_combo is
		do
			value := combo_low_level
		end

	set_dnd is
		do
			value := dnd_low_level
		end

feature {ANY} -- Queries
	normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	dialog: BOOLEAN is
		do
			Result := (value=dialog_low_level)
		end

	menu: BOOLEAN is
		do
			Result := (value=menu_low_level)
		end

	toolbar: BOOLEAN is
		do
			Result := (value=toolbar_low_level)
		end

	splashscreen: BOOLEAN is
		do
			Result := (value=splashscreen_low_level)
		end

	utility: BOOLEAN is
		do
			Result := (value=utility_low_level)
		end

	dock: BOOLEAN is
		do
			Result := (value=dock_low_level)
		end

	desktop: BOOLEAN is
		do
			Result := (value=desktop_low_level)
		end

	dropdown_menu: BOOLEAN is
		do
			Result := (value=dropdown_menu_low_level)
		end

	popup_menu: BOOLEAN is
		do
			Result := (value=popup_menu_low_level)
		end

	tooltip: BOOLEAN is
		do
			Result := (value=tooltip_low_level)
		end

	notification: BOOLEAN is
		do
			Result := (value=notification_low_level)
		end

	combo: BOOLEAN is
		do
			Result := (value=combo_low_level)
		end

	dnd: BOOLEAN is
		do
			Result := (value=dnd_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_NORMAL"
 			}"
 		end

	dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DIALOG"
 			}"
 		end

	menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_MENU"
 			}"
 		end

	toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_TOOLBAR"
 			}"
 		end

	splashscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_SPLASHSCREEN"
 			}"
 		end

	utility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_UTILITY"
 			}"
 		end

	dock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DOCK"
 			}"
 		end

	desktop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DESKTOP"
 			}"
 		end

	dropdown_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU"
 			}"
 		end

	popup_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_POPUP_MENU"
 			}"
 		end

	tooltip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_TOOLTIP"
 			}"
 		end

	notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_NOTIFICATION"
 			}"
 		end

	combo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_COMBO"
 			}"
 		end

	dnd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DND"
 			}"
 		end


end -- class GDK_WINDOW_TYPE_HINT_ENUM
