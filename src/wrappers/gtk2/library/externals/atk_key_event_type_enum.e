-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_KEY_EVENT_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = press_low_level)  or else
				(a_value = release_low_level)  or else
				(a_value = last_defined_low_level) )
		end

feature -- Setters
	default_create,
	set_press is
		do
			value := press_low_level
		end

	set_release is
		do
			value := release_low_level
		end

	set_last_defined is
		do
			value := last_defined_low_level
		end

feature -- Queries
	press: BOOLEAN is
		do
			Result := (value=press_low_level)
		end

	release: BOOLEAN is
		do
			Result := (value=release_low_level)
		end

	last_defined: BOOLEAN is
		do
			Result := (value=last_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	press_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_PRESS"
 			}"
 		end

	release_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_RELEASE"
 			}"
 		end

	last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_KEY_EVENT_LAST_DEFINED"
 			}"
 		end


end -- class ATK_KEY_EVENT_TYPE_ENUM
