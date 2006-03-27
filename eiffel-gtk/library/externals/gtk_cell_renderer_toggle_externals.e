indexing
	description: "External calls for GTK_CELL_RENDERER_TOGGLE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_TOGGLE_EXTERNALS
feature {NONE} -- External calls
	gtk_cell_renderer_toggle_new: POINTER is
		external "C use <gtk/gtk.h>"
		end
	gtk_cell_renderer_toggle_get_radio (a_toggle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_toggle_set_radio (a_toggle: POINTER; a_boolean: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_toggle_get_active (a_toggle: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_toggle_set_active (a_toggle: POINTER; a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
