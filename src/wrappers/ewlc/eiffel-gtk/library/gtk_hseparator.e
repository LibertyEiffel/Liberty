note
	description: "A horizontal separator."
	copyright: "[
					Copyright (C) 2007-2017: Paolo Redaelli, GTK+ team
					
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

	wrapped_version: "2.10.6"

class GTK_HSEPARATOR
	-- The GtkHSeparator widget is a horizontal separator, used to
	-- group the widgets within a window. It displays a horizontal line
	-- with a shadow to make it appear sunken into the interface.

	-- Note: The GtkHSeparator widget is not used as a separator within
	-- menus. To create a separator in a menu create an empty
	-- GTK_SEPARATOR_MENU_ITEM widget and add it to the menu with
	-- GTK_MENU_SHELL.`append'.

inherit GTK_SEPARATOR
	--   GtkHSeparator implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkHSeparator.
		do
			from_external_pointer(gtk_hseparator_new)
		end
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkHseparator)"
		end

feature {} -- External calls
	gtk_hseparator_new: POINTER
			-- GtkWidget* gtk_hseparator_new (void);
		external "C use <gtk/gtk.h>"
		end
end -- class GTK_HSEPARATOR
