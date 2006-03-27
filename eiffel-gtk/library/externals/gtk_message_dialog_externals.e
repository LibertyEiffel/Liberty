indexing
	description: "External calls for GTK_DIALOG_MESSAGE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_MESSAGE_DIALOG_EXTERNALS
insert
	GTK_DIALOG_FLAGS
	GTK_MESSAGE_TYPE
	GTK_BUTTONS_TYPE
	
feature {NONE} -- External calls

	gtk_message_dialog_new (a_parent: POINTER;
									some_gtkdialogflags, a_gtkmessagetype, a_gtkbuttonstype: INTEGER;
									a_message_format: POINTER): POINTER is
		require
			valid_dialog_flags: are_valid_gtk_dialog_flags (some_gtkdialogflags)
			valid_message_type: is_valid_gtk_message_type (a_gtkmessagetype)
			valid_buttons_type: is_valid_gtk_buttons_type (a_gtkbuttonstype)
		external "C use  <gtk/gtk.h>"
		end
	
	gtk_message_dialog_new_with_markup (a_parent: POINTER; some_gtkdialogflags, a_gtkmessagetype, a_gtkbuttonstype: INTEGER; a_message_format: POINTER): POINTER is 
		require
			valid_dialog_flags: are_valid_gtk_dialog_flags (some_gtkdialogflags)
			valid_message_type: is_valid_gtk_message_type (a_gtkmessagetype)
			valid_buttons_type: is_valid_gtk_buttons_type (a_gtkbuttonstype)
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_set_markup (a_message_dialog, a_string: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_format_secondary_text (a_message_dialog, a_message_format: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_message_dialog_format_secondary_markup (a_message_dialog, a_message_format: POINTER) is
		external "C use  <gtk/gtk.h>"
		end
end
