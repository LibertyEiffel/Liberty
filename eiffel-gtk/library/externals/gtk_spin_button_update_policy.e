indexing
	description: "Enum GtkSpinButtonUpdatePolicy"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_SPIN_BUTTON_UPDATE_POLICY
feature  -- enum
	is_valid_gtk_spin_button_update_policy (a_policy :INTEGER): BOOLEAN is
		do	
			Result:=((a_policy = gtk_update_always) or else
						(a_policy = gtk_update_if_valid))
		end

	gtk_update_always: INTEGER is
			-- When refreshing your GtkSpinButton, the value is always displayed.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_ALWAYS"
		end
	
	gtk_update_if_valid: INTEGER is
			-- When refreshing your GtkSpinButton, the value is only displayed if
			-- it is valid within the bounds of the spin button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_IF_VALID"
		end
end

