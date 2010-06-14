-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_DUPLEX_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = simplex_low_level)  or else
				(a_value = horizontal_low_level)  or else
				(a_value = vertical_low_level) )
		end

feature -- Setters
	default_create,
	set_simplex is
		do
			value := simplex_low_level
		end

	set_horizontal is
		do
			value := horizontal_low_level
		end

	set_vertical is
		do
			value := vertical_low_level
		end

feature -- Queries
	is_simplex: BOOLEAN is
		do
			Result := (value=simplex_low_level)
		end

	is_horizontal: BOOLEAN is
		do
			Result := (value=horizontal_low_level)
		end

	is_vertical: BOOLEAN is
		do
			Result := (value=vertical_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	simplex_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_SIMPLEX"
 			}"
 		end

	horizontal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_HORIZONTAL"
 			}"
 		end

	vertical_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_DUPLEX_VERTICAL"
 			}"
 		end


end -- class GTK_PRINT_DUPLEX_ENUM
