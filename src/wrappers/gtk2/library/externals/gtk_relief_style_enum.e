-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RELIEF_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = normal_low_level)  or else
				(a_value = half_low_level)  or else
				(a_value = none_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_normal is
		do
			value := normal_low_level
		end

	set_half is
		do
			value := half_low_level
		end

	set_none is
		do
			value := none_low_level
		end

feature {ANY} -- Queries
	normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	half: BOOLEAN is
		do
			Result := (value=half_low_level)
		end

	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_NORMAL"
 			}"
 		end

	half_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_HALF"
 			}"
 		end

	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RELIEF_NONE"
 			}"
 		end


end -- class GTK_RELIEF_STYLE_ENUM
