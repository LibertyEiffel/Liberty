-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PREVIEW_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = color_low_level)  or else
				(a_value = grayscale_low_level) )
		end

feature -- Setters
	default_create,
	set_color is
		do
			value := color_low_level
		end

	set_grayscale is
		do
			value := grayscale_low_level
		end

feature -- Queries
	is_color: BOOLEAN is
		do
			Result := (value=color_low_level)
		end

	is_grayscale: BOOLEAN is
		do
			Result := (value=grayscale_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PREVIEW_COLOR"
 			}"
 		end

	grayscale_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PREVIEW_GRAYSCALE"
 			}"
 		end


end -- class GTK_PREVIEW_TYPE_ENUM
