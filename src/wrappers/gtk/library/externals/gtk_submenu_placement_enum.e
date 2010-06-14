-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_SUBMENU_PLACEMENT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = top_bottom_low_level)  or else
				(a_value = left_right_low_level) )
		end

feature -- Setters
	default_create,
	set_top_bottom is
		do
			value := top_bottom_low_level
		end

	set_left_right is
		do
			value := left_right_low_level
		end

feature -- Queries
	is_top_bottom: BOOLEAN is
		do
			Result := (value=top_bottom_low_level)
		end

	is_left_right: BOOLEAN is
		do
			Result := (value=left_right_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	top_bottom_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TOP_BOTTOM"
 			}"
 		end

	left_right_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_LEFT_RIGHT"
 			}"
 		end


end -- class GTK_SUBMENU_PLACEMENT_ENUM
