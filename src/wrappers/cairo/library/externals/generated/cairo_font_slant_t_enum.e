-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FONT_SLANT_T_ENUM

-- Wrapper of enum _cairo_font_slant defined in file /usr/include/cairo/cairo.h line 1244
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = italic_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = oblique_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_italic
               do
                       value := italic_low_level
               end

	set_normal
               do
                       value := normal_low_level
               end

	set_oblique
               do
                       value := oblique_low_level
               end

feature {ANY} -- Queries
       is_italic: BOOLEAN
               do
                       Result := (value=italic_low_level)
               end

       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

       is_oblique: BOOLEAN
               do
                       Result := (value=oblique_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     italic_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_SLANT_ITALIC"
                       }"
               end

     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_SLANT_NORMAL"
                       }"
               end

     oblique_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_SLANT_OBLIQUE"
                       }"
               end


end -- class CAIRO_FONT_SLANT_T_ENUM
