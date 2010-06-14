-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SENSITIVITY_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = auto_low_level)  or else
				(a_value = on_low_level)  or else
				(a_value = off_low_level) )
		end

feature -- Setters
	default_create,
	set_auto is
		do
			value := auto_low_level
		end

	set_on is
		do
			value := on_low_level
		end

	set_off is
		do
			value := off_low_level
		end

feature -- Queries
	is_auto: BOOLEAN is
		do
			Result := (value=auto_low_level)
		end

	is_on: BOOLEAN is
		do
			Result := (value=on_low_level)
		end

	is_off: BOOLEAN is
		do
			Result := (value=off_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	auto_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_AUTO"
 			}"
 		end

	on_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_ON"
 			}"
 		end

	off_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_SENSITIVITY_OFF"
 			}"
 		end


end -- class GTK_SENSITIVITY_TYPE_ENUM
