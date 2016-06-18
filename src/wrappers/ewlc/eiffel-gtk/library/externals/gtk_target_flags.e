note
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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

deferred class GTK_TARGET_FLAGS
	-- The GtkTargetFlags enumeration is used to specify constraints on
	-- an entry in a GtkTargetTable.

inherit ANY undefine is_equal, copy end

feature {} --Gtk_Accel_Flags

	gtk_target_same_app: INTEGER
			-- If this is set, the target will only be selected for drags
			-- within a single application.

			-- 1 < < 0,    /*< nick=same-app >*/
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TARGET_SAME_APP"
		end

	gtk_target_same_widget: INTEGER
			-- If this is set, the target will only be selected for drags
			-- within a single widget.
				  
			-- 1 < < 1  /*< nick=same-widget >*/
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TARGET_SAME_WIDGET"
		end

end -- class GTK_TARGET_FLAGS
