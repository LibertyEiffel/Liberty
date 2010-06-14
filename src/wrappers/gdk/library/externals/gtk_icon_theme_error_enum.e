-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_ICON_THEME_ERROR_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = not_found_low_level)  or else
				(a_value = failed_low_level) )
		end

feature -- Setters
	default_create,
	set_not_found is
		do
			value := not_found_low_level
		end

	set_failed is
		do
			value := failed_low_level
		end

feature -- Queries
	is_not_found: BOOLEAN is
		do
			Result := (value=not_found_low_level)
		end

	is_failed: BOOLEAN is
		do
			Result := (value=failed_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	not_found_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_THEME_NOT_FOUND"
 			}"
 		end

	failed_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_ICON_THEME_FAILED"
 			}"
 		end


end -- class GTK_ICON_THEME_ERROR_ENUM
