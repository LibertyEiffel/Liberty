-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_CTREE_EXPANDER_STYLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = none_low_level)  or else
				(a_value = square_low_level)  or else
				(a_value = triangle_low_level)  or else
				(a_value = circular_low_level) )
		end

feature -- Setters
	default_create,
	set_none is
		do
			value := none_low_level
		end

	set_square is
		do
			value := square_low_level
		end

	set_triangle is
		do
			value := triangle_low_level
		end

	set_circular is
		do
			value := circular_low_level
		end

feature -- Queries
	is_none: BOOLEAN is
		do
			Result := (value=none_low_level)
		end

	is_square: BOOLEAN is
		do
			Result := (value=square_low_level)
		end

	is_triangle: BOOLEAN is
		do
			Result := (value=triangle_low_level)
		end

	is_circular: BOOLEAN is
		do
			Result := (value=circular_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	none_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANDER_NONE"
 			}"
 		end

	square_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANDER_SQUARE"
 			}"
 		end

	triangle_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANDER_TRIANGLE"
 			}"
 		end

	circular_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_CTREE_EXPANDER_CIRCULAR"
 			}"
 		end


end -- class GTK_CTREE_EXPANDER_STYLE_ENUM
