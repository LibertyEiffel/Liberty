-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSHELL_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = bad_quoting_low_level)  or else
				(a_value = empty_string_low_level)  or else
				(a_value = failed_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bad_quoting is
		do
			value := bad_quoting_low_level
		end

	set_empty_string is
		do
			value := empty_string_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature {ANY} -- Queries
	is_bad_quoting: BOOLEAN is
		do
			Result := (value=bad_quoting_low_level)
		end

	is_empty_string: BOOLEAN is
		do
			Result := (value=empty_string_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	bad_quoting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_BAD_QUOTING"
 			}"
 		end

	empty_string_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_EMPTY_STRING"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_FAILED"
 			}"
 		end


end -- class GSHELL_ERROR_ENUM
