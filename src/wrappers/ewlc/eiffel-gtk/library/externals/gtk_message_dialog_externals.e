note
	description: "External calls for GTK_DIALOG_MESSAGE"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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
	revision: "$Revision:$"

deferred class GTK_MESSAGE_DIALOG_EXTERNALS

inherit ANY undefine is_equal, copy end

insert
	GTK_DIALOG_FLAGS
	GTK_MESSAGE_TYPE
	GTK_BUTTONS_TYPE

feature {} -- External calls

	gtk_message_dialog_new (a_parent: POINTER;
							some_gtkdialogflags, a_gtkmessagetype, a_gtkbuttonstype: INTEGER;
							a_message_format: POINTER): POINTER
		require
			valid_dialog_flags: are_valid_dialog_flags (some_gtkdialogflags)
			valid_message_type: is_valid_gtk_message_type (a_gtkmessagetype)
			valid_buttons_type: is_valid_gtk_buttons_type (a_gtkbuttonstype)
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_new_with_markup (a_parent: POINTER; some_gtkdialogflags, a_gtkmessagetype, a_gtkbuttonstype: INTEGER; a_message_format: POINTER): POINTER
		require
			valid_dialog_flags: are_valid_dialog_flags (some_gtkdialogflags)
			valid_message_type: is_valid_gtk_message_type (a_gtkmessagetype)
			valid_buttons_type: is_valid_gtk_buttons_type (a_gtkbuttonstype)
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_set_markup (a_message_dialog, a_string: POINTER)
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_format_secondary_text (a_message_dialog, a_message_format: POINTER)
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_format_secondary_markup (a_message_dialog, a_message_format: POINTER)
		external "C use  <gtk/gtk.h>"
		end
end
