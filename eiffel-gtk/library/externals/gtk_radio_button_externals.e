indexing
	description: "External calls for GTK_RADIO_BUTTON"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_RADIO_BUTTON_EXTERNALS

feature {NONE} -- External calls

	gtk_radio_button_new (gslist_group: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_button_new_from_widget (gtkradiobutton_group: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_radio_button_new_with_label (gslist_group, a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_label_from_widget (gtkradiobutton_group, a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_mnemonic (gslist_group, a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_mnemonic_from_widget (gtkradiobutton_group, a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_set_group (a_radio_button, gslist_group: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_get_group (a_radio_button: POINTER): POINTER is -- GSList
		external "C use <gtk/gtk.h>"
		end
end
