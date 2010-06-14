-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CORNER_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = top_left_low_level)  or else
				(a_value = bottom_left_low_level)  or else
				(a_value = top_right_low_level)  or else
				(a_value = bottom_right_low_level) )
		end

feature -- Setters
	default_create,
	set_top_left is
		do
			value := top_left_low_level
		end

	set_bottom_left is
		do
			value := bottom_left_low_level
		end

	set_top_right is
		do
			value := top_right_low_level
		end

	set_bottom_right is
		do
			value := bottom_right_low_level
		end

feature -- Queries
	is_top_left: BOOLEAN is
		do
			Result := (value=top_left_low_level)
		end

	is_bottom_left: BOOLEAN is
		do
			Result := (value=bottom_left_low_level)
		end

	is_top_right: BOOLEAN is
		do
			Result := (value=top_right_low_level)
		end

	is_bottom_right: BOOLEAN is
		do
			Result := (value=bottom_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	top_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_TOP_LEFT"
 			}"
 		end

	bottom_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_BOTTOM_LEFT"
 			}"
 		end

	top_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_TOP_RIGHT"
 			}"
 		end

	bottom_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CORNER_BOTTOM_RIGHT"
 			}"
 		end


end -- class GTK_CORNER_TYPE_ENUM
