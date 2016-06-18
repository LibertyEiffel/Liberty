note
	description: "External calls for GTK_PAGE_SETUP"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_PAGE_SETUP_EXTERNALS

inherit ANY undefine is_equal, copy end

insert 
	GTK_PAGE_ORIENTATION
	GTK_UNIT

feature {} -- External calls
	gtk_page_setup_new: POINTER
			-- GtkPageSetup* gtk_page_setup_new (void);
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_copy (a_other: POINTER): POINTER
			-- GtkPageSetup* gtk_page_setup_copy (GtkPageSetup *other);
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_orientation(a_setup: POINTER): INTEGER
			-- GtkPageOrientation gtk_page_setup_get_orientation(GtkPageSetup *setup);
		external "C use <gtk/gtk.h>"
		ensure valid_result: is_valid_gtk_page_orientation(Result)
		end

	gtk_page_setup_set_orientation (a_setup: POINTER; an_orientation: INTEGER)
			-- void gtk_page_setup_set_orientation (GtkPageSetup *setup,
			-- GtkPageOrientation orientation);
		require valid_result: is_valid_gtk_page_orientation(an_orientation)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_paper_size (a_setup: POINTER): POINTER
			-- GtkPaperSize* gtk_page_setup_get_paper_size (GtkPageSetup
			-- *setup);
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_set_paper_size (a_setup, a_size: POINTER)
			-- void gtk_page_setup_set_paper_size (GtkPageSetup *setup,
			-- GtkPaperSize *size);
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_top_margin (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_top_margin (GtkPageSetup *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_set_top_margin (a_setup: POINTER; a_margin: REAL; a_unit: INTEGER)
			-- void gtk_page_setup_set_top_margin (GtkPageSetup *setup,
			-- gdouble margin, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_bottom_margin(a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_bottom_margin(GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_set_bottom_margin(a_setup: POINTER; margin: REAL; a_unit: INTEGER)
			-- void gtk_page_setup_set_bottom_margin(GtkPageSetup *setup,
			-- gdouble margin, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_left_margin (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_left_margin (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_set_left_margin (a_setup: POINTER; a_margin: REAL; a_unit: INTEGER)
			-- void gtk_page_setup_set_left_margin (GtkPageSetup *setup,
			-- gdouble margin, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_right_margin (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_right_margin (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_set_right_margin (a_setup: POINTER; a_margin: REAL; a_unit: INTEGER)
			-- void gtk_page_setup_set_right_margin (GtkPageSetup *setup,
			-- gdouble margin, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_page_setup_set_paper_size_and_default_margins (a_setup, a_size: POINTER)
			-- void gtk_page_setup_set_paper_size_and_default_margins
			-- (GtkPageSetup *setup, GtkPaperSize *size);
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_paper_width (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_paper_width (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_paper_height (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_paper_height (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

	gtk_page_setup_get_page_width (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_page_width (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_page_setup_get_page_height (a_setup: POINTER; a_unit: INTEGER): REAL
			-- gdouble gtk_page_setup_get_page_height (GtkPageSetup
			-- *setup, GtkUnit unit);
		require valid_unit: is_valid_gtk_unit(a_unit)
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkPageSetup)"
		end
end
