note
	description: "External calls for GTK_RADIO_BUTTON"
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_RADIO_BUTTON_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_radio_button_new (gslist_group: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_from_widget (gtkradiobutton_group: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_label (gslist_group, a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_label_from_widget (gtkradiobutton_group, a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_mnemonic (gslist_group, a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_new_with_mnemonic_from_widget (gtkradiobutton_group, a_label: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_set_group (a_radio_button, gslist_group: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_button_get_group (a_radio_button: POINTER): POINTER is -- GSList
		external "C use <gtk/gtk.h>"
		end

end
