-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GPARAM_FLAGS_ENUM

insert ENUM

creation {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = construct_low_level)  or else
				(a_value = construct_only_low_level)  or else
				(a_value = deprecated_low_level)  or else
				(a_value = lax_validation_low_level)  or else
				(a_value = private_low_level)  or else
				(a_value = readable_low_level)  or else
				(a_value = static_blurb_low_level)  or else
				(a_value = static_name_low_level)  or else
				(a_value = static_nick_low_level)  or else
				(a_value = writable_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_construct is
		do
			value := construct_low_level
		end

	set_construct_only is
		do
			value := construct_only_low_level
		end

	set_deprecated is
		do
			value := deprecated_low_level
		end

	set_lax_validation is
		do
			value := lax_validation_low_level
		end

	set_private is
		do
			value := private_low_level
		end

	set_readable is
		do
			value := readable_low_level
		end

	set_static_blurb is
		do
			value := static_blurb_low_level
		end

	set_static_name is
		do
			value := static_name_low_level
		end

	set_static_nick is
		do
			value := static_nick_low_level
		end

	set_writable is
		do
			value := writable_low_level
		end

feature {ANY} -- Queries
	is_construct: BOOLEAN is
		do
			Result := (value=construct_low_level)
		end

	is_construct_only: BOOLEAN is
		do
			Result := (value=construct_only_low_level)
		end

	is_deprecated: BOOLEAN is
		do
			Result := (value=deprecated_low_level)
		end

	is_lax_validation: BOOLEAN is
		do
			Result := (value=lax_validation_low_level)
		end

	is_private: BOOLEAN is
		do
			Result := (value=private_low_level)
		end

	is_readable: BOOLEAN is
		do
			Result := (value=readable_low_level)
		end

	is_static_blurb: BOOLEAN is
		do
			Result := (value=static_blurb_low_level)
		end

	is_static_name: BOOLEAN is
		do
			Result := (value=static_name_low_level)
		end

	is_static_nick: BOOLEAN is
		do
			Result := (value=static_nick_low_level)
		end

	is_writable: BOOLEAN is
		do
			Result := (value=writable_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	construct_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT"
 			}"
 		end

	construct_only_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_CONSTRUCT_ONLY"
 			}"
 		end

	deprecated_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_DEPRECATED"
 			}"
 		end

	lax_validation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_LAX_VALIDATION"
 			}"
 		end

	private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_PRIVATE"
 			}"
 		end

	readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_READABLE"
 			}"
 		end

	static_blurb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_BLURB"
 			}"
 		end

	static_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NAME"
 			}"
 		end

	static_nick_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_NICK"
 			}"
 		end

	writable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_WRITABLE"
 			}"
 		end


end -- class GPARAM_FLAGS_ENUM
