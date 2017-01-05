note
	description: "Enum GtkDialogFlags -- Flags used to influence dialog construction."
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

deferred class GTK_DIALOG_FLAGS

inherit ANY undefine is_equal, copy end

feature {} -- enum

	are_valid_dialog_flags (some_flags :INTEGER): BOOLEAN
		do
			Result:=(some_flags & (gtk_dialog_modal |
			                       gtk_dialog_destroy_with_parent |
			                       gtk_dialog_no_separator)).to_boolean
		end

	gtk_dialog_modal: INTEGER
			-- 	Make the constructed dialog modal
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_MODAL"
		end

	gtk_dialog_destroy_with_parent: INTEGER
			-- 	Destroy the dialog when its parent is destroyed
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_DESTROY_WITH_PARENT"
		end

	gtk_dialog_no_separator: INTEGER
			-- Don't put a separator between the action area and the
			-- dialog content.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_DIALOG_NO_SEPARATOR"
		end

end
