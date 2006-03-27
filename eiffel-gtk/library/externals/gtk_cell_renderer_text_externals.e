indexing
	description: "External calls for GTK_CELL_RENDERER_TEXT"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_RENDERER_TEXT_EXTERNALS
feature {NONE} -- External calls
	gtk_cell_renderer_text_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_renderer_text_set_fixed_height_from_font (gtkcellrenderertext: POINTER;
																		number_of_rows: INTEGER)  is
		external "C use <gtk/gtk.h>"
		end
end
