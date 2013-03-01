-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_EVENT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = nothing_low_level)  or else
				(a_value = delete_low_level)  or else
				(a_value = destroy_low_level)  or else
				(a_value = expose_low_level)  or else
				(a_value = motion_notify_low_level)  or else
				(a_value = button_press_low_level)  or else
				(a_value = a_2button_press_low_level)  or else
				(a_value = a_3button_press_low_level)  or else
				(a_value = button_release_low_level)  or else
				(a_value = key_press_low_level)  or else
				(a_value = key_release_low_level)  or else
				(a_value = enter_notify_low_level)  or else
				(a_value = leave_notify_low_level)  or else
				(a_value = focus_change_low_level)  or else
				(a_value = configure_low_level)  or else
				(a_value = map_low_level)  or else
				(a_value = unmap_low_level)  or else
				(a_value = property_notify_low_level)  or else
				(a_value = selection_clear_low_level)  or else
				(a_value = selection_request_low_level)  or else
				(a_value = selection_notify_low_level)  or else
				(a_value = proximity_in_low_level)  or else
				(a_value = proximity_out_low_level)  or else
				(a_value = drag_enter_low_level)  or else
				(a_value = drag_leave_low_level)  or else
				(a_value = drag_motion_low_level)  or else
				(a_value = drag_status_low_level)  or else
				(a_value = drop_start_low_level)  or else
				(a_value = drop_finished_low_level)  or else
				(a_value = client_event_low_level)  or else
				(a_value = visibility_notify_low_level)  or else
				(a_value = no_expose_low_level)  or else
				(a_value = scroll_low_level)  or else
				(a_value = window_state_low_level)  or else
				(a_value = setting_low_level)  or else
				(a_value = owner_change_low_level)  or else
				(a_value = grab_broken_low_level)  or else
				(a_value = damage_low_level)  or else
				(a_value = event_last_low_level) )
		end

feature -- Setters
	default_create,
	set_nothing is
		do
			value := nothing_low_level
		end

	set_delete is
		do
			value := delete_low_level
		end

	set_destroy is
		do
			value := destroy_low_level
		end

	set_expose is
		do
			value := expose_low_level
		end

	set_motion_notify is
		do
			value := motion_notify_low_level
		end

	set_button_press is
		do
			value := button_press_low_level
		end

	set_a_2button_press is
		do
			value := a_2button_press_low_level
		end

	set_a_3button_press is
		do
			value := a_3button_press_low_level
		end

	set_button_release is
		do
			value := button_release_low_level
		end

	set_key_press is
		do
			value := key_press_low_level
		end

	set_key_release is
		do
			value := key_release_low_level
		end

	set_enter_notify is
		do
			value := enter_notify_low_level
		end

	set_leave_notify is
		do
			value := leave_notify_low_level
		end

	set_focus_change is
		do
			value := focus_change_low_level
		end

	set_configure is
		do
			value := configure_low_level
		end

	set_map is
		do
			value := map_low_level
		end

	set_unmap is
		do
			value := unmap_low_level
		end

	set_property_notify is
		do
			value := property_notify_low_level
		end

	set_selection_clear is
		do
			value := selection_clear_low_level
		end

	set_selection_request is
		do
			value := selection_request_low_level
		end

	set_selection_notify is
		do
			value := selection_notify_low_level
		end

	set_proximity_in is
		do
			value := proximity_in_low_level
		end

	set_proximity_out is
		do
			value := proximity_out_low_level
		end

	set_drag_enter is
		do
			value := drag_enter_low_level
		end

	set_drag_leave is
		do
			value := drag_leave_low_level
		end

	set_drag_motion is
		do
			value := drag_motion_low_level
		end

	set_drag_status is
		do
			value := drag_status_low_level
		end

	set_drop_start is
		do
			value := drop_start_low_level
		end

	set_drop_finished is
		do
			value := drop_finished_low_level
		end

	set_client_event is
		do
			value := client_event_low_level
		end

	set_visibility_notify is
		do
			value := visibility_notify_low_level
		end

	set_no_expose is
		do
			value := no_expose_low_level
		end

	set_scroll is
		do
			value := scroll_low_level
		end

	set_window_state is
		do
			value := window_state_low_level
		end

	set_setting is
		do
			value := setting_low_level
		end

	set_owner_change is
		do
			value := owner_change_low_level
		end

	set_grab_broken is
		do
			value := grab_broken_low_level
		end

	set_damage is
		do
			value := damage_low_level
		end

	set_event_last is
		do
			value := event_last_low_level
		end

feature -- Queries
	nothing: BOOLEAN is
		do
			Result := (value=nothing_low_level)
		end

	delete: BOOLEAN is
		do
			Result := (value=delete_low_level)
		end

	destroy: BOOLEAN is
		do
			Result := (value=destroy_low_level)
		end

	expose: BOOLEAN is
		do
			Result := (value=expose_low_level)
		end

	motion_notify: BOOLEAN is
		do
			Result := (value=motion_notify_low_level)
		end

	button_press: BOOLEAN is
		do
			Result := (value=button_press_low_level)
		end

	a_2button_press: BOOLEAN is
		do
			Result := (value=a_2button_press_low_level)
		end

	a_3button_press: BOOLEAN is
		do
			Result := (value=a_3button_press_low_level)
		end

	button_release: BOOLEAN is
		do
			Result := (value=button_release_low_level)
		end

	key_press: BOOLEAN is
		do
			Result := (value=key_press_low_level)
		end

	key_release: BOOLEAN is
		do
			Result := (value=key_release_low_level)
		end

	enter_notify: BOOLEAN is
		do
			Result := (value=enter_notify_low_level)
		end

	leave_notify: BOOLEAN is
		do
			Result := (value=leave_notify_low_level)
		end

	focus_change: BOOLEAN is
		do
			Result := (value=focus_change_low_level)
		end

	configure: BOOLEAN is
		do
			Result := (value=configure_low_level)
		end

	map: BOOLEAN is
		do
			Result := (value=map_low_level)
		end

	unmap: BOOLEAN is
		do
			Result := (value=unmap_low_level)
		end

	property_notify: BOOLEAN is
		do
			Result := (value=property_notify_low_level)
		end

	selection_clear: BOOLEAN is
		do
			Result := (value=selection_clear_low_level)
		end

	selection_request: BOOLEAN is
		do
			Result := (value=selection_request_low_level)
		end

	selection_notify: BOOLEAN is
		do
			Result := (value=selection_notify_low_level)
		end

	proximity_in: BOOLEAN is
		do
			Result := (value=proximity_in_low_level)
		end

	proximity_out: BOOLEAN is
		do
			Result := (value=proximity_out_low_level)
		end

	drag_enter: BOOLEAN is
		do
			Result := (value=drag_enter_low_level)
		end

	drag_leave: BOOLEAN is
		do
			Result := (value=drag_leave_low_level)
		end

	drag_motion: BOOLEAN is
		do
			Result := (value=drag_motion_low_level)
		end

	drag_status: BOOLEAN is
		do
			Result := (value=drag_status_low_level)
		end

	drop_start: BOOLEAN is
		do
			Result := (value=drop_start_low_level)
		end

	drop_finished: BOOLEAN is
		do
			Result := (value=drop_finished_low_level)
		end

	client_event: BOOLEAN is
		do
			Result := (value=client_event_low_level)
		end

	visibility_notify: BOOLEAN is
		do
			Result := (value=visibility_notify_low_level)
		end

	no_expose: BOOLEAN is
		do
			Result := (value=no_expose_low_level)
		end

	scroll: BOOLEAN is
		do
			Result := (value=scroll_low_level)
		end

	window_state: BOOLEAN is
		do
			Result := (value=window_state_low_level)
		end

	setting: BOOLEAN is
		do
			Result := (value=setting_low_level)
		end

	owner_change: BOOLEAN is
		do
			Result := (value=owner_change_low_level)
		end

	grab_broken: BOOLEAN is
		do
			Result := (value=grab_broken_low_level)
		end

	damage: BOOLEAN is
		do
			Result := (value=damage_low_level)
		end

	event_last: BOOLEAN is
		do
			Result := (value=event_last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	nothing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NOTHING"
 			}"
 		end

	delete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DELETE"
 			}"
 		end

	destroy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DESTROY"
 			}"
 		end

	expose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXPOSE"
 			}"
 		end

	motion_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOTION_NOTIFY"
 			}"
 		end

	button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_PRESS"
 			}"
 		end

	a_2button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_2BUTTON_PRESS"
 			}"
 		end

	a_3button_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_3BUTTON_PRESS"
 			}"
 		end

	button_release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_RELEASE"
 			}"
 		end

	key_press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_PRESS"
 			}"
 		end

	key_release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_RELEASE"
 			}"
 		end

	enter_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ENTER_NOTIFY"
 			}"
 		end

	leave_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEAVE_NOTIFY"
 			}"
 		end

	focus_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FOCUS_CHANGE"
 			}"
 		end

	configure_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CONFIGURE"
 			}"
 		end

	map_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MAP"
 			}"
 		end

	unmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_UNMAP"
 			}"
 		end

	property_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_NOTIFY"
 			}"
 		end

	selection_clear_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_CLEAR"
 			}"
 		end

	selection_request_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_REQUEST"
 			}"
 		end

	selection_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SELECTION_NOTIFY"
 			}"
 		end

	proximity_in_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_IN"
 			}"
 		end

	proximity_out_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_OUT"
 			}"
 		end

	drag_enter_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_ENTER"
 			}"
 		end

	drag_leave_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_LEAVE"
 			}"
 		end

	drag_motion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_MOTION"
 			}"
 		end

	drag_status_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DRAG_STATUS"
 			}"
 		end

	drop_start_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DROP_START"
 			}"
 		end

	drop_finished_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DROP_FINISHED"
 			}"
 		end

	client_event_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CLIENT_EVENT"
 			}"
 		end

	visibility_notify_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_NOTIFY"
 			}"
 		end

	no_expose_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_NO_EXPOSE"
 			}"
 		end

	scroll_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL"
 			}"
 		end

	window_state_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_WINDOW_STATE"
 			}"
 		end

	setting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SETTING"
 			}"
 		end

	owner_change_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_OWNER_CHANGE"
 			}"
 		end

	grab_broken_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_GRAB_BROKEN"
 			}"
 		end

	damage_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_DAMAGE"
 			}"
 		end

	event_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EVENT_LAST"
 			}"
 		end


end -- class GDK_EVENT_TYPE_ENUM
