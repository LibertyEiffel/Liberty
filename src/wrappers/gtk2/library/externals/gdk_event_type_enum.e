-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_EVENT_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_2button_press_low_level)  or else
				(a_value = gdk_3button_press_low_level)  or else
				(a_value = gdk_button_press_low_level)  or else
				(a_value = gdk_button_release_low_level)  or else
				(a_value = gdk_client_event_low_level)  or else
				(a_value = gdk_configure_low_level)  or else
				(a_value = gdk_damage_low_level)  or else
				(a_value = gdk_delete_low_level)  or else
				(a_value = gdk_destroy_low_level)  or else
				(a_value = gdk_drag_enter_low_level)  or else
				(a_value = gdk_drag_leave_low_level)  or else
				(a_value = gdk_drag_motion_low_level)  or else
				(a_value = gdk_drag_status_low_level)  or else
				(a_value = gdk_drop_finished_low_level)  or else
				(a_value = gdk_drop_start_low_level)  or else
				(a_value = gdk_enter_notify_low_level)  or else
				(a_value = gdk_event_last_low_level)  or else
				(a_value = gdk_expose_low_level)  or else
				(a_value = gdk_focus_change_low_level)  or else
				(a_value = gdk_grab_broken_low_level)  or else
				(a_value = gdk_key_press_low_level)  or else
				(a_value = gdk_key_release_low_level)  or else
				(a_value = gdk_leave_notify_low_level)  or else
				(a_value = gdk_map_low_level)  or else
				(a_value = gdk_motion_notify_low_level)  or else
				(a_value = gdk_no_expose_low_level)  or else
				(a_value = gdk_nothing_low_level)  or else
				(a_value = gdk_owner_change_low_level)  or else
				(a_value = gdk_property_notify_low_level)  or else
				(a_value = gdk_proximity_in_low_level)  or else
				(a_value = gdk_proximity_out_low_level)  or else
				(a_value = gdk_scroll_low_level)  or else
				(a_value = gdk_selection_clear_low_level)  or else
				(a_value = gdk_selection_notify_low_level)  or else
				(a_value = gdk_selection_request_low_level)  or else
				(a_value = gdk_setting_low_level)  or else
				(a_value = gdk_unmap_low_level)  or else
				(a_value = gdk_visibility_notify_low_level)  or else
				(a_value = gdk_window_state_low_level) )
		end

feature -- Setters
	default_create,
	set_gdk_2button_press is
		do
			value := gdk_2button_press_low_level
		end

	set_gdk_3button_press is
		do
			value := gdk_3button_press_low_level
		end

	set_gdk_button_press is
		do
			value := gdk_button_press_low_level
		end

	set_gdk_button_release is
		do
			value := gdk_button_release_low_level
		end

	set_gdk_client_event is
		do
			value := gdk_client_event_low_level
		end

	set_gdk_configure is
		do
			value := gdk_configure_low_level
		end

	set_gdk_damage is
		do
			value := gdk_damage_low_level
		end

	set_gdk_delete is
		do
			value := gdk_delete_low_level
		end

	set_gdk_destroy is
		do
			value := gdk_destroy_low_level
		end

	set_gdk_drag_enter is
		do
			value := gdk_drag_enter_low_level
		end

	set_gdk_drag_leave is
		do
			value := gdk_drag_leave_low_level
		end

	set_gdk_drag_motion is
		do
			value := gdk_drag_motion_low_level
		end

	set_gdk_drag_status is
		do
			value := gdk_drag_status_low_level
		end

	set_gdk_drop_finished is
		do
			value := gdk_drop_finished_low_level
		end

	set_gdk_drop_start is
		do
			value := gdk_drop_start_low_level
		end

	set_gdk_enter_notify is
		do
			value := gdk_enter_notify_low_level
		end

	set_gdk_event_last is
		do
			value := gdk_event_last_low_level
		end

	set_gdk_expose is
		do
			value := gdk_expose_low_level
		end

	set_gdk_focus_change is
		do
			value := gdk_focus_change_low_level
		end

	set_gdk_grab_broken is
		do
			value := gdk_grab_broken_low_level
		end

	set_gdk_key_press is
		do
			value := gdk_key_press_low_level
		end

	set_gdk_key_release is
		do
			value := gdk_key_release_low_level
		end

	set_gdk_leave_notify is
		do
			value := gdk_leave_notify_low_level
		end

	set_gdk_map is
		do
			value := gdk_map_low_level
		end

	set_gdk_motion_notify is
		do
			value := gdk_motion_notify_low_level
		end

	set_gdk_no_expose is
		do
			value := gdk_no_expose_low_level
		end

	set_gdk_nothing is
		do
			value := gdk_nothing_low_level
		end

	set_gdk_owner_change is
		do
			value := gdk_owner_change_low_level
		end

	set_gdk_property_notify is
		do
			value := gdk_property_notify_low_level
		end

	set_gdk_proximity_in is
		do
			value := gdk_proximity_in_low_level
		end

	set_gdk_proximity_out is
		do
			value := gdk_proximity_out_low_level
		end

	set_gdk_scroll is
		do
			value := gdk_scroll_low_level
		end

	set_gdk_selection_clear is
		do
			value := gdk_selection_clear_low_level
		end

	set_gdk_selection_notify is
		do
			value := gdk_selection_notify_low_level
		end

	set_gdk_selection_request is
		do
			value := gdk_selection_request_low_level
		end

	set_gdk_setting is
		do
			value := gdk_setting_low_level
		end

	set_gdk_unmap is
		do
			value := gdk_unmap_low_level
		end

	set_gdk_visibility_notify is
		do
			value := gdk_visibility_notify_low_level
		end

	set_gdk_window_state is
		do
			value := gdk_window_state_low_level
		end

feature -- Queries
	is_gdk_2button_press: BOOLEAN is
		do
			Result := (value=gdk_2button_press_low_level)
		end

	is_gdk_3button_press: BOOLEAN is
		do
			Result := (value=gdk_3button_press_low_level)
		end

	is_gdk_button_press: BOOLEAN is
		do
			Result := (value=gdk_button_press_low_level)
		end

	is_gdk_button_release: BOOLEAN is
		do
			Result := (value=gdk_button_release_low_level)
		end

	is_gdk_client_event: BOOLEAN is
		do
			Result := (value=gdk_client_event_low_level)
		end

	is_gdk_configure: BOOLEAN is
		do
			Result := (value=gdk_configure_low_level)
		end

	is_gdk_damage: BOOLEAN is
		do
			Result := (value=gdk_damage_low_level)
		end

	is_gdk_delete: BOOLEAN is
		do
			Result := (value=gdk_delete_low_level)
		end

	is_gdk_destroy: BOOLEAN is
		do
			Result := (value=gdk_destroy_low_level)
		end

	is_gdk_drag_enter: BOOLEAN is
		do
			Result := (value=gdk_drag_enter_low_level)
		end

	is_gdk_drag_leave: BOOLEAN is
		do
			Result := (value=gdk_drag_leave_low_level)
		end

	is_gdk_drag_motion: BOOLEAN is
		do
			Result := (value=gdk_drag_motion_low_level)
		end

	is_gdk_drag_status: BOOLEAN is
		do
			Result := (value=gdk_drag_status_low_level)
		end

	is_gdk_drop_finished: BOOLEAN is
		do
			Result := (value=gdk_drop_finished_low_level)
		end

	is_gdk_drop_start: BOOLEAN is
		do
			Result := (value=gdk_drop_start_low_level)
		end

	is_gdk_enter_notify: BOOLEAN is
		do
			Result := (value=gdk_enter_notify_low_level)
		end

	is_gdk_event_last: BOOLEAN is
		do
			Result := (value=gdk_event_last_low_level)
		end

	is_gdk_expose: BOOLEAN is
		do
			Result := (value=gdk_expose_low_level)
		end

	is_gdk_focus_change: BOOLEAN is
		do
			Result := (value=gdk_focus_change_low_level)
		end

	is_gdk_grab_broken: BOOLEAN is
		do
			Result := (value=gdk_grab_broken_low_level)
		end

	is_gdk_key_press: BOOLEAN is
		do
			Result := (value=gdk_key_press_low_level)
		end

	is_gdk_key_release: BOOLEAN is
		do
			Result := (value=gdk_key_release_low_level)
		end

	is_gdk_leave_notify: BOOLEAN is
		do
			Result := (value=gdk_leave_notify_low_level)
		end

	is_gdk_map: BOOLEAN is
		do
			Result := (value=gdk_map_low_level)
		end

	is_gdk_motion_notify: BOOLEAN is
		do
			Result := (value=gdk_motion_notify_low_level)
		end

	is_gdk_no_expose: BOOLEAN is
		do
			Result := (value=gdk_no_expose_low_level)
		end

	is_gdk_nothing: BOOLEAN is
		do
			Result := (value=gdk_nothing_low_level)
		end

	is_gdk_owner_change: BOOLEAN is
		do
			Result := (value=gdk_owner_change_low_level)
		end

	is_gdk_property_notify: BOOLEAN is
		do
			Result := (value=gdk_property_notify_low_level)
		end

	is_gdk_proximity_in: BOOLEAN is
		do
			Result := (value=gdk_proximity_in_low_level)
		end

	is_gdk_proximity_out: BOOLEAN is
		do
			Result := (value=gdk_proximity_out_low_level)
		end

	is_gdk_scroll: BOOLEAN is
		do
			Result := (value=gdk_scroll_low_level)
		end

	is_gdk_selection_clear: BOOLEAN is
		do
			Result := (value=gdk_selection_clear_low_level)
		end

	is_gdk_selection_notify: BOOLEAN is
		do
			Result := (value=gdk_selection_notify_low_level)
		end

	is_gdk_selection_request: BOOLEAN is
		do
			Result := (value=gdk_selection_request_low_level)
		end

	is_gdk_setting: BOOLEAN is
		do
			Result := (value=gdk_setting_low_level)
		end

	is_gdk_unmap: BOOLEAN is
		do
			Result := (value=gdk_unmap_low_level)
		end

	is_gdk_visibility_notify: BOOLEAN is
		do
			Result := (value=gdk_visibility_notify_low_level)
		end

	is_gdk_window_state: BOOLEAN is
		do
			Result := (value=gdk_window_state_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_2button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_2BUTTON_PRESS"
 			}"
 		end

	gdk_3button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_3BUTTON_PRESS"
 			}"
 		end

	gdk_button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_PRESS"
 			}"
 		end

	gdk_button_release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_RELEASE"
 			}"
 		end

	gdk_client_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLIENT_EVENT"
 			}"
 		end

	gdk_configure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CONFIGURE"
 			}"
 		end

	gdk_damage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DAMAGE"
 			}"
 		end

	gdk_delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DELETE"
 			}"
 		end

	gdk_destroy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DESTROY"
 			}"
 		end

	gdk_drag_enter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_ENTER"
 			}"
 		end

	gdk_drag_leave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_LEAVE"
 			}"
 		end

	gdk_drag_motion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_MOTION"
 			}"
 		end

	gdk_drag_status_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_STATUS"
 			}"
 		end

	gdk_drop_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DROP_FINISHED"
 			}"
 		end

	gdk_drop_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DROP_START"
 			}"
 		end

	gdk_enter_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ENTER_NOTIFY"
 			}"
 		end

	gdk_event_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EVENT_LAST"
 			}"
 		end

	gdk_expose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXPOSE"
 			}"
 		end

	gdk_focus_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FOCUS_CHANGE"
 			}"
 		end

	gdk_grab_broken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_BROKEN"
 			}"
 		end

	gdk_key_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_PRESS"
 			}"
 		end

	gdk_key_release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_RELEASE"
 			}"
 		end

	gdk_leave_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEAVE_NOTIFY"
 			}"
 		end

	gdk_map_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MAP"
 			}"
 		end

	gdk_motion_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOTION_NOTIFY"
 			}"
 		end

	gdk_no_expose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NO_EXPOSE"
 			}"
 		end

	gdk_nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTHING"
 			}"
 		end

	gdk_owner_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE"
 			}"
 		end

	gdk_property_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_NOTIFY"
 			}"
 		end

	gdk_proximity_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_IN"
 			}"
 		end

	gdk_proximity_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_OUT"
 			}"
 		end

	gdk_scroll_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL"
 			}"
 		end

	gdk_selection_clear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_CLEAR"
 			}"
 		end

	gdk_selection_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_NOTIFY"
 			}"
 		end

	gdk_selection_request_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_REQUEST"
 			}"
 		end

	gdk_setting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SETTING"
 			}"
 		end

	gdk_unmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UNMAP"
 			}"
 		end

	gdk_visibility_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_NOTIFY"
 			}"
 		end

	gdk_window_state_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_STATE"
 			}"
 		end


end -- class GDK_EVENT_TYPE_ENUM
