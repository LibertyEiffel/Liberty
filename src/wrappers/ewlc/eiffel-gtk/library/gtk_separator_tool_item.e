note
	description: "GtkSeparatorToolItem -- A toolbar item that separates groups of other toolbar items."
	copyright: "[
					Copyright (C) 2007 Paolo Redaelli, GTK+ team
					
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

class GTK_SEPARATOR_TOOL_ITEM
	-- A GTK_SEPARATOR_TOOL_ITEM is a GTK_TOOL_ITEM that separates
	-- groups of other GTK_TOOL_ITEMs. Depending on the theme, a
	-- GtkSeparatorToolItem will often look like a vertical line on
	-- horizontally docked toolbars.  If the property "expand" is True
	-- and the property "draw" is False, a GTK_SEPARATOR_TOOL_ITEM will
	-- act as a "spring" that forces other items to the ends of the
	-- toolbar.

inherit                                  
	GTK_TOOL_ITEM
		redefine 
			make,
			struct_size
		end

	--   GtkSeparatorToolItem implements AtkImplementorIface.

insert 
	GTK_SEPARATOR_TOOL_ITEM_EXTERNALS

create {ANY} make, from_external_pointer

feature {} -- Creation
	make
			--   Create a new GtkSeparatorToolItem
		do
			from_external_pointer(gtk_separator_tool_item_new)
		end

feature {ANY} 
	set_draw (a_setting: BOOLEAN)
			-- When separator_tool_items is drawn as a vertical line, or
			-- just blank.  Setting this FALSE along with `set_expand' is
			-- useful to create an item that forces following items to
			-- the end of the toolbar.
		do
			gtk_separator_tool_item_set_draw(handle,a_setting.to_integer)
		ensure set: a_setting = is_drawn
		end

	is_drawn: BOOLEAN
			-- Is the separator tool item is drawn as a line, or just
			-- blank. See `set_draw'.
		do
			Result:=(gtk_separator_tool_item_get_draw(handle)).to_boolean
		end
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkSeparatorToolItem)"
		end
	
end -- class GTK_SEPARATOR_TOOL_ITEM
