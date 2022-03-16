note
	description: "GtkAccelLabel — A label which displays an accelerator key on the right of the text."
	copyright: "[
					Copyright (C) 2006-2022: Paolo Redaelli, GTK+ team
					
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

class GTK_ACCEL_LABEL
	-- The GtkAccelLabel widget is a subclass of GtkLabel that also
	-- displays an accelerator key on the right of the label text,
	-- e.g. 'Ctl+S'. It is commonly used in menus to show the keyboard
	-- short-cuts for commands.

	-- The accelerator key to display is not set explicitly. Instead,
	-- the GtkAccelLabel displays the accelerators which have been
	-- added to a particular widget. This widget is set by calling
	-- gtk_accel_label_set_accel_widget().

	-- For example, a GtkMenuItem widget may have an accelerator added
	-- to emit the "activate" signal when the 'Ctl+S' key combination
	-- is pressed. A GtkAccelLabel is created and added to the
	-- GtkMenuItem, and gtk_accel_label_set_accel_widget() is called
	-- with the GtkMenuItem as the second argument. The GtkAccelLabel
	-- will now display 'Ctl+S' after its label.

	-- Note that creating a GtkMenuItem with
	-- gtk_menu_item_new_with_label() (or one of the similar functions
	-- for GtkCheckMenuItem and GtkRadioMenuItem) automatically adds a
	-- GtkAccelLabel to the GtkMenuItem and calls
	-- gtk_accel_label_set_accel_widget() to set it up for you.

	-- A GtkAccelLabel will only display accelerators which have
	-- GTK_ACCEL_VISIBLE set (see GtkAccelFlags). A GtkAccelLabel
	-- can display multiple accelerators and even signal names,
	-- though it is almost always used to display just one
	-- accelerator key.

	-- Example 1. Creating a simple menu item with an accelerator key.
			
	--   GtkWidget *save_item;
	--   GtkAccelGroup *accel_group;
			
	--   /* Create a GtkAccelGroup and add it to the window. */
	--   accel_group = gtk_accel_group_new ();
	--   gtk_window_add_accel_group (GTK_WINDOW (window), accel_group);
			
	--   /* Create the menu item using the convenience function. */
	--   save_item = gtk_menu_item_new_with_label ("Save");
	--   gtk_widget_show (save_item);
	--   gtk_container_add (GTK_CONTAINER (menu), save_item);
			
	--   /* Now add the accelerator to the GtkMenuItem. Note that
	--   since we called gtk_menu_item_new_with_label() to create
	--   the GtkMenuItem the GtkAccelLabel is automatically set
	--   up to display the GtkMenuItem accelerators. We just need
	--   to make sure we use GTK_ACCEL_VISIBLE here. */
	--   gtk_widget_add_accelerator (save_item, "activate",
	--   accel_group, GDK_s, GDK_CONTROL_MASK,
	--   GTK_ACCEL_VISIBLE);

inherit
	GTK_LABEL
		redefine
			struct_size
		end
	-- TODO: GtkAccelLabel implements AtkImplementorIface.

insert
	GTK_ACCEL_LABEL_EXTERNALS
	G_OBJECT_FACTORY [GTK_WIDGET]
	
create {ANY} make, from_external_pointer

feature {} -- Creation
	make (a_label: STRING)
			-- Creates a new GtkAccelLabel with `a_label'.
		require label_not_void: a_label /= Void
		do
			from_external_pointer(gtk_accel_label_new(a_label.to_external))
		end

feature {ANY} 
	-- TODO: void gtk_accel_label_set_accel_closure (GtkAccelLabel
	-- *accel_label, GClosure *accel_closure);

	-- Sets the closure to be monitored by this accelerator label. The closure must be connected to an accelerator group; see gtk_accel_group_connect().
	
	-- accel_label : 	a GtkAccelLabel
	-- accel_closure : 	the closure to monitor for accelerator 
	-- changes.

	accel_widget: GTK_WIDGET
			-- Fetches the widget monitored by this accelerator
			-- label. Can be Void. See `set_accel_widget'.
		local ptr: POINTER
		do
			ptr:=gtk_accel_label_get_accel_widget(handle)
			if ptr.is_not_null then
				Result:=wrapper(ptr)
			end
		end

	set_accel_widget (a_widget: GTK_WIDGET)
			-- Sets the widget to be monitored by this accelerator label.
		do
			gtk_accel_label_set_accel_widget (handle, a_widget.handle)
		end

	accel_width: INTEGER
			-- the width needed to display the accelerator key(s). This
			-- is used by menus to align all of the GtkMenuItem widgets,
			-- and shouldn't be needed by applications.
		do
			Result:=gtk_accel_label_get_accel_width (handle)
		end

	refetch
			-- Recreates the string representing the accelerator
			-- keys. This should not be needed since the string is
			-- automatically updated whenever accelerators are added or
			-- removed from the associated widget.
		local int: INTEGER
		do
			int:=gtk_accel_label_refetch(handle)
			check
				-- gtk_accel_label_refetch always returns FALSE.
				int=0
			end
		end

feature {ANY} -- TODO, if necessary: Properties
	
	--   "accel-closure"        GClosure              : Read / Write
	--   "accel-widget"         GtkWidget             : Read / Write

	-- Property Details
	-- The "accel-closure" property

	--   "accel-closure" GClosure : Read / Write

	-- The closure to be monitored for accelerator changes.
	
	-- The "accel-widget" property

	-- "accel-widget" GtkWidget : Read / Write

	-- The widget to be monitored for accelerator changes.
	
feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkAccelLabel)"
		end
end -- GTK_ACCEL_LABEL
