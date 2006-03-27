indexing
	description: "External calls for GTK_EDITABLE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_EDITABLE_EXTERNALS

feature {NONE} -- External calls
	gtk_editable_select_region      (an_editable: POINTER; a_start,an_end: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_editable_get_selection_bounds (an_editable, a_start, an_end: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_insert_text (an_editable, a_new_text: POINTER;new_text_length: INTEGER; a_position: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_delete_text        (an_editable: POINTER; a_start_pos, a_end_pos: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_chars          (an_editable: POINTER; a_start_pos, a_end_pos: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_cut_clipboard      (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_copy_clipboard     (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_paste_clipboard    (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_editable_delete_selection   (an_editable: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_set_position       (an_editable: POINTER;a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_position       (an_editable: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_set_editable       (an_editable: POINTER; editable: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_editable_get_editable       (an_editable: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end
end
