-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_WIDGET_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := (a_value & (toplevel_low_level | 
				realized_low_level | 
				mapped_low_level | 
				visible_low_level | 
				sensitive_low_level | 
				parent_sensitive_low_level | 
				can_focus_low_level | 
				has_focus_low_level | 
				can_default_low_level | 
				has_default_low_level | 
				has_grab_low_level | 
				rc_style_low_level | 
				composite_child_low_level | 
				app_paintable_low_level | 
				receives_default_low_level | 
				double_buffered_low_level | 
				no_show_all_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_toplevel is
		do
			value := value.bit_or(toplevel_low_level)
		end

	unset_toplevel is
		do
			value := value.bit_xor(toplevel_low_level)
		end

	set_realized is
		do
			value := value.bit_or(realized_low_level)
		end

	unset_realized is
		do
			value := value.bit_xor(realized_low_level)
		end

	set_mapped is
		do
			value := value.bit_or(mapped_low_level)
		end

	unset_mapped is
		do
			value := value.bit_xor(mapped_low_level)
		end

	set_visible is
		do
			value := value.bit_or(visible_low_level)
		end

	unset_visible is
		do
			value := value.bit_xor(visible_low_level)
		end

	set_sensitive is
		do
			value := value.bit_or(sensitive_low_level)
		end

	unset_sensitive is
		do
			value := value.bit_xor(sensitive_low_level)
		end

	set_parent_sensitive is
		do
			value := value.bit_or(parent_sensitive_low_level)
		end

	unset_parent_sensitive is
		do
			value := value.bit_xor(parent_sensitive_low_level)
		end

	set_can_focus is
		do
			value := value.bit_or(can_focus_low_level)
		end

	unset_can_focus is
		do
			value := value.bit_xor(can_focus_low_level)
		end

	set_has_focus is
		do
			value := value.bit_or(has_focus_low_level)
		end

	unset_has_focus is
		do
			value := value.bit_xor(has_focus_low_level)
		end

	set_can_default is
		do
			value := value.bit_or(can_default_low_level)
		end

	unset_can_default is
		do
			value := value.bit_xor(can_default_low_level)
		end

	set_has_default is
		do
			value := value.bit_or(has_default_low_level)
		end

	unset_has_default is
		do
			value := value.bit_xor(has_default_low_level)
		end

	set_has_grab is
		do
			value := value.bit_or(has_grab_low_level)
		end

	unset_has_grab is
		do
			value := value.bit_xor(has_grab_low_level)
		end

	set_rc_style is
		do
			value := value.bit_or(rc_style_low_level)
		end

	unset_rc_style is
		do
			value := value.bit_xor(rc_style_low_level)
		end

	set_composite_child is
		do
			value := value.bit_or(composite_child_low_level)
		end

	unset_composite_child is
		do
			value := value.bit_xor(composite_child_low_level)
		end

	set_app_paintable is
		do
			value := value.bit_or(app_paintable_low_level)
		end

	unset_app_paintable is
		do
			value := value.bit_xor(app_paintable_low_level)
		end

	set_receives_default is
		do
			value := value.bit_or(receives_default_low_level)
		end

	unset_receives_default is
		do
			value := value.bit_xor(receives_default_low_level)
		end

	set_double_buffered is
		do
			value := value.bit_or(double_buffered_low_level)
		end

	unset_double_buffered is
		do
			value := value.bit_xor(double_buffered_low_level)
		end

	set_no_show_all is
		do
			value := value.bit_or(no_show_all_low_level)
		end

	unset_no_show_all is
		do
			value := value.bit_xor(no_show_all_low_level)
		end

feature -- Queries
	is_toplevel: BOOLEAN is
		do
			Result := (value=toplevel_low_level)
		end

	is_realized: BOOLEAN is
		do
			Result := (value=realized_low_level)
		end

	is_mapped: BOOLEAN is
		do
			Result := (value=mapped_low_level)
		end

	is_visible: BOOLEAN is
		do
			Result := (value=visible_low_level)
		end

	is_sensitive: BOOLEAN is
		do
			Result := (value=sensitive_low_level)
		end

	is_parent_sensitive: BOOLEAN is
		do
			Result := (value=parent_sensitive_low_level)
		end

	is_can_focus: BOOLEAN is
		do
			Result := (value=can_focus_low_level)
		end

	is_has_focus: BOOLEAN is
		do
			Result := (value=has_focus_low_level)
		end

	is_can_default: BOOLEAN is
		do
			Result := (value=can_default_low_level)
		end

	is_has_default: BOOLEAN is
		do
			Result := (value=has_default_low_level)
		end

	is_has_grab: BOOLEAN is
		do
			Result := (value=has_grab_low_level)
		end

	is_rc_style: BOOLEAN is
		do
			Result := (value=rc_style_low_level)
		end

	is_composite_child: BOOLEAN is
		do
			Result := (value=composite_child_low_level)
		end

	is_app_paintable: BOOLEAN is
		do
			Result := (value=app_paintable_low_level)
		end

	is_receives_default: BOOLEAN is
		do
			Result := (value=receives_default_low_level)
		end

	is_double_buffered: BOOLEAN is
		do
			Result := (value=double_buffered_low_level)
		end

	is_no_show_all: BOOLEAN is
		do
			Result := (value=no_show_all_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	toplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TOPLEVEL"
 			}"
 		end

	realized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_REALIZED"
 			}"
 		end

	mapped_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_MAPPED"
 			}"
 		end

	visible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_VISIBLE"
 			}"
 		end

	sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_SENSITIVE"
 			}"
 		end

	parent_sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_PARENT_SENSITIVE"
 			}"
 		end

	can_focus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CAN_FOCUS"
 			}"
 		end

	has_focus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_FOCUS"
 			}"
 		end

	can_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CAN_DEFAULT"
 			}"
 		end

	has_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_DEFAULT"
 			}"
 		end

	has_grab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_GRAB"
 			}"
 		end

	rc_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_STYLE"
 			}"
 		end

	composite_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_COMPOSITE_CHILD"
 			}"
 		end

	app_paintable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_APP_PAINTABLE"
 			}"
 		end

	receives_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECEIVES_DEFAULT"
 			}"
 		end

	double_buffered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DOUBLE_BUFFERED"
 			}"
 		end

	no_show_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_NO_SHOW_ALL"
 			}"
 		end


end -- class GTK_WIDGET_FLAGS_ENUM
