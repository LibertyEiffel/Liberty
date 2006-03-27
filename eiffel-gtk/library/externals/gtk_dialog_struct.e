indexing
	description: "External calls for GtkDialog struct"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_DIALOG_STRUCT
feature {NONE} -- External calls

	get_vbox (a_gtk_dialog: POINTER): POINTER is
		external "C struct GtkDialog get vbox use <gtk/gtk.h>"
		end
	
	get_action_area (a_gtk_dialog: POINTER): POINTER is
		external "C struct GtkDialog get action_area use <gtk/gtk.h>"
		end
end
