-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FLOAT_DENORM_STYLEENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = indeterminate_low_level)  or else
				(a_value = present_low_level) )
		end

feature -- Setters
	default_create,
	set_indeterminate is
		do
			value := indeterminate_low_level
		end

	set_present is
		do
			value := present_low_level
		end

feature -- Queries
	is_indeterminate: BOOLEAN is
		do
			Result := (value=indeterminate_low_level)
		end

	is_present: BOOLEAN is
		do
			Result := (value=present_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	indeterminate_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_indeterminate"
 			}"
 		end

	present_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "denorm_present"
 			}"
 		end


end -- class FLOAT_DENORM_STYLEENUM
