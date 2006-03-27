deferred class GTK_FRAME_EXTERNALS
insert
	GTK_SHADOW_TYPE
feature {NONE} -- External calls
	gtk_frame_new (a_label: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label (frame, a_label: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label_widget (frame,label_widget: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_label_align (frame: POINTER; xalign, yalign: REAL) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_set_shadow_type (frame: POINTER; gtkshadowtype: INTEGER) is
		require is_valid_gtk_shadow_type (gtkshadowtype)
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label (frame: POINTER): POINTER is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label_align (frame, xalign, yalign: POINTER) is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_label_widget (frame: POINTER): POINTER is
		external "C use  <gtk/gtk.h>"
		end

	gtk_frame_get_shadow_type (frame: POINTER): INTEGER is
		external "C use  <gtk/gtk.h>"
		require is_valid_gtk_shadow_type (Result)
		end

end
