-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_FONT_TYPE_T_ENUM

-- Wrapper of enum _cairo_font_type defined in file /usr/include/cairo/cairo.h line 1546
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = ft_low_level)  or else
				(a_value = quartz_low_level)  or else
				(a_value = toy_low_level)  or else
				(a_value = user_low_level)  or else
				(a_value = win32_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_ft
               do
                       value := ft_low_level
               end

	set_quartz
               do
                       value := quartz_low_level
               end

	set_toy
               do
                       value := toy_low_level
               end

	set_user
               do
                       value := user_low_level
               end

	set_win32
               do
                       value := win32_low_level
               end

feature {ANY} -- Queries
       is_ft: BOOLEAN
               do
                       Result := (value=ft_low_level)
               end

       is_quartz: BOOLEAN
               do
                       Result := (value=quartz_low_level)
               end

       is_toy: BOOLEAN
               do
                       Result := (value=toy_low_level)
               end

       is_user: BOOLEAN
               do
                       Result := (value=user_low_level)
               end

       is_win32: BOOLEAN
               do
                       Result := (value=win32_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     ft_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_TYPE_FT"
                       }"
               end

     quartz_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_TYPE_QUARTZ"
                       }"
               end

     toy_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_TYPE_TOY"
                       }"
               end

     user_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_TYPE_USER"
                       }"
               end

     win32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_FONT_TYPE_WIN32"
                       }"
               end


end -- class CAIRO_FONT_TYPE_T_ENUM
