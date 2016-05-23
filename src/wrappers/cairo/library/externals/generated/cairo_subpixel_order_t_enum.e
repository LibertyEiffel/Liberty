-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_SUBPIXEL_ORDER_T_ENUM

-- Wrapper of enum _cairo_subpixel_order defined in file /usr/include/cairo/cairo.h line 1283
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = bgr_low_level)  or else
				(a_value = default_external_low_level)  or else
				(a_value = rgb_low_level)  or else
				(a_value = vbgr_low_level)  or else
				(a_value = vrgb_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_bgr
               do
                       value := bgr_low_level
               end

	set_default_external
               do
                       value := default_external_low_level
               end

	set_rgb
               do
                       value := rgb_low_level
               end

	set_vbgr
               do
                       value := vbgr_low_level
               end

	set_vrgb
               do
                       value := vrgb_low_level
               end

feature {ANY} -- Queries
       is_bgr: BOOLEAN
               do
                       Result := (value=bgr_low_level)
               end

       is_default_external: BOOLEAN
               do
                       Result := (value=default_external_low_level)
               end

       is_rgb: BOOLEAN
               do
                       Result := (value=rgb_low_level)
               end

       is_vbgr: BOOLEAN
               do
                       Result := (value=vbgr_low_level)
               end

       is_vrgb: BOOLEAN
               do
                       Result := (value=vrgb_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     bgr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SUBPIXEL_ORDER_BGR"
                       }"
               end

     default_external_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SUBPIXEL_ORDER_DEFAULT"
                       }"
               end

     rgb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SUBPIXEL_ORDER_RGB"
                       }"
               end

     vbgr_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SUBPIXEL_ORDER_VBGR"
                       }"
               end

     vrgb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SUBPIXEL_ORDER_VRGB"
                       }"
               end


end -- class CAIRO_SUBPIXEL_ORDER_T_ENUM
