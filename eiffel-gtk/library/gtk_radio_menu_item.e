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
class GTK_RADIO_MENU_ITEM
inherit GTK_MENU_ITEM
creation make

feature -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof()"
		end

feature {} -- Creation
--    GtkRadioMenuItem

--    GtkRadioMenuItem -- A choice from multiple check menu items

-- Synopsis


--  #include <gtk/gtk.h>


--              GtkRadioMenuItem;
--  GtkWidget*  gtk_radio_menu_item_new         (GSList *group);
--  GtkWidget*  gtk_radio_menu_item_new_with_label
--                                              (GSList *group,
--                                               const gchar *label);
--  GtkWidget*  gtk_radio_menu_item_new_with_mnemonic
--                                              (GSList *group,
--                                               const gchar *label);
--  GtkWidget*  gtk_radio_menu_item_new_from_widget
--                                              (GtkRadioMenuItem *group);
--  GtkWidget*  gtk_radio_menu_item_new_with_label_from_widget
--                                              (GtkRadioMenuItem *group,
--                                               const gchar *label);
--  GtkWidget*  gtk_radio_menu_item_new_with_mnemonic_from_widget
--                                              (GtkRadioMenuItem *group,
--                                               const gchar *label);
--  #define     gtk_radio_menu_item_group
--  void        gtk_radio_menu_item_set_group   (GtkRadioMenuItem *radio_menu_item,
--                                               GSList *group);
--  GSList*     gtk_radio_menu_item_get_group   (GtkRadioMenuItem *radio_menu_item);



-- Object Hierarchy


--    GObject
--     +----GInitiallyUnowned
--           +----GtkObject
--                 +----GtkWidget
--                       +----GtkContainer
--                             +----GtkBin
--                                   +----GtkItem
--                                         +----GtkMenuItem
--                                               +----GtkCheckMenuItem
--                                                     +----GtkRadioMenuItem

-- Implemented Interfaces

--    GtkRadioMenuItem implements AtkImplementorIface.

-- Properties


--    "group"                GtkRadioMenuItem      : Write

-- Signals


--  "group-changed"
--              void        user_function      (GtkRadioMenuItem *radiomenuitem,
--                                              gpointer          user_data)          : Run first

-- Description

--    A radio menu item is a check menu item that belongs to a group. At each
--    instant exactly one of the radio menu items from a group is selected.

--    The group list does not need to be freed, as each GtkRadioMenuItem will
--    remove itself and its list item when it is destroyed.

--    The correct way to create a group of radio menu items is
--    approximatively this:

--    Example 3. How to create a group of radio menu items.

--  GSList *group = NULL;
--  GtkWidget *item;
--  gint i;

--  for (i = 0; i < 5; i++)
--  {
--    item = gtk_radio_menu_item_new_with_label (group, "This is an example");
--    group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
--    if (i == 1)
--      gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
--  }

-- Details

--   GtkRadioMenuItem

--  typedef struct _GtkRadioMenuItem GtkRadioMenuItem;

--    The structure contains only private data that must be accessed through
--    the interface functions.

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new ()

--  GtkWidget*  gtk_radio_menu_item_new         (GSList *group);

--    Creates a new GtkRadioMenuItem.

--    group :   the group to which the radio menu item is to be attached
--    Returns : a new GtkRadioMenuItem

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new_with_label ()

--  GtkWidget*  gtk_radio_menu_item_new_with_label
--                                              (GSList *group,
--                                               const gchar *label);

--    Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.

--    group :   the group to which the radio menu item is to be attached
--    label :   the text for the label
--    Returns : a new GtkRadioMenuItem

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new_with_mnemonic ()

--  GtkWidget*  gtk_radio_menu_item_new_with_mnemonic
--                                              (GSList *group,
--                                               const gchar *label);

--    Creates a new GtkRadioMenuItem containing a label. The label will be
--    created using gtk_label_new_with_mnemonic(), so underscores in label
--    indicate the mnemonic for the menu item.

--    group :   group the radio menu item is inside
--    label :   the text of the button, with an underscore in front of the
--              mnemonic character
--    Returns : a new GtkRadioMenuItem

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new_from_widget ()

--  GtkWidget*  gtk_radio_menu_item_new_from_widget
--                                              (GtkRadioMenuItem *group);

--    Creates a new GtkRadioMenuItem adding it to the same group as group.

--    group :   An existing GtkRadioMenuItem
--    Returns : The new GtkRadioMenuItem

--    Since 2.4

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new_with_label_from_widget ()

--  GtkWidget*  gtk_radio_menu_item_new_with_label_from_widget
--                                              (GtkRadioMenuItem *group,
--                                               const gchar *label);

--    Creates a new GtkRadioMenuItem whose child is a simple GtkLabel. The
--    new GtkRadioMenuItem is added to the same group as group.

--    group :   an existing GtkRadioMenuItem
--    label :   the text for the label
--    Returns : The new GtkRadioMenuItem

--    Since 2.4

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_new_with_mnemonic_from_widget ()

--  GtkWidget*  gtk_radio_menu_item_new_with_mnemonic_from_widget
--                                              (GtkRadioMenuItem *group,
--                                               const gchar *label);

--    Creates a new GtkRadioMenuItem containing a label. The label will be
--    created using gtk_label_new_with_mnemonic(), so underscores in label
--    indicate the mnemonic for the menu item.

--    The new GtkRadioMenuItem is added to the same group as group.

--    group :   An existing GtkRadioMenuItem
--    label :   the text of the button, with an underscore in front of the
--              mnemonic character
--    Returns : The new GtkRadioMenuItem

--    Since 2.4

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_group

--  #define gtk_radio_menu_item_group gtk_radio_menu_item_get_group

--   Warning

--    gtk_radio_menu_item_group is deprecated and should not be used in
--    newly-written code.

--    Deprecated compatibility macro. Use gtk_radio_menu_item_get_group()
--    instead.

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_set_group ()

--  void        gtk_radio_menu_item_set_group   (GtkRadioMenuItem *radio_menu_item,
--                                               GSList *group);

--    Sets the group of a radio menu item, or changes it.

--    radio_menu_item : a GtkRadioMenuItem.
--    group :           the new group.

--    -----------------------------------------------------------------------

--   gtk_radio_menu_item_get_group ()

--  GSList*     gtk_radio_menu_item_get_group   (GtkRadioMenuItem *radio_menu_item);

--    Returns the group to which the radio menu item belongs, as a GList of
--    GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.

--    radio_menu_item : a GtkRadioMenuItem.
--    Returns :         the group of radio_menu_item.

-- Property Details

--   The "group" property

--    "group"                GtkRadioMenuItem      : Write

--    The radio menu item whose group this widget belongs to.

--    Since 2.8

-- Signal Details

--   The "group-changed" signal

--  void        user_function                  (GtkRadioMenuItem *radiomenuitem,
--                                              gpointer          user_data)          : Run first

--    radiomenuitem : the object which received the signal.
--    user_data :     user data set when the signal handler was connected.

-- See Also

--    GtkMenuItem      because a radio menu item is a menu item.
--    GtkCheckMenuItem to know how to handle the check.

end
