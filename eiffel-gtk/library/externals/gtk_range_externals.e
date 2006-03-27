indexing
	description: "External calls for GTK_RANGE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GKT_RANGE_EXTERNALS
feature {NONE} -- External calls
	gtk_range_get_adjustment (a_range: POINTER): POINTER is
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_update_policy (a_range: POINTER; a_gtkupdatetype: INTEGER) is
		require is_valid_gtk_update_type(a_gtkupdatetype)
		external "C use <gtk/gtk.h>"
		end

	gtk_range_set_adjustment (a_range, a_gtk_adjustment: POINTER) is
		external "C use <gtk/gtk.h>"
		end

	gtk_range_get_inverted (a_range: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		end

 gtk_range_set_inverted (a_range: POINTER; a_setting: INTEGER) is
		external "C use <gtk/gtk.h>"
		end

 gtk_range_get_update_policy (a_range: POINTER): INTEGER is
		external "C use <gtk/gtk.h>"
		ensure  is_valid_gtk_update_type(Result)
		end

  gtk_range_get_value (a_range: POINTER): REAL is
		external "C use <gtk/gtk.h>"
		end

 gtk_range_set_increments (a_range: POINTER; a_step, a_page: REAL) is
		external "C use <gtk/gtk.h>"
		end

 gtk_range_set_range (a_range: POINTER; a_min,a_max: DOUBLE) is
		external "C use <gtk/gtk.h>"
		end

 gtk_range_set_value (a_range: POINTER, gdouble value) is
		external "C use <gtk/gtk.h>"
		end
end
