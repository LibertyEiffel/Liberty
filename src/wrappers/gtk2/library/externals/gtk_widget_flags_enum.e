-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_WIDGET_FLAGS_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := (a_value & (gtk_app_paintable_low_level | 
				gtk_can_focus_low_level | 
				gtk_composite_child_low_level | 
				gtk_double_buffered_low_level | 
				gtk_has_default_low_level | 
				gtk_has_focus_low_level | 
				gtk_has_grab_low_level | 
				gtk_mapped_low_level | 
				gtk_no_show_all_low_level | 
				gtk_no_window_low_level | 
				gtk_parent_sensitive_low_level | 
				gtk_rc_style_low_level | 
				gtk_realized_low_level | 
				gtk_receives_default_low_level | 
				gtk_sensitive_low_level | 
				gtk_toplevel_low_level | 
				gtk_visible_low_level)).to_boolean
		end

feature -- Setters
	default_create,
	set_gtk_app_paintable is
		do
			value := value.bit_or(gtk_app_paintable_low_level)
		end

	unset_gtk_app_paintable is
		do
			value := value.bit_xor(gtk_app_paintable_low_level)
		end

	set_gtk_can_focus is
		do
			value := value.bit_or(gtk_can_focus_low_level)
		end

	unset_gtk_can_focus is
		do
			value := value.bit_xor(gtk_can_focus_low_level)
		end

	set_gtk_composite_child is
		do
			value := value.bit_or(gtk_composite_child_low_level)
		end

	unset_gtk_composite_child is
		do
			value := value.bit_xor(gtk_composite_child_low_level)
		end

	set_gtk_double_buffered is
		do
			value := value.bit_or(gtk_double_buffered_low_level)
		end

	unset_gtk_double_buffered is
		do
			value := value.bit_xor(gtk_double_buffered_low_level)
		end

	set_gtk_has_default is
		do
			value := value.bit_or(gtk_has_default_low_level)
		end

	unset_gtk_has_default is
		do
			value := value.bit_xor(gtk_has_default_low_level)
		end

	set_gtk_has_focus is
		do
			value := value.bit_or(gtk_has_focus_low_level)
		end

	unset_gtk_has_focus is
		do
			value := value.bit_xor(gtk_has_focus_low_level)
		end

	set_gtk_has_grab is
		do
			value := value.bit_or(gtk_has_grab_low_level)
		end

	unset_gtk_has_grab is
		do
			value := value.bit_xor(gtk_has_grab_low_level)
		end

	set_gtk_mapped is
		do
			value := value.bit_or(gtk_mapped_low_level)
		end

	unset_gtk_mapped is
		do
			value := value.bit_xor(gtk_mapped_low_level)
		end

	set_gtk_no_show_all is
		do
			value := value.bit_or(gtk_no_show_all_low_level)
		end

	unset_gtk_no_show_all is
		do
			value := value.bit_xor(gtk_no_show_all_low_level)
		end

	set_gtk_no_window is
		do
			value := value.bit_or(gtk_no_window_low_level)
		end

	unset_gtk_no_window is
		do
			value := value.bit_xor(gtk_no_window_low_level)
		end

	set_gtk_parent_sensitive is
		do
			value := value.bit_or(gtk_parent_sensitive_low_level)
		end

	unset_gtk_parent_sensitive is
		do
			value := value.bit_xor(gtk_parent_sensitive_low_level)
		end

	set_gtk_rc_style is
		do
			value := value.bit_or(gtk_rc_style_low_level)
		end

	unset_gtk_rc_style is
		do
			value := value.bit_xor(gtk_rc_style_low_level)
		end

	set_gtk_realized is
		do
			value := value.bit_or(gtk_realized_low_level)
		end

	unset_gtk_realized is
		do
			value := value.bit_xor(gtk_realized_low_level)
		end

	set_gtk_receives_default is
		do
			value := value.bit_or(gtk_receives_default_low_level)
		end

	unset_gtk_receives_default is
		do
			value := value.bit_xor(gtk_receives_default_low_level)
		end

	set_gtk_sensitive is
		do
			value := value.bit_or(gtk_sensitive_low_level)
		end

	unset_gtk_sensitive is
		do
			value := value.bit_xor(gtk_sensitive_low_level)
		end

	set_gtk_toplevel is
		do
			value := value.bit_or(gtk_toplevel_low_level)
		end

	unset_gtk_toplevel is
		do
			value := value.bit_xor(gtk_toplevel_low_level)
		end

	set_gtk_visible is
		do
			value := value.bit_or(gtk_visible_low_level)
		end

	unset_gtk_visible is
		do
			value := value.bit_xor(gtk_visible_low_level)
		end

feature -- Queries
	is_gtk_app_paintable: BOOLEAN is
		do
			Result := (value=gtk_app_paintable_low_level)
		end

	is_gtk_can_focus: BOOLEAN is
		do
			Result := (value=gtk_can_focus_low_level)
		end

	is_gtk_composite_child: BOOLEAN is
		do
			Result := (value=gtk_composite_child_low_level)
		end

	is_gtk_double_buffered: BOOLEAN is
		do
			Result := (value=gtk_double_buffered_low_level)
		end

	is_gtk_has_default: BOOLEAN is
		do
			Result := (value=gtk_has_default_low_level)
		end

	is_gtk_has_focus: BOOLEAN is
		do
			Result := (value=gtk_has_focus_low_level)
		end

	is_gtk_has_grab: BOOLEAN is
		do
			Result := (value=gtk_has_grab_low_level)
		end

	is_gtk_mapped: BOOLEAN is
		do
			Result := (value=gtk_mapped_low_level)
		end

	is_gtk_no_show_all: BOOLEAN is
		do
			Result := (value=gtk_no_show_all_low_level)
		end

	is_gtk_no_window: BOOLEAN is
		do
			Result := (value=gtk_no_window_low_level)
		end

	is_gtk_parent_sensitive: BOOLEAN is
		do
			Result := (value=gtk_parent_sensitive_low_level)
		end

	is_gtk_rc_style: BOOLEAN is
		do
			Result := (value=gtk_rc_style_low_level)
		end

	is_gtk_realized: BOOLEAN is
		do
			Result := (value=gtk_realized_low_level)
		end

	is_gtk_receives_default: BOOLEAN is
		do
			Result := (value=gtk_receives_default_low_level)
		end

	is_gtk_sensitive: BOOLEAN is
		do
			Result := (value=gtk_sensitive_low_level)
		end

	is_gtk_toplevel: BOOLEAN is
		do
			Result := (value=gtk_toplevel_low_level)
		end

	is_gtk_visible: BOOLEAN is
		do
			Result := (value=gtk_visible_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_app_paintable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_APP_PAINTABLE"
 			}"
 		end

	gtk_can_focus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_CAN_FOCUS"
 			}"
 		end

	gtk_composite_child_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_COMPOSITE_CHILD"
 			}"
 		end

	gtk_double_buffered_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_DOUBLE_BUFFERED"
 			}"
 		end

	gtk_has_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_DEFAULT"
 			}"
 		end

	gtk_has_focus_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_FOCUS"
 			}"
 		end

	gtk_has_grab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_HAS_GRAB"
 			}"
 		end

	gtk_mapped_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_MAPPED"
 			}"
 		end

	gtk_no_show_all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_NO_SHOW_ALL"
 			}"
 		end

	gtk_no_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_NO_WINDOW"
 			}"
 		end

	gtk_parent_sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_PARENT_SENSITIVE"
 			}"
 		end

	gtk_rc_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RC_STYLE"
 			}"
 		end

	gtk_realized_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_REALIZED"
 			}"
 		end

	gtk_receives_default_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_RECEIVES_DEFAULT"
 			}"
 		end

	gtk_sensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_SENSITIVE"
 			}"
 		end

	gtk_toplevel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_TOPLEVEL"
 			}"
 		end

	gtk_visible_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module: "plugin"
 			feature_name: "GTK_VISIBLE"
 			}"
 		end


end -- class GTK_WIDGET_FLAGS_ENUM
