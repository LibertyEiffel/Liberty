-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class PANGO_RENDER_PART_ENUM

insert ENUM

creation default_create
feature -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = pango_render_part_background_low_level)  or else
				(a_value = pango_render_part_foreground_low_level)  or else
				(a_value = pango_render_part_strikethrough_low_level)  or else
				(a_value = pango_render_part_underline_low_level) )
		end

feature -- Setters
	default_create,
	set_pango_render_part_background is
		do
			value := pango_render_part_background_low_level
		end

	set_pango_render_part_foreground is
		do
			value := pango_render_part_foreground_low_level
		end

	set_pango_render_part_strikethrough is
		do
			value := pango_render_part_strikethrough_low_level
		end

	set_pango_render_part_underline is
		do
			value := pango_render_part_underline_low_level
		end

feature -- Queries
	is_pango_render_part_background: BOOLEAN is
		do
			Result := (value=pango_render_part_background_low_level)
		end

	is_pango_render_part_foreground: BOOLEAN is
		do
			Result := (value=pango_render_part_foreground_low_level)
		end

	is_pango_render_part_strikethrough: BOOLEAN is
		do
			Result := (value=pango_render_part_strikethrough_low_level)
		end

	is_pango_render_part_underline: BOOLEAN is
		do
			Result := (value=pango_render_part_underline_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	pango_render_part_background_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_RENDER_PART_BACKGROUND"
 			}"
 		end

	pango_render_part_foreground_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_RENDER_PART_FOREGROUND"
 			}"
 		end

	pango_render_part_strikethrough_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_RENDER_PART_STRIKETHROUGH"
 			}"
 		end

	pango_render_part_underline_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "PANGO_RENDER_PART_UNDERLINE"
 			}"
 		end


end -- class PANGO_RENDER_PART_ENUM
