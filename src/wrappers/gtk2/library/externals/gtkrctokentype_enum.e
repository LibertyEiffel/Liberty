-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class GTKRCTOKENTYPE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = gtk_rc_token_active_low_level)  or else
				(a_value = gtk_rc_token_application_low_level)  or else
				(a_value = gtk_rc_token_base_low_level)  or else
				(a_value = gtk_rc_token_bg_low_level)  or else
				(a_value = gtk_rc_token_bg_pixmap_low_level)  or else
				(a_value = gtk_rc_token_bind_low_level)  or else
				(a_value = gtk_rc_token_binding_low_level)  or else
				(a_value = gtk_rc_token_class_low_level)  or else
				(a_value = gtk_rc_token_color_low_level)  or else
				(a_value = gtk_rc_token_engine_low_level)  or else
				(a_value = gtk_rc_token_fg_low_level)  or else
				(a_value = gtk_rc_token_font_low_level)  or else
				(a_value = gtk_rc_token_font_name_low_level)  or else
				(a_value = gtk_rc_token_fontset_low_level)  or else
				(a_value = gtk_rc_token_gtk_low_level)  or else
				(a_value = gtk_rc_token_highest_low_level)  or else
				(a_value = gtk_rc_token_im_module_file_low_level)  or else
				(a_value = gtk_rc_token_im_module_path_low_level)  or else
				(a_value = gtk_rc_token_include_low_level)  or else
				(a_value = gtk_rc_token_insensitive_low_level)  or else
				(a_value = gtk_rc_token_invalid_low_level)  or else
				(a_value = gtk_rc_token_last_low_level)  or else
				(a_value = gtk_rc_token_lowest_low_level)  or else
				(a_value = gtk_rc_token_ltr_low_level)  or else
				(a_value = gtk_rc_token_module_path_low_level)  or else
				(a_value = gtk_rc_token_normal_low_level)  or else
				(a_value = gtk_rc_token_pixmap_path_low_level)  or else
				(a_value = gtk_rc_token_prelight_low_level)  or else
				(a_value = gtk_rc_token_rc_low_level)  or else
				(a_value = gtk_rc_token_rtl_low_level)  or else
				(a_value = gtk_rc_token_selected_low_level)  or else
				(a_value = gtk_rc_token_stock_low_level)  or else
				(a_value = gtk_rc_token_style_low_level)  or else
				(a_value = gtk_rc_token_text_low_level)  or else
				(a_value = gtk_rc_token_theme_low_level)  or else
				(a_value = gtk_rc_token_unbind_low_level)  or else
				(a_value = gtk_rc_token_widget_low_level)  or else
				(a_value = gtk_rc_token_widget_class_low_level)  or else
				(a_value = gtk_rc_token_xthickness_low_level)  or else
				(a_value = gtk_rc_token_ythickness_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_gtk_rc_token_active is
		do
			value := gtk_rc_token_active_low_level
		end

	set_gtk_rc_token_application is
		do
			value := gtk_rc_token_application_low_level
		end

	set_gtk_rc_token_base is
		do
			value := gtk_rc_token_base_low_level
		end

	set_gtk_rc_token_bg is
		do
			value := gtk_rc_token_bg_low_level
		end

	set_gtk_rc_token_bg_pixmap is
		do
			value := gtk_rc_token_bg_pixmap_low_level
		end

	set_gtk_rc_token_bind is
		do
			value := gtk_rc_token_bind_low_level
		end

	set_gtk_rc_token_binding is
		do
			value := gtk_rc_token_binding_low_level
		end

	set_gtk_rc_token_class is
		do
			value := gtk_rc_token_class_low_level
		end

	set_gtk_rc_token_color is
		do
			value := gtk_rc_token_color_low_level
		end

	set_gtk_rc_token_engine is
		do
			value := gtk_rc_token_engine_low_level
		end

	set_gtk_rc_token_fg is
		do
			value := gtk_rc_token_fg_low_level
		end

	set_gtk_rc_token_font is
		do
			value := gtk_rc_token_font_low_level
		end

	set_gtk_rc_token_font_name is
		do
			value := gtk_rc_token_font_name_low_level
		end

	set_gtk_rc_token_fontset is
		do
			value := gtk_rc_token_fontset_low_level
		end

	set_gtk_rc_token_gtk is
		do
			value := gtk_rc_token_gtk_low_level
		end

	set_gtk_rc_token_highest is
		do
			value := gtk_rc_token_highest_low_level
		end

	set_gtk_rc_token_im_module_file is
		do
			value := gtk_rc_token_im_module_file_low_level
		end

	set_gtk_rc_token_im_module_path is
		do
			value := gtk_rc_token_im_module_path_low_level
		end

	set_gtk_rc_token_include is
		do
			value := gtk_rc_token_include_low_level
		end

	set_gtk_rc_token_insensitive is
		do
			value := gtk_rc_token_insensitive_low_level
		end

	set_gtk_rc_token_invalid is
		do
			value := gtk_rc_token_invalid_low_level
		end

	set_gtk_rc_token_last is
		do
			value := gtk_rc_token_last_low_level
		end

	set_gtk_rc_token_lowest is
		do
			value := gtk_rc_token_lowest_low_level
		end

	set_gtk_rc_token_ltr is
		do
			value := gtk_rc_token_ltr_low_level
		end

	set_gtk_rc_token_module_path is
		do
			value := gtk_rc_token_module_path_low_level
		end

	set_gtk_rc_token_normal is
		do
			value := gtk_rc_token_normal_low_level
		end

	set_gtk_rc_token_pixmap_path is
		do
			value := gtk_rc_token_pixmap_path_low_level
		end

	set_gtk_rc_token_prelight is
		do
			value := gtk_rc_token_prelight_low_level
		end

	set_gtk_rc_token_rc is
		do
			value := gtk_rc_token_rc_low_level
		end

	set_gtk_rc_token_rtl is
		do
			value := gtk_rc_token_rtl_low_level
		end

	set_gtk_rc_token_selected is
		do
			value := gtk_rc_token_selected_low_level
		end

	set_gtk_rc_token_stock is
		do
			value := gtk_rc_token_stock_low_level
		end

	set_gtk_rc_token_style is
		do
			value := gtk_rc_token_style_low_level
		end

	set_gtk_rc_token_text is
		do
			value := gtk_rc_token_text_low_level
		end

	set_gtk_rc_token_theme is
		do
			value := gtk_rc_token_theme_low_level
		end

	set_gtk_rc_token_unbind is
		do
			value := gtk_rc_token_unbind_low_level
		end

	set_gtk_rc_token_widget is
		do
			value := gtk_rc_token_widget_low_level
		end

	set_gtk_rc_token_widget_class is
		do
			value := gtk_rc_token_widget_class_low_level
		end

	set_gtk_rc_token_xthickness is
		do
			value := gtk_rc_token_xthickness_low_level
		end

	set_gtk_rc_token_ythickness is
		do
			value := gtk_rc_token_ythickness_low_level
		end

feature {ANY} -- Queries
	is_gtk_rc_token_active: BOOLEAN is
		do
			Result := (value=gtk_rc_token_active_low_level)
		end

	is_gtk_rc_token_application: BOOLEAN is
		do
			Result := (value=gtk_rc_token_application_low_level)
		end

	is_gtk_rc_token_base: BOOLEAN is
		do
			Result := (value=gtk_rc_token_base_low_level)
		end

	is_gtk_rc_token_bg: BOOLEAN is
		do
			Result := (value=gtk_rc_token_bg_low_level)
		end

	is_gtk_rc_token_bg_pixmap: BOOLEAN is
		do
			Result := (value=gtk_rc_token_bg_pixmap_low_level)
		end

	is_gtk_rc_token_bind: BOOLEAN is
		do
			Result := (value=gtk_rc_token_bind_low_level)
		end

	is_gtk_rc_token_binding: BOOLEAN is
		do
			Result := (value=gtk_rc_token_binding_low_level)
		end

	is_gtk_rc_token_class: BOOLEAN is
		do
			Result := (value=gtk_rc_token_class_low_level)
		end

	is_gtk_rc_token_color: BOOLEAN is
		do
			Result := (value=gtk_rc_token_color_low_level)
		end

	is_gtk_rc_token_engine: BOOLEAN is
		do
			Result := (value=gtk_rc_token_engine_low_level)
		end

	is_gtk_rc_token_fg: BOOLEAN is
		do
			Result := (value=gtk_rc_token_fg_low_level)
		end

	is_gtk_rc_token_font: BOOLEAN is
		do
			Result := (value=gtk_rc_token_font_low_level)
		end

	is_gtk_rc_token_font_name: BOOLEAN is
		do
			Result := (value=gtk_rc_token_font_name_low_level)
		end

	is_gtk_rc_token_fontset: BOOLEAN is
		do
			Result := (value=gtk_rc_token_fontset_low_level)
		end

	is_gtk_rc_token_gtk: BOOLEAN is
		do
			Result := (value=gtk_rc_token_gtk_low_level)
		end

	is_gtk_rc_token_highest: BOOLEAN is
		do
			Result := (value=gtk_rc_token_highest_low_level)
		end

	is_gtk_rc_token_im_module_file: BOOLEAN is
		do
			Result := (value=gtk_rc_token_im_module_file_low_level)
		end

	is_gtk_rc_token_im_module_path: BOOLEAN is
		do
			Result := (value=gtk_rc_token_im_module_path_low_level)
		end

	is_gtk_rc_token_include: BOOLEAN is
		do
			Result := (value=gtk_rc_token_include_low_level)
		end

	is_gtk_rc_token_insensitive: BOOLEAN is
		do
			Result := (value=gtk_rc_token_insensitive_low_level)
		end

	is_gtk_rc_token_invalid: BOOLEAN is
		do
			Result := (value=gtk_rc_token_invalid_low_level)
		end

	is_gtk_rc_token_last: BOOLEAN is
		do
			Result := (value=gtk_rc_token_last_low_level)
		end

	is_gtk_rc_token_lowest: BOOLEAN is
		do
			Result := (value=gtk_rc_token_lowest_low_level)
		end

	is_gtk_rc_token_ltr: BOOLEAN is
		do
			Result := (value=gtk_rc_token_ltr_low_level)
		end

	is_gtk_rc_token_module_path: BOOLEAN is
		do
			Result := (value=gtk_rc_token_module_path_low_level)
		end

	is_gtk_rc_token_normal: BOOLEAN is
		do
			Result := (value=gtk_rc_token_normal_low_level)
		end

	is_gtk_rc_token_pixmap_path: BOOLEAN is
		do
			Result := (value=gtk_rc_token_pixmap_path_low_level)
		end

	is_gtk_rc_token_prelight: BOOLEAN is
		do
			Result := (value=gtk_rc_token_prelight_low_level)
		end

	is_gtk_rc_token_rc: BOOLEAN is
		do
			Result := (value=gtk_rc_token_rc_low_level)
		end

	is_gtk_rc_token_rtl: BOOLEAN is
		do
			Result := (value=gtk_rc_token_rtl_low_level)
		end

	is_gtk_rc_token_selected: BOOLEAN is
		do
			Result := (value=gtk_rc_token_selected_low_level)
		end

	is_gtk_rc_token_stock: BOOLEAN is
		do
			Result := (value=gtk_rc_token_stock_low_level)
		end

	is_gtk_rc_token_style: BOOLEAN is
		do
			Result := (value=gtk_rc_token_style_low_level)
		end

	is_gtk_rc_token_text: BOOLEAN is
		do
			Result := (value=gtk_rc_token_text_low_level)
		end

	is_gtk_rc_token_theme: BOOLEAN is
		do
			Result := (value=gtk_rc_token_theme_low_level)
		end

	is_gtk_rc_token_unbind: BOOLEAN is
		do
			Result := (value=gtk_rc_token_unbind_low_level)
		end

	is_gtk_rc_token_widget: BOOLEAN is
		do
			Result := (value=gtk_rc_token_widget_low_level)
		end

	is_gtk_rc_token_widget_class: BOOLEAN is
		do
			Result := (value=gtk_rc_token_widget_class_low_level)
		end

	is_gtk_rc_token_xthickness: BOOLEAN is
		do
			Result := (value=gtk_rc_token_xthickness_low_level)
		end

	is_gtk_rc_token_ythickness: BOOLEAN is
		do
			Result := (value=gtk_rc_token_ythickness_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	gtk_rc_token_active_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_ACTIVE"
 			}"
 		end

	gtk_rc_token_application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_APPLICATION"
 			}"
 		end

	gtk_rc_token_base_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BASE"
 			}"
 		end

	gtk_rc_token_bg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BG"
 			}"
 		end

	gtk_rc_token_bg_pixmap_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BG_PIXMAP"
 			}"
 		end

	gtk_rc_token_bind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BIND"
 			}"
 		end

	gtk_rc_token_binding_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_BINDING"
 			}"
 		end

	gtk_rc_token_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_CLASS"
 			}"
 		end

	gtk_rc_token_color_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_COLOR"
 			}"
 		end

	gtk_rc_token_engine_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_ENGINE"
 			}"
 		end

	gtk_rc_token_fg_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FG"
 			}"
 		end

	gtk_rc_token_font_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONT"
 			}"
 		end

	gtk_rc_token_font_name_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONT_NAME"
 			}"
 		end

	gtk_rc_token_fontset_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_FONTSET"
 			}"
 		end

	gtk_rc_token_gtk_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_GTK"
 			}"
 		end

	gtk_rc_token_highest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_HIGHEST"
 			}"
 		end

	gtk_rc_token_im_module_file_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_IM_MODULE_FILE"
 			}"
 		end

	gtk_rc_token_im_module_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_IM_MODULE_PATH"
 			}"
 		end

	gtk_rc_token_include_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INCLUDE"
 			}"
 		end

	gtk_rc_token_insensitive_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INSENSITIVE"
 			}"
 		end

	gtk_rc_token_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_INVALID"
 			}"
 		end

	gtk_rc_token_last_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LAST"
 			}"
 		end

	gtk_rc_token_lowest_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LOWEST"
 			}"
 		end

	gtk_rc_token_ltr_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_LTR"
 			}"
 		end

	gtk_rc_token_module_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_MODULE_PATH"
 			}"
 		end

	gtk_rc_token_normal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_NORMAL"
 			}"
 		end

	gtk_rc_token_pixmap_path_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_PIXMAP_PATH"
 			}"
 		end

	gtk_rc_token_prelight_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_PRELIGHT"
 			}"
 		end

	gtk_rc_token_rc_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_RC"
 			}"
 		end

	gtk_rc_token_rtl_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_RTL"
 			}"
 		end

	gtk_rc_token_selected_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_SELECTED"
 			}"
 		end

	gtk_rc_token_stock_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_STOCK"
 			}"
 		end

	gtk_rc_token_style_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_STYLE"
 			}"
 		end

	gtk_rc_token_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_TEXT"
 			}"
 		end

	gtk_rc_token_theme_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_THEME"
 			}"
 		end

	gtk_rc_token_unbind_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_UNBIND"
 			}"
 		end

	gtk_rc_token_widget_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_WIDGET"
 			}"
 		end

	gtk_rc_token_widget_class_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_WIDGET_CLASS"
 			}"
 		end

	gtk_rc_token_xthickness_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_XTHICKNESS"
 			}"
 		end

	gtk_rc_token_ythickness_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "GTK_RC_TOKEN_YTHICKNESS"
 			}"
 		end


end -- class GTKRCTOKENTYPE_ENUM
