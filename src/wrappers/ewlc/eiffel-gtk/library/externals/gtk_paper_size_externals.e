note
	description: "External calls for "
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PAPER_SIZE_EXTERNALS

inherit ANY undefine is_equal, copy end
insert GTK_UNIT
feature {} -- External calls
	gtk_paper_size_new  (a_name: POINTER): POINTER is
			-- GtkPaperSize* gtk_paper_size_new  (const gchar *name);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_new_from_ppd  (a_ppd_name, a_ppd_display_name: POINTER; a_width, an_height: REAL): POINTER is
			-- GtkPaperSize* gtk_paper_size_new_from_ppd (const gchar
			-- *ppd_name, const gchar *ppd_display_name, gdouble width,
			-- gdouble height);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_new_custom (a_name, a_display_name: POINTER; a_width, an_height: REAL; a_unit: INTEGER): POINTER is
			-- GtkPaperSize* gtk_paper_size_new_custom (const gchar
			-- *name, const gchar *display_name, gdouble width, gdouble
			-- height, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end

	gtk_paper_size_copy  (another: POINTER): POINTER is
			-- GtkPaperSize* gtk_paper_size_copy  (GtkPaperSize *other);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_free  (a_size: POINTER) is
			-- void  gtk_paper_size_free  (GtkPaperSize *size);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_is_equal  (a_size, another: POINTER): INTEGER is
			-- gboolean gtk_paper_size_is_equal (GtkPaperSize *size1,
			-- GtkPaperSize *size2);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_name  (a_size: POINTER): POINTER is
 -- const gchar* gtk_paper_size_get_name  (GtkPaperSize *size);
 external "C  use <gtk/gtk.h>"
 end

	gtk_paper_size_get_display_name (a_size: POINTER): POINTER is
			-- const gchar* gtk_paper_size_get_display_name(GtkPaperSize *size);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_ppd_name  (a_size: POINTER): POINTER is
			-- const gchar* gtk_paper_size_get_ppd_name  (GtkPaperSize *size);
		external "C  use <gtk/gtk.h>"
		end

	gtk_paper_size_get_width  (a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_width (GtkPaperSize *size,
			-- GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_height  (a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_height (GtkPaperSize *size,
			-- GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_is_custom  (a_size: POINTER): INTEGER is
			-- gboolean  gtk_paper_size_is_custom  (GtkPaperSize *size);
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_set_size (a_size: POINTER; a_width, a_height: REAL; a_unit: INTEGER) is
			-- void gtk_paper_size_set_size (GtkPaperSize *size, gdouble
			-- width, gdouble height, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_default_top_margin(a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_default_top_margin(GtkPaperSize
			-- *size, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_default_bottom_margin(a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_default_bottom_margin
			-- (GtkPaperSize *size, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_default_left_margin(a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_default_left_margin
			-- (GtkPaperSize *size, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
	gtk_paper_size_get_default_right_margin(a_size: POINTER; a_unit: INTEGER): REAL is
			-- gdouble gtk_paper_size_get_default_right_margin
			-- (GtkPaperSize *size, GtkUnit unit);
		require is_valid_gtk_unit(a_unit)
		external "C  use <gtk/gtk.h>"
		end
	
feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPaperSize)"
		end
end
