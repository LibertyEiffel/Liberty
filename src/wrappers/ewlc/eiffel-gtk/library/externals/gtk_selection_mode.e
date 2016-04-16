note
	description: "Enum  GtkSelectionMode Used to control what selections users are allowed to make."
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
	revision: "$Revision:$"

deferred class GTK_SELECTION_MODE

inherit ANY undefine is_equal, copy end

feature {} -- enum

	is_valid_gtk_selection_mode (a_mode: INTEGER): BOOLEAN is
		do
			Result:=((a_mode = gtk_selection_none) or else
						(a_mode = gtk_selection_single) or else
						(a_mode = gtk_selection_browse) or else
						(a_mode = gtk_selection_multiple))
		end

	gtk_selection_none: INTEGER is
			-- 	No selection is possible.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_NONE"
		end

	gtk_selection_single: INTEGER is
			-- 	Zero or one element may be selected.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_SINGLE"
		end

	gtk_selection_browse: INTEGER is
			-- Exactly one element is selected. In some circumstances,
			-- such as initially or during a search operation, it's
			-- possible for no element to be selected with
			-- GTK_SELECTION_BROWSE. What is really enforced is that the
			-- user can't deselect a currently selected element except by
			-- selecting another element.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_BROWSE"
		end

	gtk_selection_multiple: INTEGER is
			-- Any number of elements may be selected. Clicks toggle the
			-- state of an item. Any number of elements may be
			-- selected. The Ctrl key may be used to enlarge the
			-- selection, and Shift key to select between the focus and
			-- the child pointed to. Some widgets may also allow
			-- Click-drag to select a range of elements.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_SELECTION_MULTIPLE"
		end

end
