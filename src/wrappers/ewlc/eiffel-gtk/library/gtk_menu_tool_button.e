note
	description: "GtkMenuToolButton: A GtkToolItem containing a button with an additional dropdown menu."
	copyright: "[
					Copyright (C) 2007-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_MENU_TOOL_BUTTON
	-- A GtkMenuToolButton is a GtkToolItem that contains a button and
	-- a small additional button with an arrow. When clicked, the arrow
	-- button pops up a dropdown menu.  

	-- Use `from_label' to create a new GTK_MENU_TOOL_BUTTON. Use
	-- `from_stock' to create a new GTK_MENU_TOOL_BUTTON a stock item.

	-- Note: the previous paragraph is translated from C documentation 
	-- althought it is plainly unnecessary in an Eiffel class, since 
	-- there are creation clause.

inherit 
	GTK_TOOL_BUTTON
		redefine 
			from_label,
			from_stock,
			struct_size
		end
		--   GtkMenuToolButton implements AtkImplementorIface.

insert 
	GTK_MENU_TOOL_BUTTON_EXTERNALS
	GTK_MENU_EXTERNALS -- to access gtk_is_menu

create {ANY} from_label, from_stock, from_external_pointer

feature {} -- Creation
	from_label (an_icon_widget: GTK_WIDGET; a_label: STRING)
			-- Creates a new GtkMenuToolButton using `an_icon_widget' as icon
			-- and `a_label' as label. Both can be Void.
		do
			from_external_pointer(gtk_menu_tool_button_new
										 (null_or(an_icon_widget),
										  null_or_string(a_label)))
		end

	from_stock (a_stock_id: STRING)
			-- Creates a new GtkMenuToolButton. The new GtkMenuToolButton
			-- will contain an icon and label from the stock item
			-- indicated by `a_stock_id'.
		do
			from_external_pointer(gtk_menu_tool_button_new_from_stock
										 (a_stock_id.to_external))
		end

feature {ANY}
	set_menu (a_menu: GTK_MENU)
			-- Sets the GtkMenu that is popped up when the user clicks on
			-- the arrow. If `a_menu' is Void, the arrow button becomes
			-- insensitive.

			-- Note: in the original C implementation `a_menu' is a
			-- GTK_WIDGET, while the documentation says it is a GtkMenu.
			-- We consider valid the more defined type.
		do
			gtk_menu_tool_button_set_menu(handle,null_or(a_menu))
		ensure set: a_menu = menu
		end

	menu: GTK_MENU
			-- the GTK_MENU associated with GTK_MENU_TOOL_BUTTON.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_MENU]
		do
			Result := factory.wrapper (gtk_menu_tool_button_get_menu(handle))
		end

	set_arrow_tooltip (some_tooltips: GTK_TOOLTIPS; a_tip_text, a_tip_private: STRING)
			-- Sets the GtkTooltips object to be used for arrow button
			-- which pops up the menu. See GTK_TOOL_ITEM's `set_tooltip'
			-- for setting a tooltip on the whole GtkMenuToolButton.
		
			-- `some_tooltips': the GtkTooltips object to be used

			-- `a_tip_text': text to be used as tooltip text for tool
			-- item

			-- `a_tip_private': text to be used as private tooltip text
		require 
			tooltips_not_void: some_tooltips /= Void
			tip_text_not_void: a_tip_text /= Void
			tip_private_not_void: a_tip_private /= Void
		do
			gtk_menu_tool_button_set_arrow_tooltip
			(handle, some_tooltips.handle, 
			 a_tip_text.to_external, a_tip_private.to_external)
		end	

feature {ANY} --TODO: --Signals

	-- "show-menu" void        user_function      (GtkMenuToolButton *menutoolbutton,
	--                                             gpointer           user_data)           : Run first
	--Signal Details
	--
	--  The "show-menu" signal
	--
	-- void        user_function                  (GtkMenuToolButton *menutoolbutton,
	--                                             gpointer           user_data)           : Run first
	--
	--   menutoolbutton : the object which received the signal.
	--   user_data :      user data set when the signal handler was connected.
	--

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkMenuToolButton)"
		end
end -- class GTK_MENU_TOOL_BUTTON
