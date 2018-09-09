note
	description: "Enum  GtkSpinType"
	copyright: "[
					Copyright (C) 2006-2018: eiffel-libraries team, GTK+ team
				
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

deferred class  GTK_SPIN_TYPE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_spin_type (a_spin_type :INTEGER): BOOLEAN
		do
			Result := ((a_spin_type = gtk_spin_step_forward) or else
						  (a_spin_type = gtk_spin_step_backward) or else
						  (a_spin_type = gtk_spin_page_forward) or else
						  (a_spin_type = gtk_spin_page_backward) or else
						  (a_spin_type = gtk_spin_home) or else
						  (a_spin_type = gtk_spin_end) or else
						  (a_spin_type = gtk_spin_user_defined))
		end

	gtk_spin_step_forward: INTEGER
			-- These values spin a GtkSpinButton by the relevant values of the spin button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_STEP_FORWARD"
		end

	gtk_spin_step_backward: INTEGER
			-- These values spin a GtkSpinButton by the relevant values of the spin
			-- button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_STEP_BACKWARD"
		end

	gtk_spin_page_forward: INTEGER
			-- These values spin a GtkSpinButton by the relevant values of the spin
			-- button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_PAGE_FORWARD"
		end

	gtk_spin_page_backward: INTEGER
			-- These values spin a GtkSpinButton by the relevant values of the spin
			-- button's GtkAdjustment.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_PAGE_BACKWARD"
		end

	gtk_spin_home: INTEGER
			-- These set the spin button's value to the minimum or maxmimum
			-- possible values, (set by its GtkAdjustment), respectively.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_HOME"
		end

	gtk_spin_end: INTEGER
			-- These set the spin button's value to the minimum or maxmimum possible values, (set by its GtkAdjustment), respectively.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_END"
		end

	gtk_spin_user_defined: INTEGER
			-- The programmer must specify the exact amount to spin the GtkSpinButton.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SPIN_USER_DEFINED"
		end
end
