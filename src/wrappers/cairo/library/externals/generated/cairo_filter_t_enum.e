-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FILTER_T_ENUM

-- Wrapper of enum _cairo_filter defined in file /usr/include/cairo/cairo.h line 2920
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = best_low_level)  or else
				(a_value = bilinear_low_level)  or else
				(a_value = fast_low_level)  or else
				(a_value = gaussian_low_level)  or else
				(a_value = good_low_level)  or else
				(a_value = nearest_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_best
               do
                       value := best_low_level
               end

	set_bilinear
               do
                       value := bilinear_low_level
               end

	set_fast
               do
                       value := fast_low_level
               end

	set_gaussian
               do
                       value := gaussian_low_level
               end

	set_good
               do
                       value := good_low_level
               end

	set_nearest
               do
                       value := nearest_low_level
               end

feature {ANY} -- Queries
       is_best: BOOLEAN
               do
                       Result := (value=best_low_level)
               end

       is_bilinear: BOOLEAN
               do
                       Result := (value=bilinear_low_level)
               end

       is_fast: BOOLEAN
               do
                       Result := (value=fast_low_level)
               end

       is_gaussian: BOOLEAN
               do
                       Result := (value=gaussian_low_level)
               end

       is_good: BOOLEAN
               do
                       Result := (value=good_low_level)
               end

       is_nearest: BOOLEAN
               do
                       Result := (value=nearest_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     best_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_BEST"
                       }"
               end

     bilinear_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_BILINEAR"
                       }"
               end

     fast_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_FAST"
                       }"
               end

     gaussian_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_GAUSSIAN"
                       }"
               end

     good_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_GOOD"
                       }"
               end

     nearest_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FILTER_NEAREST"
                       }"
               end


end -- class CAIRO_FILTER_T_ENUM
