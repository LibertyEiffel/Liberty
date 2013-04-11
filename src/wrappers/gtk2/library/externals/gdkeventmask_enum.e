-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKEVENTMASK_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_all_events_mask_low_level)  or else
				(a_value = gdk_button1_motion_mask_low_level)  or else
				(a_value = gdk_button2_motion_mask_low_level)  or else
				(a_value = gdk_button3_motion_mask_low_level)  or else
				(a_value = gdk_button_motion_mask_low_level)  or else
				(a_value = gdk_button_press_mask_low_level)  or else
				(a_value = gdk_button_release_mask_low_level)  or else
				(a_value = gdk_enter_notify_mask_low_level)  or else
				(a_value = gdk_exposure_mask_low_level)  or else
				(a_value = gdk_focus_change_mask_low_level)  or else
				(a_value = gdk_key_press_mask_low_level)  or else
				(a_value = gdk_key_release_mask_low_level)  or else
				(a_value = gdk_leave_notify_mask_low_level)  or else
				(a_value = gdk_pointer_motion_hint_mask_low_level)  or else
				(a_value = gdk_pointer_motion_mask_low_level)  or else
				(a_value = gdk_property_change_mask_low_level)  or else
				(a_value = gdk_proximity_in_mask_low_level)  or else
				(a_value = gdk_proximity_out_mask_low_level)  or else
				(a_value = gdk_scroll_mask_low_level)  or else
				(a_value = gdk_structure_mask_low_level)  or else
				(a_value = gdk_substructure_mask_low_level)  or else
				(a_value = gdk_visibility_notify_mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_all_events_mask is
		do
			value := gdk_all_events_mask_low_level
		end

	set_gdk_button1_motion_mask is
		do
			value := gdk_button1_motion_mask_low_level
		end

	set_gdk_button2_motion_mask is
		do
			value := gdk_button2_motion_mask_low_level
		end

	set_gdk_button3_motion_mask is
		do
			value := gdk_button3_motion_mask_low_level
		end

	set_gdk_button_motion_mask is
		do
			value := gdk_button_motion_mask_low_level
		end

	set_gdk_button_press_mask is
		do
			value := gdk_button_press_mask_low_level
		end

	set_gdk_button_release_mask is
		do
			value := gdk_button_release_mask_low_level
		end

	set_gdk_enter_notify_mask is
		do
			value := gdk_enter_notify_mask_low_level
		end

	set_gdk_exposure_mask is
		do
			value := gdk_exposure_mask_low_level
		end

	set_gdk_focus_change_mask is
		do
			value := gdk_focus_change_mask_low_level
		end

	set_gdk_key_press_mask is
		do
			value := gdk_key_press_mask_low_level
		end

	set_gdk_key_release_mask is
		do
			value := gdk_key_release_mask_low_level
		end

	set_gdk_leave_notify_mask is
		do
			value := gdk_leave_notify_mask_low_level
		end

	set_gdk_pointer_motion_hint_mask is
		do
			value := gdk_pointer_motion_hint_mask_low_level
		end

	set_gdk_pointer_motion_mask is
		do
			value := gdk_pointer_motion_mask_low_level
		end

	set_gdk_property_change_mask is
		do
			value := gdk_property_change_mask_low_level
		end

	set_gdk_proximity_in_mask is
		do
			value := gdk_proximity_in_mask_low_level
		end

	set_gdk_proximity_out_mask is
		do
			value := gdk_proximity_out_mask_low_level
		end

	set_gdk_scroll_mask is
		do
			value := gdk_scroll_mask_low_level
		end

	set_gdk_structure_mask is
		do
			value := gdk_structure_mask_low_level
		end

	set_gdk_substructure_mask is
		do
			value := gdk_substructure_mask_low_level
		end

	set_gdk_visibility_notify_mask is
		do
			value := gdk_visibility_notify_mask_low_level
		end

feature {ANY} -- Queries
	is_gdk_all_events_mask: BOOLEAN is
		do
			Result := (value=gdk_all_events_mask_low_level)
		end

	is_gdk_button1_motion_mask: BOOLEAN is
		do
			Result := (value=gdk_button1_motion_mask_low_level)
		end

	is_gdk_button2_motion_mask: BOOLEAN is
		do
			Result := (value=gdk_button2_motion_mask_low_level)
		end

	is_gdk_button3_motion_mask: BOOLEAN is
		do
			Result := (value=gdk_button3_motion_mask_low_level)
		end

	is_gdk_button_motion_mask: BOOLEAN is
		do
			Result := (value=gdk_button_motion_mask_low_level)
		end

	is_gdk_button_press_mask: BOOLEAN is
		do
			Result := (value=gdk_button_press_mask_low_level)
		end

	is_gdk_button_release_mask: BOOLEAN is
		do
			Result := (value=gdk_button_release_mask_low_level)
		end

	is_gdk_enter_notify_mask: BOOLEAN is
		do
			Result := (value=gdk_enter_notify_mask_low_level)
		end

	is_gdk_exposure_mask: BOOLEAN is
		do
			Result := (value=gdk_exposure_mask_low_level)
		end

	is_gdk_focus_change_mask: BOOLEAN is
		do
			Result := (value=gdk_focus_change_mask_low_level)
		end

	is_gdk_key_press_mask: BOOLEAN is
		do
			Result := (value=gdk_key_press_mask_low_level)
		end

	is_gdk_key_release_mask: BOOLEAN is
		do
			Result := (value=gdk_key_release_mask_low_level)
		end

	is_gdk_leave_notify_mask: BOOLEAN is
		do
			Result := (value=gdk_leave_notify_mask_low_level)
		end

	is_gdk_pointer_motion_hint_mask: BOOLEAN is
		do
			Result := (value=gdk_pointer_motion_hint_mask_low_level)
		end

	is_gdk_pointer_motion_mask: BOOLEAN is
		do
			Result := (value=gdk_pointer_motion_mask_low_level)
		end

	is_gdk_property_change_mask: BOOLEAN is
		do
			Result := (value=gdk_property_change_mask_low_level)
		end

	is_gdk_proximity_in_mask: BOOLEAN is
		do
			Result := (value=gdk_proximity_in_mask_low_level)
		end

	is_gdk_proximity_out_mask: BOOLEAN is
		do
			Result := (value=gdk_proximity_out_mask_low_level)
		end

	is_gdk_scroll_mask: BOOLEAN is
		do
			Result := (value=gdk_scroll_mask_low_level)
		end

	is_gdk_structure_mask: BOOLEAN is
		do
			Result := (value=gdk_structure_mask_low_level)
		end

	is_gdk_substructure_mask: BOOLEAN is
		do
			Result := (value=gdk_substructure_mask_low_level)
		end

	is_gdk_visibility_notify_mask: BOOLEAN is
		do
			Result := (value=gdk_visibility_notify_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_all_events_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ALL_EVENTS_MASK"
 			}"
 		end

	gdk_button1_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON1_MOTION_MASK"
 			}"
 		end

	gdk_button2_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON2_MOTION_MASK"
 			}"
 		end

	gdk_button3_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON3_MOTION_MASK"
 			}"
 		end

	gdk_button_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_MOTION_MASK"
 			}"
 		end

	gdk_button_press_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_PRESS_MASK"
 			}"
 		end

	gdk_button_release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON_RELEASE_MASK"
 			}"
 		end

	gdk_enter_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_ENTER_NOTIFY_MASK"
 			}"
 		end

	gdk_exposure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_EXPOSURE_MASK"
 			}"
 		end

	gdk_focus_change_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_FOCUS_CHANGE_MASK"
 			}"
 		end

	gdk_key_press_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_PRESS_MASK"
 			}"
 		end

	gdk_key_release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_KEY_RELEASE_MASK"
 			}"
 		end

	gdk_leave_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LEAVE_NOTIFY_MASK"
 			}"
 		end

	gdk_pointer_motion_hint_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_POINTER_MOTION_HINT_MASK"
 			}"
 		end

	gdk_pointer_motion_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_POINTER_MOTION_MASK"
 			}"
 		end

	gdk_property_change_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROPERTY_CHANGE_MASK"
 			}"
 		end

	gdk_proximity_in_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_IN_MASK"
 			}"
 		end

	gdk_proximity_out_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_PROXIMITY_OUT_MASK"
 			}"
 		end

	gdk_scroll_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SCROLL_MASK"
 			}"
 		end

	gdk_structure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_STRUCTURE_MASK"
 			}"
 		end

	gdk_substructure_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SUBSTRUCTURE_MASK"
 			}"
 		end

	gdk_visibility_notify_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_VISIBILITY_NOTIFY_MASK"
 			}"
 		end


end -- class GDKEVENTMASK_ENUM
