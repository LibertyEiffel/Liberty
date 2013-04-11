-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_PAGE_ORIENTATION_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = portrait_low_level)  or else
				(a_value = landscape_low_level)  or else
				(a_value = reverse_portrait_low_level)  or else
				(a_value = reverse_landscape_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_portrait is
		do
			value := portrait_low_level
		end

	set_landscape is
		do
			value := landscape_low_level
		end

	set_reverse_portrait is
		do
			value := reverse_portrait_low_level
		end

	set_reverse_landscape is
		do
			value := reverse_landscape_low_level
		end

feature {ANY} -- Queries
	portrait: BOOLEAN is
		do
			Result := (value=portrait_low_level)
		end

	landscape: BOOLEAN is
		do
			Result := (value=landscape_low_level)
		end

	reverse_portrait: BOOLEAN is
		do
			Result := (value=reverse_portrait_low_level)
		end

	reverse_landscape: BOOLEAN is
		do
			Result := (value=reverse_landscape_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	portrait_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_PORTRAIT"
 			}"
 		end

	landscape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_LANDSCAPE"
 			}"
 		end

	reverse_portrait_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_REVERSE_PORTRAIT"
 			}"
 		end

	reverse_landscape_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_PAGE_ORIENTATION_REVERSE_LANDSCAPE"
 			}"
 		end


end -- class GTK_PAGE_ORIENTATION_ENUM
