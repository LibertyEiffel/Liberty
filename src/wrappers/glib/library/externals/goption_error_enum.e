-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GOPTION_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown__option_low_level)  or else
				(a_value = failed_low_level) )
		end

feature -- Setters
	default_create,
	set_unknown__option is
		do
			value := unknown__option_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature -- Queries
	is_unknown__option: BOOLEAN is
		do
			Result := (value=unknown__option_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown__option_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ERROR_UNKNOWN_OPTION"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_OPTION_ERROR_FAILED"
 			}"
 		end


end -- class GOPTION_ERROR_ENUM
