indexing
	description: "External calls for GTK_VSCALE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_VSCALE_EXTERNALS
feature {NONE} -- External calls
	gtk_vscale_new (an_adjustment: POINTER): POINTER is
		external "C use  <gtk/gtk.h>"
		end
	gtk_vscale_new_with_range (a_min, a_max, a_step: REAL): POINTER is
		external "C use  <gtk/gtk.h>"
		end
end

