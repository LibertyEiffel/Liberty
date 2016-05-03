note
	description: "Enum GtkTextWindowType"
	copyright: "(C) 2006 Paolo Redaelli "
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_TEXT_WINDOW_TYPE

inherit ANY undefine is_equal, copy end

	-- enum GtkTextWindowType
	-- 
	-- typedef enum
	-- {
	--   GTK_TEXT_WINDOW_PRIVATE,
	--   GTK_TEXT_WINDOW_WIDGET,
	--   GTK_TEXT_WINDOW_TEXT,
	--   GTK_TEXT_WINDOW_LEFT,
	--   GTK_TEXT_WINDOW_RIGHT,
	--   GTK_TEXT_WINDOW_TOP,
	--   GTK_TEXT_WINDOW_BOTTOM
	-- } GtkTextWindowType;

feature {} -- enum

	is_valid_gtk_text_window_type (a_type :INTEGER): BOOLEAN is
		do
			Result:=((a_type = gtk_text_window_private) or else
						(a_type = gtk_text_window_widget) or else
						(a_type = gtk_text_window_text) or else
						(a_type = gtk_text_window_left) or else
						(a_type = gtk_text_window_right) or else
						(a_type = gtk_text_window_top) or else
						(a_type = gtk_text_window_bottom))
		end

	gtk_text_window_private : INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_PRIVATE"
		end

	gtk_text_window_widget: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_WIDGET"
		end

	gtk_text_window_text: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_TEXT"
		end

	gtk_text_window_left: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_LEFT"
		end

	gtk_text_window_right: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_RIGHT"
		end

	gtk_text_window_top: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_TOP"
		end

	gtk_text_window_bottom: INTEGER is
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TEXT_WINDOW_BOTTOM"
		end

end
