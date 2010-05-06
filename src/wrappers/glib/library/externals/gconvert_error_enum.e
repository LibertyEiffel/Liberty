-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GCONVERT_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = no__conversion_low_level)  or else
				(a_value = failed_low_level)  or else
				(a_value = partial__input_low_level)  or else
				(a_value = bad__uri_low_level)  or else
				(a_value = not__absolute__path_low_level) )
		end

feature -- Setters
	default_create,
	set_no__conversion is
		do
			value := no__conversion_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

	set_partial__input is
		do
			value := partial__input_low_level
		end

	set_bad__uri is
		do
			value := bad__uri_low_level
		end

	set_not__absolute__path is
		do
			value := not__absolute__path_low_level
		end

feature -- Queries
	is_no__conversion: BOOLEAN is
		do
			Result := (value=no__conversion_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

	is_partial__input: BOOLEAN is
		do
			Result := (value=partial__input_low_level)
		end

	is_bad__uri: BOOLEAN is
		do
			Result := (value=bad__uri_low_level)
		end

	is_not__absolute__path: BOOLEAN is
		do
			Result := (value=not__absolute__path_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	no__conversion_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NO_CONVERSION"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_FAILED"
 			}"
 		end

	partial__input_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_PARTIAL_INPUT"
 			}"
 		end

	bad__uri_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_BAD_URI"
 			}"
 		end

	not__absolute__path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_CONVERT_ERROR_NOT_ABSOLUTE_PATH"
 			}"
 		end


end -- class GCONVERT_ERROR_ENUM
