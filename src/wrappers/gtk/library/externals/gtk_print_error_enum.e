-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = general_low_level)  or else
				(a_value = internal_error_low_level)  or else
				(a_value = nomem_low_level)  or else
				(a_value = invalid_file_low_level) )
		end

feature -- Setters
	default_create,
	set_general is
		do
			value := general_low_level
		end

	set_internal_error is
		do
			value := internal_error_low_level
		end

	set_nomem is
		do
			value := nomem_low_level
		end

	set_invalid_file is
		do
			value := invalid_file_low_level
		end

feature -- Queries
	is_general: BOOLEAN is
		do
			Result := (value=general_low_level)
		end

	is_internal_error: BOOLEAN is
		do
			Result := (value=internal_error_low_level)
		end

	is_nomem: BOOLEAN is
		do
			Result := (value=nomem_low_level)
		end

	is_invalid_file: BOOLEAN is
		do
			Result := (value=invalid_file_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	general_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_GENERAL"
 			}"
 		end

	internal_error_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_INTERNAL_ERROR"
 			}"
 		end

	nomem_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_NOMEM"
 			}"
 		end

	invalid_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_ERROR_INVALID_FILE"
 			}"
 		end


end -- class GTK_PRINT_ERROR_ENUM
