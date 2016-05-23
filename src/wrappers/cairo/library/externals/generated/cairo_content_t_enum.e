-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_CONTENT_T_ENUM

-- Wrapper of enum _cairo_content defined in file /usr/include/cairo/cairo.h line 371
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = alpha_low_level)  or else
				(a_value = color_low_level)  or else
				(a_value = color_alpha_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_alpha
               do
                       value := alpha_low_level
               end

	set_color
               do
                       value := color_low_level
               end

	set_color_alpha
               do
                       value := color_alpha_low_level
               end

feature {ANY} -- Queries
       is_alpha: BOOLEAN
               do
                       Result := (value=alpha_low_level)
               end

       is_color: BOOLEAN
               do
                       Result := (value=color_low_level)
               end

       is_color_alpha: BOOLEAN
               do
                       Result := (value=color_alpha_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     alpha_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_CONTENT_ALPHA"
                       }"
               end

     color_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_CONTENT_COLOR"
                       }"
               end

     color_alpha_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_CONTENT_COLOR_ALPHA"
                       }"
               end


end -- class CAIRO_CONTENT_T_ENUM
