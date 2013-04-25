-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SPIN_BUTTON_UPDATE_POLICY_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = always_low_level)  or else
				(a_value = if_valid_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_always is
		do
			value := always_low_level
		end

	set_if_valid is
		do
			value := if_valid_low_level
		end

feature {ANY} -- Queries
	always: BOOLEAN is
		do
			Result := (value=always_low_level)
		end

	if_valid: BOOLEAN is
		do
			Result := (value=if_valid_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	always_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_ALWAYS"
 			}"
 		end

	if_valid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_UPDATE_IF_VALID"
 			}"
 		end


end -- class GTK_SPIN_BUTTON_UPDATE_POLICY_ENUM
