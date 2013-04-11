-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GPASSWORD_SAVE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = never_low_level)  or else
				(a_value = for_session_low_level)  or else
				(a_value = permanently_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_never is
		do
			value := never_low_level
		end

	set_for_session is
		do
			value := for_session_low_level
		end

	set_permanently is
		do
			value := permanently_low_level
		end

feature {ANY} -- Queries
	never: BOOLEAN is
		do
			Result := (value=never_low_level)
		end

	for_session: BOOLEAN is
		do
			Result := (value=for_session_low_level)
		end

	permanently: BOOLEAN is
		do
			Result := (value=permanently_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PASSWORD_SAVE_NEVER"
 			}"
 		end

	for_session_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PASSWORD_SAVE_FOR_SESSION"
 			}"
 		end

	permanently_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_PASSWORD_SAVE_PERMANENTLY"
 			}"
 		end


end -- class GPASSWORD_SAVE_ENUM
