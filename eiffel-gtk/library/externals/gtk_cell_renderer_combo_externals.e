indexing
	description: "External calls for GTK_CELL_RENDERER_COMBO"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_COMBO_EXTERNALS
feature {NONE} -- External calls
	gtk_cell_renderer_combo_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
end
