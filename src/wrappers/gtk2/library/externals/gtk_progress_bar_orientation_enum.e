-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PROGRESS_BAR_ORIENTATION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = left_to_right_low_level)  or else
				(a_value = right_to_left_low_level)  or else
				(a_value = bottom_to_top_low_level)  or else
				(a_value = top_to_bottom_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_left_to_right is
		do
			value := left_to_right_low_level
		end

	set_right_to_left is
		do
			value := right_to_left_low_level
		end

	set_bottom_to_top is
		do
			value := bottom_to_top_low_level
		end

	set_top_to_bottom is
		do
			value := top_to_bottom_low_level
		end

feature {ANY} -- Queries
	left_to_right: BOOLEAN is
		do
			Result := (value=left_to_right_low_level)
		end

	right_to_left: BOOLEAN is
		do
			Result := (value=right_to_left_low_level)
		end

	bottom_to_top: BOOLEAN is
		do
			Result := (value=bottom_to_top_low_level)
		end

	top_to_bottom: BOOLEAN is
		do
			Result := (value=top_to_bottom_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	left_to_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_LEFT_TO_RIGHT"
 			}"
 		end

	right_to_left_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_RIGHT_TO_LEFT"
 			}"
 		end

	bottom_to_top_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_BOTTOM_TO_TOP"
 			}"
 		end

	top_to_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PROGRESS_TOP_TO_BOTTOM"
 			}"
 		end


end -- class GTK_PROGRESS_BAR_ORIENTATION_ENUM
