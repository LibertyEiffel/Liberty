-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_DEVICE_TYPE_T_ENUM

-- Wrapper of enum _cairo_device_type defined in file /usr/include/cairo/cairo.h line 2137
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = cogl_low_level)  or else
				(a_value = drm_low_level)  or else
				(a_value = gl_low_level)  or else
				(a_value = invalid_low_level)  or else
				(a_value = script_low_level)  or else
				(a_value = win32_low_level)  or else
				(a_value = xcb_low_level)  or else
				(a_value = xlib_low_level)  or else
				(a_value = xml_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_cogl
               do
                       value := cogl_low_level
               end

	set_drm
               do
                       value := drm_low_level
               end

	set_gl
               do
                       value := gl_low_level
               end

	set_invalid
               do
                       value := invalid_low_level
               end

	set_script
               do
                       value := script_low_level
               end

	set_win32
               do
                       value := win32_low_level
               end

	set_xcb
               do
                       value := xcb_low_level
               end

	set_xlib
               do
                       value := xlib_low_level
               end

	set_xml
               do
                       value := xml_low_level
               end

feature {ANY} -- Queries
       is_cogl: BOOLEAN
               do
                       Result := (value=cogl_low_level)
               end

       is_drm: BOOLEAN
               do
                       Result := (value=drm_low_level)
               end

       is_gl: BOOLEAN
               do
                       Result := (value=gl_low_level)
               end

       is_invalid: BOOLEAN
               do
                       Result := (value=invalid_low_level)
               end

       is_script: BOOLEAN
               do
                       Result := (value=script_low_level)
               end

       is_win32: BOOLEAN
               do
                       Result := (value=win32_low_level)
               end

       is_xcb: BOOLEAN
               do
                       Result := (value=xcb_low_level)
               end

       is_xlib: BOOLEAN
               do
                       Result := (value=xlib_low_level)
               end

       is_xml: BOOLEAN
               do
                       Result := (value=xml_low_level)
               end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
     cogl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_COGL"
                       }"
               end

     drm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_DRM"
                       }"
               end

     gl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_GL"
                       }"
               end

     invalid_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_INVALID"
                       }"
               end

     script_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_SCRIPT"
                       }"
               end

     win32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_WIN32"
                       }"
               end

     xcb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_XCB"
                       }"
               end

     xlib_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_XLIB"
                       }"
               end

     xml_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_DEVICE_TYPE_XML"
                       }"
               end


end -- class CAIRO_DEVICE_TYPE_T_ENUM
