deferred class GTK_TEXT_VIEW_EXTERNALS

feature {NONE}

	gtk_text_view_new: POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_new_with_buffer(buff: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_set_buffer (handle, buff: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_view_get_buffer (handle: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TEXT_VIEW_EXTERNALS
