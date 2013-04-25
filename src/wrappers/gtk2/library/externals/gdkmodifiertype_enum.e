-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDKMODIFIERTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gdk_button1_mask_low_level)  or else
				(a_value = gdk_button2_mask_low_level)  or else
				(a_value = gdk_button3_mask_low_level)  or else
				(a_value = gdk_button4_mask_low_level)  or else
				(a_value = gdk_button5_mask_low_level)  or else
				(a_value = gdk_control_mask_low_level)  or else
				(a_value = gdk_hyper_mask_low_level)  or else
				(a_value = gdk_lock_mask_low_level)  or else
				(a_value = gdk_meta_mask_low_level)  or else
				(a_value = gdk_mod1_mask_low_level)  or else
				(a_value = gdk_mod2_mask_low_level)  or else
				(a_value = gdk_mod3_mask_low_level)  or else
				(a_value = gdk_mod4_mask_low_level)  or else
				(a_value = gdk_mod5_mask_low_level)  or else
				(a_value = gdk_modifier_mask_low_level)  or else
				(a_value = gdk_release_mask_low_level)  or else
				(a_value = gdk_shift_mask_low_level)  or else
				(a_value = gdk_super_mask_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gdk_button1_mask is
		do
			value := gdk_button1_mask_low_level
		end

	set_gdk_button2_mask is
		do
			value := gdk_button2_mask_low_level
		end

	set_gdk_button3_mask is
		do
			value := gdk_button3_mask_low_level
		end

	set_gdk_button4_mask is
		do
			value := gdk_button4_mask_low_level
		end

	set_gdk_button5_mask is
		do
			value := gdk_button5_mask_low_level
		end

	set_gdk_control_mask is
		do
			value := gdk_control_mask_low_level
		end

	set_gdk_hyper_mask is
		do
			value := gdk_hyper_mask_low_level
		end

	set_gdk_lock_mask is
		do
			value := gdk_lock_mask_low_level
		end

	set_gdk_meta_mask is
		do
			value := gdk_meta_mask_low_level
		end

	set_gdk_mod1_mask is
		do
			value := gdk_mod1_mask_low_level
		end

	set_gdk_mod2_mask is
		do
			value := gdk_mod2_mask_low_level
		end

	set_gdk_mod3_mask is
		do
			value := gdk_mod3_mask_low_level
		end

	set_gdk_mod4_mask is
		do
			value := gdk_mod4_mask_low_level
		end

	set_gdk_mod5_mask is
		do
			value := gdk_mod5_mask_low_level
		end

	set_gdk_modifier_mask is
		do
			value := gdk_modifier_mask_low_level
		end

	set_gdk_release_mask is
		do
			value := gdk_release_mask_low_level
		end

	set_gdk_shift_mask is
		do
			value := gdk_shift_mask_low_level
		end

	set_gdk_super_mask is
		do
			value := gdk_super_mask_low_level
		end

feature {ANY} -- Queries
	is_gdk_button1_mask: BOOLEAN is
		do
			Result := (value=gdk_button1_mask_low_level)
		end

	is_gdk_button2_mask: BOOLEAN is
		do
			Result := (value=gdk_button2_mask_low_level)
		end

	is_gdk_button3_mask: BOOLEAN is
		do
			Result := (value=gdk_button3_mask_low_level)
		end

	is_gdk_button4_mask: BOOLEAN is
		do
			Result := (value=gdk_button4_mask_low_level)
		end

	is_gdk_button5_mask: BOOLEAN is
		do
			Result := (value=gdk_button5_mask_low_level)
		end

	is_gdk_control_mask: BOOLEAN is
		do
			Result := (value=gdk_control_mask_low_level)
		end

	is_gdk_hyper_mask: BOOLEAN is
		do
			Result := (value=gdk_hyper_mask_low_level)
		end

	is_gdk_lock_mask: BOOLEAN is
		do
			Result := (value=gdk_lock_mask_low_level)
		end

	is_gdk_meta_mask: BOOLEAN is
		do
			Result := (value=gdk_meta_mask_low_level)
		end

	is_gdk_mod1_mask: BOOLEAN is
		do
			Result := (value=gdk_mod1_mask_low_level)
		end

	is_gdk_mod2_mask: BOOLEAN is
		do
			Result := (value=gdk_mod2_mask_low_level)
		end

	is_gdk_mod3_mask: BOOLEAN is
		do
			Result := (value=gdk_mod3_mask_low_level)
		end

	is_gdk_mod4_mask: BOOLEAN is
		do
			Result := (value=gdk_mod4_mask_low_level)
		end

	is_gdk_mod5_mask: BOOLEAN is
		do
			Result := (value=gdk_mod5_mask_low_level)
		end

	is_gdk_modifier_mask: BOOLEAN is
		do
			Result := (value=gdk_modifier_mask_low_level)
		end

	is_gdk_release_mask: BOOLEAN is
		do
			Result := (value=gdk_release_mask_low_level)
		end

	is_gdk_shift_mask: BOOLEAN is
		do
			Result := (value=gdk_shift_mask_low_level)
		end

	is_gdk_super_mask: BOOLEAN is
		do
			Result := (value=gdk_super_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gdk_button1_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON1_MASK"
 			}"
 		end

	gdk_button2_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON2_MASK"
 			}"
 		end

	gdk_button3_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON3_MASK"
 			}"
 		end

	gdk_button4_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON4_MASK"
 			}"
 		end

	gdk_button5_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON5_MASK"
 			}"
 		end

	gdk_control_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CONTROL_MASK"
 			}"
 		end

	gdk_hyper_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HYPER_MASK"
 			}"
 		end

	gdk_lock_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LOCK_MASK"
 			}"
 		end

	gdk_meta_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_META_MASK"
 			}"
 		end

	gdk_mod1_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD1_MASK"
 			}"
 		end

	gdk_mod2_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD2_MASK"
 			}"
 		end

	gdk_mod3_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD3_MASK"
 			}"
 		end

	gdk_mod4_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD4_MASK"
 			}"
 		end

	gdk_mod5_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD5_MASK"
 			}"
 		end

	gdk_modifier_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODIFIER_MASK"
 			}"
 		end

	gdk_release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RELEASE_MASK"
 			}"
 		end

	gdk_shift_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SHIFT_MASK"
 			}"
 		end

	gdk_super_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SUPER_MASK"
 			}"
 		end


end -- class GDKMODIFIERTYPE_ENUM
