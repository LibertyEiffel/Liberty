note
	description: "UI description extracted from a Glade XML file"
	copyright: "[
					Copyright (C) 2006-2017: Soluciones Informaticas Libres S.A. (Except)
					
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

class GLADE_XML

inherit
	G_OBJECT

insert
	-- GLADE_XML_EXTERNAL

	-- Classes known, in alphabetical order
	-- Add others if you need to extract them from glade
	GLADE_GETTER [GTK_ABOUT_DIALOG]                 rename get as get_about_dialog end
	GLADE_GETTER [GTK_BUTTON]                 rename get as get_button end
	GLADE_GETTER [GTK_CALENDAR]               rename get as get_calendar end
	GLADE_GETTER [GTK_CHECK_BUTTON]           rename get as get_check_button end
	GLADE_GETTER [GTK_COLOR_BUTTON]           rename get as get_color_button end
	GLADE_GETTER [GTK_COLOR_SELECTION]        rename get as get_color_selection end
	GLADE_GETTER [GTK_COLOR_SELECTION_DIALOG] rename get as get_color_selection_dialog end
	GLADE_GETTER [GTK_COMBO_BOX]              rename get as get_combo_box end
	GLADE_GETTER [GTK_COMBO_BOX_ENTRY]        rename get as get_combo_box_entry end
	GLADE_GETTER [GTK_DIALOG]                 rename get as get_dialog end
	GLADE_GETTER [GTK_ENTRY]                  rename get as get_entry end
	GLADE_GETTER [GTK_EVENT_BOX]              rename get as get_event_box end
	GLADE_GETTER [GTK_FILE_CHOOSER_BUTTON]    rename get as get_file_chooser_button end
	GLADE_GETTER [GTK_FILE_CHOOSER_DIALOG]    rename get as get_file_chooser_dialog end
	GLADE_GETTER [GTK_FILE_CHOOSER_WIDGET]    rename get as get_file_chooser_widget end
	GLADE_GETTER [GTK_FONT_SELECTION]         rename get as get_font_selection end
	GLADE_GETTER [GTK_FONT_SELECTION_DIALOG]  rename get as get_font_selection_dialog end
	GLADE_GETTER [GTK_FRAME]                  rename get as get_frame end
	GLADE_GETTER [GTK_HBOX]                   rename get as get_hbox end
	GLADE_GETTER [GTK_HSCALE]                 rename get as get_hscale end
	GLADE_GETTER [GTK_ICON_VIEW]              rename get as get_icon_view end
	GLADE_GETTER [GTK_IMAGE]                  rename get as get_image end
	GLADE_GETTER [GTK_IMAGE_MENU_ITEM]        rename get as get_image_menu_item end
	GLADE_GETTER [GTK_LABEL]                  rename get as get_label end
	GLADE_GETTER [GTK_MENU_BAR]              rename get as get_menu_bar end
	GLADE_GETTER [GTK_MENU_ITEM]              rename get as get_menu_item end
	GLADE_GETTER [GTK_NOTEBOOK]               rename get as get_notebook end
	GLADE_GETTER [GTK_PROGRESS_BAR]           rename get as get_progress_bar end
	GLADE_GETTER [GTK_SPIN_BUTTON]            rename get as get_spin_button end
	GLADE_GETTER [GTK_STATUS_BAR]             rename get as get_status_bar end
	GLADE_GETTER [GTK_TABLE]                  rename get as get_table end
	GLADE_GETTER [GTK_TEXT_VIEW]              rename get as get_text_view end
	GLADE_GETTER [GTK_RADIO_BUTTON]           rename get as get_radio_button end
	GLADE_GETTER [GTK_TOGGLE_BUTTON]          rename get as get_toggle_button end
	GLADE_GETTER [GTK_TOGGLE_TOOL_BUTTON]     rename get as get_toggle_tool_button end
	GLADE_GETTER [GTK_TOOLBAR]                rename get as get_toolbar end
	GLADE_GETTER [GTK_TOOL_BUTTON]            rename get as get_tool_button end
	GLADE_GETTER [GTK_TREE_VIEW]              rename get as get_tree_view end
	GLADE_GETTER [GTK_VBOX]                   rename get as get_vbox end
	GLADE_GETTER [GTK_WINDOW]                 rename get as get_window end
	GLADE_GETTER [GTK_LAYOUT]                 rename get as get_layout end
	GLADE_GETTER [GTK_FONT_BUTTON]            rename get as get_font_button end
	GLADE_GETTER [GTK_ALIGNMENT]              rename get as get_alignment end

create {ANY}
	make, make_with_root

feature {} -- Creation

	make (file: STRING)
			-- Load Glade XML from `file'
		require
			file_not_null: file /= Void
			file_ok: (create {FILE_TOOLS}).is_readable (file)
		do
			handle := glade_xml_new (file.to_external, default_pointer, default_pointer)
			store_eiffel_wrapper
		ensure
			handle.is_not_null
		end

	make_with_root (file, root: STRING)
			-- Load Glade XML from `file' with root `root'
		require
			file_not_null: file /= Void
			file_ok: (create {FILE_TOOLS}).is_readable (file)
			root_not_null: root /= Void
		do
			handle := glade_xml_new (file.to_external, root.to_external, default_pointer)
			store_eiffel_wrapper
		ensure
			handle.is_not_null
		end

feature {ANY} -- Access

	get_widget (name: STRING): POINTER
		obsolete "use get_xxx instead (where xxx is the widget name, like %"window%", %"button%", etc.)"
		do
			Result := glade_xml_get_widget (handle, name.to_external)
		end

feature {ANY} -- Operations

	signal_autoconnect
		do
			glade_xml_signal_autoconnect (handle)
		end

feature {ANY} -- struct size

	struct_size: INTEGER
		external "C inline use <glade/glade.h>"
		alias "sizeof (GladeXML)"
		end

end
