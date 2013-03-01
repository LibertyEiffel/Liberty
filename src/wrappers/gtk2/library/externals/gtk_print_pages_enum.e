-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PRINT_PAGES_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = all_low_level)  or else
				(a_value = current_low_level)  or else
				(a_value = ranges_low_level)  or else
				(a_value = selection_low_level) )
		end

feature -- Setters
	default_create,
	set_all is
		do
			value := all_low_level
		end

	set_current is
		do
			value := current_low_level
		end

	set_ranges is
		do
			value := ranges_low_level
		end

	set_selection is
		do
			value := selection_low_level
		end

feature -- Queries
	all: BOOLEAN is
		do
			Result := (value=all_low_level)
		end

	current: BOOLEAN is
		do
			Result := (value=current_low_level)
		end

	ranges: BOOLEAN is
		do
			Result := (value=ranges_low_level)
		end

	selection: BOOLEAN is
		do
			Result := (value=selection_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	all_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_ALL"
 			}"
 		end

	current_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_CURRENT"
 			}"
 		end

	ranges_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_RANGES"
 			}"
 		end

	selection_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PRINT_PAGES_SELECTION"
 			}"
 		end


end -- class GTK_PRINT_PAGES_ENUM
