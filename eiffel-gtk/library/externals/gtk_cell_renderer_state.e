indexing
	description: "Enum GtkCellRendererState"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_STATE
feature  -- enum
	is_valid_gtk_cell_renderer_state (a_state :INTEGER): BOOLEAN is
		do	
			Result:=((a_state = gtk_cell_renderer_selected) or else
						(a_state = gtk_cell_renderer_prelit) or else
						(a_state = gtk_cell_renderer_insensitive) or else
						-- this flag means the cell is in the sort
						-- column/row
						(a_state = gtk_cell_renderer_sorted) or else
						(a_state = gtk_cell_renderer_focused))
		end

	gtk_cell_renderer_selected: INTEGER is
			-- 	The cell is currently selected, and probably has a selection colored background to render to.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_SELECTED"
		end
	
	gtk_cell_renderer_prelit: INTEGER is
			-- 	The mouse is hovering over the cell.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_PRELIT"
		end
	
	gtk_cell_renderer_insensitive: INTEGER is
			-- 	The cell is drawn in an insensitive manner
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_INSENSITIVE"
		end
	
	gtk_cell_renderer_sorted: INTEGER is
			-- 	The cell is in a sorted row
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_SORTED"
		end

	gtk_cell_renderer_focused: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_CELL_RENDERER_FOCUSED"
		end
end

