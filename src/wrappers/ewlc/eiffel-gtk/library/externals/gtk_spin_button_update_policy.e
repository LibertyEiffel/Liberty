note
	description: "Enum GtkSpinButtonUpdatePolicy"
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

deferred class GTK_SPIN_BUTTON_UPDATE_POLICY

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_spin_button_update_policy (a_policy :INTEGER): BOOLEAN
		do
			Result:=((a_policy = gtk_update_always) or else
						(a_policy = gtk_update_if_valid))
		end

	gtk_update_always: INTEGER
			-- When refreshing your GtkSpinButton, the value is always displayed.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_ALWAYS"
		end

	gtk_update_if_valid: INTEGER
			-- When refreshing your GtkSpinButton, the value is only displayed if
			-- it is valid within the bounds of the spin button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_UPDATE_IF_VALID"
		end

end
