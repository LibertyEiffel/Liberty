note
	description: "GTK_IMAGE_MENU_ITEM."
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

class GTK_IMAGE_MENU_ITEM
	-- A GtkImageMenuItem is a menu item which has an icon next to the
	-- text label. Note that the user can disable display of menu
	-- icons, so make sure to still fill in the text label.

inherit GTK_MENU_ITEM redefine make, struct_size, with_mnemonic, with_label end
	--    GtkImageMenuItem implements AtkImplementorIface.

create {ANY} make, from_stock, with_label, with_mnemonic, from_external_pointer

feature {} -- Creation
	make
			-- Creates a new GtkImageMenuItem with an empty label.
		do
			from_external_pointer (gtk_image_menu_item_new)
		end

	from_stock (a_stock_item: STRING)
			-- Creates a new GtkImageMenuItem containing the image and
			-- text from `a_stock_item'. Some stock ids have preprocessor
			-- macros like GTK_STOCK_OK and GTK_STOCK_APPLY (TODO:
			-- Eiffelize this description).

			-- TODO: Provide support for accel group If you want this
			-- menu item to have changeable accelerators, then pass in
			-- NULL for accel_group. Next call
			-- gtk_menu_item_set_accel_path() with an appropriate path
			-- for the menu item, use gtk_stock_lookup() to look up the
			-- standard accelerator for the stock item, and if one is
			-- found, call gtk_accel_map_add_entry() to register it.
		require
			gtk_initialized: gtk.is_initialized
			stock_item_not_void: a_stock_item /= Void
		do
			from_external_pointer (gtk_image_menu_item_new_from_stock (a_stock_item.to_external, default_pointer))
			--  GtkWidget* gtk_image_menu_item_new_from_stock (const
			--  gchar *stock_id, -- GtkAccelGroup *accel_group);
		end

	with_label (a_label: STRING)
			-- Creates a new GtkImageMenuItem containing `a_label'.
		do
			handle:=gtk_image_menu_item_new_with_label (a_label.to_external)
			store_eiffel_wrapper
		end

	with_mnemonic (a_label: STRING)
			-- Creates a new GtkImageMenuItem containing a label. Put an
			-- underscore in front of the mnemonic character for the menu
			-- item.
		do
			handle:= gtk_image_menu_item_new_with_mnemonic(a_label.to_external)
			store_eiffel_wrapper
		end

feature {ANY}
	set_image (a_widget: GTK_WIDGET)
			-- Sets the image of image menu item to `a_widget'. Note that
			-- it depends on the show-menu-images setting whether the
			-- image will be displayed or not.
		require widget_not_void: a_widget /= Void
		do
			gtk_image_menu_item_set_image (handle, a_widget.handle)
		end

	image: GTK_WIDGET
			-- The widget currently set as the image of
			-- image_menu_item. See `set_image'.
		local factory: G_OBJECT_EXPANDED_FACTORY [GTK_WIDGET]
		do
			Result := factory.wrapper_or_void (gtk_image_menu_item_get_image (handle))
		end

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkImageMenuItem)"
		end

feature {} -- External calls
	gtk_image_menu_item_set_image (an_image_menu_item,a_widget: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_image_menu_item_get_image (an_image_menu_item: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	
	gtk_image_menu_item_new: POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_image_menu_item_new_from_stock (a_stock_id, an_accel_group: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end

	gtk_image_menu_item_new_with_label (a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
	gtk_image_menu_item_new_with_mnemonic (a_label: POINTER): POINTER is -- GtkWidget*
		external "C use <gtk/gtk.h>"
		end
end
