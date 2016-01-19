-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_STYLE_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_style_italic_low_level)  or else
				(a_value = pango_style_normal_low_level)  or else
				(a_value = pango_style_oblique_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_style_italic is
		do
			value := pango_style_italic_low_level
		end

	set_pango_style_normal is
		do
			value := pango_style_normal_low_level
		end

	set_pango_style_oblique is
		do
			value := pango_style_oblique_low_level
		end

feature -- Queries
	is_pango_style_italic: BOOLEAN is
		do
			Result := (value=pango_style_italic_low_level)
		end

	is_pango_style_normal: BOOLEAN is
		do
			Result := (value=pango_style_normal_low_level)
		end

	is_pango_style_oblique: BOOLEAN is
		do
			Result := (value=pango_style_oblique_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_style_italic_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STYLE_ITALIC"
 			}"
 		end

	pango_style_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STYLE_NORMAL"
 			}"
 		end

	pango_style_oblique_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_STYLE_OBLIQUE"
 			}"
 		end


end -- class PANGO_STYLE_ENUM
