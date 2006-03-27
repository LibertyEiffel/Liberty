indexing
	description: "External calls for GTK_HBOX_EXTERNALS"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_HBOX_EXTERNALS

feature {NONE} -- External calls
	gtk_hbox_new (homogeneous, spacing: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end

end
	
