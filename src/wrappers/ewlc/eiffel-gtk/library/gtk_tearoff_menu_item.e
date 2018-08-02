note
	description: "GtkTearoffMenuItem -- A menu item used to tear off and reattach its menu."
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

class GTK_TEAROFF_MENU_ITEM
	-- A GtkTearoffMenuItem is a special GtkMenuItem which is used to
	-- tear off and reattach its menu.  When its menu is shown
	-- normally, the GtkTearoffMenuItem is drawn as a dotted line
	-- indicating that the menu can be torn off. Activating it causes
	-- its menu to be torn off and displayed in its own window as a
	-- tearoff menu.
	
	-- When its menu is shown as a tearoff menu, the GtkTearoffMenuItem
	-- is drawn as a dotted line which has a left pointing arrow
	-- graphic indicating that the tearoff menu can be
	-- reattached. Activating it will erase the tearoff menu window.

inherit GTK_MENU_ITEM redefine make, struct_size end

-- TODO: GtkTearoffMenuItem implements AtkImplementorIface.

create {ANY} make, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GtkTearoffMenuItem.
		do
			from_external_pointer (gtk_tearoff_menu_item_new)
		end 

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkTearoffMenuItem)"
		end

feature {} -- External features

	gtk_tearoff_menu_item_new: POINTER is  -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

end
