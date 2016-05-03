note
	description: "External calls for GTK_PRINT_OPERATION_PREVIEW"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PRINT_OPERATION_PREVIEW_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls
	gtk_print_operation_preview_end_preview (a_preview: POINTER) is
			-- void gtk_print_operation_preview_end_preview (GtkPrintOperationPreview *preview);
		external "C use <gtk/gtk.h>"
		end
	
	gtk_print_operation_preview_is_selected (a_preview: POINTER; a_page_nr: INTEGER): INTEGER is
			-- gboolean gtk_print_operation_preview_is_selected (GtkPrintOperationPreview *preview, gint page_nr);
		external "C use <gtk/gtk.h>"
		end

	gtk_print_operation_preview_render_page (a_preview: POINTER; a_page_nr: INTEGER) is
			-- void gtk_print_operation_preview_render_page (GtkPrintOperationPreview *preview, gint page_nr);
		external "C use <gtk/gtk.h>"
		end

end
