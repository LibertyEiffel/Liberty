-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GPARAM_FLAGS_ENUM

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
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
	set_g_param_construct
		do
			value := g_param_construct_low_level
		end

	set_g_param_construct_only
		do
			value := g_param_construct_only_low_level
		end

	set_g_param_deprecated
		do
			value := g_param_deprecated_low_level
		end

	set_g_param_lax_validation
		do
			value := g_param_lax_validation_low_level
		end

	set_g_param_private
		do
			value := g_param_private_low_level
		end

	set_g_param_readable
		do
			value := g_param_readable_low_level
		end

	set_g_param_static_blurb
		do
			value := g_param_static_blurb_low_level
		end

	set_g_param_static_name
		do
			value := g_param_static_name_low_level
		end

	set_g_param_static_nick
		do
			value := g_param_static_nick_low_level
		end

	set_g_param_writable
		do
			value := g_param_writable_low_level
		end

feature {ANY} -- Queries
	is_g_param_construct: BOOLEAN
		do
			Result := (value=g_param_construct_low_level)
		end

	is_g_param_construct_only: BOOLEAN
		do
			Result := (value=g_param_construct_only_low_level)
		end

	is_g_param_deprecated: BOOLEAN
		do
			Result := (value=g_param_deprecated_low_level)
		end

	is_g_param_lax_validation: BOOLEAN
		do
			Result := (value=g_param_lax_validation_low_level)
		end

	is_g_param_private: BOOLEAN
		do
			Result := (value=g_param_private_low_level)
		end

	is_g_param_readable: BOOLEAN
		do
			Result := (value=g_param_readable_low_level)
		end

	is_g_param_static_blurb: BOOLEAN
		do
			Result := (value=g_param_static_blurb_low_level)
		end

	is_g_param_static_name: BOOLEAN
		do
			Result := (value=g_param_static_name_low_level)
		end

	is_g_param_static_nick: BOOLEAN
		do
			Result := (value=g_param_static_nick_low_level)
		end

	is_g_param_writable: BOOLEAN
		do
			Result := (value=g_param_writable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	g_param_construct_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT"
 			}"
 		end

	g_param_construct_only_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT_ONLY"
 			}"
 		end

	g_param_deprecated_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_DEPRECATED"
 			}"
 		end

	g_param_lax_validation_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_LAX_VALIDATION"
 			}"
 		end

	g_param_private_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_PRIVATE"
 			}"
 		end

	g_param_readable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_READABLE"
 			}"
 		end

	g_param_static_blurb_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_BLURB"
 			}"
 		end

	g_param_static_name_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NAME"
 			}"
 		end

	g_param_static_nick_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NICK"
 			}"
 		end

	g_param_writable_low_level: INTEGER
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_WRITABLE"
 			}"
 		end


end -- class GPARAM_FLAGS_ENUM
