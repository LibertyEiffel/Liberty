-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FONT_WEIGHT_T_ENUM

-- Wrapper of enum _cairo_font_weight defined in file /usr/include/cairo/cairo.h line 1259
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bold_low_level)  or else
				(a_value = normal_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bold
               do
                       value := bold_low_level
               end

	set_normal
               do
                       value := normal_low_level
               end

feature {ANY} -- Queries
       is_bold: BOOLEAN
               do
                       Result := (value=bold_low_level)
               end

       is_normal: BOOLEAN
               do
                       Result := (value=normal_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bold_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_WEIGHT_BOLD"
                       }"
               end

     normal_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_WEIGHT_NORMAL"
                       }"
               end


end -- class CAIRO_FONT_WEIGHT_T_ENUM
