indexing
	description: "External calls for GTK_CHECK_BUTTON"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CHECK_BUTTON_EXTERNALS

feature {NONE} -- External calls

	gtk_check_button_new: POINTER		is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_check_button_new_with_label (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_check_button_new_with_mnemonic (a_label: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
end

