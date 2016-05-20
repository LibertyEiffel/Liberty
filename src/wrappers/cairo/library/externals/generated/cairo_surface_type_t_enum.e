-- This file has been created by wrappers_generator.
-- Any change will be lost by the next execution of the tool.
expanded class CAIRO_SURFACE_TYPE_T_ENUM

-- Wrapper of enum _cairo_surface_type defined in file /usr/include/cairo/cairo.h line 2372
insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN
        do
            Result := ((a_value = beos_low_level)  or else
				(a_value = cogl_low_level)  or else
				(a_value = directfb_low_level)  or else
				(a_value = drm_low_level)  or else
				(a_value = gl_low_level)  or else
				(a_value = glitz_low_level)  or else
				(a_value = image_low_level)  or else
				(a_value = os2_low_level)  or else
				(a_value = pdf_low_level)  or else
				(a_value = ps_low_level)  or else
				(a_value = qt_low_level)  or else
				(a_value = quartz_low_level)  or else
				(a_value = quartz_image_low_level)  or else
				(a_value = recording_low_level)  or else
				(a_value = script_low_level)  or else
				(a_value = skia_low_level)  or else
				(a_value = subsurface_low_level)  or else
				(a_value = svg_low_level)  or else
				(a_value = tee_low_level)  or else
				(a_value = vg_low_level)  or else
				(a_value = win32_low_level)  or else
				(a_value = win32_printing_low_level)  or else
				(a_value = xcb_low_level)  or else
				(a_value = xlib_low_level)  or else
				(a_value = xml_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_beos
               do
                       value := beos_low_level
               end

	set_cogl
               do
                       value := cogl_low_level
               end

	set_directfb
               do
                       value := directfb_low_level
               end

	set_drm
               do
                       value := drm_low_level
               end

	set_gl
               do
                       value := gl_low_level
               end

	set_glitz
               do
                       value := glitz_low_level
               end

	set_image
               do
                       value := image_low_level
               end

	set_os2
               do
                       value := os2_low_level
               end

	set_pdf
               do
                       value := pdf_low_level
               end

	set_ps
               do
                       value := ps_low_level
               end

	set_qt
               do
                       value := qt_low_level
               end

	set_quartz
               do
                       value := quartz_low_level
               end

	set_quartz_image
               do
                       value := quartz_image_low_level
               end

	set_recording
               do
                       value := recording_low_level
               end

	set_script
               do
                       value := script_low_level
               end

	set_skia
               do
                       value := skia_low_level
               end

	set_subsurface
               do
                       value := subsurface_low_level
               end

	set_svg
               do
                       value := svg_low_level
               end

	set_tee
               do
                       value := tee_low_level
               end

	set_vg
               do
                       value := vg_low_level
               end

	set_win32
               do
                       value := win32_low_level
               end

	set_win32_printing
               do
                       value := win32_printing_low_level
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
       is_beos: BOOLEAN
               do
                       Result := (value=beos_low_level)
               end

       is_cogl: BOOLEAN
               do
                       Result := (value=cogl_low_level)
               end

       is_directfb: BOOLEAN
               do
                       Result := (value=directfb_low_level)
               end

       is_drm: BOOLEAN
               do
                       Result := (value=drm_low_level)
               end

       is_gl: BOOLEAN
               do
                       Result := (value=gl_low_level)
               end

       is_glitz: BOOLEAN
               do
                       Result := (value=glitz_low_level)
               end

       is_image: BOOLEAN
               do
                       Result := (value=image_low_level)
               end

       is_os2: BOOLEAN
               do
                       Result := (value=os2_low_level)
               end

       is_pdf: BOOLEAN
               do
                       Result := (value=pdf_low_level)
               end

       is_ps: BOOLEAN
               do
                       Result := (value=ps_low_level)
               end

       is_qt: BOOLEAN
               do
                       Result := (value=qt_low_level)
               end

       is_quartz: BOOLEAN
               do
                       Result := (value=quartz_low_level)
               end

       is_quartz_image: BOOLEAN
               do
                       Result := (value=quartz_image_low_level)
               end

       is_recording: BOOLEAN
               do
                       Result := (value=recording_low_level)
               end

       is_script: BOOLEAN
               do
                       Result := (value=script_low_level)
               end

       is_skia: BOOLEAN
               do
                       Result := (value=skia_low_level)
               end

       is_subsurface: BOOLEAN
               do
                       Result := (value=subsurface_low_level)
               end

       is_svg: BOOLEAN
               do
                       Result := (value=svg_low_level)
               end

       is_tee: BOOLEAN
               do
                       Result := (value=tee_low_level)
               end

       is_vg: BOOLEAN
               do
                       Result := (value=vg_low_level)
               end

       is_win32: BOOLEAN
               do
                       Result := (value=win32_low_level)
               end

       is_win32_printing: BOOLEAN
               do
                       Result := (value=win32_printing_low_level)
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
     beos_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_BEOS"
                       }"
               end

     cogl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_COGL"
                       }"
               end

     directfb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_DIRECTFB"
                       }"
               end

     drm_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_DRM"
                       }"
               end

     gl_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_GL"
                       }"
               end

     glitz_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_GLITZ"
                       }"
               end

     image_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_IMAGE"
                       }"
               end

     os2_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_OS2"
                       }"
               end

     pdf_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_PDF"
                       }"
               end

     ps_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_PS"
                       }"
               end

     qt_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_QT"
                       }"
               end

     quartz_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_QUARTZ"
                       }"
               end

     quartz_image_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_QUARTZ_IMAGE"
                       }"
               end

     recording_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_RECORDING"
                       }"
               end

     script_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_SCRIPT"
                       }"
               end

     skia_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_SKIA"
                       }"
               end

     subsurface_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_SUBSURFACE"
                       }"
               end

     svg_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_SVG"
                       }"
               end

     tee_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_TEE"
                       }"
               end

     vg_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_VG"
                       }"
               end

     win32_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_WIN32"
                       }"
               end

     win32_printing_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_WIN32_PRINTING"
                       }"
               end

     xcb_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_XCB"
                       }"
               end

     xlib_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_XLIB"
                       }"
               end

     xml_low_level: INTEGER
               external "plug_in"
               alias "{
                       location: "."
                       module_name: "plugin"
                       feature_name: "CAIRO_SURFACE_TYPE_XML"
                       }"
               end


end -- class CAIRO_SURFACE_TYPE_T_ENUM
