-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_HINT_METRICS_T_ENUM

-- Wrapper of enum _cairo_hint_metrics defined in file /usr/include/cairo/cairo.h line 1338
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = default_external_low_level)  or else
				(a_value = off_low_level)  or else
				(a_value = on_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_default_external
               do
                       value := default_external_low_level
               end

	set_off
               do
                       value := off_low_level
               end

	set_on
               do
                       value := on_low_level
               end

feature {ANY} -- Queries
       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_off: BOOLEAN
               do
                       Result := (value=off_low_level)
               end

       is_on: BOOLEAN
               do
                       Result := (value=on_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_METRICS_DEFAULT"
                       }"
               end

     off_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_METRICS_OFF"
                       }"
               end

     on_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_HINT_METRICS_ON"
                       }"
               end


end -- class CAIRO_HINT_METRICS_T_ENUM
