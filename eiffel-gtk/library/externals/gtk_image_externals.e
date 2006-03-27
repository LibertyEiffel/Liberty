class GTK_IMAGE_EXTERNALS
feature {NONE} -- External calls
	gtk_image_new : POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_image_new_from_file (filename: POINTER) : POINTER  is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_image_set_from_file (image: POINTER;filename: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_image_get_pixel_size (image: POINTER) : INTEGER is
		external "C use <gtk/gtk.h>"
		end

	gtk_image_set_pixel_size (image: POINTER;a_pixel_size : INTEGER) is
		external "C use <gtk/gtk.h>"
		end
end
