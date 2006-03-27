indexing
	description: "Enum GtkDialogFlags -- Flags used to influence dialog construction."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_DIALOG_FLAGS
feature  -- enum
	are_valid_gtk_dialog_flags (some_flags :INTEGER): BOOLEAN is
		do	
			Result:=(some_flags & (gtk_dialog_modal |
										  gtk_dialog_destroy_with_parent |
										  gtk_dialog_no_separator)).to_boolean
		end

	gtk_dialog_modal: INTEGER is
			-- 	Make the constructed dialog modal
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_MODAL"
		end
	
	gtk_dialog_destroy_with_parent: INTEGER is
			-- 	Destroy the dialog when its parent is destroyed
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_DESTROY_WITH_PARENT"
		end

	gtk_dialog_no_separator: INTEGER is
			-- Don't put a separator between the action area and the
			-- dialog content.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_NO_SEPARATOR"
		end
end

