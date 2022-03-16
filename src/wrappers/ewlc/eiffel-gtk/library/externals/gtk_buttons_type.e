note
	description: "enum GtkButtonsType -- Prebuilt sets of buttons for the dialog. If none of these choices are appropriate, simply use GTK_BUTTONS_NONE then call gtk_dialog_add_buttons()."
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
					This library is free software; you can redistribute it and/or
					modify it under the terms of the GNU Lesser General Public License
					as published by the Free Software Foundation; either version 2.1 of
					the License, or (at your option) any later version.
					
					This library is distributed in the hope that it will be useful, but
					WITHOUT ANY WARRANTY; without even the implied warranty of
					MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
					Lesser General Public License for more details.

					You should have received a copy of the GNU Lesser General Public
					License along with this library; if not, write to the Free Software
					Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
					02110-1301 USA
				]"
	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_BUTTONS_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_buttons_type (a_gtk_buttons_type :INTEGER): BOOLEAN
		do
			Result:=((a_gtk_buttons_type = gtk_buttons_none) or else
						(a_gtk_buttons_type = gtk_buttons_ok) or else
						(a_gtk_buttons_type = gtk_buttons_close) or else
						(a_gtk_buttons_type = gtk_buttons_cancel) or else
						(a_gtk_buttons_type = gtk_buttons_yes_no) or else
						(a_gtk_buttons_type = gtk_buttons_ok_cancel))
		end

	gtk_buttons_none: INTEGER
			-- 	no buttons at all 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_NONE"
		end

	gtk_buttons_ok: INTEGER
			-- 	an OK button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_OK"
		end

	gtk_buttons_close: INTEGER
			-- 	a Close button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_CLOSE"
		end

	gtk_buttons_cancel: INTEGER
			-- 	a Cancel button 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_CANCEL"
		end

	gtk_buttons_yes_no: INTEGER
			-- 	Yes and No buttons 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_YES_NO"
		end

	gtk_buttons_ok_cancel: INTEGER
			-- 	OK and Cancel buttons 
		external "C macro use <gtk/gtk.h>"
		alias "GTK_BUTTONS_OK_CANCEL"
		end

end
