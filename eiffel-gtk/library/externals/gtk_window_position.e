indexing
	description: "Various flags to influence window placement"
	copyright: "(C) 2005 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision "$REvision:$"


deferred class GTK_WINDOW_POSITION
feature 

	gtk_win_pos_none: INTEGER is
			-- No influence is made on placement.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_NONE"
		end

	gtk_win_pos_center: INTEGER is
			-- Windows should be placed in the center of the screen.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER"
		end

	gtk_win_pos_mouse: INTEGER is
			-- Windows should be placed at the current mouse position.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_MOUSE"
		end

	gtk_win_pos_center_always: INTEGER is
			-- Keep window centered as it changes size, etc.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER_ALWAYS"
		end

	gtk_win_pos_center_on_parent: INTEGER is
			-- Center the window on its transient parent (see gtk_window_set_transient_for(). 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_WIN_POS_CENTER_ON_PARENT"
		end

	is_valid_gtk_window_position (a_position: INTEGER): BOOLEAN is
			-- is `a_position' a valid gtk_window_position_flag?
		do
			Result:=((a_position = gtk_win_pos_none) or else
						(a_position = gtk_win_pos_center) or else
						(a_position = gtk_win_pos_mouse) or else
						(a_position = gtk_win_pos_center_always) or else
						(a_position = gtk_win_pos_center_on_parent))
		end

end

