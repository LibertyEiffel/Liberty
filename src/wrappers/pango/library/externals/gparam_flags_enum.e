-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GPARAM_FLAGS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = readable_low_level)  or else
				(a_value = writable_low_level)  or else
				(a_value = construct_low_level)  or else
				(a_value = construct_only_low_level)  or else
				(a_value = lax_validation_low_level)  or else
				(a_value = static_name_low_level)  or else
				(a_value = private_low_level)  or else
				(a_value = static_nick_low_level)  or else
				(a_value = static_blurb_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_readable is
		do
			value := readable_low_level
		end

	set_writable is
		do
			value := writable_low_level
		end

	set_construct is
		do
			value := construct_low_level
		end

	set_construct_only is
		do
			value := construct_only_low_level
		end

	set_lax_validation is
		do
			value := lax_validation_low_level
		end

	set_static_name is
		do
			value := static_name_low_level
		end

	set_private is
		do
			value := private_low_level
		end

	set_static_nick is
		do
			value := static_nick_low_level
		end

	set_static_blurb is
		do
			value := static_blurb_low_level
		end

feature {ANY} -- Queries
	is_readable: BOOLEAN is
		do
			Result := (value=readable_low_level)
		end

	is_writable: BOOLEAN is
		do
			Result := (value=writable_low_level)
		end

	is_construct: BOOLEAN is
		do
			Result := (value=construct_low_level)
		end

	is_construct_only: BOOLEAN is
		do
			Result := (value=construct_only_low_level)
		end

	is_lax_validation: BOOLEAN is
		do
			Result := (value=lax_validation_low_level)
		end

	is_static_name: BOOLEAN is
		do
			Result := (value=static_name_low_level)
		end

	is_private: BOOLEAN is
		do
			Result := (value=private_low_level)
		end

	is_static_nick: BOOLEAN is
		do
			Result := (value=static_nick_low_level)
		end

	is_static_blurb: BOOLEAN is
		do
			Result := (value=static_blurb_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	readable_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_READABLE"
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

	lax_validation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_LAX_VALIDATION"
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

	private_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_PRIVATE"
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

	static_blurb_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PARAM_STATIC_BLURB"
 			}"
 		end


end -- class GPARAM_FLAGS_ENUM
