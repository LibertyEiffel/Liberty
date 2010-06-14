-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GDK_MODIFIER_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = shift_mask_low_level)  or else
				(a_value = lock_mask_low_level)  or else
				(a_value = control_mask_low_level)  or else
				(a_value = mod1_mask_low_level)  or else
				(a_value = mod2_mask_low_level)  or else
				(a_value = mod3_mask_low_level)  or else
				(a_value = mod4_mask_low_level)  or else
				(a_value = mod5_mask_low_level)  or else
				(a_value = button1_mask_low_level)  or else
				(a_value = button2_mask_low_level)  or else
				(a_value = button3_mask_low_level)  or else
				(a_value = button4_mask_low_level)  or else
				(a_value = button5_mask_low_level)  or else
				(a_value = super_mask_low_level)  or else
				(a_value = hyper_mask_low_level)  or else
				(a_value = meta_mask_low_level)  or else
				(a_value = release_mask_low_level)  or else
				(a_value = modifier_mask_low_level) )
		end

feature -- Setters
	default_create,
	set_shift_mask is
		do
			value := shift_mask_low_level
		end

	set_lock_mask is
		do
			value := lock_mask_low_level
		end

	set_control_mask is
		do
			value := control_mask_low_level
		end

	set_mod1_mask is
		do
			value := mod1_mask_low_level
		end

	set_mod2_mask is
		do
			value := mod2_mask_low_level
		end

	set_mod3_mask is
		do
			value := mod3_mask_low_level
		end

	set_mod4_mask is
		do
			value := mod4_mask_low_level
		end

	set_mod5_mask is
		do
			value := mod5_mask_low_level
		end

	set_button1_mask is
		do
			value := button1_mask_low_level
		end

	set_button2_mask is
		do
			value := button2_mask_low_level
		end

	set_button3_mask is
		do
			value := button3_mask_low_level
		end

	set_button4_mask is
		do
			value := button4_mask_low_level
		end

	set_button5_mask is
		do
			value := button5_mask_low_level
		end

	set_super_mask is
		do
			value := super_mask_low_level
		end

	set_hyper_mask is
		do
			value := hyper_mask_low_level
		end

	set_meta_mask is
		do
			value := meta_mask_low_level
		end

	set_release_mask is
		do
			value := release_mask_low_level
		end

	set_modifier_mask is
		do
			value := modifier_mask_low_level
		end

feature -- Queries
	is_shift_mask: BOOLEAN is
		do
			Result := (value=shift_mask_low_level)
		end

	is_lock_mask: BOOLEAN is
		do
			Result := (value=lock_mask_low_level)
		end

	is_control_mask: BOOLEAN is
		do
			Result := (value=control_mask_low_level)
		end

	is_mod1_mask: BOOLEAN is
		do
			Result := (value=mod1_mask_low_level)
		end

	is_mod2_mask: BOOLEAN is
		do
			Result := (value=mod2_mask_low_level)
		end

	is_mod3_mask: BOOLEAN is
		do
			Result := (value=mod3_mask_low_level)
		end

	is_mod4_mask: BOOLEAN is
		do
			Result := (value=mod4_mask_low_level)
		end

	is_mod5_mask: BOOLEAN is
		do
			Result := (value=mod5_mask_low_level)
		end

	is_button1_mask: BOOLEAN is
		do
			Result := (value=button1_mask_low_level)
		end

	is_button2_mask: BOOLEAN is
		do
			Result := (value=button2_mask_low_level)
		end

	is_button3_mask: BOOLEAN is
		do
			Result := (value=button3_mask_low_level)
		end

	is_button4_mask: BOOLEAN is
		do
			Result := (value=button4_mask_low_level)
		end

	is_button5_mask: BOOLEAN is
		do
			Result := (value=button5_mask_low_level)
		end

	is_super_mask: BOOLEAN is
		do
			Result := (value=super_mask_low_level)
		end

	is_hyper_mask: BOOLEAN is
		do
			Result := (value=hyper_mask_low_level)
		end

	is_meta_mask: BOOLEAN is
		do
			Result := (value=meta_mask_low_level)
		end

	is_release_mask: BOOLEAN is
		do
			Result := (value=release_mask_low_level)
		end

	is_modifier_mask: BOOLEAN is
		do
			Result := (value=modifier_mask_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	shift_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SHIFT_MASK"
 			}"
 		end

	lock_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_LOCK_MASK"
 			}"
 		end

	control_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_CONTROL_MASK"
 			}"
 		end

	mod1_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD1_MASK"
 			}"
 		end

	mod2_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD2_MASK"
 			}"
 		end

	mod3_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD3_MASK"
 			}"
 		end

	mod4_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD4_MASK"
 			}"
 		end

	mod5_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MOD5_MASK"
 			}"
 		end

	button1_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON1_MASK"
 			}"
 		end

	button2_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON2_MASK"
 			}"
 		end

	button3_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON3_MASK"
 			}"
 		end

	button4_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON4_MASK"
 			}"
 		end

	button5_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_BUTTON5_MASK"
 			}"
 		end

	super_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_SUPER_MASK"
 			}"
 		end

	hyper_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_HYPER_MASK"
 			}"
 		end

	meta_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_META_MASK"
 			}"
 		end

	release_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_RELEASE_MASK"
 			}"
 		end

	modifier_mask_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GDK_MODIFIER_MASK"
 			}"
 		end


end -- class GDK_MODIFIER_TYPE_ENUM
