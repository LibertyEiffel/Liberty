-- This file have been created by wrapper-generator.
-- Any change will be lost by the next execution of the tool.

expanded class ATK_ROLE_ENUM

-- TODO emit_description(class_descriptions.reference_at(an_enum_name))

insert ENUM

creation default_create
feature -- Validity
	is_valid_value (a_value: INTEGER): BOOLEAN is
		do
			Result := ((a_value = invalid_low_level)  or else
				(a_value = accel_label_low_level)  or else
				(a_value = alert_low_level)  or else
				(a_value = animation_low_level)  or else
				(a_value = arrow_low_level)  or else
				(a_value = calendar_low_level)  or else
				(a_value = canvas_low_level)  or else
				(a_value = check_box_low_level)  or else
				(a_value = check_menu_item_low_level)  or else
				(a_value = color_chooser_low_level)  or else
				(a_value = column_header_low_level)  or else
				(a_value = combo_box_low_level)  or else
				(a_value = date_editor_low_level)  or else
				(a_value = desktop_icon_low_level)  or else
				(a_value = desktop_frame_low_level)  or else
				(a_value = dial_low_level)  or else
				(a_value = dialog_low_level)  or else
				(a_value = directory_pane_low_level)  or else
				(a_value = drawing_area_low_level)  or else
				(a_value = file_chooser_low_level)  or else
				(a_value = filler_low_level)  or else
				(a_value = font_chooser_low_level)  or else
				(a_value = frame_low_level)  or else
				(a_value = glass_pane_low_level)  or else
				(a_value = html_container_low_level)  or else
				(a_value = icon_low_level)  or else
				(a_value = image_low_level)  or else
				(a_value = internal_frame_low_level)  or else
				(a_value = label_low_level)  or else
				(a_value = layered_pane_low_level)  or else
				(a_value = list_low_level)  or else
				(a_value = list_item_low_level)  or else
				(a_value = menu_low_level)  or else
				(a_value = menu_bar_low_level)  or else
				(a_value = menu_item_low_level)  or else
				(a_value = option_pane_low_level)  or else
				(a_value = page_tab_low_level)  or else
				(a_value = page_tab_list_low_level)  or else
				(a_value = panel_low_level)  or else
				(a_value = password_text_low_level)  or else
				(a_value = popup_menu_low_level)  or else
				(a_value = progress_bar_low_level)  or else
				(a_value = push_button_low_level)  or else
				(a_value = radio_button_low_level)  or else
				(a_value = radio_menu_item_low_level)  or else
				(a_value = root_pane_low_level)  or else
				(a_value = row_header_low_level)  or else
				(a_value = scroll_bar_low_level)  or else
				(a_value = scroll_pane_low_level)  or else
				(a_value = separator_low_level)  or else
				(a_value = slider_low_level)  or else
				(a_value = split_pane_low_level)  or else
				(a_value = spin_button_low_level)  or else
				(a_value = statusbar_low_level)  or else
				(a_value = table_low_level)  or else
				(a_value = table_cell_low_level)  or else
				(a_value = table_column_header_low_level)  or else
				(a_value = table_row_header_low_level)  or else
				(a_value = tear_off_menu_item_low_level)  or else
				(a_value = terminal_low_level)  or else
				(a_value = text_low_level)  or else
				(a_value = toggle_button_low_level)  or else
				(a_value = tool_bar_low_level)  or else
				(a_value = tool_tip_low_level)  or else
				(a_value = tree_low_level)  or else
				(a_value = tree_table_low_level)  or else
				(a_value = unknown_low_level)  or else
				(a_value = viewport_low_level)  or else
				(a_value = window_low_level)  or else
				(a_value = header_low_level)  or else
				(a_value = footer_low_level)  or else
				(a_value = paragraph_low_level)  or else
				(a_value = ruler_low_level)  or else
				(a_value = application_low_level)  or else
				(a_value = autocomplete_low_level)  or else
				(a_value = editbar_low_level)  or else
				(a_value = embedded_low_level)  or else
				(a_value = entry_low_level)  or else
				(a_value = chart_low_level)  or else
				(a_value = caption_low_level)  or else
				(a_value = document_frame_low_level)  or else
				(a_value = heading_low_level)  or else
				(a_value = page_low_level)  or else
				(a_value = section_low_level)  or else
				(a_value = redundant_object_low_level)  or else
				(a_value = form_low_level)  or else
				(a_value = link_low_level)  or else
				(a_value = input_method_window_low_level)  or else
				(a_value = table_row_low_level)  or else
				(a_value = tree_item_low_level)  or else
				(a_value = document_spreadsheet_low_level)  or else
				(a_value = document_presentation_low_level)  or else
				(a_value = document_text_low_level)  or else
				(a_value = document_web_low_level)  or else
				(a_value = document_email_low_level)  or else
				(a_value = comment_low_level)  or else
				(a_value = list_box_low_level)  or else
				(a_value = grouping_low_level)  or else
				(a_value = image_map_low_level)  or else
				(a_value = notification_low_level)  or else
				(a_value = info_bar_low_level)  or else
				(a_value = last_defined_low_level) )
		end

feature -- Setters
	default_create,
	set_invalid is
		do
			value := invalid_low_level
		end

	set_accel_label is
		do
			value := accel_label_low_level
		end

	set_alert is
		do
			value := alert_low_level
		end

	set_animation is
		do
			value := animation_low_level
		end

	set_arrow is
		do
			value := arrow_low_level
		end

	set_calendar is
		do
			value := calendar_low_level
		end

	set_canvas is
		do
			value := canvas_low_level
		end

	set_check_box is
		do
			value := check_box_low_level
		end

	set_check_menu_item is
		do
			value := check_menu_item_low_level
		end

	set_color_chooser is
		do
			value := color_chooser_low_level
		end

	set_column_header is
		do
			value := column_header_low_level
		end

	set_combo_box is
		do
			value := combo_box_low_level
		end

	set_date_editor is
		do
			value := date_editor_low_level
		end

	set_desktop_icon is
		do
			value := desktop_icon_low_level
		end

	set_desktop_frame is
		do
			value := desktop_frame_low_level
		end

	set_dial is
		do
			value := dial_low_level
		end

	set_dialog is
		do
			value := dialog_low_level
		end

	set_directory_pane is
		do
			value := directory_pane_low_level
		end

	set_drawing_area is
		do
			value := drawing_area_low_level
		end

	set_file_chooser is
		do
			value := file_chooser_low_level
		end

	set_filler is
		do
			value := filler_low_level
		end

	set_font_chooser is
		do
			value := font_chooser_low_level
		end

	set_frame is
		do
			value := frame_low_level
		end

	set_glass_pane is
		do
			value := glass_pane_low_level
		end

	set_html_container is
		do
			value := html_container_low_level
		end

	set_icon is
		do
			value := icon_low_level
		end

	set_image is
		do
			value := image_low_level
		end

	set_internal_frame is
		do
			value := internal_frame_low_level
		end

	set_label is
		do
			value := label_low_level
		end

	set_layered_pane is
		do
			value := layered_pane_low_level
		end

	set_list is
		do
			value := list_low_level
		end

	set_list_item is
		do
			value := list_item_low_level
		end

	set_menu is
		do
			value := menu_low_level
		end

	set_menu_bar is
		do
			value := menu_bar_low_level
		end

	set_menu_item is
		do
			value := menu_item_low_level
		end

	set_option_pane is
		do
			value := option_pane_low_level
		end

	set_page_tab is
		do
			value := page_tab_low_level
		end

	set_page_tab_list is
		do
			value := page_tab_list_low_level
		end

	set_panel is
		do
			value := panel_low_level
		end

	set_password_text is
		do
			value := password_text_low_level
		end

	set_popup_menu is
		do
			value := popup_menu_low_level
		end

	set_progress_bar is
		do
			value := progress_bar_low_level
		end

	set_push_button is
		do
			value := push_button_low_level
		end

	set_radio_button is
		do
			value := radio_button_low_level
		end

	set_radio_menu_item is
		do
			value := radio_menu_item_low_level
		end

	set_root_pane is
		do
			value := root_pane_low_level
		end

	set_row_header is
		do
			value := row_header_low_level
		end

	set_scroll_bar is
		do
			value := scroll_bar_low_level
		end

	set_scroll_pane is
		do
			value := scroll_pane_low_level
		end

	set_separator is
		do
			value := separator_low_level
		end

	set_slider is
		do
			value := slider_low_level
		end

	set_split_pane is
		do
			value := split_pane_low_level
		end

	set_spin_button is
		do
			value := spin_button_low_level
		end

	set_statusbar is
		do
			value := statusbar_low_level
		end

	set_table is
		do
			value := table_low_level
		end

	set_table_cell is
		do
			value := table_cell_low_level
		end

	set_table_column_header is
		do
			value := table_column_header_low_level
		end

	set_table_row_header is
		do
			value := table_row_header_low_level
		end

	set_tear_off_menu_item is
		do
			value := tear_off_menu_item_low_level
		end

	set_terminal is
		do
			value := terminal_low_level
		end

	set_text is
		do
			value := text_low_level
		end

	set_toggle_button is
		do
			value := toggle_button_low_level
		end

	set_tool_bar is
		do
			value := tool_bar_low_level
		end

	set_tool_tip is
		do
			value := tool_tip_low_level
		end

	set_tree is
		do
			value := tree_low_level
		end

	set_tree_table is
		do
			value := tree_table_low_level
		end

	set_unknown is
		do
			value := unknown_low_level
		end

	set_viewport is
		do
			value := viewport_low_level
		end

	set_window is
		do
			value := window_low_level
		end

	set_header is
		do
			value := header_low_level
		end

	set_footer is
		do
			value := footer_low_level
		end

	set_paragraph is
		do
			value := paragraph_low_level
		end

	set_ruler is
		do
			value := ruler_low_level
		end

	set_application is
		do
			value := application_low_level
		end

	set_autocomplete is
		do
			value := autocomplete_low_level
		end

	set_editbar is
		do
			value := editbar_low_level
		end

	set_embedded is
		do
			value := embedded_low_level
		end

	set_entry is
		do
			value := entry_low_level
		end

	set_chart is
		do
			value := chart_low_level
		end

	set_caption is
		do
			value := caption_low_level
		end

	set_document_frame is
		do
			value := document_frame_low_level
		end

	set_heading is
		do
			value := heading_low_level
		end

	set_page is
		do
			value := page_low_level
		end

	set_section is
		do
			value := section_low_level
		end

	set_redundant_object is
		do
			value := redundant_object_low_level
		end

	set_form is
		do
			value := form_low_level
		end

	set_link is
		do
			value := link_low_level
		end

	set_input_method_window is
		do
			value := input_method_window_low_level
		end

	set_table_row is
		do
			value := table_row_low_level
		end

	set_tree_item is
		do
			value := tree_item_low_level
		end

	set_document_spreadsheet is
		do
			value := document_spreadsheet_low_level
		end

	set_document_presentation is
		do
			value := document_presentation_low_level
		end

	set_document_text is
		do
			value := document_text_low_level
		end

	set_document_web is
		do
			value := document_web_low_level
		end

	set_document_email is
		do
			value := document_email_low_level
		end

	set_comment is
		do
			value := comment_low_level
		end

	set_list_box is
		do
			value := list_box_low_level
		end

	set_grouping is
		do
			value := grouping_low_level
		end

	set_image_map is
		do
			value := image_map_low_level
		end

	set_notification is
		do
			value := notification_low_level
		end

	set_info_bar is
		do
			value := info_bar_low_level
		end

	set_last_defined is
		do
			value := last_defined_low_level
		end

feature -- Queries
	invalid: BOOLEAN is
		do
			Result := (value=invalid_low_level)
		end

	accel_label: BOOLEAN is
		do
			Result := (value=accel_label_low_level)
		end

	alert: BOOLEAN is
		do
			Result := (value=alert_low_level)
		end

	animation: BOOLEAN is
		do
			Result := (value=animation_low_level)
		end

	arrow: BOOLEAN is
		do
			Result := (value=arrow_low_level)
		end

	calendar: BOOLEAN is
		do
			Result := (value=calendar_low_level)
		end

	canvas: BOOLEAN is
		do
			Result := (value=canvas_low_level)
		end

	check_box: BOOLEAN is
		do
			Result := (value=check_box_low_level)
		end

	check_menu_item: BOOLEAN is
		do
			Result := (value=check_menu_item_low_level)
		end

	color_chooser: BOOLEAN is
		do
			Result := (value=color_chooser_low_level)
		end

	column_header: BOOLEAN is
		do
			Result := (value=column_header_low_level)
		end

	combo_box: BOOLEAN is
		do
			Result := (value=combo_box_low_level)
		end

	date_editor: BOOLEAN is
		do
			Result := (value=date_editor_low_level)
		end

	desktop_icon: BOOLEAN is
		do
			Result := (value=desktop_icon_low_level)
		end

	desktop_frame: BOOLEAN is
		do
			Result := (value=desktop_frame_low_level)
		end

	dial: BOOLEAN is
		do
			Result := (value=dial_low_level)
		end

	dialog: BOOLEAN is
		do
			Result := (value=dialog_low_level)
		end

	directory_pane: BOOLEAN is
		do
			Result := (value=directory_pane_low_level)
		end

	drawing_area: BOOLEAN is
		do
			Result := (value=drawing_area_low_level)
		end

	file_chooser: BOOLEAN is
		do
			Result := (value=file_chooser_low_level)
		end

	filler: BOOLEAN is
		do
			Result := (value=filler_low_level)
		end

	font_chooser: BOOLEAN is
		do
			Result := (value=font_chooser_low_level)
		end

	frame: BOOLEAN is
		do
			Result := (value=frame_low_level)
		end

	glass_pane: BOOLEAN is
		do
			Result := (value=glass_pane_low_level)
		end

	html_container: BOOLEAN is
		do
			Result := (value=html_container_low_level)
		end

	icon: BOOLEAN is
		do
			Result := (value=icon_low_level)
		end

	image: BOOLEAN is
		do
			Result := (value=image_low_level)
		end

	internal_frame: BOOLEAN is
		do
			Result := (value=internal_frame_low_level)
		end

	label: BOOLEAN is
		do
			Result := (value=label_low_level)
		end

	layered_pane: BOOLEAN is
		do
			Result := (value=layered_pane_low_level)
		end

	list: BOOLEAN is
		do
			Result := (value=list_low_level)
		end

	list_item: BOOLEAN is
		do
			Result := (value=list_item_low_level)
		end

	menu: BOOLEAN is
		do
			Result := (value=menu_low_level)
		end

	menu_bar: BOOLEAN is
		do
			Result := (value=menu_bar_low_level)
		end

	menu_item: BOOLEAN is
		do
			Result := (value=menu_item_low_level)
		end

	option_pane: BOOLEAN is
		do
			Result := (value=option_pane_low_level)
		end

	page_tab: BOOLEAN is
		do
			Result := (value=page_tab_low_level)
		end

	page_tab_list: BOOLEAN is
		do
			Result := (value=page_tab_list_low_level)
		end

	panel: BOOLEAN is
		do
			Result := (value=panel_low_level)
		end

	password_text: BOOLEAN is
		do
			Result := (value=password_text_low_level)
		end

	popup_menu: BOOLEAN is
		do
			Result := (value=popup_menu_low_level)
		end

	progress_bar: BOOLEAN is
		do
			Result := (value=progress_bar_low_level)
		end

	push_button: BOOLEAN is
		do
			Result := (value=push_button_low_level)
		end

	radio_button: BOOLEAN is
		do
			Result := (value=radio_button_low_level)
		end

	radio_menu_item: BOOLEAN is
		do
			Result := (value=radio_menu_item_low_level)
		end

	root_pane: BOOLEAN is
		do
			Result := (value=root_pane_low_level)
		end

	row_header: BOOLEAN is
		do
			Result := (value=row_header_low_level)
		end

	scroll_bar: BOOLEAN is
		do
			Result := (value=scroll_bar_low_level)
		end

	scroll_pane: BOOLEAN is
		do
			Result := (value=scroll_pane_low_level)
		end

	separator: BOOLEAN is
		do
			Result := (value=separator_low_level)
		end

	slider: BOOLEAN is
		do
			Result := (value=slider_low_level)
		end

	split_pane: BOOLEAN is
		do
			Result := (value=split_pane_low_level)
		end

	spin_button: BOOLEAN is
		do
			Result := (value=spin_button_low_level)
		end

	statusbar: BOOLEAN is
		do
			Result := (value=statusbar_low_level)
		end

	table: BOOLEAN is
		do
			Result := (value=table_low_level)
		end

	table_cell: BOOLEAN is
		do
			Result := (value=table_cell_low_level)
		end

	table_column_header: BOOLEAN is
		do
			Result := (value=table_column_header_low_level)
		end

	table_row_header: BOOLEAN is
		do
			Result := (value=table_row_header_low_level)
		end

	tear_off_menu_item: BOOLEAN is
		do
			Result := (value=tear_off_menu_item_low_level)
		end

	terminal: BOOLEAN is
		do
			Result := (value=terminal_low_level)
		end

	text: BOOLEAN is
		do
			Result := (value=text_low_level)
		end

	toggle_button: BOOLEAN is
		do
			Result := (value=toggle_button_low_level)
		end

	tool_bar: BOOLEAN is
		do
			Result := (value=tool_bar_low_level)
		end

	tool_tip: BOOLEAN is
		do
			Result := (value=tool_tip_low_level)
		end

	tree: BOOLEAN is
		do
			Result := (value=tree_low_level)
		end

	tree_table: BOOLEAN is
		do
			Result := (value=tree_table_low_level)
		end

	unknown: BOOLEAN is
		do
			Result := (value=unknown_low_level)
		end

	viewport: BOOLEAN is
		do
			Result := (value=viewport_low_level)
		end

	window: BOOLEAN is
		do
			Result := (value=window_low_level)
		end

	header: BOOLEAN is
		do
			Result := (value=header_low_level)
		end

	footer: BOOLEAN is
		do
			Result := (value=footer_low_level)
		end

	paragraph: BOOLEAN is
		do
			Result := (value=paragraph_low_level)
		end

	ruler: BOOLEAN is
		do
			Result := (value=ruler_low_level)
		end

	application: BOOLEAN is
		do
			Result := (value=application_low_level)
		end

	autocomplete: BOOLEAN is
		do
			Result := (value=autocomplete_low_level)
		end

	editbar: BOOLEAN is
		do
			Result := (value=editbar_low_level)
		end

	embedded: BOOLEAN is
		do
			Result := (value=embedded_low_level)
		end

	entry: BOOLEAN is
		do
			Result := (value=entry_low_level)
		end

	chart: BOOLEAN is
		do
			Result := (value=chart_low_level)
		end

	caption: BOOLEAN is
		do
			Result := (value=caption_low_level)
		end

	document_frame: BOOLEAN is
		do
			Result := (value=document_frame_low_level)
		end

	heading: BOOLEAN is
		do
			Result := (value=heading_low_level)
		end

	page: BOOLEAN is
		do
			Result := (value=page_low_level)
		end

	section: BOOLEAN is
		do
			Result := (value=section_low_level)
		end

	redundant_object: BOOLEAN is
		do
			Result := (value=redundant_object_low_level)
		end

	form: BOOLEAN is
		do
			Result := (value=form_low_level)
		end

	link: BOOLEAN is
		do
			Result := (value=link_low_level)
		end

	input_method_window: BOOLEAN is
		do
			Result := (value=input_method_window_low_level)
		end

	table_row: BOOLEAN is
		do
			Result := (value=table_row_low_level)
		end

	tree_item: BOOLEAN is
		do
			Result := (value=tree_item_low_level)
		end

	document_spreadsheet: BOOLEAN is
		do
			Result := (value=document_spreadsheet_low_level)
		end

	document_presentation: BOOLEAN is
		do
			Result := (value=document_presentation_low_level)
		end

	document_text: BOOLEAN is
		do
			Result := (value=document_text_low_level)
		end

	document_web: BOOLEAN is
		do
			Result := (value=document_web_low_level)
		end

	document_email: BOOLEAN is
		do
			Result := (value=document_email_low_level)
		end

	comment: BOOLEAN is
		do
			Result := (value=comment_low_level)
		end

	list_box: BOOLEAN is
		do
			Result := (value=list_box_low_level)
		end

	grouping: BOOLEAN is
		do
			Result := (value=grouping_low_level)
		end

	image_map: BOOLEAN is
		do
			Result := (value=image_map_low_level)
		end

	notification: BOOLEAN is
		do
			Result := (value=notification_low_level)
		end

	info_bar: BOOLEAN is
		do
			Result := (value=info_bar_low_level)
		end

	last_defined: BOOLEAN is
		do
			Result := (value=last_defined_low_level)
		end

feature {WRAPPER, WRAPPER_HANDLER} -- Low level values
	invalid_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INVALID"
 			}"
 		end

	accel_label_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ACCEL_LABEL"
 			}"
 		end

	alert_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ALERT"
 			}"
 		end

	animation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ANIMATION"
 			}"
 		end

	arrow_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ARROW"
 			}"
 		end

	calendar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CALENDAR"
 			}"
 		end

	canvas_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CANVAS"
 			}"
 		end

	check_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHECK_BOX"
 			}"
 		end

	check_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHECK_MENU_ITEM"
 			}"
 		end

	color_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COLOR_CHOOSER"
 			}"
 		end

	column_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COLUMN_HEADER"
 			}"
 		end

	combo_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COMBO_BOX"
 			}"
 		end

	date_editor_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DATE_EDITOR"
 			}"
 		end

	desktop_icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DESKTOP_ICON"
 			}"
 		end

	desktop_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DESKTOP_FRAME"
 			}"
 		end

	dial_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIAL"
 			}"
 		end

	dialog_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIALOG"
 			}"
 		end

	directory_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DIRECTORY_PANE"
 			}"
 		end

	drawing_area_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DRAWING_AREA"
 			}"
 		end

	file_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FILE_CHOOSER"
 			}"
 		end

	filler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FILLER"
 			}"
 		end

	font_chooser_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FONT_CHOOSER"
 			}"
 		end

	frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FRAME"
 			}"
 		end

	glass_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_GLASS_PANE"
 			}"
 		end

	html_container_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HTML_CONTAINER"
 			}"
 		end

	icon_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ICON"
 			}"
 		end

	image_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_IMAGE"
 			}"
 		end

	internal_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INTERNAL_FRAME"
 			}"
 		end

	label_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LABEL"
 			}"
 		end

	layered_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LAYERED_PANE"
 			}"
 		end

	list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST"
 			}"
 		end

	list_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST_ITEM"
 			}"
 		end

	menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU"
 			}"
 		end

	menu_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU_BAR"
 			}"
 		end

	menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_MENU_ITEM"
 			}"
 		end

	option_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_OPTION_PANE"
 			}"
 		end

	page_tab_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE_TAB"
 			}"
 		end

	page_tab_list_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE_TAB_LIST"
 			}"
 		end

	panel_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PANEL"
 			}"
 		end

	password_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PASSWORD_TEXT"
 			}"
 		end

	popup_menu_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_POPUP_MENU"
 			}"
 		end

	progress_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PROGRESS_BAR"
 			}"
 		end

	push_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PUSH_BUTTON"
 			}"
 		end

	radio_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RADIO_BUTTON"
 			}"
 		end

	radio_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RADIO_MENU_ITEM"
 			}"
 		end

	root_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ROOT_PANE"
 			}"
 		end

	row_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ROW_HEADER"
 			}"
 		end

	scroll_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SCROLL_BAR"
 			}"
 		end

	scroll_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SCROLL_PANE"
 			}"
 		end

	separator_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SEPARATOR"
 			}"
 		end

	slider_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SLIDER"
 			}"
 		end

	split_pane_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SPLIT_PANE"
 			}"
 		end

	spin_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SPIN_BUTTON"
 			}"
 		end

	statusbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_STATUSBAR"
 			}"
 		end

	table_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE"
 			}"
 		end

	table_cell_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_CELL"
 			}"
 		end

	table_column_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_COLUMN_HEADER"
 			}"
 		end

	table_row_header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_ROW_HEADER"
 			}"
 		end

	tear_off_menu_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TEAR_OFF_MENU_ITEM"
 			}"
 		end

	terminal_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TERMINAL"
 			}"
 		end

	text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TEXT"
 			}"
 		end

	toggle_button_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOGGLE_BUTTON"
 			}"
 		end

	tool_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOOL_BAR"
 			}"
 		end

	tool_tip_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TOOL_TIP"
 			}"
 		end

	tree_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE"
 			}"
 		end

	tree_table_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE_TABLE"
 			}"
 		end

	unknown_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_UNKNOWN"
 			}"
 		end

	viewport_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_VIEWPORT"
 			}"
 		end

	window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_WINDOW"
 			}"
 		end

	header_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HEADER"
 			}"
 		end

	footer_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FOOTER"
 			}"
 		end

	paragraph_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PARAGRAPH"
 			}"
 		end

	ruler_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_RULER"
 			}"
 		end

	application_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_APPLICATION"
 			}"
 		end

	autocomplete_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_AUTOCOMPLETE"
 			}"
 		end

	editbar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_EDITBAR"
 			}"
 		end

	embedded_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_EMBEDDED"
 			}"
 		end

	entry_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_ENTRY"
 			}"
 		end

	chart_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CHART"
 			}"
 		end

	caption_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_CAPTION"
 			}"
 		end

	document_frame_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_FRAME"
 			}"
 		end

	heading_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_HEADING"
 			}"
 		end

	page_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_PAGE"
 			}"
 		end

	section_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_SECTION"
 			}"
 		end

	redundant_object_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_REDUNDANT_OBJECT"
 			}"
 		end

	form_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_FORM"
 			}"
 		end

	link_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LINK"
 			}"
 		end

	input_method_window_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INPUT_METHOD_WINDOW"
 			}"
 		end

	table_row_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TABLE_ROW"
 			}"
 		end

	tree_item_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_TREE_ITEM"
 			}"
 		end

	document_spreadsheet_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_SPREADSHEET"
 			}"
 		end

	document_presentation_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_PRESENTATION"
 			}"
 		end

	document_text_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_TEXT"
 			}"
 		end

	document_web_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_WEB"
 			}"
 		end

	document_email_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_DOCUMENT_EMAIL"
 			}"
 		end

	comment_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_COMMENT"
 			}"
 		end

	list_box_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LIST_BOX"
 			}"
 		end

	grouping_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_GROUPING"
 			}"
 		end

	image_map_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_IMAGE_MAP"
 			}"
 		end

	notification_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_NOTIFICATION"
 			}"
 		end

	info_bar_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_INFO_BAR"
 			}"
 		end

	last_defined_low_level: INTEGER is
		external "plug_in"
 		alias "{
 			location: "."
 			module_name: "plugin"
 			feature_name: "ATK_ROLE_LAST_DEFINED"
 			}"
 		end


end -- class ATK_ROLE_ENUM
