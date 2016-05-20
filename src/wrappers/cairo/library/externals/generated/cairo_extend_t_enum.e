-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_EXTEND_T_ENUM

-- Wrapper of enum _cairo_extend defined in file /usr/include/cairo/cairo.h line 2887
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = none_low_level)  or else
				(a_value = pad_low_level)  or else
				(a_value = reflect_low_level)  or else
				(a_value = repeat_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_none
               do
                       value := none_low_level
               end

	set_pad
               do
                       value := pad_low_level
               end

	set_reflect
               do
                       value := reflect_low_level
               end

	set_repeat
               do
                       value := repeat_low_level
               end

feature {ANY} -- Queries
       is_none: BOOLEAN
               do
                       Result := (value=none_low_level)
               end

       is_pad: BOOLEAN
               do
                       Result := (value=pad_low_level)
               end

       is_reflect: BOOLEAN
               do
                       Result := (value=reflect_low_level)
               end

       is_repeat: BOOLEAN
               do
                       Result := (value=repeat_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     none_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_EXTEND_NONE"
                       }"
               end

     pad_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_EXTEND_PAD"
                       }"
               end

     reflect_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_EXTEND_REFLECT"
                       }"
               end

     repeat_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_EXTEND_REPEAT"
                       }"
               end


end -- class CAIRO_EXTEND_T_ENUM
