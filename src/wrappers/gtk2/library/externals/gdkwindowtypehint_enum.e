-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKWINDOWTYPEHINT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_window_type_hint_combo_low_level)  or else
				(a_value = gdk_window_type_hint_desktop_low_level)  or else
				(a_value = gdk_window_type_hint_dialog_low_level)  or else
				(a_value = gdk_window_type_hint_dnd_low_level)  or else
				(a_value = gdk_window_type_hint_dock_low_level)  or else
				(a_value = gdk_window_type_hint_dropdown_menu_low_level)  or else
				(a_value = gdk_window_type_hint_menu_low_level)  or else
				(a_value = gdk_window_type_hint_normal_low_level)  or else
				(a_value = gdk_window_type_hint_notification_low_level)  or else
				(a_value = gdk_window_type_hint_popup_menu_low_level)  or else
				(a_value = gdk_window_type_hint_splashscreen_low_level)  or else
				(a_value = gdk_window_type_hint_toolbar_low_level)  or else
				(a_value = gdk_window_type_hint_tooltip_low_level)  or else
				(a_value = gdk_window_type_hint_utility_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_window_type_hint_combo is
		do
			value := gdk_window_type_hint_combo_low_level
		end

	set_gdk_window_type_hint_desktop is
		do
			value := gdk_window_type_hint_desktop_low_level
		end

	set_gdk_window_type_hint_dialog is
		do
			value := gdk_window_type_hint_dialog_low_level
		end

	set_gdk_window_type_hint_dnd is
		do
			value := gdk_window_type_hint_dnd_low_level
		end

	set_gdk_window_type_hint_dock is
		do
			value := gdk_window_type_hint_dock_low_level
		end

	set_gdk_window_type_hint_dropdown_menu is
		do
			value := gdk_window_type_hint_dropdown_menu_low_level
		end

	set_gdk_window_type_hint_menu is
		do
			value := gdk_window_type_hint_menu_low_level
		end

	set_gdk_window_type_hint_normal is
		do
			value := gdk_window_type_hint_normal_low_level
		end

	set_gdk_window_type_hint_notification is
		do
			value := gdk_window_type_hint_notification_low_level
		end

	set_gdk_window_type_hint_popup_menu is
		do
			value := gdk_window_type_hint_popup_menu_low_level
		end

	set_gdk_window_type_hint_splashscreen is
		do
			value := gdk_window_type_hint_splashscreen_low_level
		end

	set_gdk_window_type_hint_toolbar is
		do
			value := gdk_window_type_hint_toolbar_low_level
		end

	set_gdk_window_type_hint_tooltip is
		do
			value := gdk_window_type_hint_tooltip_low_level
		end

	set_gdk_window_type_hint_utility is
		do
			value := gdk_window_type_hint_utility_low_level
		end

feature {ANY} -- Queries
	is_gdk_window_type_hint_combo: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_combo_low_level)
		end

	is_gdk_window_type_hint_desktop: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_desktop_low_level)
		end

	is_gdk_window_type_hint_dialog: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_dialog_low_level)
		end

	is_gdk_window_type_hint_dnd: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_dnd_low_level)
		end

	is_gdk_window_type_hint_dock: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_dock_low_level)
		end

	is_gdk_window_type_hint_dropdown_menu: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_dropdown_menu_low_level)
		end

	is_gdk_window_type_hint_menu: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_menu_low_level)
		end

	is_gdk_window_type_hint_normal: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_normal_low_level)
		end

	is_gdk_window_type_hint_notification: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_notification_low_level)
		end

	is_gdk_window_type_hint_popup_menu: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_popup_menu_low_level)
		end

	is_gdk_window_type_hint_splashscreen: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_splashscreen_low_level)
		end

	is_gdk_window_type_hint_toolbar: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_toolbar_low_level)
		end

	is_gdk_window_type_hint_tooltip: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_tooltip_low_level)
		end

	is_gdk_window_type_hint_utility: BOOLEAN is
		do
			Result := (value=gdk_window_type_hint_utility_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_window_type_hint_combo_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_COMBO"
 			}"
 		end

	gdk_window_type_hint_desktop_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DESKTOP"
 			}"
 		end

	gdk_window_type_hint_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DIALOG"
 			}"
 		end

	gdk_window_type_hint_dnd_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DND"
 			}"
 		end

	gdk_window_type_hint_dock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DOCK"
 			}"
 		end

	gdk_window_type_hint_dropdown_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_DROPDOWN_MENU"
 			}"
 		end

	gdk_window_type_hint_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_MENU"
 			}"
 		end

	gdk_window_type_hint_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_NORMAL"
 			}"
 		end

	gdk_window_type_hint_notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_NOTIFICATION"
 			}"
 		end

	gdk_window_type_hint_popup_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_POPUP_MENU"
 			}"
 		end

	gdk_window_type_hint_splashscreen_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_SPLASHSCREEN"
 			}"
 		end

	gdk_window_type_hint_toolbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_TOOLBAR"
 			}"
 		end

	gdk_window_type_hint_tooltip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_TOOLTIP"
 			}"
 		end

	gdk_window_type_hint_utility_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_TYPE_HINT_UTILITY"
 			}"
 		end


end -- class GDKWINDOWTYPEHINT_ENUM
