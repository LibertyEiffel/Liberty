deferred class GTK_ADJUSTMENT_STRUCT
feature -- struct access
	get_lower (an_adjustment: POINTER): REAL is
			-- 	the minimum value.
		external "C struct GtkAdjustment get lower use <gtk/gtk.h>"
		end
	
	get_upper (an_adjustment: POINTER): REAL is
			-- 	the maximum value.
		external "C struct GtkAdjustment get upper use <gtk/gtk.h>"
		end
	
	get_value (an_adjustment: POINTER): REAL is
			-- 	the current value.
		external "C struct GtkAdjustment get value use <gtk/gtk.h>"
		end
	
	get_step_increment (an_adjustment: POINTER): REAL is
			-- the increment to use to make minor changes to the
			-- value. In a GtkScrollbar this increment is used when the
			-- mouse is clicked on the arrows at the top and bottom of
			-- the scrollbar, to scroll by a small amount.
		external "C struct GtkAdjustment get step_increment use <gtk/gtk.h>"
		end
	
	get_page_increment (an_adjustment: POINTER): REAL is
			-- the increment to use to make major changes to the
			-- value. In a GtkScrollbar this increment is used when the
			-- mouse is clicked in the trough, to scroll by a large
			-- amount.
		external "C struct GtkAdjustment get page_increment use <gtk/gtk.h>"
		end

	get_page_size (an_adjustment: POINTER): REAL is
			-- the page size. In a GtkScrollbar this is the size of the
			-- area which is currently visible.
		external "C struct GtkAdjustment get page_size use <gtk/gtk.h>"
		end
end


