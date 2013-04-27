-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GPARAMFLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = g_param_construct_low_level)  or else
				(a_value = g_param_construct_only_low_level)  or else
				(a_value = g_param_deprecated_low_level)  or else
				(a_value = g_param_lax_validation_low_level)  or else
				(a_value = g_param_private_low_level)  or else
				(a_value = g_param_readable_low_level)  or else
				(a_value = g_param_static_blurb_low_level)  or else
				(a_value = g_param_static_name_low_level)  or else
				(a_value = g_param_static_nick_low_level)  or else
				(a_value = g_param_writable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_g_param_construct is
		do
			value := g_param_construct_low_level
		end

	set_g_param_construct_only is
		do
			value := g_param_construct_only_low_level
		end

	set_g_param_deprecated is
		do
			value := g_param_deprecated_low_level
		end

	set_g_param_lax_validation is
		do
			value := g_param_lax_validation_low_level
		end

	set_g_param_private is
		do
			value := g_param_private_low_level
		end

	set_g_param_readable is
		do
			value := g_param_readable_low_level
		end

	set_g_param_static_blurb is
		do
			value := g_param_static_blurb_low_level
		end

	set_g_param_static_name is
		do
			value := g_param_static_name_low_level
		end

	set_g_param_static_nick is
		do
			value := g_param_static_nick_low_level
		end

	set_g_param_writable is
		do
			value := g_param_writable_low_level
		end

feature {ANY} -- Queries
	is_g_param_construct: BOOLEAN is
		do
			Result := (value=g_param_construct_low_level)
		end

	is_g_param_construct_only: BOOLEAN is
		do
			Result := (value=g_param_construct_only_low_level)
		end

	is_g_param_deprecated: BOOLEAN is
		do
			Result := (value=g_param_deprecated_low_level)
		end

	is_g_param_lax_validation: BOOLEAN is
		do
			Result := (value=g_param_lax_validation_low_level)
		end

	is_g_param_private: BOOLEAN is
		do
			Result := (value=g_param_private_low_level)
		end

	is_g_param_readable: BOOLEAN is
		do
			Result := (value=g_param_readable_low_level)
		end

	is_g_param_static_blurb: BOOLEAN is
		do
			Result := (value=g_param_static_blurb_low_level)
		end

	is_g_param_static_name: BOOLEAN is
		do
			Result := (value=g_param_static_name_low_level)
		end

	is_g_param_static_nick: BOOLEAN is
		do
			Result := (value=g_param_static_nick_low_level)
		end

	is_g_param_writable: BOOLEAN is
		do
			Result := (value=g_param_writable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_param_construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT"
 			}"
 		end

	g_param_construct_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT_ONLY"
 			}"
 		end

	g_param_deprecated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_DEPRECATED"
 			}"
 		end

	g_param_lax_validation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_LAX_VALIDATION"
 			}"
 		end

	g_param_private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_PRIVATE"
 			}"
 		end

	g_param_readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_READABLE"
 			}"
 		end

	g_param_static_blurb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_BLURB"
 			}"
 		end

	g_param_static_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NAME"
 			}"
 		end

	g_param_static_nick_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NICK"
 			}"
 		end

	g_param_writable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_WRITABLE"
 			}"
 		end


end -- class GPARAMFLAGS_ENUM
