   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkMenuShell (previous)
   Link: GtkRadioMenuItem (next)
   Link: Part I. GTK+ Overview (part)
   Link: Part II. GTK+ Core Reference (part)
   Link: Part III. GTK+ Widgets and Objects (part)
   Link: Object Hierarchy (chapter)
   Link: Widget Gallery (chapter)
   Link: Windows (chapter)
   Link: Display Widgets (chapter)
   Link: Buttons and Toggles (chapter)
   Link: Numeric/Text Data Entry (chapter)
   Link: Multiline Text Editor (chapter)
   Link: Tree, List and Icon Grid Widgets (chapter)
   Link: Menus, Combo Box, Toolbar (chapter)
   Link: Action-based menus and toolbars (chapter)
   Link: Selectors (File/Font/Color/Input Devices) (chapter)
   Link: Layout Containers (chapter)
   Link: Ornaments (chapter)
   Link: Scrolling (chapter)
   Link: Miscellaneous (chapter)
   Link: Abstract Base Classes (chapter)
   Link: Cross-process Embedding (chapter)
   Link: Special-purpose features (chapter)
   Link: Deprecated (chapter)
   Link: Part IV. Migrating from Previous Versions of GTK+ (part)
   Link: Migration Checklist (chapter)
   Link: Migrating from GtkFileSelection to GtkFileChooser (chapter)
   Link: Migrating from old menu and toolbar systems to GtkAction
   (chapter)
   Link: Migrating from GtkOptionMenu and GtkCombo to GtkComboBox and
        GtkComboBoxEntry (chapter)
   Link: Migrating from GnomeIconList to GtkIconView (chapter)
   Link: Migrating from GnomeAbout to GtkAboutDialog (chapter)
   Link: Migrating from GnomeColorPicker to GtkColorButton (chapter)
   Link: Part V. GTK+ Tools (part)
   Link: Glossary (glossary)
   Link: Index (index)
   Link: Index of deprecated symbols (index)
   Link: Index of new symbols in 2.2 (index)
   Link: Index of new symbols in 2.4 (index)
   Link: Index of new symbols in 2.6 (index)
   Link: Index of new symbols in 2.8 (index)

   Prev     Up    Home             GTK+ Reference Manual           Next
   Top  |  Description  |  Object Hierarchy  |  Properties

   GtkImageMenuItem

   GtkImageMenuItem -- A menu item with an icon

Synopsis


 #include <gtk/gtk.h>


             GtkImageMenuItem;
 void        gtk_image_menu_item_set_image   (GtkImageMenuItem *image_menu_item,
                                              GtkWidget *image);
 GtkWidget*  gtk_image_menu_item_get_image   (GtkImageMenuItem *image_menu_item);
 GtkWidget*  gtk_image_menu_item_new         (void);
 GtkWidget*  gtk_image_menu_item_new_from_stock
                                             (const gchar *stock_id,
                                              GtkAccelGroup *accel_group);
 GtkWidget*  gtk_image_menu_item_new_with_label
                                             (const gchar *label);
 GtkWidget*  gtk_image_menu_item_new_with_mnemonic
                                             (const gchar *label);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkBin
                                  +----GtkItem
                                        +----GtkMenuItem
                                              +----GtkImageMenuItem

Implemented Interfaces

   GtkImageMenuItem implements AtkImplementorIface.

Properties


   "image"                GtkWidget             : Read / Write

Description

   A GtkImageMenuItem is a menu item which has an icon next to the text
   label.

   Note that the user can disable display of menu icons, so make sure to
   still fill in the text label.

Details

  GtkImageMenuItem

 typedef struct _GtkImageMenuItem GtkImageMenuItem;

   -----------------------------------------------------------------------

  gtk_image_menu_item_set_image ()

 void        gtk_image_menu_item_set_image   (GtkImageMenuItem *image_menu_item,
                                              GtkWidget *image);

   Sets the image of image_menu_item to the given widget. Note that it
   depends on the show-menu-images setting whether the image will be
   displayed or not.

   image_menu_item : a GtkImageMenuItem.
   image :           a widget to set as the image for the menu item.

   -----------------------------------------------------------------------

  gtk_image_menu_item_get_image ()

 GtkWidget*  gtk_image_menu_item_get_image   (GtkImageMenuItem *image_menu_item);

   Gets the widget that is currently set as the image of image_menu_item.
   See gtk_image_menu_item_set_image().

   image_menu_item : a GtkImageMenuItem.
   Returns :         the widget set as image of image_menu_item.

   -----------------------------------------------------------------------

  gtk_image_menu_item_new ()

 GtkWidget*  gtk_image_menu_item_new         (void);

   Creates a new GtkImageMenuItem with an empty label.

   Returns : a new GtkImageMenuItem.

   -----------------------------------------------------------------------

  gtk_image_menu_item_new_from_stock ()

 GtkWidget*  gtk_image_menu_item_new_from_stock
                                             (const gchar *stock_id,
                                              GtkAccelGroup *accel_group);

   Creates a new GtkImageMenuItem containing the image and text from a
   stock item. Some stock ids have preprocessor macros like GTK_STOCK_OK
   and GTK_STOCK_APPLY.

   If you want this menu item to have changeable accelerators, then pass
   in NULL for accel_group. Next call gtk_menu_item_set_accel_path() with
   an appropriate path for the menu item, use gtk_stock_lookup() to look
   up the standard accelerator for the stock item, and if one is found,
   call gtk_accel_map_add_entry() to register it.

   stock_id :    the name of the stock item.
   accel_group : the GtkAccelGroup to add the menu items accelerator to,
                 or NULL.
   Returns :     a new GtkImageMenuItem.

   -----------------------------------------------------------------------

  gtk_image_menu_item_new_with_label ()

 GtkWidget*  gtk_image_menu_item_new_with_label
                                             (const gchar *label);

   Creates a new GtkImageMenuItem containing a label.

   label :   the text of the menu item.
   Returns : a new GtkImageMenuItem.

   -----------------------------------------------------------------------

  gtk_image_menu_item_new_with_mnemonic ()

 GtkWidget*  gtk_image_menu_item_new_with_mnemonic
                                             (const gchar *label);

   Creates a new GtkImageMenuItem containing a label. The label will be
   created using gtk_label_new_with_mnemonic(), so underscores in label
   indicate the mnemonic for the menu item.

   label :   the text of the menu item, with an underscore in front of the
             mnemonic character
   Returns : a new GtkImageMenuItem

Property Details

  The "image" property

   "image"                GtkWidget             : Read / Write

   Child widget to appear next to the menu text.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtkbase.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtkobjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ch01.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ch02.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/WindowWidgets.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/DisplayWidgets.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ButtonWidgets.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/NumericEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/TextWidgetObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/TreeWidgetObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/Actions.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/SelectorWidgets.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/LayoutContainers.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/Ornaments.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ScrollingWidgets.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MiscObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/AbstractObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/PlugSocket.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/SpecialObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/DeprecatedObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/migrating.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-checklist.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkFileChooser.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkAction.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkComboBox.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkIconView.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkAboutDialog.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkColorButton.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/pt05.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/glossary.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix01.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix02.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix03.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix04.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix05.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix06.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#GtkImageMenuItem-struct
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-set-image
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-get-image
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-new
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-new-from-stock
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Keyboard-Accelerators.html#GtkAccelGroup
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-new-with-label
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-new-with-mnemonic
   . GtkObject
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkObject.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . GtkBin
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkBin.html
   . GtkItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#GtkImageMenuItem--image
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html#gtk-image-menu-item-set-image
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Keyboard-Accelerators.html#GtkAccelGroup
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Stock-Items.html#GTK-STOCK-OK:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Stock-Items.html#GTK-STOCK-APPLY:CAPS
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-set-accel-path
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Stock-Items.html#gtk-stock-lookup
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Accelerator-Maps.html#gtk-accel-map-add-entry
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Keyboard-Accelerators.html#GtkAccelGroup
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html#gtk-label-new-with-mnemonic
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
