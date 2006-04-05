indexing
	description: "Enum GtkCellRendererMode"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_MODE
feature  -- enum
	is_valid_gtk_cell_renderer_mode (a_mode :INTEGER): BOOLEAN is
		do	
			Result:=((a_mode = gtk_cell_renderer_mode_inert) or else
						(a_mode = gtk_cell_renderer_mode_activatable) or else
						(a_mode = gtk_cell_renderer_mode_editable))
		end

	gtk_cell_renderer_mode_inert: INTEGER is
			-- The cell is just for display and cannot be interacted
			-- with. Note that this doesn't mean that eg. the row being
			-- drawn can't be selected, just that a particular element of
			-- it cannot be individually modified.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_INERT"
		end
	
	gtk_cell_renderer_mode_activatable: INTEGER is
			-- 	The cell can be clicked.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_ACTIVATABLE"
		end
	
	gtk_cell_renderer_mode_editable: INTEGER is
			-- 	The cell can be edited or otherwise modified.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_MODE_EDITABLE"
		end
end
