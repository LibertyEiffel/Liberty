-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_JUSTIFICATION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = left_low_level)  or else
				(a_value = right_low_level)  or else
				(a_value = center_low_level)  or else
				(a_value = fill_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_left is
		do
			value := left_low_level
		end

	set_right is
		do
			value := right_low_level
		end

	set_center is
		do
			value := center_low_level
		end

	set_fill is
		do
			value := fill_low_level
		end

feature {ANY} -- Queries
	left: BOOLEAN is
		do
			Result := (value=left_low_level)
		end

	right: BOOLEAN is
		do
			Result := (value=right_low_level)
		end

	center: BOOLEAN is
		do
			Result := (value=center_low_level)
		end

	fill: BOOLEAN is
		do
			Result := (value=fill_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_LEFT"
 			}"
 		end

	right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_RIGHT"
 			}"
 		end

	center_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_CENTER"
 			}"
 		end

	fill_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_JUSTIFY_FILL"
 			}"
 		end


end -- class GTK_JUSTIFICATION_ENUM
