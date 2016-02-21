-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FORMAT_T_ENUM

-- Wrapper of enum _cairo_format defined in file /usr/include/cairo/cairo.h line 408
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = a1_low_level)  or else
				(a_value = a8_low_level)  or else
				(a_value = argb32_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = rgb16_565_low_level)  or else
				(a_value = rgb24_low_level)  or else
				(a_value = rgb30_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_a1
               do
                       value := a1_low_level
               end

	set_a8
               do
                       value := a8_low_level
               end

	set_argb32
               do
                       value := argb32_low_level
               end

	set_invalid
               do
                       value := invalid_low_level
               end

	set_rgb16_565
               do
                       value := rgb16_565_low_level
               end

	set_rgb24
               do
                       value := rgb24_low_level
               end

	set_rgb30
               do
                       value := rgb30_low_level
               end

feature {ANY} -- Queries
       is_a1: BOOLEAN
               do
                       Result := (value=a1_low_level)
               end

       is_a8: BOOLEAN
               do
                       Result := (value=a8_low_level)
               end

       is_argb32: BOOLEAN
               do
                       Result := (value=argb32_low_level)
               end

       is_invalid: BOOLEAN
               do
                       Result := (value=invalid_low_level)
               end

       is_rgb16_565: BOOLEAN
               do
                       Result := (value=rgb16_565_low_level)
               end

       is_rgb24: BOOLEAN
               do
                       Result := (value=rgb24_low_level)
               end

       is_rgb30: BOOLEAN
               do
                       Result := (value=rgb30_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     a1_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_A1"
                       }"
               end

     a8_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_A8"
                       }"
               end

     argb32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_ARGB32"
                       }"
               end

     invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_INVALID"
                       }"
               end

     rgb16_565_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_RGB16_565"
                       }"
               end

     rgb24_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_RGB24"
                       }"
               end

     rgb30_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FORMAT_RGB30"
                       }"
               end


end -- class CAIRO_FORMAT_T_ENUM
