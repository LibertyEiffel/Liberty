-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_STATE_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = active_low_level)  or else
				(a_value = armed_low_level)  or else
				(a_value = busy_low_level)  or else
				(a_value = checked_low_level)  or else
				(a_value = defunct_low_level)  or else
				(a_value = editable_low_level)  or else
				(a_value = enabled_low_level)  or else
				(a_value = expandable_low_level)  or else
				(a_value = expanded_external_low_level)  or else
				(a_value = focusable_low_level)  or else
				(a_value = focused_low_level)  or else
				(a_value = horizontal_low_level)  or else
				(a_value = iconified_low_level)  or else
				(a_value = modal_low_level)  or else
				(a_value = multi_line_low_level)  or else
				(a_value = multiselectable_low_level)  or else
				(a_value = opaque_low_level)  or else
				(a_value = pressed_low_level)  or else
				(a_value = resizable_low_level)  or else
				(a_value = selectable_low_level)  or else
				(a_value = selected_low_level)  or else
				(a_value = sensitive_low_level)  or else
				(a_value = showing_low_level)  or else
				(a_value = single_line_low_level)  or else
				(a_value = stale_low_level)  or else
				(a_value = transient_low_level)  or else
				(a_value = vertical_low_level)  or else
				(a_value = visible_low_level)  or else
				(a_value = manages_descendants_low_level)  or else
				(a_value = indeterminate_low_level)  or else
				(a_value = truncated_low_level)  or else
				(a_value = required_low_level)  or else
				(a_value = invalid_entry_low_level)  or else
				(a_value = supports_autocompletion_low_level)  or else
				(a_value = selectable_text_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = animated_low_level)  or else
				(a_value = visited_low_level)  or else
				(a_value = last_defined_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_active is
		do
			value := active_low_level
		end

	set_armed is
		do
			value := armed_low_level
		end

	set_busy is
		do
			value := busy_low_level
		end

	set_checked is
		do
			value := checked_low_level
		end

	set_defunct is
		do
			value := defunct_low_level
		end

	set_editable is
		do
			value := editable_low_level
		end

	set_enabled is
		do
			value := enabled_low_level
		end

	set_expandable is
		do
			value := expandable_low_level
		end

	set_expanded_external is
		do
			value := expanded_external_low_level
		end

	set_focusable is
		do
			value := focusable_low_level
		end

	set_focused is
		do
			value := focused_low_level
		end

	set_horizontal is
		do
			value := horizontal_low_level
		end

	set_iconified is
		do
			value := iconified_low_level
		end

	set_modal is
		do
			value := modal_low_level
		end

	set_multi_line is
		do
			value := multi_line_low_level
		end

	set_multiselectable is
		do
			value := multiselectable_low_level
		end

	set_opaque is
		do
			value := opaque_low_level
		end

	set_pressed is
		do
			value := pressed_low_level
		end

	set_resizable is
		do
			value := resizable_low_level
		end

	set_selectable is
		do
			value := selectable_low_level
		end

	set_selected is
		do
			value := selected_low_level
		end

	set_sensitive is
		do
			value := sensitive_low_level
		end

	set_showing is
		do
			value := showing_low_level
		end

	set_single_line is
		do
			value := single_line_low_level
		end

	set_stale is
		do
			value := stale_low_level
		end

	set_transient is
		do
			value := transient_low_level
		end

	set_vertical is
		do
			value := vertical_low_level
		end

	set_visible is
		do
			value := visible_low_level
		end

	set_manages_descendants is
		do
			value := manages_descendants_low_level
		end

	set_indeterminate is
		do
			value := indeterminate_low_level
		end

	set_truncated is
		do
			value := truncated_low_level
		end

	set_required is
		do
			value := required_low_level
		end

	set_invalid_entry is
		do
			value := invalid_entry_low_level
		end

	set_supports_autocompletion is
		do
			value := supports_autocompletion_low_level
		end

	set_selectable_text is
		do
			value := selectable_text_low_level
		end

	set_default_external is
		do
			value := default_external_low_level
		end

	set_animated is
		do
			value := animated_low_level
		end

	set_visited is
		do
			value := visited_low_level
		end

	set_last_defined is
		do
			value := last_defined_low_level
		end

feature {ANY} -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	active: BOOLEAN is
		do
			Result := (value=active_low_level)
		end

	armed: BOOLEAN is
		do
			Result := (value=armed_low_level)
		end

	busy: BOOLEAN is
		do
			Result := (value=busy_low_level)
		end

	checked: BOOLEAN is
		do
			Result := (value=checked_low_level)
		end

	defunct: BOOLEAN is
		do
			Result := (value=defunct_low_level)
		end

	editable: BOOLEAN is
		do
			Result := (value=editable_low_level)
		end

	enabled: BOOLEAN is
		do
			Result := (value=enabled_low_level)
		end

	expandable: BOOLEAN is
		do
			Result := (value=expandable_low_level)
		end

	expanded_external: BOOLEAN is
		do
			Result := (value=expanded_external_low_level)
		end

	focusable: BOOLEAN is
		do
			Result := (value=focusable_low_level)
		end

	focused: BOOLEAN is
		do
			Result := (value=focused_low_level)
		end

	horizontal: BOOLEAN is
		do
			Result := (value=horizontal_low_level)
		end

	iconified: BOOLEAN is
		do
			Result := (value=iconified_low_level)
		end

	modal: BOOLEAN is
		do
			Result := (value=modal_low_level)
		end

	multi_line: BOOLEAN is
		do
			Result := (value=multi_line_low_level)
		end

	multiselectable: BOOLEAN is
		do
			Result := (value=multiselectable_low_level)
		end

	opaque: BOOLEAN is
		do
			Result := (value=opaque_low_level)
		end

	pressed: BOOLEAN is
		do
			Result := (value=pressed_low_level)
		end

	resizable: BOOLEAN is
		do
			Result := (value=resizable_low_level)
		end

	selectable: BOOLEAN is
		do
			Result := (value=selectable_low_level)
		end

	selected: BOOLEAN is
		do
			Result := (value=selected_low_level)
		end

	sensitive: BOOLEAN is
		do
			Result := (value=sensitive_low_level)
		end

	showing: BOOLEAN is
		do
			Result := (value=showing_low_level)
		end

	single_line: BOOLEAN is
		do
			Result := (value=single_line_low_level)
		end

	stale: BOOLEAN is
		do
			Result := (value=stale_low_level)
		end

	transient: BOOLEAN is
		do
			Result := (value=transient_low_level)
		end

	vertical: BOOLEAN is
		do
			Result := (value=vertical_low_level)
		end

	visible: BOOLEAN is
		do
			Result := (value=visible_low_level)
		end

	manages_descendants: BOOLEAN is
		do
			Result := (value=manages_descendants_low_level)
		end

	indeterminate: BOOLEAN is
		do
			Result := (value=indeterminate_low_level)
		end

	truncated: BOOLEAN is
		do
			Result := (value=truncated_low_level)
		end

	required: BOOLEAN is
		do
			Result := (value=required_low_level)
		end

	invalid_entry: BOOLEAN is
		do
			Result := (value=invalid_entry_low_level)
		end

	supports_autocompletion: BOOLEAN is
		do
			Result := (value=supports_autocompletion_low_level)
		end

	selectable_text: BOOLEAN is
		do
			Result := (value=selectable_text_low_level)
		end

	default_external: BOOLEAN is
		do
			Result := (value=default_external_low_level)
		end

	animated: BOOLEAN is
		do
			Result := (value=animated_low_level)
		end

	visited: BOOLEAN is
		do
			Result := (value=visited_low_level)
		end

	last_defined: BOOLEAN is
		do
			Result := (value=last_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INVALID"
 			}"
 		end

	active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ACTIVE"
 			}"
 		end

	armed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ARMED"
 			}"
 		end

	busy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_BUSY"
 			}"
 		end

	checked_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_CHECKED"
 			}"
 		end

	defunct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_DEFUNCT"
 			}"
 		end

	editable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EDITABLE"
 			}"
 		end

	enabled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ENABLED"
 			}"
 		end

	expandable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EXPANDABLE"
 			}"
 		end

	expanded_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_EXPANDED"
 			}"
 		end

	focusable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_FOCUSABLE"
 			}"
 		end

	focused_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_FOCUSED"
 			}"
 		end

	horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_HORIZONTAL"
 			}"
 		end

	iconified_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ICONIFIED"
 			}"
 		end

	modal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MODAL"
 			}"
 		end

	multi_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MULTI_LINE"
 			}"
 		end

	multiselectable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MULTISELECTABLE"
 			}"
 		end

	opaque_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_OPAQUE"
 			}"
 		end

	pressed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_PRESSED"
 			}"
 		end

	resizable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_RESIZABLE"
 			}"
 		end

	selectable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTABLE"
 			}"
 		end

	selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTED"
 			}"
 		end

	sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SENSITIVE"
 			}"
 		end

	showing_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SHOWING"
 			}"
 		end

	single_line_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SINGLE_LINE"
 			}"
 		end

	stale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_STALE"
 			}"
 		end

	transient_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_TRANSIENT"
 			}"
 		end

	vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VERTICAL"
 			}"
 		end

	visible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VISIBLE"
 			}"
 		end

	manages_descendants_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_MANAGES_DESCENDANTS"
 			}"
 		end

	indeterminate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INDETERMINATE"
 			}"
 		end

	truncated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_TRUNCATED"
 			}"
 		end

	required_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_REQUIRED"
 			}"
 		end

	invalid_entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_INVALID_ENTRY"
 			}"
 		end

	supports_autocompletion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SUPPORTS_AUTOCOMPLETION"
 			}"
 		end

	selectable_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_SELECTABLE_TEXT"
 			}"
 		end

	default_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_DEFAULT"
 			}"
 		end

	animated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_ANIMATED"
 			}"
 		end

	visited_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_VISITED"
 			}"
 		end

	last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_STATE_LAST_DEFINED"
 			}"
 		end


end -- class ATK_STATE_TYPE_ENUM
