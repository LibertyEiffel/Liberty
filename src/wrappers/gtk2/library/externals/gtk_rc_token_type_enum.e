-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTK_RC_TOKEN_TYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = include_low_level)  or else
				(a_value = normal_low_level)  or else
				(a_value = active_low_level)  or else
				(a_value = prelight_low_level)  or else
				(a_value = selected_low_level)  or else
				(a_value = insensitive_low_level)  or else
				(a_value = fg_low_level)  or else
				(a_value = bg_low_level)  or else
				(a_value = text_low_level)  or else
				(a_value = base_low_level)  or else
				(a_value = xthickness_low_level)  or else
				(a_value = ythickness_low_level)  or else
				(a_value = font_low_level)  or else
				(a_value = fontset_low_level)  or else
				(a_value = font_name_low_level)  or else
				(a_value = bg_pixmap_low_level)  or else
				(a_value = pixmap_path_low_level)  or else
				(a_value = style_low_level)  or else
				(a_value = binding_low_level)  or else
				(a_value = bind_low_level)  or else
				(a_value = widget_low_level)  or else
				(a_value = widget_class_low_level)  or else
				(a_value = class_external_low_level)  or else
				(a_value = lowest_low_level)  or else
				(a_value = gtk_low_level)  or else
				(a_value = application_low_level)  or else
				(a_value = theme_low_level)  or else
				(a_value = rc_low_level)  or else
				(a_value = highest_low_level)  or else
				(a_value = engine_low_level)  or else
				(a_value = module_path_low_level)  or else
				(a_value = im_module_path_low_level)  or else
				(a_value = im_module_file_low_level)  or else
				(a_value = stock_low_level)  or else
				(a_value = ltr_low_level)  or else
				(a_value = rtl_low_level)  or else
				(a_value = color_low_level)  or else
				(a_value = unbind_low_level)  or else
				(a_value = last_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_include is
		do
			value := include_low_level
		end

	set_normal is
		do
			value := normal_low_level
		end

	set_active is
		do
			value := active_low_level
		end

	set_prelight is
		do
			value := prelight_low_level
		end

	set_selected is
		do
			value := selected_low_level
		end

	set_insensitive is
		do
			value := insensitive_low_level
		end

	set_fg is
		do
			value := fg_low_level
		end

	set_bg is
		do
			value := bg_low_level
		end

	set_text is
		do
			value := text_low_level
		end

	set_base is
		do
			value := base_low_level
		end

	set_xthickness is
		do
			value := xthickness_low_level
		end

	set_ythickness is
		do
			value := ythickness_low_level
		end

	set_font is
		do
			value := font_low_level
		end

	set_fontset is
		do
			value := fontset_low_level
		end

	set_font_name is
		do
			value := font_name_low_level
		end

	set_bg_pixmap is
		do
			value := bg_pixmap_low_level
		end

	set_pixmap_path is
		do
			value := pixmap_path_low_level
		end

	set_style is
		do
			value := style_low_level
		end

	set_binding is
		do
			value := binding_low_level
		end

	set_bind is
		do
			value := bind_low_level
		end

	set_widget is
		do
			value := widget_low_level
		end

	set_widget_class is
		do
			value := widget_class_low_level
		end

	set_class_external is
		do
			value := class_external_low_level
		end

	set_lowest is
		do
			value := lowest_low_level
		end

	set_gtk is
		do
			value := gtk_low_level
		end

	set_application is
		do
			value := application_low_level
		end

	set_theme is
		do
			value := theme_low_level
		end

	set_rc is
		do
			value := rc_low_level
		end

	set_highest is
		do
			value := highest_low_level
		end

	set_engine is
		do
			value := engine_low_level
		end

	set_module_path is
		do
			value := module_path_low_level
		end

	set_im_module_path is
		do
			value := im_module_path_low_level
		end

	set_im_module_file is
		do
			value := im_module_file_low_level
		end

	set_stock is
		do
			value := stock_low_level
		end

	set_ltr is
		do
			value := ltr_low_level
		end

	set_rtl is
		do
			value := rtl_low_level
		end

	set_color is
		do
			value := color_low_level
		end

	set_unbind is
		do
			value := unbind_low_level
		end

	set_last is
		do
			value := last_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	include: BOOLEAN is
		do
			Result := (value=include_low_level)
		end

	normal: BOOLEAN is
		do
			Result := (value=normal_low_level)
		end

	active: BOOLEAN is
		do
			Result := (value=active_low_level)
		end

	prelight: BOOLEAN is
		do
			Result := (value=prelight_low_level)
		end

	selected: BOOLEAN is
		do
			Result := (value=selected_low_level)
		end

	insensitive: BOOLEAN is
		do
			Result := (value=insensitive_low_level)
		end

	fg: BOOLEAN is
		do
			Result := (value=fg_low_level)
		end

	bg: BOOLEAN is
		do
			Result := (value=bg_low_level)
		end

	text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	base: BOOLEAN is
		do
			Result := (value=base_low_level)
		end

	xthickness: BOOLEAN is
		do
			Result := (value=xthickness_low_level)
		end

	ythickness: BOOLEAN is
		do
			Result := (value=ythickness_low_level)
		end

	font: BOOLEAN is
		do
			Result := (value=font_low_level)
		end

	fontset: BOOLEAN is
		do
			Result := (value=fontset_low_level)
		end

	font_name: BOOLEAN is
		do
			Result := (value=font_name_low_level)
		end

	bg_pixmap: BOOLEAN is
		do
			Result := (value=bg_pixmap_low_level)
		end

	pixmap_path: BOOLEAN is
		do
			Result := (value=pixmap_path_low_level)
		end

	style: BOOLEAN is
		do
			Result := (value=style_low_level)
		end

	binding: BOOLEAN is
		do
			Result := (value=binding_low_level)
		end

	bind: BOOLEAN is
		do
			Result := (value=bind_low_level)
		end

	widget: BOOLEAN is
		do
			Result := (value=widget_low_level)
		end

	widget_class: BOOLEAN is
		do
			Result := (value=widget_class_low_level)
		end

	class_external: BOOLEAN is
		do
			Result := (value=class_external_low_level)
		end

	lowest: BOOLEAN is
		do
			Result := (value=lowest_low_level)
		end

	gtk: BOOLEAN is
		do
			Result := (value=gtk_low_level)
		end

	application: BOOLEAN is
		do
			Result := (value=application_low_level)
		end

	theme: BOOLEAN is
		do
			Result := (value=theme_low_level)
		end

	rc: BOOLEAN is
		do
			Result := (value=rc_low_level)
		end

	highest: BOOLEAN is
		do
			Result := (value=highest_low_level)
		end

	engine: BOOLEAN is
		do
			Result := (value=engine_low_level)
		end

	module_path: BOOLEAN is
		do
			Result := (value=module_path_low_level)
		end

	im_module_path: BOOLEAN is
		do
			Result := (value=im_module_path_low_level)
		end

	im_module_file: BOOLEAN is
		do
			Result := (value=im_module_file_low_level)
		end

	stock: BOOLEAN is
		do
			Result := (value=stock_low_level)
		end

	ltr: BOOLEAN is
		do
			Result := (value=ltr_low_level)
		end

	rtl: BOOLEAN is
		do
			Result := (value=rtl_low_level)
		end

	color: BOOLEAN is
		do
			Result := (value=color_low_level)
		end

	unbind: BOOLEAN is
		do
			Result := (value=unbind_low_level)
		end

	last: BOOLEAN is
		do
			Result := (value=last_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INVALID"
 			}"
 		end

	include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INCLUDE"
 			}"
 		end

	normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_NORMAL"
 			}"
 		end

	active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_ACTIVE"
 			}"
 		end

	prelight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_PRELIGHT"
 			}"
 		end

	selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_SELECTED"
 			}"
 		end

	insensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INSENSITIVE"
 			}"
 		end

	fg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FG"
 			}"
 		end

	bg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BG"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_TEXT"
 			}"
 		end

	base_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BASE"
 			}"
 		end

	xthickness_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_XTHICKNESS"
 			}"
 		end

	ythickness_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_YTHICKNESS"
 			}"
 		end

	font_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONT"
 			}"
 		end

	fontset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONTSET"
 			}"
 		end

	font_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONT_NAME"
 			}"
 		end

	bg_pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BG_PIXMAP"
 			}"
 		end

	pixmap_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_PIXMAP_PATH"
 			}"
 		end

	style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_STYLE"
 			}"
 		end

	binding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BINDING"
 			}"
 		end

	bind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BIND"
 			}"
 		end

	widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_WIDGET"
 			}"
 		end

	widget_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_WIDGET_CLASS"
 			}"
 		end

	class_external_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_CLASS"
 			}"
 		end

	lowest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LOWEST"
 			}"
 		end

	gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_GTK"
 			}"
 		end

	application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_APPLICATION"
 			}"
 		end

	theme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_THEME"
 			}"
 		end

	rc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_RC"
 			}"
 		end

	highest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_HIGHEST"
 			}"
 		end

	engine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_ENGINE"
 			}"
 		end

	module_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_MODULE_PATH"
 			}"
 		end

	im_module_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_IM_MODULE_PATH"
 			}"
 		end

	im_module_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_IM_MODULE_FILE"
 			}"
 		end

	stock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_STOCK"
 			}"
 		end

	ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LTR"
 			}"
 		end

	rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_RTL"
 			}"
 		end

	color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_COLOR"
 			}"
 		end

	unbind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_UNBIND"
 			}"
 		end

	last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LAST"
 			}"
 		end


end -- class GTK_RC_TOKEN_TYPE_ENUM
