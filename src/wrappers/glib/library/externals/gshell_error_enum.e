-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GSHELL_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = d_quoting_low_level)  or else
				(a_value = iled_low_level) )
		end

feature -- Setters
	default_create,
	set_d_quoting is
		do
			value := d_quoting_low_level
		end

	set_iled is
		do
			value := iled_low_level
		end

feature -- Queries
	is_d_quoting: BOOLEAN is
		do
			Result := (value=d_quoting_low_level)
		end

	is_iled: BOOLEAN is
		do
			Result := (value=iled_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	d_quoting_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_BAD_QUOTING"
 			}"
 		end

	iled_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "G_SHELL_ERROR_FAILED"
 			}"
 		end


end -- class GSHELL_ERROR_ENUM
