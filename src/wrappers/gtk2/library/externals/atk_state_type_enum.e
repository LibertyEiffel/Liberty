-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_STATE_TYPE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_state_active_low_level)  or else
				(a_value = atk_state_animated_low_level)  or else
				(a_value = atk_state_armed_low_level)  or else
				(a_value = atk_state_busy_low_level)  or else
				(a_value = atk_state_checked_low_level)  or else
				(a_value = atk_state_default_low_level)  or else
				(a_value = atk_state_defunct_low_level)  or else
				(a_value = atk_state_editable_low_level)  or else
				(a_value = atk_state_enabled_low_level)  or else
				(a_value = atk_state_expandable_low_level)  or else
				(a_value = atk_state_expanded_low_level)  or else
				(a_value = atk_state_focusable_low_level)  or else
				(a_value = atk_state_focused_low_level)  or else
				(a_value = atk_state_horizontal_low_level)  or else
				(a_value = atk_state_iconified_low_level)  or else
				(a_value = atk_state_indeterminate_low_level)  or else
				(a_value = atk_state_invalid_low_level)  or else
				(a_value = atk_state_invalid_entry_low_level)  or else
				(a_value = atk_state_last_defined_low_level)  or else
				(a_value = atk_state_manages_descendants_low_level)  or else
				(a_value = atk_state_modal_low_level)  or else
				(a_value = atk_state_multi_line_low_level)  or else
				(a_value = atk_state_multiselectable_low_level)  or else
				(a_value = atk_state_opaque_low_level)  or else
				(a_value = atk_state_pressed_low_level)  or else
				(a_value = atk_state_required_low_level)  or else
				(a_value = atk_state_resizable_low_level)  or else
				(a_value = atk_state_selectable_low_level)  or else
				(a_value = atk_state_selectable_text_low_level)  or else
				(a_value = atk_state_selected_low_level)  or else
				(a_value = atk_state_sensitive_low_level)  or else
				(a_value = atk_state_showing_low_level)  or else
				(a_value = atk_state_single_line_low_level)  or else
				(a_value = atk_state_stale_low_level)  or else
				(a_value = atk_state_supports_autocompletion_low_level)  or else
				(a_value = atk_state_transient_low_level)  or else
				(a_value = atk_state_truncated_low_level)  or else
				(a_value = atk_state_vertical_low_level)  or else
				(a_value = atk_state_visible_low_level)  or else
				(a_value = atk_state_visited_low_level) )
		end

feature -- Setters
	default_create,
	set_atk_state_active is
		do
			value := atk_state_active_low_level
		end

	set_atk_state_animated is
		do
			value := atk_state_animated_low_level
		end

	set_atk_state_armed is
		do
			value := atk_state_armed_low_level
		end

	set_atk_state_busy is
		do
			value := atk_state_busy_low_level
		end

	set_atk_state_checked is
		do
			value := atk_state_checked_low_level
		end

	set_atk_state_default is
		do
			value := atk_state_default_low_level
		end

	set_atk_state_defunct is
		do
			value := atk_state_defunct_low_level
		end

	set_atk_state_editable is
		do
			value := atk_state_editable_low_level
		end

	set_atk_state_enabled is
		do
			value := atk_state_enabled_low_level
		end

	set_atk_state_expandable is
		do
			value := atk_state_expandable_low_level
		end

	set_atk_state_expanded is
		do
			value := atk_state_expanded_low_level
		end

	set_atk_state_focusable is
		do
			value := atk_state_focusable_low_level
		end

	set_atk_state_focused is
		do
			value := atk_state_focused_low_level
		end

	set_atk_state_horizontal is
		do
			value := atk_state_horizontal_low_level
		end

	set_atk_state_iconified is
		do
			value := atk_state_iconified_low_level
		end

	set_atk_state_indeterminate is
		do
			value := atk_state_indeterminate_low_level
		end

	set_atk_state_invalid is
		do
			value := atk_state_invalid_low_level
		end

	set_atk_state_invalid_entry is
		do
			value := atk_state_invalid_entry_low_level
		end

	set_atk_state_last_defined is
		do
			value := atk_state_last_defined_low_level
		end

	set_atk_state_manages_descendants is
		do
			value := atk_state_manages_descendants_low_level
		end

	set_atk_state_modal is
		do
			value := atk_state_modal_low_level
		end

	set_atk_state_multi_line is
		do
			value := atk_state_multi_line_low_level
		end

	set_atk_state_multiselectable is
		do
			value := atk_state_multiselectable_low_level
		end

	set_atk_state_opaque is
		do
			value := atk_state_opaque_low_level
		end

	set_atk_state_pressed is
		do
			value := atk_state_pressed_low_level
		end

	set_atk_state_required is
		do
			value := atk_state_required_low_level
		end

	set_atk_state_resizable is
		do
			value := atk_state_resizable_low_level
		end

	set_atk_state_selectable is
		do
			value := atk_state_selectable_low_level
		end

	set_atk_state_selectable_text is
		do
			value := atk_state_selectable_text_low_level
		end

	set_atk_state_selected is
		do
			value := atk_state_selected_low_level
		end

	set_atk_state_sensitive is
		do
			value := atk_state_sensitive_low_level
		end

	set_atk_state_showing is
		do
			value := atk_state_showing_low_level
		end

	set_atk_state_single_line is
		do
			value := atk_state_single_line_low_level
		end

	set_atk_state_stale is
		do
			value := atk_state_stale_low_level
		end

	set_atk_state_supports_autocompletion is
		do
			value := atk_state_supports_autocompletion_low_level
		end

	set_atk_state_transient is
		do
			value := atk_state_transient_low_level
		end

	set_atk_state_truncated is
		do
			value := atk_state_truncated_low_level
		end

	set_atk_state_vertical is
		do
			value := atk_state_vertical_low_level
		end

	set_atk_state_visible is
		do
			value := atk_state_visible_low_level
		end

	set_atk_state_visited is
		do
			value := atk_state_visited_low_level
		end

feature -- Queries
	is_atk_state_active: BOOLEAN is
		do
			Result := (value=atk_state_active_low_level)
		end

	is_atk_state_animated: BOOLEAN is
		do
			Result := (value=atk_state_animated_low_level)
		end

	is_atk_state_armed: BOOLEAN is
		do
			Result := (value=atk_state_armed_low_level)
		end

	is_atk_state_busy: BOOLEAN is
		do
			Result := (value=atk_state_busy_low_level)
		end

	is_atk_state_checked: BOOLEAN is
		do
			Result := (value=atk_state_checked_low_level)
		end

	is_atk_state_default: BOOLEAN is
		do
			Result := (value=atk_state_default_low_level)
		end

	is_atk_state_defunct: BOOLEAN is
		do
			Result := (value=atk_state_defunct_low_level)
		end

	is_atk_state_editable: BOOLEAN is
		do
			Result := (value=atk_state_editable_low_level)
		end

	is_atk_state_enabled: BOOLEAN is
		do
			Result := (value=atk_state_enabled_low_level)
		end

	is_atk_state_expandable: BOOLEAN is
		do
			Result := (value=atk_state_expandable_low_level)
		end

	is_atk_state_expanded: BOOLEAN is
		do
			Result := (value=atk_state_expanded_low_level)
		end

	is_atk_state_focusable: BOOLEAN is
		do
			Result := (value=atk_state_focusable_low_level)
		end

	is_atk_state_focused: BOOLEAN is
		do
			Result := (value=atk_state_focused_low_level)
		end

	is_atk_state_horizontal: BOOLEAN is
		do
			Result := (value=atk_state_horizontal_low_level)
		end

	is_atk_state_iconified: BOOLEAN is
		do
			Result := (value=atk_state_iconified_low_level)
		end

	is_atk_state_indeterminate: BOOLEAN is
		do
			Result := (value=atk_state_indeterminate_low_level)
		end

	is_atk_state_invalid: BOOLEAN is
		do
			Result := (value=atk_state_invalid_low_level)
		end

	is_atk_state_invalid_entry: BOOLEAN is
		do
			Result := (value=atk_state_invalid_entry_low_level)
		end

	is_atk_state_last_defined: BOOLEAN is
		do
			Result := (value=atk_state_last_defined_low_level)
		end

	is_atk_state_manages_descendants: BOOLEAN is
		do
			Result := (value=atk_state_manages_descendants_low_level)
		end

	is_atk_state_modal: BOOLEAN is
		do
			Result := (value=atk_state_modal_low_level)
		end

	is_atk_state_multi_line: BOOLEAN is
		do
			Result := (value=atk_state_multi_line_low_level)
		end

	is_atk_state_multiselectable: BOOLEAN is
		do
			Result := (value=atk_state_multiselectable_low_level)
		end

	is_atk_state_opaque: BOOLEAN is
		do
			Result := (value=atk_state_opaque_low_level)
		end

	is_atk_state_pressed: BOOLEAN is
		do
			Result := (value=atk_state_pressed_low_level)
		end

	is_atk_state_required: BOOLEAN is
		do
			Result := (value=atk_state_required_low_level)
		end

	is_atk_state_resizable: BOOLEAN is
		do
			Result := (value=atk_state_resizable_low_level)
		end

	is_atk_state_selectable: BOOLEAN is
		do
			Result := (value=atk_state_selectable_low_level)
		end

	is_atk_state_selectable_text: BOOLEAN is
		do
			Result := (value=atk_state_selectable_text_low_level)
		end

	is_atk_state_selected: BOOLEAN is
		do
			Result := (value=atk_state_selected_low_level)
		end

	is_atk_state_sensitive: BOOLEAN is
		do
			Result := (value=atk_state_sensitive_low_level)
		end

	is_atk_state_showing: BOOLEAN is
		do
			Result := (value=atk_state_showing_low_level)
		end

	is_atk_state_single_line: BOOLEAN is
		do
			Result := (value=atk_state_single_line_low_level)
		end

	is_atk_state_stale: BOOLEAN is
		do
			Result := (value=atk_state_stale_low_level)
		end

	is_atk_state_supports_autocompletion: BOOLEAN is
		do
			Result := (value=atk_state_supports_autocompletion_low_level)
		end

	is_atk_state_transient: BOOLEAN is
		do
			Result := (value=atk_state_transient_low_level)
		end

	is_atk_state_truncated: BOOLEAN is
		do
			Result := (value=atk_state_truncated_low_level)
		end

	is_atk_state_vertical: BOOLEAN is
		do
			Result := (value=atk_state_vertical_low_level)
		end

	is_atk_state_visible: BOOLEAN is
		do
			Result := (value=atk_state_visible_low_level)
		end

	is_atk_state_visited: BOOLEAN is
		do
			Result := (value=atk_state_visited_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_state_active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ACTIVE"
 			}"
 		end

	atk_state_animated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ANIMATED"
 			}"
 		end

	atk_state_armed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ARMED"
 			}"
 		end

	atk_state_busy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_BUSY"
 			}"
 		end

	atk_state_checked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_CHECKED"
 			}"
 		end

	atk_state_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_DEFAULT"
 			}"
 		end

	atk_state_defunct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_DEFUNCT"
 			}"
 		end

	atk_state_editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EDITABLE"
 			}"
 		end

	atk_state_enabled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ENABLED"
 			}"
 		end

	atk_state_expandable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EXPANDABLE"
 			}"
 		end

	atk_state_expanded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EXPANDED"
 			}"
 		end

	atk_state_focusable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_FOCUSABLE"
 			}"
 		end

	atk_state_focused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_FOCUSED"
 			}"
 		end

	atk_state_horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_HORIZONTAL"
 			}"
 		end

	atk_state_iconified_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ICONIFIED"
 			}"
 		end

	atk_state_indeterminate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INDETERMINATE"
 			}"
 		end

	atk_state_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INVALID"
 			}"
 		end

	atk_state_invalid_entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INVALID_ENTRY"
 			}"
 		end

	atk_state_last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_LAST_DEFINED"
 			}"
 		end

	atk_state_manages_descendants_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MANAGES_DESCENDANTS"
 			}"
 		end

	atk_state_modal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MODAL"
 			}"
 		end

	atk_state_multi_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MULTI_LINE"
 			}"
 		end

	atk_state_multiselectable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MULTISELECTABLE"
 			}"
 		end

	atk_state_opaque_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_OPAQUE"
 			}"
 		end

	atk_state_pressed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_PRESSED"
 			}"
 		end

	atk_state_required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_REQUIRED"
 			}"
 		end

	atk_state_resizable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_RESIZABLE"
 			}"
 		end

	atk_state_selectable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTABLE"
 			}"
 		end

	atk_state_selectable_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTABLE_TEXT"
 			}"
 		end

	atk_state_selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTED"
 			}"
 		end

	atk_state_sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SENSITIVE"
 			}"
 		end

	atk_state_showing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SHOWING"
 			}"
 		end

	atk_state_single_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SINGLE_LINE"
 			}"
 		end

	atk_state_stale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_STALE"
 			}"
 		end

	atk_state_supports_autocompletion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SUPPORTS_AUTOCOMPLETION"
 			}"
 		end

	atk_state_transient_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_TRANSIENT"
 			}"
 		end

	atk_state_truncated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_TRUNCATED"
 			}"
 		end

	atk_state_vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VERTICAL"
 			}"
 		end

	atk_state_visible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VISIBLE"
 			}"
 		end

	atk_state_visited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VISITED"
 			}"
 		end


end -- class ATK_STATE_TYPE_ENUM
