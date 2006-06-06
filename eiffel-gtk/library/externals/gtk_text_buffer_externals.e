deferred class GTK_TEXT_BUFFER_EXTERNALS

feature {NONE}

	gtk_text_buffer_new(dummy_table: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_set_text(handle, text: POINTER; len: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_text_buffer_get_text(handle, start, finish: POINTER; hidden: INTEGER): POINTER is
		external "C use <gtk/gtk.h>"
		end

end -- class GTK_TEXT_BUFFER_EXTERNALS
