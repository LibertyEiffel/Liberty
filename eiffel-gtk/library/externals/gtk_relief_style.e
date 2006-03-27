indexing
	description: "enum GtkReliefStyle indicates the relief to be drawn around a GtkButton."
	
deferred class GTK_RELIEF_STYLE
feature -- enum
	is_valid_gtk_relief_style (a_style: INTEGER): BOOLEAN is
		do
			Result:=((a_style=gtk_relief_normal) or else
						(a_style=gtk_relief_half) or else
						(a_style=gtk_relief_none))
		end
	
	gtk_relief_normal: INTEGER is
			-- Draw a normal relief.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RELIEF_NORMAL"
		end
	
	gtk_relief_half: INTEGER is
			-- A half relief.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RELIEF_HALF"
		end

	gtk_relief_none: INTEGER is
			-- No relief.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_RELIEF_NONE"
		end
end
