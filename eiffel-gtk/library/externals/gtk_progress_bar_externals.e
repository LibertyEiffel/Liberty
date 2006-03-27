class GTK_PROGRESS_BAR_EXTERNALS
feature {NONE} -- External calls
	gtk_progress_bar_new : POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_pulse (bar: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_text (bar: POINTER; text : POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_fraction (bar: POINTER; fraction: REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_set_pulse_step (bar : POINTER;fraction : REAL) is
		external "C use <gtk/gtk.h>"
		end

	gtk_progress_bar_get_text (bar : POINTER) : POINTER is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_progress_bar_get_fraction (bar : POINTER) : REAL is
		external "C use <gtk/gtk.h>"
		end
end
