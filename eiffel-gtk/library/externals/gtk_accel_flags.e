indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

class GTK_ACCEL_FLAGS

feature {NONE} --Gtk_Accel_Flags

	gtk_accel_visible: INTEGER is -- = 1 << 0,	/* display in Gtk_Accel_Label? */
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_VISIBLE"
		end

	gtk_accel_locked: INTEGER is -- = 1 << 1,	/* is it removable? */
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_LOCKED"
		end

	gtk_accel_mask: INTEGER is -- = 0x07
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_MASK"
		end

end -- class GTK_ACCEL_FLAGS
