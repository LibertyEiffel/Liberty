-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_ANTIALIAS_T_ENUM

-- Wrapper of enum _cairo_antialias defined in file /usr/include/cairo/cairo.h line 701
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = best_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = fast_low_level)  or else
				(a_value = good_low_level)  or else
				(a_value = gray_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = subpixel_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_best
               do
                       value := best_low_level
               end

	set_default_external
               do
                       value := default_external_low_level
               end

	set_fast
               do
                       value := fast_low_level
               end

	set_good
               do
                       value := good_low_level
               end

	set_gray
               do
                       value := gray_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_subpixel
               do
                       value := subpixel_low_level
               end

feature {ANY} -- Queries
       is_best: BOOLEAN
               do
                       Result := (value=best_low_level)
               end

       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_fast: BOOLEAN
               do
                       Result := (value=fast_low_level)
               end

       is_good: BOOLEAN
               do
                       Result := (value=good_low_level)
               end

       is_gray: BOOLEAN
               do
                       Result := (value=gray_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_subpixel: BOOLEAN
               do
                       Result := (value=subpixel_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     best_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_BEST"
                       }"
               end

     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_DEFAULT"
                       }"
               end

     fast_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_FAST"
                       }"
               end

     good_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_GOOD"
                       }"
               end

     gray_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_GRAY"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_NONE"
                       }"
               end

     subpixel_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_ANTIALIAS_SUBPIXEL"
                       }"
               end


end -- class CAIRO_ANTIALIAS_T_ENUM
