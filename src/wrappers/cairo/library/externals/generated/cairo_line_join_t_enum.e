-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_LINE_JOIN_T_ENUM

-- Wrapper of enum _cairo_line_join defined in file /usr/include/cairo/cairo.h line 792
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bevel_low_level)  or else
				(a_value = miter_low_level)  or else
				(a_value = round_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bevel
               do
                       value := bevel_low_level
               end

	set_miter
               do
                       value := miter_low_level
               end

	set_round
               do
                       value := round_low_level
               end

feature {ANY} -- Queries
       is_bevel: BOOLEAN
               do
                       Result := (value=bevel_low_level)
               end

       is_miter: BOOLEAN
               do
                       Result := (value=miter_low_level)
               end

       is_round: BOOLEAN
               do
                       Result := (value=round_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bevel_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_JOIN_BEVEL"
                       }"
               end

     miter_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_JOIN_MITER"
                       }"
               end

     round_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_LINE_JOIN_ROUND"
                       }"
               end


end -- class CAIRO_LINE_JOIN_T_ENUM
