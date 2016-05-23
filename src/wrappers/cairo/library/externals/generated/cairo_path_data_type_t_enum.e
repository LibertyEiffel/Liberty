-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_PATH_DATA_TYPE_T_ENUM

-- Wrapper of enum _cairo_path_data_type defined in file /usr/include/cairo/cairo.h line 1967
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = close_path_low_level)  or else
				(a_value = curve_to_low_level)  or else
				(a_value = line_to_low_level)  or else
				(a_value = move_to_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_close_path
               do
                       value := close_path_low_level
               end

	set_curve_to
               do
                       value := curve_to_low_level
               end

	set_line_to
               do
                       value := line_to_low_level
               end

	set_move_to
               do
                       value := move_to_low_level
               end

feature {ANY} -- Queries
       is_close_path: BOOLEAN
               do
                       Result := (value=close_path_low_level)
               end

       is_curve_to: BOOLEAN
               do
                       Result := (value=curve_to_low_level)
               end

       is_line_to: BOOLEAN
               do
                       Result := (value=line_to_low_level)
               end

       is_move_to: BOOLEAN
               do
                       Result := (value=move_to_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     close_path_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATH_CLOSE_PATH"
                       }"
               end

     curve_to_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATH_CURVE_TO"
                       }"
               end

     line_to_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATH_LINE_TO"
                       }"
               end

     move_to_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_PATH_MOVE_TO"
                       }"
               end


end -- class CAIRO_PATH_DATA_TYPE_T_ENUM
