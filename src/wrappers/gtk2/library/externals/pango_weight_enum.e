-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_WEIGHT_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_weight_bold_low_level)  or else
				(a_value = pango_weight_book_low_level)  or else
				(a_value = pango_weight_heavy_low_level)  or else
				(a_value = pango_weight_light_low_level)  or else
				(a_value = pango_weight_medium_low_level)  or else
				(a_value = pango_weight_normal_low_level)  or else
				(a_value = pango_weight_semibold_low_level)  or else
				(a_value = pango_weight_thin_low_level)  or else
				(a_value = pango_weight_ultrabold_low_level)  or else
				(a_value = pango_weight_ultraheavy_low_level)  or else
				(a_value = pango_weight_ultralight_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_weight_bold is
		do
			value := pango_weight_bold_low_level
		end

	set_pango_weight_book is
		do
			value := pango_weight_book_low_level
		end

	set_pango_weight_heavy is
		do
			value := pango_weight_heavy_low_level
		end

	set_pango_weight_light is
		do
			value := pango_weight_light_low_level
		end

	set_pango_weight_medium is
		do
			value := pango_weight_medium_low_level
		end

	set_pango_weight_normal is
		do
			value := pango_weight_normal_low_level
		end

	set_pango_weight_semibold is
		do
			value := pango_weight_semibold_low_level
		end

	set_pango_weight_thin is
		do
			value := pango_weight_thin_low_level
		end

	set_pango_weight_ultrabold is
		do
			value := pango_weight_ultrabold_low_level
		end

	set_pango_weight_ultraheavy is
		do
			value := pango_weight_ultraheavy_low_level
		end

	set_pango_weight_ultralight is
		do
			value := pango_weight_ultralight_low_level
		end

feature -- Queries
	is_pango_weight_bold: BOOLEAN is
		do
			Result := (value=pango_weight_bold_low_level)
		end

	is_pango_weight_book: BOOLEAN is
		do
			Result := (value=pango_weight_book_low_level)
		end

	is_pango_weight_heavy: BOOLEAN is
		do
			Result := (value=pango_weight_heavy_low_level)
		end

	is_pango_weight_light: BOOLEAN is
		do
			Result := (value=pango_weight_light_low_level)
		end

	is_pango_weight_medium: BOOLEAN is
		do
			Result := (value=pango_weight_medium_low_level)
		end

	is_pango_weight_normal: BOOLEAN is
		do
			Result := (value=pango_weight_normal_low_level)
		end

	is_pango_weight_semibold: BOOLEAN is
		do
			Result := (value=pango_weight_semibold_low_level)
		end

	is_pango_weight_thin: BOOLEAN is
		do
			Result := (value=pango_weight_thin_low_level)
		end

	is_pango_weight_ultrabold: BOOLEAN is
		do
			Result := (value=pango_weight_ultrabold_low_level)
		end

	is_pango_weight_ultraheavy: BOOLEAN is
		do
			Result := (value=pango_weight_ultraheavy_low_level)
		end

	is_pango_weight_ultralight: BOOLEAN is
		do
			Result := (value=pango_weight_ultralight_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_weight_bold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_BOLD"
 			}"
 		end

	pango_weight_book_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_BOOK"
 			}"
 		end

	pango_weight_heavy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_HEAVY"
 			}"
 		end

	pango_weight_light_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_LIGHT"
 			}"
 		end

	pango_weight_medium_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_MEDIUM"
 			}"
 		end

	pango_weight_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_NORMAL"
 			}"
 		end

	pango_weight_semibold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_SEMIBOLD"
 			}"
 		end

	pango_weight_thin_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_THIN"
 			}"
 		end

	pango_weight_ultrabold_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRABOLD"
 			}"
 		end

	pango_weight_ultraheavy_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRAHEAVY"
 			}"
 		end

	pango_weight_ultralight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_WEIGHT_ULTRALIGHT"
 			}"
 		end


end -- class PANGO_WEIGHT_ENUM
