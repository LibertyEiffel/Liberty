-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_LINE_CAP_T_ENUM

-- Wrapper of enum _cairo_line_cap defined in file /usr/include/cairo/cairo.h line 768
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = butt_low_level)  or else
				(a_value = round_low_level)  or else
				(a_value = square_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_butt
               do
                       value := butt_low_level
               end

	set_round
               do
                       value := round_low_level
               end

	set_square
               do
                       value := square_low_level
               end

feature {ANY} -- Queries
       is_butt: BOOLEAN
               do
                       Result := (value=butt_low_level)
               end

       is_round: BOOLEAN
               do
                       Result := (value=round_low_level)
               end

       is_square: BOOLEAN
               do
                       Result := (value=square_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     butt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_CAP_BUTT"
                       }"
               end

     round_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_CAP_ROUND"
                       }"
               end

     square_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_CAP_SQUARE"
                       }"
               end


end -- class CAIRO_LINE_CAP_T_ENUM
