indexing
	description: "enum GtkButtonsType -- Prebuilt sets of buttons for the dialog. If none of these choices are appropriate, simply use GTK_BUTTONS_NONE then call gtk_dialog_add_buttons()."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BUTTONS_TYPE
feature  -- enum
	is_valid_gtk_buttons_type (a_gtk_buttons_type :INTEGER): BOOLEAN is
		do	
			Result:=((a_gtk_buttons_type = gtk_buttons_none) or else
						(a_gtk_buttons_type = gtk_buttons_ok) or else
						(a_gtk_buttons_type = gtk_buttons_close) or else
						(a_gtk_buttons_type = gtk_buttons_cancel) or else
						(a_gtk_buttons_type = gtk_buttons_yes_no) or else
						(a_gtk_buttons_type = gtk_buttons_ok_cancel))
		end

	gtk_buttons_none: INTEGER is 
			-- 	no buttons at all 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_NONE"
		end

	gtk_buttons_ok: INTEGER is 
			-- 	an OK button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_OK"
		end

	gtk_buttons_close: INTEGER is 
			-- 	a Close button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_CLOSE"
		end

	gtk_buttons_cancel: INTEGER is 
			-- 	a Cancel button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_CANCEL"
		end

	gtk_buttons_yes_no: INTEGER is 
			-- 	Yes and No buttons 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_YES_NO"
		end

	gtk_buttons_ok_cancel: INTEGER is 
			-- 	OK and Cancel buttons 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_OK_CANCEL"
		end
end
