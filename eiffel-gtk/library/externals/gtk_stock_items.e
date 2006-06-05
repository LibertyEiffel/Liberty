indexing

	description: "GTK stock items names"

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
	date: "$Date:  $"
	revision: "$Revision:  $"

deferred class GTK_STOCK_ITEMS
	
feature {WRAPPER} -- Pointers to Stock items (C) strings
	gtk_stock_dialog_authentication: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIALOG_AUTHENTICATION"
		end

	gtk_stock_dialog_info: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIALOG_INFO"
		end

	gtk_stock_dialog_warning: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIALOG_WARNING"
		end

	gtk_stock_dialog_error: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIALOG_ERROR"
		end

	gtk_stock_dialog_question: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIALOG_QUESTION"
		end

	gtk_stock_dnd: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DND"
		end

	gtk_stock_dnd_multiple: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DND_MULTIPLE"
		end

	gtk_stock_about: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ABOUT"
		end

	gtk_stock_add: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ADD"
		end

	gtk_stock_apply: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_APPLY"
		end

	gtk_stock_bold: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_BOLD"
		end

	gtk_stock_cancel: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CANCEL"
		end

	gtk_stock_cdrom: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CDROM"
		end

	gtk_stock_clear: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CLEAR"
		end

	gtk_stock_close: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CLOSE"
		end

	gtk_stock_color_picker: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_COLOR_PICKER"
		end

	gtk_stock_convert: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CONVERT"
		end

	gtk_stock_connect: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CONNECT"
		end

	gtk_stock_copy: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_COPY"
		end

	gtk_stock_cut: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_CUT"
		end

	gtk_stock_delete: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DELETE"
		end

	gtk_stock_directory: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DIRECTORY"
		end

	gtk_stock_disconnect: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_DISCONNECT"
		end

	gtk_stock_edit: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_EDIT"
		end

	gtk_stock_execute: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_EXECUTE"
		end

	gtk_stock_file: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_FILE"
		end

	gtk_stock_find: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_FIND"
		end

	gtk_stock_find_and_replace: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_FIND_AND_REPLACE"
		end

	gtk_stock_floppy: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_FLOPPY"
		end

	gtk_stock_fullscreen: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_FULLSCREEN"
		end

	gtk_stock_goto_bottom: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GOTO_BOTTOM"
		end

	gtk_stock_goto_first: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GOTO_FIRST"
		end

	gtk_stock_goto_last: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GOTO_LAST"
		end

	gtk_stock_goto_top: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GOTO_TOP"
		end

	gtk_stock_go_back: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GO_BACK"
		end

	gtk_stock_go_down: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GO_DOWN"
		end

	gtk_stock_go_forward: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GO_FORWARD"
		end

	gtk_stock_go_up: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_GO_UP"
		end

	gtk_stock_harddisk: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_HARDDISK"
		end

	gtk_stock_help: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_HELP"
		end

	gtk_stock_home: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_HOME"
		end

	gtk_stock_index: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_INDEX"
		end

	gtk_stock_indent: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_INDENT"
		end

	gtk_stock_info: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_INFO"
		end

	gtk_stock_unindent: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_UNINDENT"
		end

	gtk_stock_italic: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ITALIC"
		end

	gtk_stock_jump_to: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_JUMP_TO"
		end

	gtk_stock_justify_center: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_JUSTIFY_CENTER"
		end

	gtk_stock_justify_fill: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_JUSTIFY_FILL"
		end

	gtk_stock_justify_left: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_JUSTIFY_LEFT"
		end

	gtk_stock_justify_right: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_JUSTIFY_RIGHT"
		end

	gtk_stock_leave_fullscreen: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_LEAVE_FULLSCREEN"
		end

	gtk_stock_missing_image: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MISSING_IMAGE"
		end

	gtk_stock_media_forward: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_FORWARD"
		end

	gtk_stock_media_next: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_NEXT"
		end

	gtk_stock_media_pause: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_PAUSE"
		end

	gtk_stock_media_play: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_PLAY"
		end

	gtk_stock_media_previous: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_PREVIOUS"
		end

	gtk_stock_media_record: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_RECORD"
		end

	gtk_stock_media_rewind: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_REWIND"
		end

	gtk_stock_media_stop: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_MEDIA_STOP"
		end

	gtk_stock_network: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_NETWORK"
		end

	gtk_stock_new: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_NEW"
		end

	gtk_stock_no: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_NO"
		end

	gtk_stock_ok: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_OK"
		end

	gtk_stock_open: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_OPEN"
		end

	gtk_stock_paste: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_PASTE"
		end

	gtk_stock_preferences: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_PREFERENCES"
		end

	gtk_stock_print: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_PRINT"
		end

	gtk_stock_print_preview: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_PRINT_PREVIEW"
		end

	gtk_stock_properties: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_PROPERTIES"
		end

	gtk_stock_quit: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_QUIT"
		end

	gtk_stock_redo: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_REDO"
		end

	gtk_stock_refresh: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_REFRESH"
		end

	gtk_stock_remove: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_REMOVE"
		end

	gtk_stock_revert_to_saved: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_REVERT_TO_SAVED"
		end

	gtk_stock_save: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SAVE"
		end

	gtk_stock_save_as: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SAVE_AS"
		end

	gtk_stock_select_color: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SELECT_COLOR"
		end

	gtk_stock_select_font: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SELECT_FONT"
		end

	gtk_stock_sort_ascending: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SORT_ASCENDING"
		end

	gtk_stock_sort_descending: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SORT_DESCENDING"
		end

	gtk_stock_spell_check: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_SPELL_CHECK"
		end

	gtk_stock_stop: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_STOP"
		end

	gtk_stock_strikethrough: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_STRIKETHROUGH"
		end

	gtk_stock_undelete: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_UNDELETE"
		end

	gtk_stock_underline: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_UNDERLINE"
		end

	gtk_stock_undo: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_UNDO"
		end

	gtk_stock_yes: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_YES"
		end

	gtk_stock_zoom_100: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ZOOM_100"
		end

	gtk_stock_zoom_fit: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ZOOM_FIT"
		end

	gtk_stock_zoom_in: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ZOOM_IN"
		end

	gtk_stock_zoom_out: POINTER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_STOCK_ZOOM_OUT"
		end
end
