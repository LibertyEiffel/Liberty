indexing
	description: "enum GtkPositionType Describes which edge of a widget a certain feature is positioned at, e.g. the tabs of a GtkNotebook, the handle of a GtkHandleBox or the label of a GtkScale."

deferred class  GTK_POSITION_TYPE
feature
	is_valid_gtk_position_type (a_position: INTEGER): BOOLEAN is
		do
			Result := ((a_position=gtk_pos_left) or else
						  (a_position=gtk_pos_right) or else
						  (a_position=gtk_pos_top) or else
						  (a_position=gtk_pos_bottom))
		end

	gtk_pos_left: INTEGER is
			-- 	The feature is at the left edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_LEFT"
		end

	gtk_pos_right: INTEGER is
			-- 	The feature is at the right edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_RIGHT"
		end

	gtk_pos_top: INTEGER is
			-- 	The feature is at the top edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_TOP"
		end

	gtk_pos_bottom: INTEGER is
			-- 	The feature is at the bottom edge.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_POS_BOTTOM"
		end
end

