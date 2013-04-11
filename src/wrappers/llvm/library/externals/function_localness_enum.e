-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class FUNCTION_LOCALNESS_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = unknown_low_level)  or else
				(a_value = no_low_level)  or else
				(a_value = yes_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_unknown is
		do
			value := unknown_low_level
		end

	set_no is
		do
			value := no_low_level
		end

	set_yes is
		do
			value := yes_low_level
		end

feature {ANY} -- Queries
	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	no: BOOLEAN is
		do
			Result := (value=no_low_level)
		end

	yes: BOOLEAN is
		do
			Result := (value=yes_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_Unknown"
 			}"
 		end

	no_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_No"
 			}"
 		end

	yes_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "FL_Yes"
 			}"
 		end


end -- class FUNCTION_LOCALNESS_ENUM
