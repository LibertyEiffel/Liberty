indexing
	description: "."
	copyright: "[
					Copyright (C) 2006 eiffel-libraries team, GTK+ team
					
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
inherit GTK_MENU_ITEM
	
creation make

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkImageMenuItem)"
		end

feature {} -- Creation
--    

--    GtkImageMenuItem -- A menu item with an icon

-- Synopsis


--  #include <gtk/gtk.h>


--              GtkImageMenuItem;
--  void        gtk_image_menu_item_set_image   (GtkImageMenuItem *image_menu_item,
--                                               GtkWidget *image);
--  GtkWidget*  gtk_image_menu_item_get_image   (GtkImageMenuItem *image_menu_item);
--  GtkWidget*  gtk_image_menu_item_new         (void);
--  GtkWidget*  gtk_image_menu_item_new_from_stock
--                                              (const gchar *stock_id,
--                                               GtkAccelGroup *accel_group);
--  GtkWidget*  gtk_image_menu_item_new_with_label
--                                              (const gchar *label);
--  GtkWidget*  gtk_image_menu_item_new_with_mnemonic
--                                              (const gchar *label);



-- Object Hierarchy


--    GObject
--     +----GInitiallyUnowned
--           +----GtkObject
--                 +----GtkWidget
--                       +----GtkContainer
--                             +----GtkBin
--                                   +----GtkItem
--                                         +----GtkMenuItem
--                                               +----GtkImageMenuItem

-- Implemented Interfaces

--    GtkImageMenuItem implements AtkImplementorIface.

-- Properties


--    "image"                GtkWidget             : Read / Write

-- Description

--    A GtkImageMenuItem is a menu item which has an icon next to the text label.

--    Note that the user can disable display of menu icons, so make sure to still fill in the text label.

-- Details

--   GtkImageMenuItem

--  typedef struct _GtkImageMenuItem GtkImageMenuItem;

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_set_image ()

--  void        gtk_image_menu_item_set_image   (GtkImageMenuItem *image_menu_item,
--                                               GtkWidget *image);

--    Sets the image of image_menu_item to the given widget. Note that it depends on the show-menu-images setting
--    whether the image will be displayed or not.

--    image_menu_item : a GtkImageMenuItem.
--    image :           a widget to set as the image for the menu item.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_get_image ()

--  GtkWidget*  gtk_image_menu_item_get_image   (GtkImageMenuItem *image_menu_item);

--    Gets the widget that is currently set as the image of image_menu_item. See gtk_image_menu_item_set_image().

--    image_menu_item : a GtkImageMenuItem.
--    Returns :         the widget set as image of image_menu_item.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_new ()

--  GtkWidget*  gtk_image_menu_item_new         (void);

--    Creates a new GtkImageMenuItem with an empty label.

--    Returns : a new GtkImageMenuItem.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_new_from_stock ()

--  GtkWidget*  gtk_image_menu_item_new_from_stock
--                                              (const gchar *stock_id,
--                                               GtkAccelGroup *accel_group);

--    Creates a new GtkImageMenuItem containing the image and text from a stock item. Some stock ids have
--    preprocessor macros like GTK_STOCK_OK and GTK_STOCK_APPLY.

--    If you want this menu item to have changeable accelerators, then pass in NULL for accel_group. Next call
--    gtk_menu_item_set_accel_path() with an appropriate path for the menu item, use gtk_stock_lookup() to look up
--    the standard accelerator for the stock item, and if one is found, call gtk_accel_map_add_entry() to register
--    it.

--    stock_id :    the name of the stock item.
--    accel_group : the GtkAccelGroup to add the menu items accelerator to, or NULL.
--    Returns :     a new GtkImageMenuItem.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_new_with_label ()

--  GtkWidget*  gtk_image_menu_item_new_with_label
--                                              (const gchar *label);

--    Creates a new GtkImageMenuItem containing a label.

--    label :   the text of the menu item.
--    Returns : a new GtkImageMenuItem.

--    ------------------------------------------------------------------------------------------------------------

--   gtk_image_menu_item_new_with_mnemonic ()

--  GtkWidget*  gtk_image_menu_item_new_with_mnemonic
--                                              (const gchar *label);

--    Creates a new GtkImageMenuItem containing a label. The label will be created using
--    gtk_label_new_with_mnemonic(), so underscores in label indicate the mnemonic for the menu item.

--    label :   the text of the menu item, with an underscore in front of the mnemonic character
--    Returns : a new GtkImageMenuItem

-- Property Details

--   The "image" property

--    "image"                GtkWidget             : Read / Write

--    Child widget to appear next to the menu text.

end
