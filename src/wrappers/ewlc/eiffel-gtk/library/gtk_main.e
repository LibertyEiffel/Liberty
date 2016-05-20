note
	description: "Main loop and Events - Library initialization, main event loop, and events"
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	date: "$Date:$"
	revision "$REvision:$"


class GTK_MAIN

inherit
	ANY redefine default_create end
	WRAPPER_HANDLER  redefine default_create end

insert
	SHARED_CREATION_DICTIONARY  redefine default_create end
	GDK
	PANGO
	ARGUMENTS redefine default_create end
	GTK_MAIN_EXTERNALS redefine default_create end
	POINTER_HANDLING redefine default_create end

create {ANY} default_create

feature {ANY} -- Creation

	default_create is
		do
			create error.empty
			initialize
			store_creation_agents
		end

feature {ANY} -- Creation agents
	-- Creation agents are functions that given a pointer returns an
	-- Eiffel wrapper of a precise kind. They are usually stored into
	store_creation_agents is
		local old_count: INTEGER
		do
			debug 
				std_error.put_string(once "Putting wrapper-creation-agents into creation_agents dictionary%N")
				old_count := creation_agents.count
			end
			creation_agents.put (agent create_gtk_about_dialog, "GtkAboutDialog")
			--creation_agents.put (agent create_gtk_accel_group, "GtkAccelGroup")
			creation_agents.put (agent create_gtk_accel_label, "GtkAccelLabel")
			-- creation_agents.put (agent create_gtk_accel_map, "GtkAccelMap")
			-- creation_agents.put (agent create_gtk_accessible, "GtkAccessible")
			creation_agents.put (agent create_gtk_action, "GtkAction")
			creation_agents.put (agent create_gtk_action_group, "GtkActionGroup")
			creation_agents.put (agent create_gtk_alignment, "GtkAlignment")
			creation_agents.put (agent create_gtk_arrow, "GtkArrow")
			-- creation_agents.put (agent create_gtk_aspect_frame, "GtkAspectFrame")
			-- 			creation_agents.put (agent create_gtk_assistant, "GtkAssistant")
			creation_agents.put (agent create_gtk_button, "GtkButton")
			creation_agents.put (agent create_gtk_calendar, "GtkCalendar")
			creation_agents.put (agent create_gtk_cell_renderer_accel, "GtkCellRendererAccel")
			creation_agents.put (agent create_gtk_cell_renderer_combo, "GtkCellRendererCombo")
			creation_agents.put (agent create_gtk_cell_renderer_pixbuf, "GtkCellRendererPixbuf")
			creation_agents.put (agent create_gtk_cell_renderer_progress, "GtkCellRendererProgress")
			creation_agents.put (agent create_gtk_cell_renderer_spin, "GtkCellRendererSpin")
			creation_agents.put (agent create_gtk_cell_renderer_text, "GtkCellRendererText")
			creation_agents.put (agent create_gtk_cell_renderer_toggle, "GtkCellRendererToggle")
			creation_agents.put (agent create_gtk_cell_view, "GtkCellView")
			creation_agents.put (agent create_gtk_check_button, "GtkCheckButton")
			creation_agents.put (agent create_gtk_check_menu_item, "GtkCheckMenuItem")
			creation_agents.put (agent create_gtk_clipboard, "GtkClipboard")
			creation_agents.put (agent create_gtk_color_button, "GtkColorButton")
			creation_agents.put (agent create_gtk_color_selection, "GtkColorSelection")
			creation_agents.put (agent create_gtk_color_selection_dialog, "GtkColorSelectionDialog")
			-- GtkCombo is deprecated
			creation_agents.put (agent create_gtk_combo_box, "GtkComboBox")
			creation_agents.put (agent create_gtk_combo_box_entry, "GtkComboBoxEntry")
			-- creation_agents.put (agent create_gtk_Curve, "GtkCurve")
			creation_agents.put (agent create_gtk_dialog, "GtkDialog")
			creation_agents.put (agent create_gtk_drawing_area, "GtkDrawingArea")
			creation_agents.put (agent create_gtk_entry, "GtkEntry")
			creation_agents.put (agent create_gtk_entry_completion, "GtkEntryCompletion")
			creation_agents.put (agent create_gtk_event_box, "GtkEventBox")
			creation_agents.put (agent create_gtk_expander, "GtkExpander")
			creation_agents.put (agent create_gtk_file_chooser_button, "GtkFileChooserButton")
			creation_agents.put (agent create_gtk_file_chooser_dialog, "GtkFileChooserDialog")
			creation_agents.put (agent create_gtk_file_chooser_widget, "GtkFileChooserWidget")
			creation_agents.put (agent create_gtk_file_filter, "GtkFileFilter")
			-- GtkFileSelection is deprecated
			-- creation_agents.put (agent create_gtk_Fixed, "GtkFixed")
			creation_agents.put (agent create_gtk_font_button, "GtkFontButton")
			creation_agents.put (agent create_gtk_font_selection, "GtkFontSelection")
			creation_agents.put (agent create_gtk_font_selection_dialog, "GtkFontSelectionDialog")
			creation_agents.put (agent create_gtk_frame, "GtkFrame")
			--creation_agents.put (agent create_gtk_GammaCurve, "GtkGammaCurve")
			creation_agents.put (agent create_gtk_hbox, "GtkHBox")
			creation_agents.put (agent create_gtk_hbutton_box, "GtkHButtonBox")
			creation_agents.put (agent create_gtk_hpaned, "GtkHPaned")
			--creation_agents.put (agent create_gtk_hruler, "GtkHRuler")
			creation_agents.put (agent create_gtk_hscale, "GtkHScale")
			creation_agents.put (agent create_gtk_hscrollbar, "GtkHScrollbar")
			creation_agents.put (agent create_gtk_hseparator, "GtkHSeparator")
			--creation_agents.put (agent create_gtk_handle_box, "GtkHandleBox")
			--creation_agents.put (agent create_gtkIM_Context, "GtkIMContext")
			--creation_agents.put (agent create_gtkIM_ContextSimple, "GtkIMContextSimple")
			--creation_agents.put (agent create_gtkIM_Multicontext, "GtkIMMulticontext")
			-- creation_agents.put (agent create_gtk_iconf_actory, "GtkIconFactory")
			creation_agents.put (agent create_gtk_icon_theme, "GtkIconTheme")
			creation_agents.put (agent create_gtk_icon_view, "GtkIconView")
			creation_agents.put (agent create_gtk_image, "GtkImage")
			creation_agents.put (agent create_gtk_image_menu_item, "GtkImageMenuItem")
			-- creation_agents.put (agent create_gtk_Invisible, "GtkInvisible")
			creation_agents.put (agent create_gtk_label, "GtkLabel")
			creation_agents.put (agent create_gtk_layout, "GtkLayout")
			creation_agents.put (agent create_gtk_link_button, "GtkLinkButton")
			creation_agents.put (agent create_gtk_list_store, "GtkListStore")
			creation_agents.put (agent create_gtk_menu, "GtkMenu")
			creation_agents.put (agent create_gtk_menu_bar, "GtkMenuBar")
			creation_agents.put (agent create_gtk_menu_item, "GtkMenuItem")
			creation_agents.put (agent create_gtk_menu_tool_button, "GtkMenuToolButton")
			creation_agents.put (agent create_gtk_message_dialog, "GtkMessageDialog")
			creation_agents.put (agent create_gtk_notebook, "GtkNotebook")
			creation_agents.put (agent create_gtk_page_setup, "GtkPageSetup")
			-- creation_agents.put (agent create_gtk_PageSetupUnixDialog, "GtkPageSetupUnixDialog")
			-- creation_agents.put (agent create_gtk_plug, "GtkPlug")
			-- creation_agents.put (agent create_gtk_preview, "GtkPreview")
			-- creation_agents.put (agent create_gtk_PrintBackend, "GtkPrintBackend")
			creation_agents.put (agent create_gtk_print_context, "GtkPrintContext")
			creation_agents.put (agent create_gtk_print_job, "GtkPrintJob")
			creation_agents.put (agent create_gtk_print_operation, "GtkPrintOperation")
			creation_agents.put (agent create_gtk_print_settings, "GtkPrintSettings")
			-- creation_agents.put (agent create_gtk_PrintUnixDialog, "GtkPrintUnixDialog")
			creation_agents.put (agent create_gtk_printer, "GtkPrinter")
			creation_agents.put (agent create_gtk_progress_bar, "GtkProgressBar")
			creation_agents.put (agent create_gtk_radio_action, "GtkRadioAction")
			creation_agents.put (agent create_gtk_radio_button, "GtkRadioButton")
			creation_agents.put (agent create_gtk_radio_menu_item, "GtkRadioMenuItem")
			creation_agents.put (agent create_gtk_radio_tool_button, "GtkRadioToolButton")
						--creation_agents.put (agent create_gtk_RcStyle, "GtkRcStyle")
			--creation_agents.put (agent create_gtk_RecentChooserDialog, "GtkRecentChooserDialog")
			--creation_agents.put (agent create_gtk_RecentChooserMenu, "GtkRecentChooserMenu")
			--creation_agents.put (agent create_gtk_RecentChooserWidget, "GtkRecentChooserWidget")
			--creation_agents.put (agent create_gtk_RecentFilter, "GtkRecentFilter")
			--creation_agents.put (agent create_gtk_RecentManager, "GtkRecentManager")
			creation_agents.put (agent create_gtk_scrolled_window, "GtkScrolledWindow")
			creation_agents.put (agent create_gtk_separator_menu_item, "GtkSeparatorMenuItem")
			creation_agents.put (agent create_gtk_separator_tool_item, "GtkSeparatorToolItem")
			-- creation_agents.put (agent create_gtk_settings, "GtkSettings")
			-- creation_agents.put (agent create_gtk_size_group, "GtkSizeGroup")
			-- creation_agents.put (agent create_gtk_socket, "GtkSocket")
			creation_agents.put (agent create_gtk_spin_button, "GtkSpinButton")
			creation_agents.put (agent create_gtk_status_icon, "GtkStatusIcon")
			creation_agents.put (agent create_gtk_status_bar, "GtkStatusbar")
			creation_agents.put (agent create_gtk_style, "GtkStyle")
			creation_agents.put (agent create_gtk_table, "GtkTable")
			creation_agents.put (agent create_gtk_tearoff_menu_item, "GtkTearoffMenuItem")
			-- GtkText is deprecated
			creation_agents.put (agent create_gtk_text_buffer, "GtkTextBuffer")
			creation_agents.put (agent create_gtk_text_child_anchor, "GtkTextChildAnchor")
			creation_agents.put (agent create_gtk_text_mark, "GtkTextMark")
			creation_agents.put (agent create_gtk_text_tag, "GtkTextTag")
			creation_agents.put (agent create_gtk_text_tag_table, "GtkTextTagTable")
			creation_agents.put (agent create_gtk_text_view, "GtkTextView")
			-- GtkTipsQuery is deprecated
			creation_agents.put (agent create_gtk_toggle_action, "GtkToggleAction")
			creation_agents.put (agent create_gtk_toggle_button, "GtkToggleButton")
			creation_agents.put (agent create_gtk_toggle_tool_button, "GtkToggleToolButton")
			creation_agents.put (agent create_gtk_tool_button, "GtkToolButton")
			creation_agents.put (agent create_gtk_tool_item, "GtkToolItem")
			creation_agents.put (agent create_gtk_toolbar, "GtkToolbar")
			creation_agents.put (agent create_gtk_tooltips, "GtkTooltips")
			-- GtkTree and GtkTreeItem are deprecated.
			creation_agents.put (agent create_gtk_tree_model_filter, "GtkTreeModelFilter")
			creation_agents.put (agent create_gtk_tree_model_sort, "GtkTreeModelSort")
			creation_agents.put (agent create_gtk_tree_selection, "GtkTreeSelection")
			creation_agents.put (agent create_gtk_tree_store, "GtkTreeStore")
			creation_agents.put (agent create_gtk_tree_view, "GtkTreeView")
			creation_agents.put (agent create_gtk_tree_view_column, "GtkTreeViewColumn")
			-- creation_agents.put (agent create_gtkUI_Manager, "GtkUIManager")
			creation_agents.put (agent create_gtk_vbox, "GtkVBox")
			creation_agents.put (agent create_gtk_vbutton_box, "GtkVButtonBox")
			creation_agents.put (agent create_gtk_vpaned, "GtkVPaned")
			-- creation_agents.put (agent create_gtk_vruler, "GtkVRuler")
			creation_agents.put (agent create_gtk_vscale, "GtkVScale")
			creation_agents.put (agent create_gtk_vscrollbar, "GtkVScrollbar")
			creation_agents.put (agent create_gtk_vseparator, "GtkVSeparator")
			-- creation_agents.put (agent create_gtk_Viewport, "GtkViewport")
			creation_agents.put (agent create_gtk_window, "GtkWindow")
			creation_agents.put (agent create_gtk_window_group, "GtkWindowGroup")

			-- Store creation agents of preconditions
			store_gdk_creation_agents
			store_pango_creation_agents

			debug 
				std_error.put_line
				((creation_agents.count-old_count).out+" function agents put into creation_agents dictionary.")
			end
		end

	create_gtk_about_dialog (p: POINTER): GTK_ABOUT_DIALOG is do create Result.from_external_pointer(p) end
		-- create_gtk_accel_group (p: POINTER): GTK_ACCEL_GROUP is do create Result.from_external_pointer(p) end
	create_gtk_accel_label (p: POINTER): GTK_ACCEL_LABEL is do create Result.from_external_pointer(p) end
		-- create_gtk_accel_map (p: POINTER): Gtk_AccelMap is do create Result.from_external_pointer(p) end
		-- create_gtk_accessible (p: POINTER): GTK_ACCESSIBLE is do create Result.from_external_pointer(p) end
	create_gtk_action (p: POINTER): GTK_ACTION is do create Result.from_external_pointer(p) end
	create_gtk_action_group (p: POINTER): GTK_ACTION_GROUP is do create Result.from_external_pointer(p) end
	create_gtk_adjustment (p: POINTER): GTK_ADJUSTMENT is do create Result.from_external_pointer(p) end
	create_gtk_alignment (p: POINTER): GTK_ALIGNMENT is do create Result.from_external_pointer(p) end
	create_gtk_arrow (p: POINTER): GTK_ARROW is do create Result.from_external_pointer(p) end
	create_gtk_aspect_frame (p: POINTER): GTK_ASPECT_FRAME is do create Result.from_external_pointer(p) end
	create_gtk_assistant (p: POINTER): GTK_ASSISTANT is do create Result.from_external_pointer(p) end
	create_gtk_button (p: POINTER): GTK_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_calendar (p: POINTER): GTK_CALENDAR is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_accel (p: POINTER): GTK_CELL_RENDERER_ACCEL is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_combo (p: POINTER): GTK_CELL_RENDERER_COMBO is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_pixbuf (p: POINTER): GTK_CELL_RENDERER_PIXBUF is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_progress (p: POINTER): GTK_CELL_RENDERER_PROGRESS is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_spin (p: POINTER): GTK_CELL_RENDERER_SPIN is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_text (p: POINTER): GTK_CELL_RENDERER_TEXT is do create Result.from_external_pointer(p) end
	create_gtk_cell_renderer_toggle (p: POINTER): GTK_CELL_RENDERER_TOGGLE is do create Result.from_external_pointer(p) end
	create_gtk_cell_view (p: POINTER): GTK_CELL_VIEW is do create Result.from_external_pointer(p) end
	create_gtk_check_button (p: POINTER): GTK_CHECK_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_check_menu_item (p: POINTER): GTK_CHECK_MENU_ITEM is do create Result.from_external_pointer(p) end
	create_gtk_clipboard (p: POINTER): GTK_CLIPBOARD is do create Result.from_external_pointer(p) end
	create_gtk_color_button (p: POINTER): GTK_COLOR_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_color_selection (p: POINTER): GTK_COLOR_SELECTION is do create Result.from_external_pointer(p) end
	create_gtk_color_selection_dialog (p: POINTER): GTK_COLOR_SELECTION_DIALOG is do create Result.from_external_pointer(p) end
	create_gtk_combo_box (p: POINTER): GTK_COMBO_BOX is do create Result.from_external_pointer(p) end
	create_gtk_combo_box_entry (p: POINTER): GTK_COMBO_BOX_ENTRY is do create Result.from_external_pointer(p) end
		-- create_gtk_Curve (p: POINTER): Gtk_Curve is do create Result.from_external_pointer(p) end
	create_gtk_dialog (p: POINTER): GTK_DIALOG is do create Result.from_external_pointer(p) end
	create_gtk_drawing_area (p: POINTER): GTK_DRAWING_AREA is do create Result.from_external_pointer(p) end
	create_gtk_entry (p: POINTER): GTK_ENTRY is do create Result.from_external_pointer(p) end
	create_gtk_entry_completion (p: POINTER): GTK_ENTRY_COMPLETION is do create Result.from_external_pointer(p) end
	create_gtk_event_box (p: POINTER): GTK_EVENT_BOX is do create Result.from_external_pointer(p) end
	create_gtk_expander (p: POINTER): GTK_EXPANDER is do create Result.from_external_pointer(p) end
	create_gtk_file_chooser_button (p: POINTER): GTK_FILE_CHOOSER_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_file_chooser_dialog (p: POINTER): GTK_FILE_CHOOSER_DIALOG is do create Result.from_external_pointer(p) end
	create_gtk_file_chooser_widget (p: POINTER): GTK_FILE_CHOOSER_WIDGET is do create Result.from_external_pointer(p) end
	create_gtk_file_filter (p: POINTER): GTK_FILE_FILTER is do create Result.from_external_pointer(p) end
	-- create_gtk_Fixed (p: POINTER): Gtk_Fixed is do create Result.from_external_pointer(p) end
	create_gtk_font_button (p: POINTER): GTK_FONT_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_font_selection (p: POINTER): GTK_FONT_SELECTION is do create Result.from_external_pointer(p) end
	create_gtk_font_selection_dialog (p: POINTER): GTK_FONT_SELECTION_DIALOG is do create Result.from_external_pointer(p) end
	create_gtk_frame (p: POINTER): GTK_FRAME is do create Result.from_external_pointer(p) end
	--create_gtk_GammaCurve (p: POINTER): Gtk_GammaCurve is do create Result.from_external_pointer(p) end
	create_gtk_hbox (p: POINTER): GTK_HBOX is do create Result.from_external_pointer(p) end
	create_gtk_hbutton_box (p: POINTER): GTK_HBUTTON_BOX is do create Result.from_external_pointer(p) end
	create_gtk_hpaned (p: POINTER): GTK_HPANED is do create Result.from_external_pointer(p) end
	--create_gtk_hruler (p: POINTER): GTK_HRULER is do create Result.from_external_pointer(p) end
	create_gtk_hscale (p: POINTER): GTK_HSCALE is do create Result.from_external_pointer(p) end
	create_gtk_hscrollbar (p: POINTER): GTK_HSCROLLBAR is do create Result.from_external_pointer(p) end
	create_gtk_hseparator (p: POINTER): GTK_HSEPARATOR is do create Result.from_external_pointer(p) end
	--create_gtk_handle_box (p: POINTER): GTK_HANDLE_BOX is do create Result.from_external_pointer(p) end
	--create_gtkIM_Context (p: POINTER): GtkIM_Context is do create Result.from_external_pointer(p) end
	--create_gtkIM_ContextSimple (p: POINTER): GtkIM_ContextSimple is do create Result.from_external_pointer(p) end
	--create_gtkIM_Multicontext (p: POINTER): GtkIM_Multicontext is do create Result.from_external_pointer(p) end
	--create_gtk_IconFactory (p: POINTER): Gtk_IconFactory is do create Result.from_external_pointer(p) end
	create_gtk_icon_theme (p: POINTER): GTK_ICON_THEME is do create Result.from_external_pointer(p) end
	create_gtk_icon_view (p: POINTER): GTK_ICON_VIEW is do create Result.from_external_pointer(p) end
	create_gtk_image (p: POINTER): GTK_IMAGE is do create Result.from_external_pointer(p) end
	create_gtk_image_menu_item (p: POINTER): GTK_IMAGE_MENU_ITEM is do create Result.from_external_pointer(p) end
	-- create_gtk_Invisible (p: POINTER): Gtk_Invisible is do create Result.from_external_pointer(p) end
	create_gtk_label (p: POINTER): GTK_LABEL is do create Result.from_external_pointer(p) end
	create_gtk_layout (p: POINTER): GTK_LAYOUT is do create Result.from_external_pointer(p) end
	create_gtk_link_button (p: POINTER): GTK_LINK_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_list_store (p: POINTER): GTK_LIST_STORE is do create Result.from_external_pointer(p) end
	create_gtk_menu (p: POINTER): GTK_MENU is do create Result.from_external_pointer(p) end
	create_gtk_menu_bar (p: POINTER): GTK_MENU_BAR is do create Result.from_external_pointer(p) end
	create_gtk_menu_item (p: POINTER): GTK_MENU_ITEM is do create Result.from_external_pointer(p) end
	create_gtk_menu_tool_button (p: POINTER): GTK_MENU_TOOL_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_message_dialog (p: POINTER): GTK_MESSAGE_DIALOG is do create Result.from_external_pointer(p) end
	create_gtk_notebook (p: POINTER): GTK_NOTEBOOK is do create Result.from_external_pointer(p) end
	create_gtk_page_setup (p: POINTER): GTK_PAGE_SETUP is do create Result.from_external_pointer(p) end
	-- create_gtk_PageSetupUnixDialog (p: POINTER): Gtk_PageSetupUnixDialog is do create Result.from_external_pointer(p) end
	-- create_gtk_Plug (p: POINTER): Gtk_Plug is do create Result.from_external_pointer(p) end
	-- create_gtk_preview (p: POINTER): GTK_PREVIEW is do create Result.from_external_pointer(p) end
	-- create_gtk_print_backend (p: POINTER): GTK_PRINT_BACKEND is do create Result.from_external_pointer(p) end
	create_gtk_print_context (p: POINTER): GTK_PRINT_CONTEXT is do create Result.from_external_pointer(p) end
	create_gtk_print_job (p: POINTER): GTK_PRINT_JOB is do create Result.from_external_pointer(p) end
	create_gtk_print_operation (p: POINTER): GTK_PRINT_OPERATION is do create Result.from_external_pointer(p) end
	create_gtk_print_settings (p: POINTER): GTK_PRINT_SETTINGS is do create Result.from_external_pointer(p) end
		--create_gtk_PrintUnixDialog (p: POINTER): Gtk_PrintUnixDialog is do create Result.from_external_pointer(p) end
	create_gtk_printer (p: POINTER): GTK_PRINTER is do create Result.from_external_pointer(p) end
	create_gtk_progress_bar (p: POINTER): GTK_PROGRESS_BAR is do create Result.from_external_pointer(p) end
	create_gtk_radio_action (p: POINTER): GTK_RADIO_ACTION is do create Result.from_external_pointer(p) end
	create_gtk_radio_button (p: POINTER): GTK_RADIO_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_radio_menu_item (p: POINTER): GTK_RADIO_MENU_ITEM is 
		do
			debug std_error.put_line(once "Don't ask me why, but SmartEiffel thinks that GTK_RADIO_MENU_ITEM is deferred.") end
			create Result.from_external_pointer(p) 
		end
	create_gtk_radio_tool_button (p: POINTER): GTK_RADIO_TOOL_BUTTON is do create Result.from_external_pointer(p) end
		-- create_gtk_RcStyle (p: POINTER): Gtk_RcStyle is do create Result.from_external_pointer(p) end
		-- create_gtk_RecentChooserDialog (p: POINTER): Gtk_RecentChooserDialog is do create Result.from_external_pointer(p) end
	-- create_gtk_RecentChooserMenu (p: POINTER): Gtk_RecentChooserMenu is do create Result.from_external_pointer(p) end
	-- create_gtk_RecentChooserWidget (p: POINTER): Gtk_RecentChooserWidget is do create Result.from_external_pointer(p) end
		-- create_gtk_RecentFilter (p: POINTER): Gtk_RecentFilter is do create Result.from_external_pointer(p) end
		-- create_gtk_RecentManager (p: POINTER): Gtk_RecentManager is do create Result.from_external_pointer(p) end
	create_gtk_scrolled_window (p: POINTER): GTK_SCROLLED_WINDOW is do create Result.from_external_pointer(p) end
	create_gtk_separator_menu_item (p: POINTER): GTK_SEPARATOR_MENU_ITEM is do create Result.from_external_pointer(p) end
	create_gtk_separator_tool_item (p: POINTER): GTK_SEPARATOR_TOOL_ITEM is do create Result.from_external_pointer(p) end
		-- create_gtk_settings (p: POINTER): GTK_SETTINGS is do create Result.from_external_pointer(p) end
		-- create_gtk_size_group (p: POINTER): GTK_SIZE_GROUP is do create Result.from_external_pointer(p) end
		-- create_gtk_socket (p: POINTER): GTK_SOCKET is do create Result.from_external_pointer(p) end
	create_gtk_spin_button (p: POINTER): GTK_SPIN_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_status_icon (p: POINTER): GTK_STATUS_ICON is do create Result.from_external_pointer(p) end
	create_gtk_status_bar (p: POINTER): GTK_STATUS_BAR is do create Result.from_external_pointer(p) end
	create_gtk_style (p: POINTER): GTK_STYLE is do create Result.from_external_pointer(p) end
	create_gtk_table (p: POINTER): GTK_TABLE is do create Result.from_external_pointer(p) end
	create_gtk_tearoff_menu_item (p: POINTER): GTK_TEAROFF_MENU_ITEM is do create Result.from_external_pointer(p) end
	create_gtk_text_buffer (p: POINTER): GTK_TEXT_BUFFER is do create Result.from_external_pointer(p) end
	create_gtk_text_child_anchor (p: POINTER): GTK_TEXT_CHILD_ANCHOR is do create Result.from_external_pointer(p) end
	create_gtk_text_mark (p: POINTER): GTK_TEXT_MARK is do create Result.from_external_pointer(p) end
	create_gtk_text_tag (p: POINTER): GTK_TEXT_TAG is do create Result.from_external_pointer(p) end
	create_gtk_text_tag_table (p: POINTER): GTK_TEXT_TAG_TABLE is do create Result.from_external_pointer(p) end
	create_gtk_text_view (p: POINTER): GTK_TEXT_VIEW is do create Result.from_external_pointer(p) end
	create_gtk_toggle_action (p: POINTER): GTK_TOGGLE_ACTION is do create Result.from_external_pointer(p) end
	create_gtk_toggle_button (p: POINTER): GTK_TOGGLE_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_toggle_tool_button (p: POINTER): GTK_TOGGLE_TOOL_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_tool_button (p: POINTER): GTK_TOOL_BUTTON is do create Result.from_external_pointer(p) end
	create_gtk_tool_item (p: POINTER): GTK_TOOL_ITEM is do create Result.from_external_pointer(p) end
	create_gtk_toolbar (p: POINTER): GTK_TOOLBAR is do create Result.from_external_pointer(p) end
	create_gtk_tooltips (p: POINTER): GTK_TOOLTIPS is do create Result.from_external_pointer(p) end
	create_gtk_tree_model_filter (p: POINTER): GTK_TREE_MODEL_FILTER is do create Result.from_external_pointer(p) end
	create_gtk_tree_model_sort (p: POINTER): GTK_TREE_MODEL_SORT is do create Result.from_external_pointer(p) end
	create_gtk_tree_selection (p: POINTER): GTK_TREE_SELECTION is do create Result.from_external_pointer(p) end
	create_gtk_tree_store (p: POINTER): GTK_TREE_STORE is do create Result.from_external_pointer(p) end
	create_gtk_tree_view (p: POINTER): GTK_TREE_VIEW is do create Result.from_external_pointer(p) end
	create_gtk_tree_view_column (p: POINTER): GTK_TREE_VIEW_COLUMN is do create Result.from_external_pointer(p) end
	-- create_gtkUI_Manager (p: POINTER): GtkUI_Manager is do create Result.from_external_pointer(p) end
	create_gtk_vbox (p: POINTER): GTK_VBOX is do create Result.from_external_pointer(p) end
	create_gtk_vbutton_box (p: POINTER): GTK_VBUTTON_BOX is do create Result.from_external_pointer(p) end
	create_gtk_vpaned (p: POINTER): GTK_VPANED is do create Result.from_external_pointer(p) end
	-- create_gtk_vruler (p: POINTER): GTK_VRULER is do create Result.from_external_pointer(p) end
	create_gtk_vscale (p: POINTER): GTK_VSCALE is do create Result.from_external_pointer(p) end
	create_gtk_vscrollbar (p: POINTER): GTK_VSCROLLBAR is do create Result.from_external_pointer(p) end
	create_gtk_vseparator (p: POINTER): GTK_VSEPARATOR is do create Result.from_external_pointer(p) end
		-- create_gtk_Viewport (p: POINTER): Gtk_Viewport is do create Result.from_external_pointer(p) end
	create_gtk_window (p: POINTER): GTK_WINDOW is do create Result.from_external_pointer(p) end
	create_gtk_window_group (p: POINTER): GTK_WINDOW_GROUP is do create Result.from_external_pointer(p) end

feature {ANY}

	disable_setlocale is
			-- Prevents initilize_gtk and similar call (wrappers of
			-- gtk_init(), gtk_init_check(), gtk_init_with_args() and
			-- gtk_parse_args() from automatically calling setlocale
			-- (LC_ALL, ""). You would want to use this function if you
			-- wanted to set the locale for your program to something
			-- other than the user's locale, or if you wanted to set
			-- different values for different locale categories.

			-- Most programs should not need to call this function.
		do
			gtk_disable_setlocale
		end
	
	-- TODO: wrap gtk_get_default_language ()

	-- TODO: wrap gtk_parse_args ()

	initialize, initialize_gtk is
			-- Initialize everything needed to operate the GTK toolkit and parses
			-- some standard command line options. argc and argv are adjusted
			-- accordingly so your own code will never see those standard
			-- arguments.

			-- Note that there are some alternative ways to initialize GTK+: if you
			-- are calling gtk_parse_args(), gtk_init_check(), gtk_init_with_args()
			-- or g_option_context_parse() with the option group returned by
			-- gtk_get_option_group(), you don't have to call gtk_init().

			-- Note: This function will terminate your program if it was unable to
			-- initialize the GUI for some reason. If you want your program to fall
			-- back to a textual interface you want to call gtk_init_check()
			-- instead.
		local argc: INTEGER; argv: POINTER
		do
			if not is_initialized then
				argc := argument_count
				argv := command_arguments.to_external
				gtk_init ($argc, $argv)
				is_initialized := True
			end
		ensure initialized: is_initialized = True
		end

	is_initialized: BOOLEAN
			-- Have gtk been successfully initilized?

	try_initilizing_gtk is
		-- Try initiliazing GTK toolkit. If successful
		-- `is_gtk_initialized' will be True.
		local argc: INTEGER; argv: POINTER
		do
			argc := argument_count
			argv := command_arguments.to_external
			is_initialized := gtk_init_check ($argc, $argv).to_boolean
		end

	-- TODO: wrap gtk_init_with_args ()

	are_events_pending: BOOLEAN is
			-- Are there any events pending? This can be used to update
			-- the GUI and invoke timeouts etc. while doing some time
			-- intensive computation.

			-- TODO: Eiffelize this example Updating the GUI during a
			-- long computation.

			-- computation going on
			-- ...
			--     from until not are_events_pendind
			-- 	 loop gtk_main_iteration 
			-- ...
			-- 	computation continued 
		do
			Result:=gtk_events_pending.to_boolean
		end

	run_main_loop, run_gtk_main_loop is
			-- Runs the main loop until (C function) gtk_main_quit() is
			-- called. You can nest calls to gtk_main(). In that case
			-- gtk_main_quit() will make the innermost invocation of the
			-- main loop return.
		require gtk_initialized: is_initialized
		do
			gtk_main
			std_error.put_string (once "Exiting gtk_main%N")
		end

	gtk_nesting_level: INTEGER is
		obsolete "use nesting level instead"
		do
			Result := nesting_level
		end

	nesting_level: INTEGER is
			-- the nesting level of the current invocation of the main
			-- loop. This can be useful when calling gtk_quit_add().
		do
			Result := gtk_main_level
		end

	gtk_quit is
		obsolete "use quit instead"
		do
			quit
		end

	quit is
			-- Makes the innermost invocation of the main loop return
			-- when it regains control.
		do
			gtk_main_quit
		end

	gtk_main_iteration is
		obsolete "use main_iteration"
		do
			main_iteration
		end

	main_iteration is
		-- Runs a single iteration of the mainloop. If no events are
		-- waiting to be processed GTK+ will block until the next event
		-- is noticed. If you don't want to block look at
		-- gtk_main_iteration_not_blocking or check if any events are pending
		-- with are_events_pending first.
		local called_on_innermost_mainloop: INTEGER
		do
			-- TODO: expose called_on_innermost_mainloop in an intelligent way
			called_on_innermost_mainloop := gtk_main_iteration_external
		end

	gtk_main_iteration_not_blocking is
		obsolete "use not_blocking_main_iteration"
		do
			not_blocking_main_iteration
		end

	not_blocking_main_iteration is
		local called_on_innermost_mainloop: INTEGER
		do
			-- TODO: expose called_on_innermost_mainloop in an intelligent way
			called_on_innermost_mainloop := gtk_main_iteration_do (0)
		end

	-- TODO: wrap gtk_main_do_event in a release distant in the
	-- future. Infact GTK documentation says "This is public only to
	-- allow filtering of events between GDK and GTK+. You will not
	-- usually need to call this function directly."
	
	-- GtkModuleInitFunc ()

	-- void        (*GtkModuleInitFunc)            (gint *argc,
	--                                              gchar ***argv);
	
	-- Each GTK+ module must have a function gtk_module_init() with this prototype. This function is called after loading the module with the argc and argv cleaned from any arguments that GTK+ handles itself.
	-- argc : 	Pointer to the number of arguments remaining after gtk_init().
	-- argv : 	Points to the argument vector.

	-- GtkModuleDisplayInitFunc ()
	
	-- void        (*GtkModuleDisplayInitFunc)     (GdkDisplay *display);
	


	-- void        gtk_grab_add                    (GtkWidget *widget);

	-- Makes widget the current grabbed widget. This means that interaction with other widgets in the same application is blocked and mouse as well as keyboard events are delivered to this widget.
	-- widget : 	The widget that grabs keyboard and pointer events.
	-- gtk_grab_get_current ()
	
	-- GtkWidget*  gtk_grab_get_current            (void);
	
	-- Queries the current grab of the default window group.
	-- Returns : 	The widget which currently has the grab or NULL if no grab is active.
	-- gtk_grab_remove ()
	
	-- void        gtk_grab_remove                 (GtkWidget *widget);

-- Removes the grab from the given widget. You have to pair calls to gtk_grab_add() and gtk_grab_remove().
-- widget : 	The widget which gives up the grab.
-- gtk_init_add ()

-- void        gtk_init_add                    (GtkFunction function,
--                                              gpointer data);

-- Registers a function to be called when the mainloop is started.
-- function : 	Function to invoke when gtk_main() is called next.
-- data : 	Data to pass to that function.
-- gtk_quit_add_destroy ()

-- void        gtk_quit_add_destroy            (guint main_level,
--                                              GtkObject *object);

-- Trigger destruction of object in case the mainloop at level main_level is quit.
-- main_level : 	Level of the mainloop which shall trigger the destruction.
-- object : 	Object to be destroyed.
-- gtk_quit_add ()

-- guint       gtk_quit_add                    (guint main_level,
--                                              GtkFunction function,
--                                              gpointer data);

-- Registers a function to be called when an instance of the mainloop is left.
-- main_level : 	Level at which termination the function shall be called. You can pass 0 here to have the function run at the termination of the current mainloop.
-- function : 	The function to call. This should return 0 to be removed from the list of quit handlers. Otherwise the function might be called again.
-- data : 	Pointer to pass when calling function.
-- Returns : 	A handle for this quit handler (you need this for gtk_quit_remove()) or 0 if you passed a NULL pointer in function.
-- gtk_quit_add_full ()

-- guint       gtk_quit_add_full               (guint main_level,
--                                              GtkFunction function,
--                                              GtkCallbackMarshal marshal,
--                                              gpointer data,
--                                              GtkDestroyNotify destroy);

-- Registers a function to be called when an instance of the mainloop is left. In comparison to gtk_quit_add() this function adds the possibility to pass a marshaller and a function to be called when the quit handler is freed.

-- The former can be used to run interpreted code instead of a compilxfed function while the latter can be used to free the information stored in data (while you can do this in function as well)... So this function will mostly be used by GTK+ wrappers for languages other than C.
-- main_level : 	Level at which termination the function shall be called. You can pass 0 here to have the function run at the termination of the current mainloop.
-- function : 	The function to call. This should return 0 to be removed from the list of quit handlers. Otherwise the function might be called again.
-- marshal : 	The marshaller to be used. If this is non-NULL, function is ignored.
-- data : 	Pointer to pass when calling function.
-- destroy : 	Function to call to destruct data. Gets data as argument.
-- Returns : 	A handle for this quit handler (you need this for gtk_quit_remove()) or 0 if you passed a NULL pointer in function.
-- gtk_quit_remove ()

-- void        gtk_quit_remove                 (guint quit_handler_id);

-- Removes a quit handler by its identifier.
-- quit_handler_id : 	Identifier for the handler returned when installing it.
-- gtk_quit_remove_by_data ()

-- void        gtk_quit_remove_by_data         (gpointer data);

-- Removes a quit handler identified by its data field.
-- data : 	The pointer passed as data to gtk_quit_add() or gtk_quit_add_full().
-- gtk_timeout_add_full ()


-- gtk_key_snooper_install ()

-- guint       gtk_key_snooper_install         (GtkKeySnoopFunc snooper,
--                                              gpointer func_data);

-- Installs a key snooper function, which will get called on all key events before delivering them normally.
-- snooper : 	a GtkKeySnoopFunc.
-- func_data : 	data to pass to snooper.
-- Returns : 	a unique id for this key snooper for use with gtk_key_snooper_remove().

	-- GtkKeySnoopFunc ()

-- gint        (*GtkKeySnoopFunc)              (GtkWidget *grab_widget,
--                                              GdkEventKey *event,
--                                              gpointer func_data);

-- Key snooper functions are called before normal event delivery. They can be used to implement custom key event handling.
-- grab_widget : 	the widget to which the event will be delivered.
-- event : 	the key event.
-- func_data : 	the func_data supplied to gtk_key_snooper_install().
-- Returns : 	TRUE to stop further processing of event, FALSE to continue.
-- gtk_key_snooper_remove ()

-- void        gtk_key_snooper_remove          (guint snooper_handler_id);

-- Removes the key snooper function with the given id.
-- snooper_handler_id : 	Identifies the key snooper to remove.
-- gtk_get_current_event ()

-- GdkEvent*   gtk_get_current_event           (void);

-- Obtains a copy of the event currently being processed by GTK+. For example, if you get a "clicked" signal from GtkButton, the current event will be the GdkEventButton that triggered the "clicked" signal. The returned event must be freed with gdk_event_free(). If there is no current event, the function returns NULL.

-- Returns : 	a copy of the current event, or NULL if no current event.
-- gtk_get_current_event_time ()

-- guint32     gtk_get_current_event_time      (void);

-- If there is a current event and it has a timestamp, return that timestamp, otherwise return GDK_CURRENT_TIME.

-- Returns : 	the timestamp from the current event, or GDK_CURRENT_TIME.
-- gtk_get_current_event_state ()

-- gboolean    gtk_get_current_event_state     (GdkModifierType *state);

-- If there is a current event and it has a state field, place that state field in state and return TRUE, otherwise return FALSE.

-- state : 	a location to store the state of the current event
-- Returns : 	TRUE if there was a current event and it had a state field
-- gtk_get_event_widget ()

-- GtkWidget*  gtk_get_event_widget            (GdkEvent *event);

-- If event is NULL or the event was not associated with any widget, returns NULL, otherwise returns the widget that received the event originally.

-- event : 	a GdkEvent
-- Returns : 	the widget that originally received event, or NULL
-- gtk_propagate_event ()

-- void        gtk_propagate_event             (GtkWidget *widget,
--                                              GdkEvent *event);

-- Sends an event to a widget, propagating the event to parent widgets if the event remains unhandled. Events received by GTK+ from GDK normally begin in gtk_main_do_event(). Depending on the type of event, existence of modal dialogs, grabs, etc., the event may be propagated; if so, this function is used. gtk_propagate_event() calls gtk_widget_event() on each widget it decides to send the event to. So gtk_widget_event() is the lowest-level function; it simply emits the "event" and possibly an event-specific signal on a widget. gtk_propagate_event() is a bit higher-level, and gtk_main_do_event() is the highest level.

-- All that said, you most likely don't want to use any of these functions; synthesizing events is rarely needed. Consider asking on the mailing list for better ways to achieve your goals. For example, use gdk_window_invalidate_rect() or gtk_widget_queue_draw() instead of making up expose events.

-- widget : 	a GtkWidget
-- event : 	an event
-- See Also

-- See the GLib manual, especially GMainLoop and signal-related functions such as g_signal_connect().

feature {ANY} -- global windows features
	toplevels: G_LIST [GTK_WINDOW] is
			-- A list of all existing toplevel windows.
		do
			create {G_OBJECT_LIST [GTK_WINDOW]} Result.from_external_pointer (gtk_window_list_toplevels)
			-- Note: (adapted from original documentation)
			-- `gtk_window_list_toplevels' returns a list in which the
			-- widgets are not individually referenced. Therefore before
			-- performing actions involving callbacks that might destroy
			-- the widgets, we call "g_list_foreach (result,
			-- (GFunc)g_object_ref, NULL)" (implemented in
			-- `ref_all_toplevels') first, and then unref all the widgets
			-- afterwards.
		
			-- TODO: I'm not sure toplevels shall be reffed.
			ref_all_toplevels (Result.handle)
		end


	default_icon_list: G_LIST[GDK_PIXBUF] is
			-- an icon list to be used as fallback for windows that
			-- haven't had `icon_list' called on them to set up a
			-- window-specific icon list.
		do
			create {G_OBJECT_LIST[GDK_PIXBUF]} Result.from_external_pointer (gtk_window_get_default_icon_list)
			-- Gets the value set by
			-- gtk_window_set_default_icon_list(). The list is a copy and
			-- should be freed with g_list_free(), but the pixbufs in the
			-- list have not had their reference count incremented.
		end

	set_default_icon_list (some_pixbuffers: G_LIST[GDK_PIXBUF]) is
			-- Sets an icon list to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them to
			-- set up a window-specific icon list. This function allows
			-- you to set up the icon for all windows in your app at
			-- once.  See `GTK_WINDOW.set_icon_list' for more details.
		require
			list_not_void: some_pixbuffers /= Void
		do
			gtk_window_set_default_icon_list(some_pixbuffers.handle)
		end


	set_default_icon (an_icon: GDK_PIXBUF) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had `GTK_WINDOW.set_icon' called on them from a
			-- pixbuf.
		do
			gtk_window_set_default_icon (an_icon.handle)
		end

	set_default_icon_from_file (a_filename: STRING) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them from
			-- a file on disk. Errors are stored in `error' feature
		require
			filename_not_void: a_filename /= Void
		do
			is_default_icon_set := (gtk_window_set_default_icon_from_file
											(a_filename.to_external,
											 address_of (error.handle))).to_boolean
			-- Sets an icon to be used as fallback for windows that
			-- haven't had gtk_window_set_icon_list() called on them from
			-- a file on disk. Warns on failure if err is NULL.
		end

	is_default_icon_set: BOOLEAN
			-- Has last call to `set_default_icon_from_file' actually 
			-- set up the default icon?

	set_default_icon_name (a_name: STRING) is
			-- Sets an icon to be used as fallback for windows that
			-- haven't had `GTK_WINDOW.set_icon_list' called on them from
			-- a named themed icon, see `GTK_WINDOW.set_icon_name'.
		do
			gtk_window_set_default_icon_name (a_name.to_external)
		end

	set_auto_startup_notification is
			-- By default, after showing the first GtkWindow for each
			-- GdkScreen, GTK+ calls gdk_notify_startup_complete(). Call
			-- this function to disable the automatic startup
			-- notification. You might do this if your first window is a
			-- splash screen, and you want to delay notification until
			-- after your real main window has been shown, for example.

			-- In that example, you would disable startup notification
			-- temporarily, show your splash screen, then re-enable it so
			-- that showing the main window would automatically result in
			-- notification.
		do
			gtk_window_set_auto_startup_notification (1)
		end

	unset_auto_startup_notification is
			-- Disable auto startup notification. Useful when dealing 
			-- with splash-screens. See `set_auto_startup_notification' 
			-- for further informations.
		do
			gtk_window_set_auto_startup_notification (0)
		end

feature {ANY} -- Global error
	error: G_ERROR
			-- The error eventually set up by a GTK+ call.
	
feature {} -- External calls for global windows features
	ref_all_toplevels (toplevel_list: POINTER) is
		external "C inline use <gtk/gtk.h>"
		alias "g_list_foreach ($toplevel_list, (GFunc)g_object_ref, NULL)"
		end

	gtk_window_list_toplevels: POINTER is -- GList* 
		external "C use <gtk/gtk.h>"
		end

	gtk_window_get_default_icon_list: POINTER is -- GList* 
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_list(a_glist: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon (a_gdkpixbuf_icon: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_from_file (filename_str, gerror_handle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_default_icon_name (name_str: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_window_set_auto_startup_notification (gboolean_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

feature {} -- Unwrapped code from "Main loop and Events"

	--   Main loop and Events -- Library initialization, main event loop, and
	--   events
	--
	--Synopsis
	--
	--
	-- #include <gtk/gtk.h>
	--
	--
	-- gchar*      gtk_set_locale                  (void);
	-- void        gtk_disable_setlocale           (void);
	-- PangoLanguage* gtk_get_default_language     (void);
	-- gboolean    gtk_parse_args                  (int *argc,
	--                                              char ***argv);
	-- void        gtk_init                        (int *argc,
	--                                              char ***argv);
	-- gboolean    gtk_init_check                  (int *argc,
	--                                              char ***argv);
	-- gboolean    gtk_init_with_args              (int *argc,
	--                                              char ***argv,
	--                                              char *parameter_string,
	--                                              GOptionEntry *entries,
	--                                              char *translation_domain,
	--                                              GError **error);
	-- GOptionGroup* gtk_get_option_group          (gboolean open_default_display);
	-- void        gtk_exit                        (gint error_code);
	-- gboolean    gtk_events_pending              (void);
	-- void        gtk_main                        (void);
	-- guint       gtk_main_level                  (void);
	-- void        gtk_main_quit                   (void);
	-- gboolean    gtk_main_iteration              (void);
	-- gboolean    gtk_main_iteration_do           (gboolean blocking);
	-- void        gtk_main_do_event               (GdkEvent *event);
	-- void        (*GtkModuleInitFunc)            (gint *argc,
	--                                              gchar ***argv);
	-- void        (*GtkModuleDisplayInitFunc)     (GdkDisplay *display);
	--
	-- gboolean    gtk_true                        (void);
	-- gboolean    gtk_false                       (void);
	--
	-- void        gtk_grab_add                    (GtkWidget *widget);
	-- GtkWidget*  gtk_grab_get_current            (void);
	-- void        gtk_grab_remove                 (GtkWidget *widget);
	--
	-- void        gtk_init_add                    (GtkFunction function,
	--                                              gpointer data);
	-- void        gtk_quit_add_destroy            (guint main_level,
	--                                              GtkObject *object);
	-- guint       gtk_quit_add                    (guint main_level,
	--                                              GtkFunction function,
	--                                              gpointer data);
	-- guint       gtk_quit_add_full               (guint main_level,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	-- void        gtk_quit_remove                 (guint quit_handler_id);
	-- void        gtk_quit_remove_by_data         (gpointer data);
	--
	-- guint       gtk_timeout_add_full            (guint32 interval,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	-- guint       gtk_timeout_add                 (guint32 interval,
	--                                              GtkFunction function,
	--                                              gpointer data);
	-- void        gtk_timeout_remove              (guint timeout_handler_id);
	--
	-- guint       gtk_idle_add                    (GtkFunction function,
	--                                              gpointer data);
	-- guint       gtk_idle_add_priority           (gint priority,
	--                                              GtkFunction function,
	--                                              gpointer data);
	-- guint       gtk_idle_add_full               (gint priority,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	-- void        gtk_idle_remove                 (guint idle_handler_id);
	-- void        gtk_idle_remove_by_data         (gpointer data);
	--
	-- guint       gtk_input_add_full              (gint source,
	--                                              GdkInputCondition condition,
	--                                              GdkInputFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	-- void        gtk_input_remove                (guint input_handler_id);
	--
	-- #define     GTK_PRIORITY_REDRAW
	-- #define     GTK_PRIORITY_RESIZE
	-- #define     GTK_PRIORITY_HIGH
	-- #define     GTK_PRIORITY_INTERNAL
	-- #define     GTK_PRIORITY_DEFAULT
	-- #define     GTK_PRIORITY_LOW
	--
	-- guint       gtk_key_snooper_install         (GtkKeySnoopFunc snooper,
	--                                              gpointer func_data);
	-- gint        (*GtkKeySnoopFunc)              (GtkWidget *grab_widget,
	--                                              GdkEventKey *event,
	--                                              gpointer func_data);
	-- void        gtk_key_snooper_remove          (guint snooper_handler_id);
	--
	-- GdkEvent*   gtk_get_current_event           (void);
	-- guint32     gtk_get_current_event_time      (void);
	-- gboolean    gtk_get_current_event_state     (GdkModifierType *state);
	-- GtkWidget*  gtk_get_event_widget            (GdkEvent *event);
	-- void        gtk_propagate_event             (GtkWidget *widget,
	--                                              GdkEvent *event);
	--
	--
	--Description
	--
	--   Before using GTK+, you need to initialize it; initialization connects to
	--   the window system display, and parses some standard command line
	--   arguments. The gtk_init() function initializes GTK+. gtk_init() exits the
	--   application if errors occur; to avoid this, use gtk_init_check().
	--   gtk_init_check() allows you to recover from a failed GTK+ initialization -
	--   you might start up your application in text mode instead.
	--
	--   Like all GUI toolkits, GTK+ uses an event-driven programming model. When
	--   the user is doing nothing, GTK+ sits in the main loop and waits for input.
	--   If the user performs some action - say, a mouse click - then the main loop
	--   "wakes up" and delivers an event to GTK+. GTK+ forwards the event to one
	--   or more widgets.
	--
	--   When widgets receive an event, they frequently emit one or more signals.
	--   Signals notify your program that "something interesting happened" by
	--   invoking functions you've connected to the signal with g_signal_connect().
	--   Functions connected to a signal are often termed callbacks.
	--
	--   When your callbacks are invoked, you would typically take some action -
	--   for example, when an Open button is clicked you might display a
	--   GtkFileSelectionDialog. After a callback finishes, GTK+ will return to the
	--   main loop and await more user input.
	--
	--   Example 1. Typical main function for a GTK+ application
	--
	-- int
	-- main (int argc, char **argv)
	-- {
	--   /* Initialize i18n support */
	--   gtk_set_locale ();
	--
	--   /* Initialize the widget set */
	--   gtk_init (&argc, &argv);
	--
	--   /* Create the main window */
	--   mainwin = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	--
	--   /* Set up our GUI elements */
	--   ...
	--
	--   /* Show the application window */
	--   gtk_widget_show_all (mainwin);
	--
	--   /* Enter the main event loop, and wait for user interaction */
	--   gtk_main ();
	--
	--   /* The user lost interest */
	--   return 0;
	-- }
	--
	--   It's OK to use the GLib main loop directly instead of gtk_main(), though
	--   it involves slightly more typing. See GMainLoop in the GLib documentation.
	--
	--Details
	--
	--  gtk_set_locale ()
	--
	-- gchar*      gtk_set_locale                  (void);
	--
	--   Initializes internationalization support for GTK+. gtk_init()
	--   automatically does this, so there is typically no point in calling this
	--   function.
	--
	--   If you are calling this function because you changed the locale after GTK+
	--   is was initialized, then calling this function may help a bit. (Note,
	--   however, that changing the locale after GTK+ is initialized may produce
	--   inconsistent results and is not really supported.)
	--
	--   In detail - sets the current locale according to the program environment.
	--   This is the same as calling the C library function setlocale (LC_ALL, "")
	--   but also takes care of the locale specific setup of the windowing system
	--   used by GDK.
	--
	--   Returns : a string corresponding to the locale set, typically in the form
	--             lang_COUNTRY, where lang is an ISO-639 language code, and
	--             COUNTRY is an ISO-3166 country code. On Unix, this form matches
	--             the result of the setlocale(); it is also used on other
	--             machines, such as Windows, where the C library returns a
	--             different result. The string is owned by GTK+ and should not be
	--             modified or freed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_disable_setlocale ()
	--
	-- void        gtk_disable_setlocale           (void);
	--
	--   Prevents gtk_init(), gtk_init_check(), gtk_init_with_args() and
	--   gtk_parse_args() from automatically calling setlocale (LC_ALL, ""). You
	--   would want to use this function if you wanted to set the locale for your
	--   program to something other than the user's locale, or if you wanted to set
	--   different values for different locale categories.
	--
	--   Most programs should not need to call this function.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_default_language ()
	--
	-- PangoLanguage* gtk_get_default_language     (void);
	--
	--   Returns the PangoLanguage for the default language currently in effect.
	--   (Note that this can change over the life of an application.) The default
	--   language is derived from the current locale. It determines, for example,
	--   whether GTK+ uses the right-to-left or left-to-right text direction. See
	--   _gtk_get_lc_ctype() for notes on behaviour on Windows.
	--
	--   Returns : the default language as a PangoLanguage, must not be freed
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_parse_args ()
	--
	-- gboolean    gtk_parse_args                  (int *argc,
	--                                              char ***argv);
	--
	--   Parses command line arguments, and initializes global attributes of GTK+,
	--   but does not actually open a connection to a display. (See
	--   gdk_display_open(), gdk_get_display_arg_name())
	--
	--   Any arguments used by GTK+ or GDK are removed from the array and argc and
	--   argv are updated accordingly.
	--
	--   You shouldn't call this function explicitely if you are using gtk_init(),
	--   or gtk_init_check().
	--
	--   argc :    a pointer to the number of command line arguments.
	--   argv :    a pointer to the array of command line arguments.
	--   Returns : TRUE if initialization succeeded, otherwise FALSE.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_init ()
	--
	-- void        gtk_init                        (int *argc,
	--                                              char ***argv);
	--
	--   Call this function before using any other GTK+ functions in your GUI
	--   applications. It will initialize everything needed to operate the toolkit
	--   and parses some standard command line options. argc and argv are adjusted
	--   accordingly so your own code will never see those standard arguments.
	--
	--   Note that there are some alternative ways to initialize GTK+: if you are
	--   calling gtk_parse_args(), gtk_init_check(), gtk_init_with_args() or
	--   g_option_context_parse() with the option group returned by
	--   gtk_get_option_group(), you don't have to call gtk_init().
	--
	--  Note
	--
	--   This function will terminate your program if it was unable to initialize
	--   the GUI for some reason. If you want your program to fall back to a
	--   textual interface you want to call gtk_init_check() instead.
	--
	--  Note
	--
	--   argc : Address of the argc parameter of your main() function. Changed if
	--          any arguments were handled.
	--   argv : Address of the argv parameter of main(). Any parameters understood
	--          by gtk_init() are stripped before return.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_init_check ()
	--
	-- gboolean    gtk_init_check                  (int *argc,
	--                                              char ***argv);
	--
	--   This function does the same work as gtk_init() with only a single change:
	--   It does not terminate the program if the GUI can't be initialized. Instead
	--   it returns FALSE on failure.
	--
	--   This way the application can fall back to some other means of
	--   communication with the user - for example a curses or command line
	--   interface.
	--
	--   argc :    Address of the argc parameter of your main() function. Changed
	--             if any arguments were handled.
	--   argv :    Address of the argv parameter of main(). Any parameters
	--             understood by gtk_init() are stripped before return.
	--   Returns : TRUE if the GUI has been successfully initialized, FALSE
	--             otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_init_with_args ()
	--
	-- gboolean    gtk_init_with_args              (int *argc,
	--                                              char ***argv,
	--                                              char *parameter_string,
	--                                              GOptionEntry *entries,
	--                                              char *translation_domain,
	--                                              GError **error);
	--
	--   This function does the same work as gtk_init_check(). Additionally, it
	--   allows you to add your own commandline options, and it automatically
	--   generates nicely formatted --help output. Note that your program will be
	--   terminated after writing out the help output.
	--
	--   argc :               a pointer to the number of command line arguments.
	--   argv :               a pointer to the array of command line arguments.
	--   parameter_string :   a string which is displayed in the first line of
	--                        --help output, after programname [OPTION...]
	--   entries :            a NULL-terminated array of GOptionEntrys describing
	--                        the options of your program
	--   translation_domain : a translation domain to use for translating the
	--                        --help output for the options in entries with
	--                        gettext(), or NULL
	--   error :              a return location for errors
	--   Returns :            TRUE if the GUI has been successfully initialized,
	--                        FALSE otherwise.
	--
	--   Since 2.6
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_option_group ()
	--
	-- GOptionGroup* gtk_get_option_group          (gboolean open_default_display);
	--
	--   Returns a GOptionGroup for the commandline arguments recognized by GTK+
	--   and GDK. You should add this group to your GOptionContext with
	--   g_option_context_add_group(), if you are using g_option_context_parse() to
	--   parse your commandline arguments.
	--
	--   open_default_display : whether to open the default display when parsing
	--                          the commandline arguments
	--   Returns :              a GOptionGroup for the commandline arguments
	--                          recognized by GTK+
	--
	--   Since 2.6
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_exit ()
	--
	-- void        gtk_exit                        (gint error_code);
	--
	--  Warning
	--
	--   gtk_exit is deprecated and should not be used in newly-written code. Use
	--   the standard exit() function instead.
	--
	--   Terminates the program and returns the given exit code to the caller. This
	--   function will shut down the GUI and free all resources allocated for GTK+.
	--
	--   error_code : Return value to pass to the caller. This is dependent on the
	--                target system but at least on Unix systems 0 means success.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_events_pending ()
	--
	-- gboolean    gtk_events_pending              (void);
	--
	--   Checks if any events are pending. This can be used to update the GUI and
	--   invoke timeouts etc. while doing some time intensive computation.
	--
	--   Example 2. Updating the GUI during a long computation.
	--
	--         /* computation going on */
	-- ...
	--         while (gtk_events_pending ())
	--           gtk_main_iteration ();
	-- ...
	--         /* computation continued */
	--
	--   Returns : TRUE if any events are pending, FALSE otherwise.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main ()
	--
	-- void        gtk_main                        (void);
	--
	--   Runs the main loop until gtk_main_quit() is called. You can nest calls to
	--   gtk_main(). In that case gtk_main_quit() will make the innermost
	--   invocation of the main loop return.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main_level ()
	--
	-- guint       gtk_main_level                  (void);
	--
	--   Asks for the current nesting level of the main loop. This can be useful
	--   when calling gtk_quit_add().
	--
	--   Returns : the nesting level of the current invocation of the main loop.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main_quit ()
	--
	-- void        gtk_main_quit                   (void);
	--
	--   Makes the innermost invocation of the main loop return when it regains
	--   control.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main_iteration ()
	--
	-- gboolean    gtk_main_iteration              (void);
	--
	--   Runs a single iteration of the mainloop. If no events are waiting to be
	--   processed GTK+ will block until the next event is noticed. If you don't
	--   want to block look at gtk_main_iteration_do() or check if any events are
	--   pending with gtk_events_pending() first.
	--
	--   Returns : TRUE if gtk_main_quit() has been called for the innermost
	--             mainloop.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main_iteration_do ()
	--
	-- gboolean    gtk_main_iteration_do           (gboolean blocking);
	--
	--   Runs a single iteration of the mainloop. If no events are available either
	--   return or block dependent on the value of blocking.
	--
	--   blocking : TRUE if you want GTK+ to block if no events are pending.
	--   Returns :  TRUE if gtk_main_quit() has been called for the innermost
	--              mainloop.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_main_do_event ()
	--
	-- void        gtk_main_do_event               (GdkEvent *event);
	--
	--   Processes a single GDK event. This is public only to allow filtering of
	--   events between GDK and GTK+. You will not usually need to call this
	--   function directly.
	--
	--   While you should not call this function directly, you might want to know
	--   how exactly events are handled. So here is what this function does with
	--   the event:
	--
	--    1. Compress enter/leave notify events. If the event passed build an
	--       enter/leave pair together with the next event (peeked from GDK) both
	--       events are thrown away. This is to avoid a backlog of
	--       (de-)highlighting widgets crossed by the pointer.
	--
	--    2. Find the widget which got the event. If the widget can't be determined
	--       the event is thrown away unless it belongs to a INCR transaction. In
	--       that case it is passed to gtk_selection_incr_event().
	--
	--    3. Then the event is passed on a stack so you can query the currently
	--       handled event with gtk_get_current_event().
	--
	--    4. The event is sent to a widget. If a grab is active all events for
	--       widgets that are not in the contained in the grab widget are sent to
	--       the latter with a few exceptions:
	--
	--          o Deletion and destruction events are still sent to the event
	--            widget for obvious reasons.
	--
	--          o Events which directly relate to the visual representation of the
	--            event widget.
	--
	--          o Leave events are delivered to the event widget if there was an
	--            enter event delivered to it before without the paired leave
	--            event.
	--
	--          o Drag events are not redirected because it is unclear what the
	--            semantics of that would be.
	--
	--       Another point of interest might be that all key events are first
	--       passed through the key snooper functions if there are any. Read the
	--       description of gtk_key_snooper_install() if you need this feature.
	--
	--    5. After finishing the delivery the event is popped from the event stack.
	--
	--   event : An event to process (normally) passed by GDK.
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkModuleInitFunc ()
	--
	-- void        (*GtkModuleInitFunc)            (gint *argc,
	--                                              gchar ***argv);
	--
	--   Each GTK+ module must have a function gtk_module_init() with this
	--   prototype. This function is called after loading the module with the argc
	--   and argv cleaned from any arguments that GTK+ handles itself.
	--
	--   argc : Pointer to the number of arguments remaining after gtk_init().
	--   argv : Points to the argument vector.
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkModuleDisplayInitFunc ()
	--
	-- void        (*GtkModuleDisplayInitFunc)     (GdkDisplay *display);
	--
	--   display :
	--
	--   Since 2.2
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_true ()
	--
	-- gboolean    gtk_true                        (void);
	--
	--   All this function does it to return TRUE. This can be useful for example
	--   if you want to inhibit the deletion of a window. Of course you should not
	--   do this as the user expects a reaction from clicking the close icon of the
	--   window...
	--
	--   Example 3. A persistent window
	--
	-- #include <gtk/gtk.h>
	--
	-- int
	-- main (int argc, char **argv)
	-- {
	--   GtkWidget     *win, *but;
	--
	--   gtk_init( &argc, &argv );
	--
	--   win = gtk_window_new (GTK_WINDOW_TOPLEVEL);
	--   g_signal_connect (win, "delete-event",
	--                     G_CALLBACK (gtk_true), NULL);
	--   g_signal_connect (win, "destroy",
	--                     G_CALLBACK (gtk_main_quit), NULL);
	--
	--   but = gtk_button_new_with_label ("Close yourself. I mean it!");
	--   g_signal_connect_swapped (but, "clicked",
	--                   G_CALLBACK (gtk_object_destroy), win);
	--   gtk_container_add (GTK_CONTAINER (win), but);
	--
	--   gtk_widget_show_all (win);
	--   gtk_main ();
	--   return 0;
	-- }
	--
	--   Returns : TRUE
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_false ()
	--
	-- gboolean    gtk_false                       (void);
	--
	--   Analogical to gtk_true() this function does nothing but always returns
	--   FALSE.
	--
	--   Returns : FALSE
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_grab_add ()
	--
	-- void        gtk_grab_add                    (GtkWidget *widget);
	--
	--   Makes widget the current grabbed widget. This means that interaction with
	--   other widgets in the same application is blocked and mouse as well as
	--   keyboard events are delivered to this widget.
	--
	--   widget : The widget that grabs keyboard and pointer events.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_grab_get_current ()
	--
	-- GtkWidget*  gtk_grab_get_current            (void);
	--
	--   Queries the current grab of the default window group.
	--
	--   Returns : The widget which currently has the grab or NULL if no grab is
	--             active.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_grab_remove ()
	--
	-- void        gtk_grab_remove                 (GtkWidget *widget);
	--
	--   Removes the grab from the given widget. You have to pair calls to
	--   gtk_grab_add() and gtk_grab_remove().
	--
	--   widget : The widget which gives up the grab.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_init_add ()
	--
	-- void        gtk_init_add                    (GtkFunction function,
	--                                              gpointer data);
	--
	--   Registers a function to be called when the mainloop is started.
	--
	--   function : Function to invoke when gtk_main() is called next.
	--   data :     Data to pass to that function.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_quit_add_destroy ()
	--
	-- void        gtk_quit_add_destroy            (guint main_level,
	--                                              GtkObject *object);
	--
	--   Trigger destruction of object in case the mainloop at level main_level is
	--   quit.
	--
	--   main_level : Level of the mainloop which shall trigger the destruction.
	--   object :     Object to be destroyed.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_quit_add ()
	--
	-- guint       gtk_quit_add                    (guint main_level,
	--                                              GtkFunction function,
	--                                              gpointer data);
	--
	--   Registers a function to be called when an instance of the mainloop is
	--   left.
	--
	--   main_level : Level at which termination the function shall be called. You
	--                can pass 0 here to have the function run at the termination
	--                of the current mainloop.
	--   function :   The function to call. This should return 0 to be removed from
	--                the list of quit handlers. Otherwise the function might be
	--                called again.
	--   data :       Pointer to pass when calling function.
	--   Returns :    A handle for this quit handler (you need this for
	--                gtk_quit_remove()) or 0 if you passed a NULL pointer in
	--                function.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_quit_add_full ()
	--
	-- guint       gtk_quit_add_full               (guint main_level,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	--
	--   Registers a function to be called when an instance of the mainloop is
	--   left. In comparison to gtk_quit_add() this function adds the possibility
	--   to pass a marshaller and a function to be called when the quit handler is
	--   freed.
	--
	--   The former can be used to run interpreted code instead of a compiled
	--   function while the latter can be used to free the information stored in
	--   data (while you can do this in function as well)... So this function will
	--   mostly be used by GTK+ wrappers for languages other than C.
	--
	--   main_level : Level at which termination the function shall be called. You
	--                can pass 0 here to have the function run at the termination
	--                of the current mainloop.
	--   function :   The function to call. This should return 0 to be removed from
	--                the list of quit handlers. Otherwise the function might be
	--                called again.
	--   marshal :    The marshaller to be used. If this is non-NULL, function is
	--                ignored.
	--   data :       Pointer to pass when calling function.
	--   destroy :    Function to call to destruct data. Gets data as argument.
	--   Returns :    A handle for this quit handler (you need this for
	--                gtk_quit_remove()) or 0 if you passed a NULL pointer in
	--                function.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_quit_remove ()
	--
	-- void        gtk_quit_remove                 (guint quit_handler_id);
	--
	--   Removes a quit handler by its identifier.
	--
	--   quit_handler_id : Identifier for the handler returned when installing it.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_quit_remove_by_data ()
	--
	-- void        gtk_quit_remove_by_data         (gpointer data);
	--
	--   Removes a quit handler identified by its data field.
	--
	--   data : The pointer passed as data to gtk_quit_add() or
	--          gtk_quit_add_full().
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_timeout_add_full ()
	--
	-- guint       gtk_timeout_add_full            (guint32 interval,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	--
	--  Warning
	--
	--   gtk_timeout_add_full has been deprecated since version 2.4 and should not
	--   be used in newly-written code. Use g_timeout_add_full() instead.
	--
	--   Registers a function to be called periodically. The function will be
	--   called repeatedly after interval milliseconds until it returns FALSE at
	--   which point the timeout is destroyed and will not be called again.
	--
	--   interval : The time between calls to the function, in milliseconds
	--              (1/1000ths of a second.)
	--   function : The function to call periodically.
	--   marshal :  The marshaller to use instead of the function (if non-NULL).
	--   data :     The data to pass to the function.
	--   destroy :  Function to call when the timeout is destroyed or NULL.
	--   Returns :  A unique id for the event source.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_timeout_add ()
	--
	-- guint       gtk_timeout_add                 (guint32 interval,
	--                                              GtkFunction function,
	--                                              gpointer data);
	--
	--  Warning
	--
	--   gtk_timeout_add has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_timeout_add() instead.
	--
	--   Registers a function to be called periodically. The function will be
	--   called repeatedly after interval milliseconds until it returns FALSE at
	--   which point the timeout is destroyed and will not be called again.
	--
	--   interval : The time between calls to the function, in milliseconds
	--              (1/1000ths of a second.)
	--   function : The function to call periodically.
	--   data :     The data to pass to the function.
	--   Returns :  A unique id for the event source.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_timeout_remove ()
	--
	-- void        gtk_timeout_remove              (guint timeout_handler_id);
	--
	--  Warning
	--
	--   gtk_timeout_remove has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_source_remove() instead.
	--
	--   Removes the given timeout destroying all information about it.
	--
	--   timeout_handler_id : The identifier returned when installing the timeout.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_idle_add ()
	--
	-- guint       gtk_idle_add                    (GtkFunction function,
	--                                              gpointer data);
	--
	--  Warning
	--
	--   gtk_idle_add has been deprecated since version 2.4 and should not be used
	--   in newly-written code. Use g_idle_add() instead.
	--
	--   Causes the mainloop to call the given function whenever no events with
	--   higher priority are to be processed. The default priority is
	--   GTK_PRIORITY_DEFAULT, which is rather low.
	--
	--   function : The function to call.
	--   data :     The information to pass to the function.
	--   Returns :  a unique handle for this registration.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_idle_add_priority ()
	--
	-- guint       gtk_idle_add_priority           (gint priority,
	--                                              GtkFunction function,
	--                                              gpointer data);
	--
	--  Warning
	--
	--   gtk_idle_add_priority has been deprecated since version 2.4 and should not
	--   be used in newly-written code. Use g_idle_add_full() instead.
	--
	--   Like gtk_idle_add() this function allows you to have a function called
	--   when the event loop is idle. The difference is that you can give a
	--   priority different from GTK_PRIORITY_DEFAULT to the idle function.
	--
	--   priority : The priority which should not be above G_PRIORITY_HIGH_IDLE.
	--              Note that you will interfere with GTK+ if you use a priority
	--              above GTK_PRIORITY_RESIZE.
	--   function : The function to call.
	--   data :     Data to pass to that function.
	--   Returns :  A unique id for the event source.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_idle_add_full ()
	--
	-- guint       gtk_idle_add_full               (gint priority,
	--                                              GtkFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	--
	--  Warning
	--
	--   gtk_idle_add_full has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_idle_add_full() instead.
	--
	--   Like gtk_idle_add() this function allows you to have a function called
	--   when the event loop is idle. The difference is that you can give a
	--   priority different from GTK_PRIORITY_DEFAULT to the idle function.
	--
	--   priority : The priority which should not be above G_PRIORITY_HIGH_IDLE.
	--              Note that you will interfere with GTK+ if you use a priority
	--              above GTK_PRIORITY_RESIZE.
	--   function : The function to call.
	--   marshal :  The marshaller to use instead of the function (if non-NULL).
	--   data :     Data to pass to that function.
	--   destroy :  Function to call when the timeout is destroyed or NULL.
	--   Returns :  A unique id for the event source.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_idle_remove ()
	--
	-- void        gtk_idle_remove                 (guint idle_handler_id);
	--
	--  Warning
	--
	--   gtk_idle_remove has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_source_remove() instead.
	--
	--   Removes the idle function with the given id.
	--
	--   idle_handler_id : Identifies the idle function to remove.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_idle_remove_by_data ()
	--
	-- void        gtk_idle_remove_by_data         (gpointer data);
	--
	--  Warning
	--
	--   gtk_idle_remove_by_data has been deprecated since version 2.4 and should
	--   not be used in newly-written code. Use g_idle_remove_by_data() instead.
	--
	--   Removes the idle function identified by the user data.
	--
	--   data : remove the idle function which was registered with this user data.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_input_add_full ()
	--
	-- guint       gtk_input_add_full              (gint source,
	--                                              GdkInputCondition condition,
	--                                              GdkInputFunction function,
	--                                              GtkCallbackMarshal marshal,
	--                                              gpointer data,
	--                                              GtkDestroyNotify destroy);
	--
	--  Warning
	--
	--   gtk_input_add_full has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_io_add_watch_full() instead.
	--
	--   Registers a function to be called when a condition becomes true on a file
	--   descriptor.
	--
	--   source :    a file descriptor.
	--   condition : the condition.
	--   function :  The function to call.
	--   marshal :   The marshaller to use instead of the function (if non-NULL).
	--   data :      callback data passed to function.
	--   destroy :   callback function to call with data when the input handler is
	--               removed, or NULL.
	--   Returns :   A unique id for the event source; to be used with
	--               gtk_input_remove().
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_input_remove ()
	--
	-- void        gtk_input_remove                (guint input_handler_id);
	--
	--  Warning
	--
	--   gtk_input_remove has been deprecated since version 2.4 and should not be
	--   used in newly-written code. Use g_source_remove() instead.
	--
	--   Removes the function with the given id.
	--
	--   input_handler_id : Identifies the function to remove.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_REDRAW
	--
	-- #define GTK_PRIORITY_REDRAW     (G_PRIORITY_HIGH_IDLE + 20)
	--
	--  Warning
	--
	--   GTK_PRIORITY_REDRAW has been deprecated since version 2.4 and should not
	--   be used in newly-written code. This macro is deprecated. You should use
	--   GDK_PRIORITY_REDRAW instead.
	--
	--   Use this priority for redrawing related stuff. It is used internally by
	--   GTK+ to do pending redraws. This priority is lower than
	--   GTK_PRIORITY_RESIZE to avoid redrawing a widget just before resizing (and
	--   therefore redrawing it again).
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_RESIZE
	--
	-- #define GTK_PRIORITY_RESIZE     (G_PRIORITY_HIGH_IDLE + 10)
	--
	--   Use this priority for resizing related stuff. It is used internally by
	--   GTK+ to compute the sizes of widgets. This priority is higher than
	--   GTK_PRIORITY_REDRAW to avoid resizing a widget which was just redrawn.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_HIGH
	--
	-- #define GTK_PRIORITY_HIGH       G_PRIORITY_HIGH
	--
	--  Warning
	--
	--   GTK_PRIORITY_HIGH has been deprecated since version 2.4 and should not be
	--   used in newly-written code. This macro is deprecated. You should use
	--   G_PRIORITY_HIGH instead.
	--
	--   Use this for high priority timeouts. This priority is never used inside
	--   GTK+ so everything running at this priority will be running before
	--   anything inside the toolkit.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_INTERNAL
	--
	-- #define GTK_PRIORITY_INTERNAL   GTK_PRIORITY_REDRAW
	--
	--  Warning
	--
	--   GTK_PRIORITY_INTERNAL is deprecated and should not be used in
	--   newly-written code.
	--
	--   This priority is for GTK+ internal stuff. Don't use it in your
	--   applications.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_DEFAULT
	--
	-- #define GTK_PRIORITY_DEFAULT    G_PRIORITY_DEFAULT_IDLE
	--
	--  Warning
	--
	--   GTK_PRIORITY_DEFAULT has been deprecated since version 2.4 and should not
	--   be used in newly-written code. This macro is deprecated. You should use
	--   G_PRIORITY_DEFAULT_IDLE instead.
	--
	--   Default priority for idle functions.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_PRIORITY_LOW
	--
	-- #define GTK_PRIORITY_LOW        G_PRIORITY_LOW
	--
	--  Warning
	--
	--   GTK_PRIORITY_LOW has been deprecated since version 2.4 and should not be
	--   used in newly-written code. This macro is deprecated. You should use
	--   G_PRIORITY_LOW instead.
	--
	--   Priority for very unimportant background tasks.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_key_snooper_install ()
	--
	-- guint       gtk_key_snooper_install         (GtkKeySnoopFunc snooper,
	--                                              gpointer func_data);
	--
	--   Installs a key snooper function, which will get called on all key events
	--   before delivering them normally.
	--
	--   snooper :   a GtkKeySnoopFunc.
	--   func_data : data to pass to snooper.
	--   Returns :   a unique id for this key snooper for use with
	--               gtk_key_snooper_remove().
	--
	--   --------------------------------------------------------------------------
	--
	--  GtkKeySnoopFunc ()
	--
	-- gint        (*GtkKeySnoopFunc)              (GtkWidget *grab_widget,
	--                                              GdkEventKey *event,
	--                                              gpointer func_data);
	--
	--   Key snooper functions are called before normal event delivery. They can be
	--   used to implement custom key event handling.
	--
	--   grab_widget : the widget to which the event will be delivered.
	--   event :       the key event.
	--   func_data :   the func_data supplied to gtk_key_snooper_install().
	--   Returns :     TRUE to stop further processing of event, FALSE to continue.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_key_snooper_remove ()
	--
	-- void        gtk_key_snooper_remove          (guint snooper_handler_id);
	--
	--   Removes the key snooper function with the given id.
	--
	--   snooper_handler_id : Identifies the key snooper to remove.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_current_event ()
	--
	-- GdkEvent*   gtk_get_current_event           (void);
	--
	--   Obtains a copy of the event currently being processed by GTK+. For
	--   example, if you get a "clicked" signal from GtkButton, the current event
	--   will be the GdkEventButton that triggered the "clicked" signal. The
	--   returned event must be freed with gdk_event_free(). If there is no current
	--   event, the function returns NULL.
	--
	--   Returns : a copy of the current event, or NULL if no current event.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_current_event_time ()
	--
	-- guint32     gtk_get_current_event_time      (void);
	--
	--   If there is a current event and it has a timestamp, return that timestamp,
	--   otherwise return GDK_CURRENT_TIME.
	--
	--   Returns : the timestamp from the current event, or GDK_CURRENT_TIME.
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_current_event_state ()
	--
	-- gboolean    gtk_get_current_event_state     (GdkModifierType *state);
	--
	--   If there is a current event and it has a state field, place that state
	--   field in state and return TRUE, otherwise return FALSE.
	--
	--   state :   a location to store the state of the current event
	--   Returns : TRUE if there was a current event and it had a state field
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_get_event_widget ()
	--
	-- GtkWidget*  gtk_get_event_widget            (GdkEvent *event);
	--
	--   If event is NULL or the event was not associated with any widget, returns
	--   NULL, otherwise returns the widget that received the event originally.
	--
	--   event :   a GdkEvent
	--   Returns : the widget that originally received event, or NULL
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_propagate_event ()
	--
	-- void        gtk_propagate_event             (GtkWidget *widget,
	--                                              GdkEvent *event);
	--
	--   Sends an event to a widget, propagating the event to parent widgets if the
	--   event remains unhandled. Events received by GTK+ from GDK normally begin
	--   in gtk_main_do_event(). Depending on the type of event, existence of modal
	--   dialogs, grabs, etc., the event may be propagated; if so, this function is
	--   used. gtk_propagate_event() calls gtk_widget_event() on each widget it
	--   decides to send the event to. So gtk_widget_event() is the lowest-level
	--   function; it simply emits the "event" and possibly an event-specific
	--   signal on a widget. gtk_propagate_event() is a bit higher-level, and
	--   gtk_main_do_event() is the highest level.
	--
	--   All that said, you most likely don't want to use any of these functions;
	--   synthesizing events is rarely needed. Consider asking on the mailing list
	--   for better ways to achieve your goals. For example, use
	--   gdk_window_invalidate_rect() or gtk_widget_queue_draw() instead of making
	--   up expose events.
	--
	--   widget : a GtkWidget
	--   event :  an event
	--
	--See Also
	--
	--   See the GLib manual, especially GMainLoop and signal-related functions
	--   such as g_signal_connect().

feature {ANY} -- Version Information 
	-- Variables and functions to check the GTK+ version.

	-- GTK+ provides version information, primarily useful in configure
	-- checks for builds that have a configure script. Applications
	-- will not typically use the features described here.

	gtk_major_version: INTEGER is
			-- The major version number of the GTK+ library. (e.g. in
			-- GTK+ version 1.2.5 this is 1.)
			
			-- This variable is in the library, so represents the GTK+
			-- library you have linked against. Contrast with the
			-- GTK_MAJOR_VERSION macro, which represents the major
			-- version of the GTK+ headers you have included.  TODO:
			-- Should be NATURAL since it is a guint
		external "C macro use <gtk/gtk.h>"
		end

	gtk_minor_version: INTEGER is
			-- The minor version number of the GTK+ library. (e.g. in
			-- GTK+ version 1.2.5 this is 2.)
			
			-- This variable is in the library, so represents the GTK+
			-- library you have linked against. Contrast with the
			-- GTK_MINOR_VERSION macro, which represents the minor
			-- version of the GTK+ headers you have included.
			
			-- TODO: Should be NATURAL since it is a guint
		external "C macro use <gtk/gtk.h>"
		end

	gtk_micro_version: INTEGER is
			-- The micro version number of the GTK+ library. (e.g. in
			-- GTK+ version 1.2.5 this is 5.)
			
			-- This variable is in the library, so represents the GTK+
			-- library you have linked against. Contrast with the
			-- GTK_MICRO_VERSION macro, which represents the micro
			-- version of the GTK+ headers you have included.
			
			-- TODO: Should be NATURAL since it is a guint
		external "C macro use <gtk/gtk.h>"
		end

	--  gtk_binary_age
	--
	-- extern const guint gtk_binary_age;
	--
	--   This is the binary age passed to libtool. If libtool means nothing to you,
	--   don't worry about it. ;-)
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_interface_age
	--
	-- extern const guint gtk_interface_age;
	--
	--   This is the interface age passed to libtool. If libtool means nothing to
	--   you, don't worry about it. ;-)
	--
	--   --------------------------------------------------------------------------
	--
	--  gtk_check_version ()
	--
	-- gchar*      gtk_check_version               (guint required_major,
	--                                              guint required_minor,
	--                                              guint required_micro);
	--
	--   Checks that the GTK+ library in use is compatible with the given version.
	--   Generally you would pass in the constants GTK_MAJOR_VERSION,
	--   GTK_MINOR_VERSION, GTK_MICRO_VERSION as the three arguments to this
	--   function; that produces a check that the library in use is compatible with
	--   the version of GTK+ the application or module was compiled against.
	--
	--   Compatibility is defined by two things: first the version of the running
	--   library is newer than the version
	--   required_major.required_minor.required_micro. Second the running library
	--   must be binary compatible with the version
	--   required_major.required_minor.required_micro (same major version.)
	--
	--   This function is primarily for GTK+ modules; the module can call this
	--   function to check that it wasn't loaded into an incompatible version of
	--   GTK+. However, such a a check isn't completely reliable, since the module
	--   may be linked against an old version of GTK+ and calling the old version
	--   of gtk_check_version(), but still get loaded into an application using a
	--   newer version of GTK+.
	--
	--   required_major : the required major version.
	--   required_minor : the required major version.
	--   required_micro : the required major version.
	--   Returns :        NULL if the GTK+ library is compatible with the given
	--                    version, or a string describing the version mismatch. The
	--                    returned string is owned by GTK+ and should not be
	--                    modified or freed.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_MAJOR_VERSION
	--
	-- #define GTK_MAJOR_VERSION                               (2)
	--
	--   Like gtk_major_version, but from the headers used at application compile
	--   time, rather than from the library linked against at application run time.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_MINOR_VERSION
	--
	-- #define GTK_MINOR_VERSION                               (10)
	--
	--   Like gtk_minor_version, but from the headers used at application compile
	--   time, rather than from the library linked against at application run time.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_MICRO_VERSION
	--
	-- #define GTK_MICRO_VERSION                               (6)
	--
	--   Like gtk_micro_version, but from the headers used at application compile
	--   time, rather than from the library linked against at application run time.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_BINARY_AGE
	--
	-- #define GTK_BINARY_AGE                                  (1006)
	--
	--   Like gtk_binary_age, but from the headers used at application compile
	--   time, rather than from the library linked against at application run time.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_INTERFACE_AGE
	--
	-- #define GTK_INTERFACE_AGE                               (6)
	--
	--   Like gtk_interface_age, but from the headers used at application compile
	--   time, rather than from the library linked against at application run time.
	--
	--   --------------------------------------------------------------------------
	--
	--  GTK_CHECK_VERSION()
	--
	-- #define     GTK_CHECK_VERSION(major,minor,micro)
	--
	--   Returns TRUE if the version of the GTK+ header files is the same as or
	--   newer than the passed-in version.
	--
	--   major : major version (e.g. 1 for version 1.2.5)
	--   minor : minor version (e.g. 2 for version 1.2.5)
	--   micro : micro version (e.g. 5 for version 1.2.5)

invariant
	error_not_void: error /= Void

end
