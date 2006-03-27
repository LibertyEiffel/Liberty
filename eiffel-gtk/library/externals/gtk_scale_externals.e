indexing
	description: "External calls for GTK_RANGE"
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_RANGE_EXTERNALS
feature {NONE} -- External calls
	gtk_scale_set_digits            (a_scale: POINTER; some_digits: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_scale_set_draw_value (a_scale: POINTER; draw_value: INTEGER)  is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_scale_set_value_pos (a_scale: POINTER; a_gtk_position_type: INTEGER) is
		require is_valid_gtk_position_type (a_gtk_position_type)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_scale_get_digits (a_scale: POINTER): INTEGER  is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_scale_get_draw_value        (a_scale: POINTER): INTEGER  is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_scale_get_value_pos     (a_scale: POINTER): INTEGER  is
		external "C use <gtk/gtk.h>"
		ensure  is_valid_gtk_position_type (Result)
		end
	
	gtk_scale_get_layout           (a_scale: POINTER): POINTER  is
		external "C use <gtk/gtk.h>"
		end
		
	gtk_scale_get_layout_offsets    (a_scale,an_x,an_y: POINTER)  is
		external "C use <gtk/gtk.h>"
		end
		
end
