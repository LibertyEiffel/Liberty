note
	description: "Enum enum GtkToolbarStyle"
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

deferred class
	GTK_TOOLBAR_STYLE
	-- Used to customize the appearance of a GtkToolbar. Note that
	-- setting the toolbar style overrides the user's preferences for
	-- the default toolbar style. Note that if the button has only a
	-- label set and GTK_TOOLBAR_ICONS is used, the label will be
	-- visible, and vice versa.

inherit ANY undefine is_equal, copy end

feature {} -- enum
	-- Used to customize the appearance of a GtkToolbar. Note that
	-- setting the toolbar style overrides the user's preferences for
	-- the default toolbar style. Note that if the button has only a
	-- label set and `gtk_toolbar_icons' is used, the label will be
	-- visible, and vice versa.

	is_valid_gtk_toolbar_style (a_style :INTEGER): BOOLEAN
		do
			Result:=((a_style = gtk_toolbar_icons) or else
						(a_style = gtk_toolbar_text) or else
						(a_style = gtk_toolbar_both) or else
						(a_style = gtk_toolbar_both_horiz))
		end

	gtk_toolbar_icons: INTEGER
			-- Buttons display only icons in the toolbar.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TOOLBAR_ICONS"
		end

	gtk_toolbar_text: INTEGER
			-- Buttons display only text labels in the toolbar.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TOOLBAR_TEXT"
		end

	gtk_toolbar_both: INTEGER
			-- Buttons display text and icons in the toolbar.
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TOOLBAR_BOTH"
		end

	gtk_toolbar_both_horiz: INTEGER
			-- Buttons display icons and text alongside each other, rather than vertically stacked
		external "C macro use <gtk/gtk.h>"
		alias "GTK_TOOLBAR_BOTH_HORIZ"
		end

end
