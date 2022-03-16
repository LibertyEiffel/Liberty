note
	description: "GtkSeparatorMenuItem -- A separator used in menus."
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

class GTK_SEPARATOR_MENU_ITEM
	-- The GtkSeparatorMenuItem is a separator used to group items
	-- within a menu. It displays a horizontal line with a shadow to
	-- make it appear sunken into the interface.
	
inherit 
	GTK_MENU_ITEM 
		redefine 
			make, struct_size
		end
	
	-- TODO: GtkSeparatorMenuItem implements AtkImplementorIface.	
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkSeparatorMenuItem.
		do
			from_external_pointer (gtk_separator_menu_item_new )
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSeparatorMenuItem)"
		end

feature {} -- External features
	gtk_separator_menu_item_new: POINTER
		external "C use <gtk/gtk.h>"
		end

end
