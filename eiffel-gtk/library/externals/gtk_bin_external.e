indexing
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"

deferred class GTK_BIN_EXTERNAL

feature {NONE} -- External calls

	gtk_bin_get_child (a_bin: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end
end
