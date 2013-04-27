-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATKROLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

create {ANY} default_create
feature {ANY} -- Validity
    is_valid_value (a_value: INTEGER): BOOLEAN is
        do
            Result := ((a_value = atk_role_accel_label_low_level)  or else
				(a_value = atk_role_alert_low_level)  or else
				(a_value = atk_role_animation_low_level)  or else
				(a_value = atk_role_application_low_level)  or else
				(a_value = atk_role_arrow_low_level)  or else
				(a_value = atk_role_autocomplete_low_level)  or else
				(a_value = atk_role_calendar_low_level)  or else
				(a_value = atk_role_canvas_low_level)  or else
				(a_value = atk_role_caption_low_level)  or else
				(a_value = atk_role_chart_low_level)  or else
				(a_value = atk_role_check_box_low_level)  or else
				(a_value = atk_role_check_menu_item_low_level)  or else
				(a_value = atk_role_color_chooser_low_level)  or else
				(a_value = atk_role_column_header_low_level)  or else
				(a_value = atk_role_combo_box_low_level)  or else
				(a_value = atk_role_comment_low_level)  or else
				(a_value = atk_role_date_editor_low_level)  or else
				(a_value = atk_role_desktop_frame_low_level)  or else
				(a_value = atk_role_desktop_icon_low_level)  or else
				(a_value = atk_role_dial_low_level)  or else
				(a_value = atk_role_dialog_low_level)  or else
				(a_value = atk_role_directory_pane_low_level)  or else
				(a_value = atk_role_document_email_low_level)  or else
				(a_value = atk_role_document_frame_low_level)  or else
				(a_value = atk_role_document_presentation_low_level)  or else
				(a_value = atk_role_document_spreadsheet_low_level)  or else
				(a_value = atk_role_document_text_low_level)  or else
				(a_value = atk_role_document_web_low_level)  or else
				(a_value = atk_role_drawing_area_low_level)  or else
				(a_value = atk_role_editbar_low_level)  or else
				(a_value = atk_role_embedded_low_level)  or else
				(a_value = atk_role_entry_low_level)  or else
				(a_value = atk_role_file_chooser_low_level)  or else
				(a_value = atk_role_filler_low_level)  or else
				(a_value = atk_role_font_chooser_low_level)  or else
				(a_value = atk_role_footer_low_level)  or else
				(a_value = atk_role_form_low_level)  or else
				(a_value = atk_role_frame_low_level)  or else
				(a_value = atk_role_glass_pane_low_level)  or else
				(a_value = atk_role_grouping_low_level)  or else
				(a_value = atk_role_header_low_level)  or else
				(a_value = atk_role_heading_low_level)  or else
				(a_value = atk_role_html_container_low_level)  or else
				(a_value = atk_role_icon_low_level)  or else
				(a_value = atk_role_image_low_level)  or else
				(a_value = atk_role_image_map_low_level)  or else
				(a_value = atk_role_info_bar_low_level)  or else
				(a_value = atk_role_input_method_window_low_level)  or else
				(a_value = atk_role_internal_frame_low_level)  or else
				(a_value = atk_role_invalid_low_level)  or else
				(a_value = atk_role_label_low_level)  or else
				(a_value = atk_role_last_defined_low_level)  or else
				(a_value = atk_role_layered_pane_low_level)  or else
				(a_value = atk_role_link_low_level)  or else
				(a_value = atk_role_list_low_level)  or else
				(a_value = atk_role_list_box_low_level)  or else
				(a_value = atk_role_list_item_low_level)  or else
				(a_value = atk_role_menu_low_level)  or else
				(a_value = atk_role_menu_bar_low_level)  or else
				(a_value = atk_role_menu_item_low_level)  or else
				(a_value = atk_role_notification_low_level)  or else
				(a_value = atk_role_option_pane_low_level)  or else
				(a_value = atk_role_page_low_level)  or else
				(a_value = atk_role_page_tab_low_level)  or else
				(a_value = atk_role_page_tab_list_low_level)  or else
				(a_value = atk_role_panel_low_level)  or else
				(a_value = atk_role_paragraph_low_level)  or else
				(a_value = atk_role_password_text_low_level)  or else
				(a_value = atk_role_popup_menu_low_level)  or else
				(a_value = atk_role_progress_bar_low_level)  or else
				(a_value = atk_role_push_button_low_level)  or else
				(a_value = atk_role_radio_button_low_level)  or else
				(a_value = atk_role_radio_menu_item_low_level)  or else
				(a_value = atk_role_redundant_object_low_level)  or else
				(a_value = atk_role_root_pane_low_level)  or else
				(a_value = atk_role_row_header_low_level)  or else
				(a_value = atk_role_ruler_low_level)  or else
				(a_value = atk_role_scroll_bar_low_level)  or else
				(a_value = atk_role_scroll_pane_low_level)  or else
				(a_value = atk_role_section_low_level)  or else
				(a_value = atk_role_separator_low_level)  or else
				(a_value = atk_role_slider_low_level)  or else
				(a_value = atk_role_spin_button_low_level)  or else
				(a_value = atk_role_split_pane_low_level)  or else
				(a_value = atk_role_statusbar_low_level)  or else
				(a_value = atk_role_table_low_level)  or else
				(a_value = atk_role_table_cell_low_level)  or else
				(a_value = atk_role_table_column_header_low_level)  or else
				(a_value = atk_role_table_row_low_level)  or else
				(a_value = atk_role_table_row_header_low_level)  or else
				(a_value = atk_role_tear_off_menu_item_low_level)  or else
				(a_value = atk_role_terminal_low_level)  or else
				(a_value = atk_role_text_low_level)  or else
				(a_value = atk_role_toggle_button_low_level)  or else
				(a_value = atk_role_tool_bar_low_level)  or else
				(a_value = atk_role_tool_tip_low_level)  or else
				(a_value = atk_role_tree_low_level)  or else
				(a_value = atk_role_tree_item_low_level)  or else
				(a_value = atk_role_tree_table_low_level)  or else
				(a_value = atk_role_unknown_low_level)  or else
				(a_value = atk_role_viewport_low_level)  or else
				(a_value = atk_role_window_low_level) )
		end

feature {ANY} -- Setters
	default_create,
	set_atk_role_accel_label is
		do
			value := atk_role_accel_label_low_level
		end

	set_atk_role_alert is
		do
			value := atk_role_alert_low_level
		end

	set_atk_role_animation is
		do
			value := atk_role_animation_low_level
		end

	set_atk_role_application is
		do
			value := atk_role_application_low_level
		end

	set_atk_role_arrow is
		do
			value := atk_role_arrow_low_level
		end

	set_atk_role_autocomplete is
		do
			value := atk_role_autocomplete_low_level
		end

	set_atk_role_calendar is
		do
			value := atk_role_calendar_low_level
		end

	set_atk_role_canvas is
		do
			value := atk_role_canvas_low_level
		end

	set_atk_role_caption is
		do
			value := atk_role_caption_low_level
		end

	set_atk_role_chart is
		do
			value := atk_role_chart_low_level
		end

	set_atk_role_check_box is
		do
			value := atk_role_check_box_low_level
		end

	set_atk_role_check_menu_item is
		do
			value := atk_role_check_menu_item_low_level
		end

	set_atk_role_color_chooser is
		do
			value := atk_role_color_chooser_low_level
		end

	set_atk_role_column_header is
		do
			value := atk_role_column_header_low_level
		end

	set_atk_role_combo_box is
		do
			value := atk_role_combo_box_low_level
		end

	set_atk_role_comment is
		do
			value := atk_role_comment_low_level
		end

	set_atk_role_date_editor is
		do
			value := atk_role_date_editor_low_level
		end

	set_atk_role_desktop_frame is
		do
			value := atk_role_desktop_frame_low_level
		end

	set_atk_role_desktop_icon is
		do
			value := atk_role_desktop_icon_low_level
		end

	set_atk_role_dial is
		do
			value := atk_role_dial_low_level
		end

	set_atk_role_dialog is
		do
			value := atk_role_dialog_low_level
		end

	set_atk_role_directory_pane is
		do
			value := atk_role_directory_pane_low_level
		end

	set_atk_role_document_email is
		do
			value := atk_role_document_email_low_level
		end

	set_atk_role_document_frame is
		do
			value := atk_role_document_frame_low_level
		end

	set_atk_role_document_presentation is
		do
			value := atk_role_document_presentation_low_level
		end

	set_atk_role_document_spreadsheet is
		do
			value := atk_role_document_spreadsheet_low_level
		end

	set_atk_role_document_text is
		do
			value := atk_role_document_text_low_level
		end

	set_atk_role_document_web is
		do
			value := atk_role_document_web_low_level
		end

	set_atk_role_drawing_area is
		do
			value := atk_role_drawing_area_low_level
		end

	set_atk_role_editbar is
		do
			value := atk_role_editbar_low_level
		end

	set_atk_role_embedded is
		do
			value := atk_role_embedded_low_level
		end

	set_atk_role_entry is
		do
			value := atk_role_entry_low_level
		end

	set_atk_role_file_chooser is
		do
			value := atk_role_file_chooser_low_level
		end

	set_atk_role_filler is
		do
			value := atk_role_filler_low_level
		end

	set_atk_role_font_chooser is
		do
			value := atk_role_font_chooser_low_level
		end

	set_atk_role_footer is
		do
			value := atk_role_footer_low_level
		end

	set_atk_role_form is
		do
			value := atk_role_form_low_level
		end

	set_atk_role_frame is
		do
			value := atk_role_frame_low_level
		end

	set_atk_role_glass_pane is
		do
			value := atk_role_glass_pane_low_level
		end

	set_atk_role_grouping is
		do
			value := atk_role_grouping_low_level
		end

	set_atk_role_header is
		do
			value := atk_role_header_low_level
		end

	set_atk_role_heading is
		do
			value := atk_role_heading_low_level
		end

	set_atk_role_html_container is
		do
			value := atk_role_html_container_low_level
		end

	set_atk_role_icon is
		do
			value := atk_role_icon_low_level
		end

	set_atk_role_image is
		do
			value := atk_role_image_low_level
		end

	set_atk_role_image_map is
		do
			value := atk_role_image_map_low_level
		end

	set_atk_role_info_bar is
		do
			value := atk_role_info_bar_low_level
		end

	set_atk_role_input_method_window is
		do
			value := atk_role_input_method_window_low_level
		end

	set_atk_role_internal_frame is
		do
			value := atk_role_internal_frame_low_level
		end

	set_atk_role_invalid is
		do
			value := atk_role_invalid_low_level
		end

	set_atk_role_label is
		do
			value := atk_role_label_low_level
		end

	set_atk_role_last_defined is
		do
			value := atk_role_last_defined_low_level
		end

	set_atk_role_layered_pane is
		do
			value := atk_role_layered_pane_low_level
		end

	set_atk_role_link is
		do
			value := atk_role_link_low_level
		end

	set_atk_role_list is
		do
			value := atk_role_list_low_level
		end

	set_atk_role_list_box is
		do
			value := atk_role_list_box_low_level
		end

	set_atk_role_list_item is
		do
			value := atk_role_list_item_low_level
		end

	set_atk_role_menu is
		do
			value := atk_role_menu_low_level
		end

	set_atk_role_menu_bar is
		do
			value := atk_role_menu_bar_low_level
		end

	set_atk_role_menu_item is
		do
			value := atk_role_menu_item_low_level
		end

	set_atk_role_notification is
		do
			value := atk_role_notification_low_level
		end

	set_atk_role_option_pane is
		do
			value := atk_role_option_pane_low_level
		end

	set_atk_role_page is
		do
			value := atk_role_page_low_level
		end

	set_atk_role_page_tab is
		do
			value := atk_role_page_tab_low_level
		end

	set_atk_role_page_tab_list is
		do
			value := atk_role_page_tab_list_low_level
		end

	set_atk_role_panel is
		do
			value := atk_role_panel_low_level
		end

	set_atk_role_paragraph is
		do
			value := atk_role_paragraph_low_level
		end

	set_atk_role_password_text is
		do
			value := atk_role_password_text_low_level
		end

	set_atk_role_popup_menu is
		do
			value := atk_role_popup_menu_low_level
		end

	set_atk_role_progress_bar is
		do
			value := atk_role_progress_bar_low_level
		end

	set_atk_role_push_button is
		do
			value := atk_role_push_button_low_level
		end

	set_atk_role_radio_button is
		do
			value := atk_role_radio_button_low_level
		end

	set_atk_role_radio_menu_item is
		do
			value := atk_role_radio_menu_item_low_level
		end

	set_atk_role_redundant_object is
		do
			value := atk_role_redundant_object_low_level
		end

	set_atk_role_root_pane is
		do
			value := atk_role_root_pane_low_level
		end

	set_atk_role_row_header is
		do
			value := atk_role_row_header_low_level
		end

	set_atk_role_ruler is
		do
			value := atk_role_ruler_low_level
		end

	set_atk_role_scroll_bar is
		do
			value := atk_role_scroll_bar_low_level
		end

	set_atk_role_scroll_pane is
		do
			value := atk_role_scroll_pane_low_level
		end

	set_atk_role_section is
		do
			value := atk_role_section_low_level
		end

	set_atk_role_separator is
		do
			value := atk_role_separator_low_level
		end

	set_atk_role_slider is
		do
			value := atk_role_slider_low_level
		end

	set_atk_role_spin_button is
		do
			value := atk_role_spin_button_low_level
		end

	set_atk_role_split_pane is
		do
			value := atk_role_split_pane_low_level
		end

	set_atk_role_statusbar is
		do
			value := atk_role_statusbar_low_level
		end

	set_atk_role_table is
		do
			value := atk_role_table_low_level
		end

	set_atk_role_table_cell is
		do
			value := atk_role_table_cell_low_level
		end

	set_atk_role_table_column_header is
		do
			value := atk_role_table_column_header_low_level
		end

	set_atk_role_table_row is
		do
			value := atk_role_table_row_low_level
		end

	set_atk_role_table_row_header is
		do
			value := atk_role_table_row_header_low_level
		end

	set_atk_role_tear_off_menu_item is
		do
			value := atk_role_tear_off_menu_item_low_level
		end

	set_atk_role_terminal is
		do
			value := atk_role_terminal_low_level
		end

	set_atk_role_text is
		do
			value := atk_role_text_low_level
		end

	set_atk_role_toggle_button is
		do
			value := atk_role_toggle_button_low_level
		end

	set_atk_role_tool_bar is
		do
			value := atk_role_tool_bar_low_level
		end

	set_atk_role_tool_tip is
		do
			value := atk_role_tool_tip_low_level
		end

	set_atk_role_tree is
		do
			value := atk_role_tree_low_level
		end

	set_atk_role_tree_item is
		do
			value := atk_role_tree_item_low_level
		end

	set_atk_role_tree_table is
		do
			value := atk_role_tree_table_low_level
		end

	set_atk_role_unknown is
		do
			value := atk_role_unknown_low_level
		end

	set_atk_role_viewport is
		do
			value := atk_role_viewport_low_level
		end

	set_atk_role_window is
		do
			value := atk_role_window_low_level
		end

feature {ANY} -- Queries
	is_atk_role_accel_label: BOOLEAN is
		do
			Result := (value=atk_role_accel_label_low_level)
		end

	is_atk_role_alert: BOOLEAN is
		do
			Result := (value=atk_role_alert_low_level)
		end

	is_atk_role_animation: BOOLEAN is
		do
			Result := (value=atk_role_animation_low_level)
		end

	is_atk_role_application: BOOLEAN is
		do
			Result := (value=atk_role_application_low_level)
		end

	is_atk_role_arrow: BOOLEAN is
		do
			Result := (value=atk_role_arrow_low_level)
		end

	is_atk_role_autocomplete: BOOLEAN is
		do
			Result := (value=atk_role_autocomplete_low_level)
		end

	is_atk_role_calendar: BOOLEAN is
		do
			Result := (value=atk_role_calendar_low_level)
		end

	is_atk_role_canvas: BOOLEAN is
		do
			Result := (value=atk_role_canvas_low_level)
		end

	is_atk_role_caption: BOOLEAN is
		do
			Result := (value=atk_role_caption_low_level)
		end

	is_atk_role_chart: BOOLEAN is
		do
			Result := (value=atk_role_chart_low_level)
		end

	is_atk_role_check_box: BOOLEAN is
		do
			Result := (value=atk_role_check_box_low_level)
		end

	is_atk_role_check_menu_item: BOOLEAN is
		do
			Result := (value=atk_role_check_menu_item_low_level)
		end

	is_atk_role_color_chooser: BOOLEAN is
		do
			Result := (value=atk_role_color_chooser_low_level)
		end

	is_atk_role_column_header: BOOLEAN is
		do
			Result := (value=atk_role_column_header_low_level)
		end

	is_atk_role_combo_box: BOOLEAN is
		do
			Result := (value=atk_role_combo_box_low_level)
		end

	is_atk_role_comment: BOOLEAN is
		do
			Result := (value=atk_role_comment_low_level)
		end

	is_atk_role_date_editor: BOOLEAN is
		do
			Result := (value=atk_role_date_editor_low_level)
		end

	is_atk_role_desktop_frame: BOOLEAN is
		do
			Result := (value=atk_role_desktop_frame_low_level)
		end

	is_atk_role_desktop_icon: BOOLEAN is
		do
			Result := (value=atk_role_desktop_icon_low_level)
		end

	is_atk_role_dial: BOOLEAN is
		do
			Result := (value=atk_role_dial_low_level)
		end

	is_atk_role_dialog: BOOLEAN is
		do
			Result := (value=atk_role_dialog_low_level)
		end

	is_atk_role_directory_pane: BOOLEAN is
		do
			Result := (value=atk_role_directory_pane_low_level)
		end

	is_atk_role_document_email: BOOLEAN is
		do
			Result := (value=atk_role_document_email_low_level)
		end

	is_atk_role_document_frame: BOOLEAN is
		do
			Result := (value=atk_role_document_frame_low_level)
		end

	is_atk_role_document_presentation: BOOLEAN is
		do
			Result := (value=atk_role_document_presentation_low_level)
		end

	is_atk_role_document_spreadsheet: BOOLEAN is
		do
			Result := (value=atk_role_document_spreadsheet_low_level)
		end

	is_atk_role_document_text: BOOLEAN is
		do
			Result := (value=atk_role_document_text_low_level)
		end

	is_atk_role_document_web: BOOLEAN is
		do
			Result := (value=atk_role_document_web_low_level)
		end

	is_atk_role_drawing_area: BOOLEAN is
		do
			Result := (value=atk_role_drawing_area_low_level)
		end

	is_atk_role_editbar: BOOLEAN is
		do
			Result := (value=atk_role_editbar_low_level)
		end

	is_atk_role_embedded: BOOLEAN is
		do
			Result := (value=atk_role_embedded_low_level)
		end

	is_atk_role_entry: BOOLEAN is
		do
			Result := (value=atk_role_entry_low_level)
		end

	is_atk_role_file_chooser: BOOLEAN is
		do
			Result := (value=atk_role_file_chooser_low_level)
		end

	is_atk_role_filler: BOOLEAN is
		do
			Result := (value=atk_role_filler_low_level)
		end

	is_atk_role_font_chooser: BOOLEAN is
		do
			Result := (value=atk_role_font_chooser_low_level)
		end

	is_atk_role_footer: BOOLEAN is
		do
			Result := (value=atk_role_footer_low_level)
		end

	is_atk_role_form: BOOLEAN is
		do
			Result := (value=atk_role_form_low_level)
		end

	is_atk_role_frame: BOOLEAN is
		do
			Result := (value=atk_role_frame_low_level)
		end

	is_atk_role_glass_pane: BOOLEAN is
		do
			Result := (value=atk_role_glass_pane_low_level)
		end

	is_atk_role_grouping: BOOLEAN is
		do
			Result := (value=atk_role_grouping_low_level)
		end

	is_atk_role_header: BOOLEAN is
		do
			Result := (value=atk_role_header_low_level)
		end

	is_atk_role_heading: BOOLEAN is
		do
			Result := (value=atk_role_heading_low_level)
		end

	is_atk_role_html_container: BOOLEAN is
		do
			Result := (value=atk_role_html_container_low_level)
		end

	is_atk_role_icon: BOOLEAN is
		do
			Result := (value=atk_role_icon_low_level)
		end

	is_atk_role_image: BOOLEAN is
		do
			Result := (value=atk_role_image_low_level)
		end

	is_atk_role_image_map: BOOLEAN is
		do
			Result := (value=atk_role_image_map_low_level)
		end

	is_atk_role_info_bar: BOOLEAN is
		do
			Result := (value=atk_role_info_bar_low_level)
		end

	is_atk_role_input_method_window: BOOLEAN is
		do
			Result := (value=atk_role_input_method_window_low_level)
		end

	is_atk_role_internal_frame: BOOLEAN is
		do
			Result := (value=atk_role_internal_frame_low_level)
		end

	is_atk_role_invalid: BOOLEAN is
		do
			Result := (value=atk_role_invalid_low_level)
		end

	is_atk_role_label: BOOLEAN is
		do
			Result := (value=atk_role_label_low_level)
		end

	is_atk_role_last_defined: BOOLEAN is
		do
			Result := (value=atk_role_last_defined_low_level)
		end

	is_atk_role_layered_pane: BOOLEAN is
		do
			Result := (value=atk_role_layered_pane_low_level)
		end

	is_atk_role_link: BOOLEAN is
		do
			Result := (value=atk_role_link_low_level)
		end

	is_atk_role_list: BOOLEAN is
		do
			Result := (value=atk_role_list_low_level)
		end

	is_atk_role_list_box: BOOLEAN is
		do
			Result := (value=atk_role_list_box_low_level)
		end

	is_atk_role_list_item: BOOLEAN is
		do
			Result := (value=atk_role_list_item_low_level)
		end

	is_atk_role_menu: BOOLEAN is
		do
			Result := (value=atk_role_menu_low_level)
		end

	is_atk_role_menu_bar: BOOLEAN is
		do
			Result := (value=atk_role_menu_bar_low_level)
		end

	is_atk_role_menu_item: BOOLEAN is
		do
			Result := (value=atk_role_menu_item_low_level)
		end

	is_atk_role_notification: BOOLEAN is
		do
			Result := (value=atk_role_notification_low_level)
		end

	is_atk_role_option_pane: BOOLEAN is
		do
			Result := (value=atk_role_option_pane_low_level)
		end

	is_atk_role_page: BOOLEAN is
		do
			Result := (value=atk_role_page_low_level)
		end

	is_atk_role_page_tab: BOOLEAN is
		do
			Result := (value=atk_role_page_tab_low_level)
		end

	is_atk_role_page_tab_list: BOOLEAN is
		do
			Result := (value=atk_role_page_tab_list_low_level)
		end

	is_atk_role_panel: BOOLEAN is
		do
			Result := (value=atk_role_panel_low_level)
		end

	is_atk_role_paragraph: BOOLEAN is
		do
			Result := (value=atk_role_paragraph_low_level)
		end

	is_atk_role_password_text: BOOLEAN is
		do
			Result := (value=atk_role_password_text_low_level)
		end

	is_atk_role_popup_menu: BOOLEAN is
		do
			Result := (value=atk_role_popup_menu_low_level)
		end

	is_atk_role_progress_bar: BOOLEAN is
		do
			Result := (value=atk_role_progress_bar_low_level)
		end

	is_atk_role_push_button: BOOLEAN is
		do
			Result := (value=atk_role_push_button_low_level)
		end

	is_atk_role_radio_button: BOOLEAN is
		do
			Result := (value=atk_role_radio_button_low_level)
		end

	is_atk_role_radio_menu_item: BOOLEAN is
		do
			Result := (value=atk_role_radio_menu_item_low_level)
		end

	is_atk_role_redundant_object: BOOLEAN is
		do
			Result := (value=atk_role_redundant_object_low_level)
		end

	is_atk_role_root_pane: BOOLEAN is
		do
			Result := (value=atk_role_root_pane_low_level)
		end

	is_atk_role_row_header: BOOLEAN is
		do
			Result := (value=atk_role_row_header_low_level)
		end

	is_atk_role_ruler: BOOLEAN is
		do
			Result := (value=atk_role_ruler_low_level)
		end

	is_atk_role_scroll_bar: BOOLEAN is
		do
			Result := (value=atk_role_scroll_bar_low_level)
		end

	is_atk_role_scroll_pane: BOOLEAN is
		do
			Result := (value=atk_role_scroll_pane_low_level)
		end

	is_atk_role_section: BOOLEAN is
		do
			Result := (value=atk_role_section_low_level)
		end

	is_atk_role_separator: BOOLEAN is
		do
			Result := (value=atk_role_separator_low_level)
		end

	is_atk_role_slider: BOOLEAN is
		do
			Result := (value=atk_role_slider_low_level)
		end

	is_atk_role_spin_button: BOOLEAN is
		do
			Result := (value=atk_role_spin_button_low_level)
		end

	is_atk_role_split_pane: BOOLEAN is
		do
			Result := (value=atk_role_split_pane_low_level)
		end

	is_atk_role_statusbar: BOOLEAN is
		do
			Result := (value=atk_role_statusbar_low_level)
		end

	is_atk_role_table: BOOLEAN is
		do
			Result := (value=atk_role_table_low_level)
		end

	is_atk_role_table_cell: BOOLEAN is
		do
			Result := (value=atk_role_table_cell_low_level)
		end

	is_atk_role_table_column_header: BOOLEAN is
		do
			Result := (value=atk_role_table_column_header_low_level)
		end

	is_atk_role_table_row: BOOLEAN is
		do
			Result := (value=atk_role_table_row_low_level)
		end

	is_atk_role_table_row_header: BOOLEAN is
		do
			Result := (value=atk_role_table_row_header_low_level)
		end

	is_atk_role_tear_off_menu_item: BOOLEAN is
		do
			Result := (value=atk_role_tear_off_menu_item_low_level)
		end

	is_atk_role_terminal: BOOLEAN is
		do
			Result := (value=atk_role_terminal_low_level)
		end

	is_atk_role_text: BOOLEAN is
		do
			Result := (value=atk_role_text_low_level)
		end

	is_atk_role_toggle_button: BOOLEAN is
		do
			Result := (value=atk_role_toggle_button_low_level)
		end

	is_atk_role_tool_bar: BOOLEAN is
		do
			Result := (value=atk_role_tool_bar_low_level)
		end

	is_atk_role_tool_tip: BOOLEAN is
		do
			Result := (value=atk_role_tool_tip_low_level)
		end

	is_atk_role_tree: BOOLEAN is
		do
			Result := (value=atk_role_tree_low_level)
		end

	is_atk_role_tree_item: BOOLEAN is
		do
			Result := (value=atk_role_tree_item_low_level)
		end

	is_atk_role_tree_table: BOOLEAN is
		do
			Result := (value=atk_role_tree_table_low_level)
		end

	is_atk_role_unknown: BOOLEAN is
		do
			Result := (value=atk_role_unknown_low_level)
		end

	is_atk_role_viewport: BOOLEAN is
		do
			Result := (value=atk_role_viewport_low_level)
		end

	is_atk_role_window: BOOLEAN is
		do
			Result := (value=atk_role_window_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	atk_role_accel_label_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ACCEL_LABEL"
 			}"
 		end

	atk_role_alert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ALERT"
 			}"
 		end

	atk_role_animation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ANIMATION"
 			}"
 		end

	atk_role_application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_APPLICATION"
 			}"
 		end

	atk_role_arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ARROW"
 			}"
 		end

	atk_role_autocomplete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_AUTOCOMPLETE"
 			}"
 		end

	atk_role_calendar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CALENDAR"
 			}"
 		end

	atk_role_canvas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CANVAS"
 			}"
 		end

	atk_role_caption_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CAPTION"
 			}"
 		end

	atk_role_chart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHART"
 			}"
 		end

	atk_role_check_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHECK_BOX"
 			}"
 		end

	atk_role_check_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHECK_MENU_ITEM"
 			}"
 		end

	atk_role_color_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COLOR_CHOOSER"
 			}"
 		end

	atk_role_column_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COLUMN_HEADER"
 			}"
 		end

	atk_role_combo_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COMBO_BOX"
 			}"
 		end

	atk_role_comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COMMENT"
 			}"
 		end

	atk_role_date_editor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DATE_EDITOR"
 			}"
 		end

	atk_role_desktop_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DESKTOP_FRAME"
 			}"
 		end

	atk_role_desktop_icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DESKTOP_ICON"
 			}"
 		end

	atk_role_dial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIAL"
 			}"
 		end

	atk_role_dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIALOG"
 			}"
 		end

	atk_role_directory_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIRECTORY_PANE"
 			}"
 		end

	atk_role_document_email_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_EMAIL"
 			}"
 		end

	atk_role_document_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_FRAME"
 			}"
 		end

	atk_role_document_presentation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_PRESENTATION"
 			}"
 		end

	atk_role_document_spreadsheet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_SPREADSHEET"
 			}"
 		end

	atk_role_document_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_TEXT"
 			}"
 		end

	atk_role_document_web_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_WEB"
 			}"
 		end

	atk_role_drawing_area_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DRAWING_AREA"
 			}"
 		end

	atk_role_editbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_EDITBAR"
 			}"
 		end

	atk_role_embedded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_EMBEDDED"
 			}"
 		end

	atk_role_entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ENTRY"
 			}"
 		end

	atk_role_file_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FILE_CHOOSER"
 			}"
 		end

	atk_role_filler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FILLER"
 			}"
 		end

	atk_role_font_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FONT_CHOOSER"
 			}"
 		end

	atk_role_footer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FOOTER"
 			}"
 		end

	atk_role_form_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FORM"
 			}"
 		end

	atk_role_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FRAME"
 			}"
 		end

	atk_role_glass_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_GLASS_PANE"
 			}"
 		end

	atk_role_grouping_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_GROUPING"
 			}"
 		end

	atk_role_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HEADER"
 			}"
 		end

	atk_role_heading_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HEADING"
 			}"
 		end

	atk_role_html_container_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HTML_CONTAINER"
 			}"
 		end

	atk_role_icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ICON"
 			}"
 		end

	atk_role_image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_IMAGE"
 			}"
 		end

	atk_role_image_map_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_IMAGE_MAP"
 			}"
 		end

	atk_role_info_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INFO_BAR"
 			}"
 		end

	atk_role_input_method_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INPUT_METHOD_WINDOW"
 			}"
 		end

	atk_role_internal_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INTERNAL_FRAME"
 			}"
 		end

	atk_role_invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INVALID"
 			}"
 		end

	atk_role_label_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LABEL"
 			}"
 		end

	atk_role_last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LAST_DEFINED"
 			}"
 		end

	atk_role_layered_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LAYERED_PANE"
 			}"
 		end

	atk_role_link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LINK"
 			}"
 		end

	atk_role_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST"
 			}"
 		end

	atk_role_list_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST_BOX"
 			}"
 		end

	atk_role_list_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST_ITEM"
 			}"
 		end

	atk_role_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU"
 			}"
 		end

	atk_role_menu_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU_BAR"
 			}"
 		end

	atk_role_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU_ITEM"
 			}"
 		end

	atk_role_notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_NOTIFICATION"
 			}"
 		end

	atk_role_option_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_OPTION_PANE"
 			}"
 		end

	atk_role_page_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE"
 			}"
 		end

	atk_role_page_tab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE_TAB"
 			}"
 		end

	atk_role_page_tab_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE_TAB_LIST"
 			}"
 		end

	atk_role_panel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PANEL"
 			}"
 		end

	atk_role_paragraph_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PARAGRAPH"
 			}"
 		end

	atk_role_password_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PASSWORD_TEXT"
 			}"
 		end

	atk_role_popup_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_POPUP_MENU"
 			}"
 		end

	atk_role_progress_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PROGRESS_BAR"
 			}"
 		end

	atk_role_push_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PUSH_BUTTON"
 			}"
 		end

	atk_role_radio_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RADIO_BUTTON"
 			}"
 		end

	atk_role_radio_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RADIO_MENU_ITEM"
 			}"
 		end

	atk_role_redundant_object_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_REDUNDANT_OBJECT"
 			}"
 		end

	atk_role_root_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ROOT_PANE"
 			}"
 		end

	atk_role_row_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ROW_HEADER"
 			}"
 		end

	atk_role_ruler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RULER"
 			}"
 		end

	atk_role_scroll_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SCROLL_BAR"
 			}"
 		end

	atk_role_scroll_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SCROLL_PANE"
 			}"
 		end

	atk_role_section_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SECTION"
 			}"
 		end

	atk_role_separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SEPARATOR"
 			}"
 		end

	atk_role_slider_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SLIDER"
 			}"
 		end

	atk_role_spin_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SPIN_BUTTON"
 			}"
 		end

	atk_role_split_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SPLIT_PANE"
 			}"
 		end

	atk_role_statusbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_STATUSBAR"
 			}"
 		end

	atk_role_table_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE"
 			}"
 		end

	atk_role_table_cell_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_CELL"
 			}"
 		end

	atk_role_table_column_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_COLUMN_HEADER"
 			}"
 		end

	atk_role_table_row_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_ROW"
 			}"
 		end

	atk_role_table_row_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_ROW_HEADER"
 			}"
 		end

	atk_role_tear_off_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TEAR_OFF_MENU_ITEM"
 			}"
 		end

	atk_role_terminal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TERMINAL"
 			}"
 		end

	atk_role_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TEXT"
 			}"
 		end

	atk_role_toggle_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOGGLE_BUTTON"
 			}"
 		end

	atk_role_tool_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOOL_BAR"
 			}"
 		end

	atk_role_tool_tip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOOL_TIP"
 			}"
 		end

	atk_role_tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE"
 			}"
 		end

	atk_role_tree_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE_ITEM"
 			}"
 		end

	atk_role_tree_table_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE_TABLE"
 			}"
 		end

	atk_role_unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_UNKNOWN"
 			}"
 		end

	atk_role_viewport_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_VIEWPORT"
 			}"
 		end

	atk_role_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_WINDOW"
 			}"
 		end


end -- class ATKROLE_ENUM
