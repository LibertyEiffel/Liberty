-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_EVENT_MASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = exposure_mask_low_level)  or else
				(a_value = pointer_motion_mask_low_level)  or else
				(a_value = pointer_motion_hint_mask_low_level)  or else
				(a_value = button_motion_mask_low_level)  or else
				(a_value = button1_motion_mask_low_level)  or else
				(a_value = button2_motion_mask_low_level)  or else
				(a_value = button3_motion_mask_low_level)  or else
				(a_value = button_press_mask_low_level)  or else
				(a_value = button_release_mask_low_level)  or else
				(a_value = key_press_mask_low_level)  or else
				(a_value = key_release_mask_low_level)  or else
				(a_value = enter_notify_mask_low_level)  or else
				(a_value = leave_notify_mask_low_level)  or else
				(a_value = focus_change_mask_low_level)  or else
				(a_value = structure_mask_low_level)  or else
				(a_value = property_change_mask_low_level)  or else
				(a_value = visibility_notify_mask_low_level)  or else
				(a_value = proximity_in_mask_low_level)  or else
				(a_value = proximity_out_mask_low_level)  or else
				(a_value = substructure_mask_low_level)  or else
				(a_value = scroll_mask_low_level)  or else
				(a_value = all_events_mask_low_level) )
		end

feature -- Setters
	default_create,
	set_exposure_mask is
		do
			value := exposure_mask_low_level
		end

	set_pointer_motion_mask is
		do
			value := pointer_motion_mask_low_level
		end

	set_pointer_motion_hint_mask is
		do
			value := pointer_motion_hint_mask_low_level
		end

	set_button_motion_mask is
		do
			value := button_motion_mask_low_level
		end

	set_button1_motion_mask is
		do
			value := button1_motion_mask_low_level
		end

	set_button2_motion_mask is
		do
			value := button2_motion_mask_low_level
		end

	set_button3_motion_mask is
		do
			value := button3_motion_mask_low_level
		end

	set_button_press_mask is
		do
			value := button_press_mask_low_level
		end

	set_button_release_mask is
		do
			value := button_release_mask_low_level
		end

	set_key_press_mask is
		do
			value := key_press_mask_low_level
		end

	set_key_release_mask is
		do
			value := key_release_mask_low_level
		end

	set_enter_notify_mask is
		do
			value := enter_notify_mask_low_level
		end

	set_leave_notify_mask is
		do
			value := leave_notify_mask_low_level
		end

	set_focus_change_mask is
		do
			value := focus_change_mask_low_level
		end

	set_structure_mask is
		do
			value := structure_mask_low_level
		end

	set_property_change_mask is
		do
			value := property_change_mask_low_level
		end

	set_visibility_notify_mask is
		do
			value := visibility_notify_mask_low_level
		end

	set_proximity_in_mask is
		do
			value := proximity_in_mask_low_level
		end

	set_proximity_out_mask is
		do
			value := proximity_out_mask_low_level
		end

	set_substructure_mask is
		do
			value := substructure_mask_low_level
		end

	set_scroll_mask is
		do
			value := scroll_mask_low_level
		end

	set_all_events_mask is
		do
			value := all_events_mask_low_level
		end

feature -- Queries
	is_exposure_mask: BOOLEAN is
		do
			Result := (value=exposure_mask_low_level)
		end

	is_pointer_motion_mask: BOOLEAN is
		do
			Result := (value=pointer_motion_mask_low_level)
		end

	is_pointer_motion_hint_mask: BOOLEAN is
		do
			Result := (value=pointer_motion_hint_mask_low_level)
		end

	is_button_motion_mask: BOOLEAN is
		do
			Result := (value=button_motion_mask_low_level)
		end

	is_button1_motion_mask: BOOLEAN is
		do
			Result := (value=button1_motion_mask_low_level)
		end

	is_button2_motion_mask: BOOLEAN is
		do
			Result := (value=button2_motion_mask_low_level)
		end

	is_button3_motion_mask: BOOLEAN is
		do
			Result := (value=button3_motion_mask_low_level)
		end

	is_button_press_mask: BOOLEAN is
		do
			Result := (value=button_press_mask_low_level)
		end

	is_button_release_mask: BOOLEAN is
		do
			Result := (value=button_release_mask_low_level)
		end

	is_key_press_mask: BOOLEAN is
		do
			Result := (value=key_press_mask_low_level)
		end

	is_key_release_mask: BOOLEAN is
		do
			Result := (value=key_release_mask_low_level)
		end

	is_enter_notify_mask: BOOLEAN is
		do
			Result := (value=enter_notify_mask_low_level)
		end

	is_leave_notify_mask: BOOLEAN is
		do
			Result := (value=leave_notify_mask_low_level)
		end

	is_focus_change_mask: BOOLEAN is
		do
			Result := (value=focus_change_mask_low_level)
		end

	is_structure_mask: BOOLEAN is
		do
			Result := (value=structure_mask_low_level)
		end

	is_property_change_mask: BOOLEAN is
		do
			Result := (value=property_change_mask_low_level)
		end

	is_visibility_notify_mask: BOOLEAN is
		do
			Result := (value=visibility_notify_mask_low_level)
		end

	is_proximity_in_mask: BOOLEAN is
		do
			Result := (value=proximity_in_mask_low_level)
		end

	is_proximity_out_mask: BOOLEAN is
		do
			Result := (value=proximity_out_mask_low_level)
		end

	is_substructure_mask: BOOLEAN is
		do
			Result := (value=substructure_mask_low_level)
		end

	is_scroll_mask: BOOLEAN is
		do
			Result := (value=scroll_mask_low_level)
		end

	is_all_events_mask: BOOLEAN is
		do
			Result := (value=all_events_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	exposure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXPOSURE_MASK"
 			}"
 		end

	pointer_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_POINTER_MOTION_MASK"
 			}"
 		end

	pointer_motion_hint_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_POINTER_MOTION_HINT_MASK"
 			}"
 		end

	button_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_MOTION_MASK"
 			}"
 		end

	button1_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON1_MOTION_MASK"
 			}"
 		end

	button2_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON2_MOTION_MASK"
 			}"
 		end

	button3_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON3_MOTION_MASK"
 			}"
 		end

	button_press_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_PRESS_MASK"
 			}"
 		end

	button_release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_RELEASE_MASK"
 			}"
 		end

	key_press_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_PRESS_MASK"
 			}"
 		end

	key_release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_RELEASE_MASK"
 			}"
 		end

	enter_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ENTER_NOTIFY_MASK"
 			}"
 		end

	leave_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEAVE_NOTIFY_MASK"
 			}"
 		end

	focus_change_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FOCUS_CHANGE_MASK"
 			}"
 		end

	structure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STRUCTURE_MASK"
 			}"
 		end

	property_change_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_CHANGE_MASK"
 			}"
 		end

	visibility_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_NOTIFY_MASK"
 			}"
 		end

	proximity_in_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_IN_MASK"
 			}"
 		end

	proximity_out_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_OUT_MASK"
 			}"
 		end

	substructure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SUBSTRUCTURE_MASK"
 			}"
 		end

	scroll_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_MASK"
 			}"
 		end

	all_events_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ALL_EVENTS_MASK"
 			}"
 		end


end -- class GDK_EVENT_MASK_ENUM
