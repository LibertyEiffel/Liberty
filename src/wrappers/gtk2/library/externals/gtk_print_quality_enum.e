-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_QUALITY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = low_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = high_low_level)  or else
				(a_value = draft_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_low is
		do
			value := low_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_high is
		do
			value := high_low_level
		end

	set_draft is
		do
			value := draft_low_level
		end

feature {ANY} -- Queries
	low: BOOLEAN is
		do
			Result := (value=low_low_level)
		end

	normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	high: BOOLEAN is
		do
			Result := (value=high_low_level)
		end

	draft: BOOLEAN is
		do
			Result := (value=draft_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	low_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_LOW"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_NORMAL"
 			}"
 		end

	high_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_HIGH"
 			}"
 		end

	draft_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_QUALITY_DRAFT"
 			}"
 		end


end -- class GTK_PRINT_QUALITY_ENUM
