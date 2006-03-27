indexing
	description: "Enum GtkJustification Used for justifying the text inside a GtkLabel widget. (See also GtkAlignment)."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_JUSTIFICATION
feature  -- enum
	is_valid_gtk_justification (a_justification :INTEGER): BOOLEAN is
		do	
			Result:=((a_justification= gtk_justify_left) or else
						(a_justification= gtk_justify_right) or else
						(a_justification= gtk_justify_center) or else
						(a_justification= gtk_justify_fill))
		end

	gtk_justify_left: INTEGER is
			-- 	The text is placed at the left edge of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_LEFT"
		end
	
	gtk_justify_right: INTEGER is
			-- 	The text is placed at the right edge of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_RIGHT"
		end
	
	gtk_justify_center: INTEGER is
			-- 	The text is placed in the center of the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_CENTER"
		end
	
	gtk_justify_fill: INTEGER is
			-- 	The text is distributed across the label.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_JUSTIFY_FILL"
		end
	
end
