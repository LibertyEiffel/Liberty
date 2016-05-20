-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_HINT_STYLE_T_ENUM

-- Wrapper of enum _cairo_hint_style defined in file /usr/include/cairo/cairo.h line 1315
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_external_low_level)  or else
				(a_value = full_low_level)  or else
				(a_value = medium_low_level)  or else
				(a_value = none_low_level)  or else
				(a_value = slight_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_external
               do
                       value := default_external_low_level
               end

	set_full
               do
                       value := full_low_level
               end

	set_medium
               do
                       value := medium_low_level
               end

	set_none
               do
                       value := none_low_level
               end

	set_slight
               do
                       value := slight_low_level
               end

feature {ANY} -- Queries
       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_full: BOOLEAN
               do
                       Result := (value=full_low_level)
               end

       is_medium: BOOLEAN
               do
                       Result := (value=medium_low_level)
               end

       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_slight: BOOLEAN
               do
                       Result := (value=slight_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_STYLE_DEFAULT"
                       }"
               end

     full_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_STYLE_FULL"
                       }"
               end

     medium_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_STYLE_MEDIUM"
                       }"
               end

     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_STYLE_NONE"
                       }"
               end

     slight_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_STYLE_SLIGHT"
                       }"
               end


end -- class CAIRO_HINT_STYLE_T_ENUM
