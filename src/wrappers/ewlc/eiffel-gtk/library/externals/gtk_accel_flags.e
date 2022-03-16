note
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
	revision "$REvision:$"

deferred class GTK_ACCEL_FLAGS

inherit
	ANY undefine is_equal, copy end

feature {} -- Enum

	gtk_accel_visible: INTEGER is -- = 1 << 0,	/* display in Gtk_Accel_Label? */
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_VISIBLE"
		end

	gtk_accel_locked: INTEGER is -- = 1 << 1,	/* is it removable? */
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_LOCKED"
		end

	gtk_accel_mask: INTEGER is -- = 0x07
		external "C use <gtk/gtk.h>"
		alias "GTK_ACCEL_MASK"
		end

end -- class GTK_ACCEL_FLAGS
