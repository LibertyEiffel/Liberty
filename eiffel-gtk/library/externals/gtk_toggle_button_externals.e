indexing
	description: "External calls for GTK_TOGGLE_BUTTON"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TOGGLE_BUTTON_EXTERNALS

feature {NONE} -- External calls
	
	gtk_toggle_button_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_toggle_button_new_with_label (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_new_with_mnemonic (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_set_mode (a_toggle_button: POINTER; a_draw_indicator: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_get_mode (a_toggle_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_toggled (a_toggle_button: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_get_active    (a_toggle_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_toggle_button_set_active    (a_toggle_button: POINTER; active: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_get_inconsistent (a_toggle_button: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_toggle_button_set_inconsistent (a_toggle_button: POINTER; a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
