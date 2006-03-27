indexing
	description:" enum GtkShadowType Used to change the appearance of an outline typically provided by a GtkFrame."

class GTK_SHADOW_TYPE

feature
	is_valid_shadow_type (a_shadow: INTEGER): BOOLEAN is
		do
			Result:=((a_shadow = gtk_shadow_none) or else
						(a_shadow = gtk_shadow_in) or else
						(a_shadow = gtk_shadow_out) or else
						(a_shadow = gtk_shadow_etched_in) or else
						(a_shadow = gtk_shadow_etched_out))
		end
	
	gtk_shadow_none: INTEGER is
			-- No outline.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_NONE"
		end
	
	gtk_shadow_in: INTEGER is
			-- 	The outline is bevelled inwards..
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_IN"
		end
	
	gtk_shadow_out: INTEGER is
			-- 	The outline is bevelled outwards like a button..
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_OUT"
		end
	
	gtk_shadow_etched_in: INTEGER is
			-- 	The outline itself is an inward bevel, but the frame does.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_ETCHED_IN"
		end
	
	gtk_shadow_etched_out: INTEGER is
			-- TODO
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SHADOW_ETCHED_OUT"
		end
end

