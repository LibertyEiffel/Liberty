-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_WEIGHT_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = thin_low_level)  or else
				(a_value = ultralight_low_level)  or else
				(a_value = light_low_level)  or else
				(a_value = book_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = medium_low_level)  or else
				(a_value = semibold_low_level)  or else
				(a_value = bold_low_level)  or else
				(a_value = ultrabold_low_level)  or else
				(a_value = heavy_low_level)  or else
				(a_value = ultraheavy_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_thin is
		do
			value := thin_low_level
		end

	set_ultralight is
		do
			value := ultralight_low_level
		end

	set_light is
		do
			value := light_low_level
		end

	set_book is
		do
			value := book_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_medium is
		do
			value := medium_low_level
		end

	set_semibold is
		do
			value := semibold_low_level
		end

	set_bold is
		do
			value := bold_low_level
		end

	set_ultrabold is
		do
			value := ultrabold_low_level
		end

	set_heavy is
		do
			value := heavy_low_level
		end

	set_ultraheavy is
		do
			value := ultraheavy_low_level
		end

feature {ANY} -- Queries
	is_thin: BOOLEAN is
		do
			Result := (value=thin_low_level)
		end

	is_ultralight: BOOLEAN is
		do
			Result := (value=ultralight_low_level)
		end

	is_light: BOOLEAN is
		do
			Result := (value=light_low_level)
		end

	is_book: BOOLEAN is
		do
			Result := (value=book_low_level)
		end

	is_normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	is_medium: BOOLEAN is
		do
			Result := (value=medium_low_level)
		end

	is_semibold: BOOLEAN is
		do
			Result := (value=semibold_low_level)
		end

	is_bold: BOOLEAN is
		do
			Result := (value=bold_low_level)
		end

	is_ultrabold: BOOLEAN is
		do
			Result := (value=ultrabold_low_level)
		end

	is_heavy: BOOLEAN is
		do
			Result := (value=heavy_low_level)
		end

	is_ultraheavy: BOOLEAN is
		do
			Result := (value=ultraheavy_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	thin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_THIN"
 			}"
 		end

	ultralight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRALIGHT"
 			}"
 		end

	light_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_LIGHT"
 			}"
 		end

	book_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_BOOK"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_NORMAL"
 			}"
 		end

	medium_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_MEDIUM"
 			}"
 		end

	semibold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_SEMIBOLD"
 			}"
 		end

	bold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_BOLD"
 			}"
 		end

	ultrabold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRABOLD"
 			}"
 		end

	heavy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_HEAVY"
 			}"
 		end

	ultraheavy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRAHEAVY"
 			}"
 		end


end -- class PANGO_WEIGHT_ENUM
