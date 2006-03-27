indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_WINDOW_TYPE
feature
	gtk_window_toplevel:INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WINDOW_TOPLEVEL"
		end
	
	gtk_window_popup: INTEGER is
		external "C use <gtk/gtk.h>"
		alias "GTK_WINDOW_POPUP"
		end
end
