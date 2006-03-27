indexing
	description: "External calls for GtkAdjustment"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_ADJUSTMENT_EXTERNALS
feature {NONE} -- External calls
	gtk_adjustment_new (a_value, a_lower, an_upper, a_step_increment, a_page_increment, a_page_size: REAL): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_get_value (an_adjustment: POINTER): REAL is
		external "C use <gtk/gtk.h>"
		end

	gtk_adjustment_set_value (an_adjustment: POINTER; a_value: REAL) is
		external "C use <gtk/gtk.h>"
		end
			
	gtk_adjustment_clamp_page (an_adjustment: POINTER; a_lower, an_upper: REAL) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_adjustment_changed (an_adjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_adjustment_value_changed (an_adjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end
end
