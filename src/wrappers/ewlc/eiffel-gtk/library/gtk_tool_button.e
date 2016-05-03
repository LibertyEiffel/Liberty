note
	description: "A GtkToolItem subclass that displays buttons."
	copyright: "[
					Copyright (C) 2006 Daniel F Moisset, GTK+ team
					
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

class GTK_TOOL_BUTTON
	-- GtkToolButtons are GtkToolItems containing buttons. Use `with_label'
	-- to create a new GtkToolButton. Use `with_stock' to create a
	-- GtkToolButton containing a stock item.

	-- The label of a GtkToolButton is determined by the
	-- properties/feature "label_widget", "label", and "stock_id". If
	-- "label_widget" is non-Void, then that widget is used as the
	-- label. Otherwise, if "label" is non-Void, that string is used as
	-- the label. Otherwise, if "stock_id" is non-Void, the label is
	-- determined by the stock item. Otherwise, the button does not
	-- have a label.

	-- The icon of a GtkToolButton is determined by the properties
	-- "icon_widget" and "stock_id". If "icon_widget" is non-Void, then
	-- that widget is used as the icon. Otherwise, if "stock_id" is
	-- non-Void, the icon is determined by the stock item. Otherwise,
	-- the button does not have a label.

inherit
	GTK_TOOL_ITEM redefine struct_size end
	
create {ANY}
	from_external_pointer, from_stock, from_label


feature {} -- Creation
	from_label (an_icon_widget: GTK_WIDGET; a_label: STRING) is
			--Creates a new GtkToolButton using `an_icon_widget' as icon
			--and `a_label' as label. Both can be Void.
		do
			from_external_pointer(gtk_tool_button_new(null_or(an_icon_widget),
																	null_or_string(a_label)))
		end

	from_stock (a_stock_id: STRING) is
			-- Creates a new GtkToolButton containing the image and text
			-- from a stock item. Some stock ids have preprocessor macros
			-- like GTK_STOCK_OK and GTK_STOCK_APPLY.
		require
			id_not_void: a_stock_id /= Void
			valid_stock_id: -- TODO It is an error if stock_id is not a name of a stock 
			-- item.
		do
			from_external_pointer(gtk_tool_button_new_from_stock (a_stock_id.to_external))
		end
		

feature {ANY} 
	
	set_label (a_label: STRING) is
			-- Sets label as the label used for the tool button. The
			-- "label" property only has an effect if not overridden by a
			-- non-Void "label_widget" property. If both the
			-- "label_widget" and "label" properties are Void, the label
			-- is determined by the "stock_id" property. If the
			-- "stock_id" property is also Void, button will not have a
			-- label.
		do
			gtk_tool_button_set_label (handle,null_or_string(a_label))
			ensure set: a_label/=Void implies a_label.is_equal(label)
		end

	label: CONST_STRING is
			-- the label used by the tool button; Void if the tool button
			-- doesn't have a label or uses a the label from a stock
			-- item. 
		local ptr: POINTER
		do
			ptr := gtk_tool_button_get_label(handle)
			-- The returned string is owned by GTK+, and must not be
			-- modified or freed. So we create a CONST_STRING
			if ptr.is_not_null then 
				create {CONST_STRING} Result.from_external(ptr)
			end
		end

	set_use_underline (a_setting: BOOLEAN) is
			-- If set, an underline in the label property indicates that
			-- the next character should be used for the mnemonic
			-- accelerator key in the overflow menu. For example, if the
			-- label property is "_Open" and use_underline is True, the
			-- label on the tool button will be "Open" and the item on
			-- the overflow menu will have an underlined 'O'.
			
			-- Labels shown on tool buttons never have mnemonics on them;
			-- this property only affects the menu item on the overflow
			-- menu.
		do
			gtk_tool_button_set_use_underline(handle,
														 a_setting.to_integer)
		ensure set: a_setting = is_underline_used
		end

	is_underline_used: BOOLEAN is
			-- Are underscores used in the label property as mnemonics?
			-- See `set_use_underline'.
		do 
			Result:=(gtk_tool_button_get_use_underline(handle).to_boolean)
		end

	set_stock_id (a_stock_id: STRING) is
			-- Sets the name of the stock item. See `from_stock'. The
			-- stock_id property only has an effect if not overridden by
			-- non-Void "label" and "icon_widget" properties.
		do
			gtk_tool_button_set_stock_id(handle,
												  null_or_string(a_stock_id))
		end

	stock_id: CONST_STRING is
			-- The name of the stock item. See `set_stock_id'.
		local ptr: POINTER 
		do
			ptr := gtk_tool_button_get_stock_id (handle)
			if ptr.is_not_null then
				create Result.from_external(ptr)
			end
		end

	set_icon_name (an_icon_name: STRING) is
			-- Sets the icon for the tool button from a named themed
			-- icon. See the docs for GtkIconTheme for more details. The
			-- "icon_name" property only has an effect if not overridden
			-- by non-Void "label", "icon_widget" and "stock_id"
			-- properties.
		require name_not_void: an_icon_name/=Void
		do
			gtk_tool_button_set_icon_name(handle, an_icon_name.to_external)
		end

	icon_name: CONST_STRING is
			--  name of the themed icon for the tool button, see
			-- `set_icon_name'.
		local ptr: POINTER
		do 
			ptr:=gtk_tool_button_get_icon_name(handle)
			if ptr.is_not_null then
				create Result.from_external(ptr)
			end
		end
	
	set_icon_widget (an_icon_widget: GTK_WIDGET) is
			-- Sets `an_icon_widget' as the widget used as icon on
			-- button. If Voidthe icon is determined by the "stock_id"
			-- property. If the "stock_id" property is also Void, button
			-- will not have an icon.
		do
			gtk_tool_button_set_icon_widget (handle,null_or(an_icon_widget))
		ensure set: an_icon_widget = icon_widget
		end

	icon_widget: GTK_WIDGET is
			-- the widget used as icon widget on button. See
			-- `set_icon_widget'. 

			-- Note: In debug mode an unwrapped object obtained from the
			-- GTK library will produce an exception; otherwise Result
			-- will be Void
		local ptr: POINTER; r: G_OBJECT_EXPANDED_FACTORY[GTK_WIDGET]
		do
			ptr:=gtk_tool_button_get_icon_widget(handle)
			if ptr.is_not_null then
				Result:=r.wrapper(ptr)
				debug 
					if Result=Void then
						raise(pointer_to_unwrapped_deferred_object)
					end
				end
			end
		end

	set_label_widget (a_label_widget: GTK_WIDGET) is
			-- Sets `a_label_widget' as the widget that will be used as
			-- the label for button. If label_widget is Void the "label"
			-- property is used as label. If "label" is also Void, the
			-- label in the stock item determined by the "stock_id"
			-- property is used as label. If "stock_id" is also Void,
			-- button does not have a label.  
		do
			gtk_tool_button_set_label_widget(handle,null_or(a_label_widget))
		ensure set: a_label_widget = label_widget
		end

	label_widget: GTK_WIDGET is
		-- The widget used as label on button. Can be Void. See
		-- `set_label_widget'.
		local factory: G_OBJECT_EXPANDED_FACTORY[GTK_WIDGET]
		do
			Result := factory.wrapper_or_void (gtk_tool_button_get_label_widget(handle))
		end
	
feature {ANY} --Properties 

	-- Note: "icon-name", "icon-widget", "label", "label-widget",  "stock-id" 
	-- and "use-underline" properties have proper, strongly-typed 
	-- getter/setters features so they're not wrapped as properties

feature {ANY} -- The "clicked" signal
	clicked_signal_name: STRING is "clicked"

	on_clicked is
			-- Built-in clicked signal handler; empty by design; redefine it.
		local a_foo: INTEGER
		do
			a_foo := 12 -- Dummy instructions
		end

	enable_on_clicked is
			-- Connects "clicked" signal to `on_clicked' feature.
			-- This signal is emitted when the tool button is clicked with the
			-- mouse or activated with the keyboard.
		do
			connect (Current, clicked_signal_name, $on_clicked)
		end

	connect_agent_to_clicked_signal (a_procedure: PROCEDURE [ANY, TUPLE[GTK_TOOL_BUTTON]]) is
			-- button : 	the object that received the signal
		require valid_procedure: a_procedure /= Void
		local clicked_callback: CLICKED_CALLBACK [like Current]
		do
			create clicked_callback.make
			clicked_callback.connect (Current, a_procedure)
		end

feature {ANY} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkToolButton)"
		end
	
feature {} -- External calls
	gtk_tool_button_new (a_icon_widget, a_label: POINTER): POINTER is
			-- GtkToolItem* gtk_tool_button_new (GtkWidget *icon_widget, const gchar *label);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_new_from_stock (a_stock_id: POINTER): POINTER is
			-- GtkToolItem* gtk_tool_button_new_from_stock (const gchar *stock_id);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_label (a_button, a_label: POINTER) is
			-- void gtk_tool_button_set_label (GtkToolButton *button, const gchar *label);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_label (a_button: POINTER): POINTER is
			-- const gchar* gtk_tool_button_get_label (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_use_underline (a_button: POINTER; a_use_underline: INTEGER) is
			-- void gtk_tool_button_set_use_underline (GtkToolButton *button, gboolean use_underline);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_use_underline (a_button: POINTER): INTEGER is
			-- gboolean gtk_tool_button_get_use_underline (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_stock_id (a_button, a_stock_id: POINTER) is
			-- void gtk_tool_button_set_stock_id (GtkToolButton *button, const gchar *stock_id);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_stock_id (a_button: POINTER): POINTER is
			-- const gchar* gtk_tool_button_get_stock_id (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_icon_name (a_button, an_icon_name: POINTER) is
			-- void gtk_tool_button_set_icon_name (GtkToolButton *button, const gchar *icon_name);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_icon_name (a_button: POINTER): POINTER is
			-- const gchar* gtk_tool_button_get_icon_name (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_icon_widget (a_button, an_icon_widget: POINTER) is
			-- void gtk_tool_button_set_icon_widget (GtkToolButton *button, GtkWidget *icon_widget);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_icon_widget (a_button: POINTER): POINTER is
			-- GtkWidget* gtk_tool_button_get_icon_widget (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_set_label_widget (a_button, a_label_widget: POINTER) is
			-- void gtk_tool_button_set_label_widget (GtkToolButton *button, GtkWidget *label_widget);
		external "C use <gtk/gtk.h>"
		end

	gtk_tool_button_get_label_widget (a_button: POINTER): POINTER is
			-- GtkWidget* gtk_tool_button_get_label_widget (GtkToolButton *button);
		external "C use <gtk/gtk.h>"
		end
end
