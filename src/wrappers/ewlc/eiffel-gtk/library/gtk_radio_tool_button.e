note
	description: "GtkRadioToolButton -- A toolbar item that contains a radio button."
	copyright: "[
					Copyright (C) 2007-2018: Paolo Redaelli, GTK+ team
					
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

class GTK_RADIO_TOOL_BUTTON
	-- A GtkRadioToolButton is a GtkToolItem that contains a radio
	-- button, that is, a button that is part of a group of toggle
	-- buttons where only one button can be active at a time.
	
inherit
	GTK_TOGGLE_TOOL_BUTTON
		rename from_stock as toggle_from_stock
		redefine struct_size
		end
	-- GtkRadioToolButton implements AtkImplementorIface.
	
create {ANY}
	from_group, from_stock, from_widget, from_external_pointer

feature {} -- Creation

	from_group (a_group: G_SLIST[GTK_RADIO_TOOL_BUTTON])
			-- Creates a new GtkRadioToolButton, adding it to `a_group'. 
			-- If it is Void a new group is created. 

			-- TODO: this behaviour may be inconsistent with
			-- GTK_RADIO_BUTTON. Check which is better suited to real
			-- use.
		do
			from_external_pointer(gtk_radio_tool_button_new (null_or(a_group)))
		end

	from_stock (a_group: G_SLIST[GTK_RADIO_TOOL_BUTTON]; a_stock_id: STRING)
			-- Creates a new GtkRadioToolButton, adding it to
			-- `a_group'. The new GtkRadioToolButton will contain an icon
			-- and label `a_stock_id'.  If `a_group' is Void, a new group
			-- is created; `a_stock_id' is the name of a stock item
		require
			id_not_void: a_stock_id /= Void
			valid_stock_id: -- TODO It is an error if stock_id is not a name of a stock item.
		do
			from_external_pointer(gtk_radio_tool_button_new_from_stock
										 (null_or(a_group), a_stock_id.to_external))
		end

	from_widget (a_radio: GTK_RADIO_TOOL_BUTTON)
			-- Creates a new GtkRadioToolButton adding it to the same
			-- group of `a_radio'.
		require radio_not_void: a_radio /= Void
		do
			from_external_pointer(gtk_radio_tool_button_new_from_widget(a_radio.handle))
		end			

	from_widget_with_stock (a_radio: GTK_RADIO_TOOL_BUTTON; a_stock_id: STRING)
			-- Creates a new GtkRadioToolButton adding it to the same
			-- group of `a_radio'. The new GtkRadioToolButton will
			-- contain an icon and label from `a_stock_id'.
		require 
			radio_not_void: a_radio /= Void
			id_not_void: a_stock_id /= Void
			valid_stock_id: -- TODO It is an error if stock_id is not a name of a stock item.
		do
			from_external_pointer(gtk_radio_tool_button_new_with_stock_from_widget
										 (a_radio.handle, a_stock_id.to_external))
		end

feature {ANY} 
	group: G_SLIST[GTK_RADIO_TOOL_BUTTON]
			-- the radio button group button belongs to. 

			-- Note: this feature is re-computed every time it is accessed.
		local ptr: POINTER
		do
			ptr:=gtk_radio_tool_button_get_group (handle)
			if ptr.is_not_null then 
				create {G_OBJECT_SLIST[GTK_RADIO_TOOL_BUTTON]} Result.from_external_pointer(ptr)
			end
		end

	set_group (a_group: G_SLIST[GTK_RADIO_TOOL_BUTTON])
			--   Adds button to `a_group', removing it from the group it
			--   belonged to before.
		do
			gtk_radio_tool_button_set_group (handle, a_group.handle)
		ensure set: a_group = group
		end

	-- Note: "group" property is already handled by strongly-typed 
	-- "group" and "set_group" features.

feature {} -- External calls

	gtk_radio_tool_button_new (a_group: POINTER): POINTER
			-- 	GtkToolItem* gtk_radio_tool_button_new      (GSList *group);
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_tool_button_new_from_stock (a_group, a_stock_id: POINTER): POINTER
			-- GtkToolItem* gtk_radio_tool_button_new_from_stock (GSList
			-- *group, const gchar *stock_id);
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_tool_button_new_from_widget (a_group: POINTER): POINTER
			-- GtkToolItem* gtk_radio_tool_button_new_from_widget
			-- (GtkRadioToolButton *group);
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_tool_button_new_with_stock_from_widget (a_group, a_stock_id: POINTER): POINTER
			-- 	GtkToolItem* gtk_radio_tool_button_new_with_stock_from_widget (GtkRadioToolButton *group, const gchar *stock_id);
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_tool_button_get_group (a_button: POINTER): POINTER
			-- 	GSList*     gtk_radio_tool_button_get_group (GtkRadioToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_radio_tool_button_set_group (a_button, a_group: POINTER)
			-- void gtk_radio_tool_button_set_group (GtkRadioToolButton
			-- *button, GSList *group);
		external "C use <gtk/gtk.h>"
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkRadioToolButton)"
		end
end -- class GTK_RADIO_TOOL_BUTTON
