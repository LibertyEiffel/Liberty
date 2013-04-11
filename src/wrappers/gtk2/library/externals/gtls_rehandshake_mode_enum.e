-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTLS_REHANDSHAKE_MODE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = never_low_level)  or else
				(a_value = safely_low_level)  or else
				(a_value = unsafely_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_never is
		do
			value := never_low_level
		end

	set_safely is
		do
			value := safely_low_level
		end

	set_unsafely is
		do
			value := unsafely_low_level
		end

feature {ANY} -- Queries
	never: BOOLEAN is
		do
			Result := (value=never_low_level)
		end

	safely: BOOLEAN is
		do
			Result := (value=safely_low_level)
		end

	unsafely: BOOLEAN is
		do
			Result := (value=unsafely_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	never_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_NEVER"
 			}"
 		end

	safely_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_SAFELY"
 			}"
 		end

	unsafely_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_TLS_REHANDSHAKE_UNSAFELY"
 			}"
 		end


end -- class GTLS_REHANDSHAKE_MODE_ENUM
