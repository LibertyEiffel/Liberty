-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_TREE_VIEW_GRID_LINES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = horizontal_low_level)  or else
				(a_value = vertical_low_level)  or else
				(a_value = both_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_horizontal is
		do
			value := horizontal_low_level
		end

	set_vertical is
		do
			value := vertical_low_level
		end

	set_both is
		do
			value := both_low_level
		end

feature {ANY} -- Queries
	none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	horizontal: BOOLEAN is
		do
			Result := (value=horizontal_low_level)
		end

	vertical: BOOLEAN is
		do
			Result := (value=vertical_low_level)
		end

	both: BOOLEAN is
		do
			Result := (value=both_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_NONE"
 			}"
 		end

	horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_HORIZONTAL"
 			}"
 		end

	vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_VERTICAL"
 			}"
 		end

	both_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_TREE_VIEW_GRID_LINES_BOTH"
 			}"
 		end


end -- class GTK_TREE_VIEW_GRID_LINES_ENUM
