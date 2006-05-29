   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkImageMenuItem (previous)
   Link: GtkCheckMenuItem (next)
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

   Prev       Up       Home           GTK+ Reference Manual      Next
   Top  |  Description  |  Object Hierarchy  |  Properties  |  Signals

   GtkRadioMenuItem

   GtkRadioMenuItem -- A choice from multiple check menu items

Synopsis


 #include <gtk/gtk.h>


             GtkRadioMenuItem;
 GtkWidget*  gtk_radio_menu_item_new         (GSList *group);
 GtkWidget*  gtk_radio_menu_item_new_with_label
                                             (GSList *group,
                                              const gchar *label);
 GtkWidget*  gtk_radio_menu_item_new_with_mnemonic
                                             (GSList *group,
                                              const gchar *label);
 GtkWidget*  gtk_radio_menu_item_new_from_widget
                                             (GtkRadioMenuItem *group);
 GtkWidget*  gtk_radio_menu_item_new_with_label_from_widget
                                             (GtkRadioMenuItem *group,
                                              const gchar *label);
 GtkWidget*  gtk_radio_menu_item_new_with_mnemonic_from_widget
                                             (GtkRadioMenuItem *group,
                                              const gchar *label);
 #define     gtk_radio_menu_item_group
 void        gtk_radio_menu_item_set_group   (GtkRadioMenuItem *radio_menu_item,
                                              GSList *group);
 GSList*     gtk_radio_menu_item_get_group   (GtkRadioMenuItem *radio_menu_item);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkBin
                                  +----GtkItem
                                        +----GtkMenuItem
                                              +----GtkCheckMenuItem
                                                    +----GtkRadioMenuItem

Implemented Interfaces

   GtkRadioMenuItem implements AtkImplementorIface.

Properties


   "group"                GtkRadioMenuItem      : Write

Signals


 "group-changed"
             void        user_function      (GtkRadioMenuItem *radiomenuitem,
                                             gpointer          user_data)          : Run first

Description

   A radio menu item is a check menu item that belongs to a group. At each
   instant exactly one of the radio menu items from a group is selected.

   The group list does not need to be freed, as each GtkRadioMenuItem will
   remove itself and its list item when it is destroyed.

   The correct way to create a group of radio menu items is
   approximatively this:

   Example 3. How to create a group of radio menu items.

 GSList *group = NULL;
 GtkWidget *item;
 gint i;

 for (i = 0; i < 5; i++)
 {
   item = gtk_radio_menu_item_new_with_label (group, "This is an example");
   group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
   if (i == 1)
     gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
 }

Details

  GtkRadioMenuItem

 typedef struct _GtkRadioMenuItem GtkRadioMenuItem;

   The structure contains only private data that must be accessed through
   the interface functions.

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new ()

 GtkWidget*  gtk_radio_menu_item_new         (GSList *group);

   Creates a new GtkRadioMenuItem.

   group :   the group to which the radio menu item is to be attached
   Returns : a new GtkRadioMenuItem

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new_with_label ()

 GtkWidget*  gtk_radio_menu_item_new_with_label
                                             (GSList *group,
                                              const gchar *label);

   Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.

   group :   the group to which the radio menu item is to be attached
   label :   the text for the label
   Returns : a new GtkRadioMenuItem

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new_with_mnemonic ()

 GtkWidget*  gtk_radio_menu_item_new_with_mnemonic
                                             (GSList *group,
                                              const gchar *label);

   Creates a new GtkRadioMenuItem containing a label. The label will be
   created using gtk_label_new_with_mnemonic(), so underscores in label
   indicate the mnemonic for the menu item.

   group :   group the radio menu item is inside
   label :   the text of the button, with an underscore in front of the
             mnemonic character
   Returns : a new GtkRadioMenuItem

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new_from_widget ()

 GtkWidget*  gtk_radio_menu_item_new_from_widget
                                             (GtkRadioMenuItem *group);

   Creates a new GtkRadioMenuItem adding it to the same group as group.

   group :   An existing GtkRadioMenuItem
   Returns : The new GtkRadioMenuItem

   Since 2.4

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new_with_label_from_widget ()

 GtkWidget*  gtk_radio_menu_item_new_with_label_from_widget
                                             (GtkRadioMenuItem *group,
                                              const gchar *label);

   Creates a new GtkRadioMenuItem whose child is a simple GtkLabel. The
   new GtkRadioMenuItem is added to the same group as group.

   group :   an existing GtkRadioMenuItem
   label :   the text for the label
   Returns : The new GtkRadioMenuItem

   Since 2.4

   -----------------------------------------------------------------------

  gtk_radio_menu_item_new_with_mnemonic_from_widget ()

 GtkWidget*  gtk_radio_menu_item_new_with_mnemonic_from_widget
                                             (GtkRadioMenuItem *group,
                                              const gchar *label);

   Creates a new GtkRadioMenuItem containing a label. The label will be
   created using gtk_label_new_with_mnemonic(), so underscores in label
   indicate the mnemonic for the menu item.

   The new GtkRadioMenuItem is added to the same group as group.

   group :   An existing GtkRadioMenuItem
   label :   the text of the button, with an underscore in front of the
             mnemonic character
   Returns : The new GtkRadioMenuItem

   Since 2.4

   -----------------------------------------------------------------------

  gtk_radio_menu_item_group

 #define gtk_radio_menu_item_group gtk_radio_menu_item_get_group

  Warning

   gtk_radio_menu_item_group is deprecated and should not be used in
   newly-written code.

   Deprecated compatibility macro. Use gtk_radio_menu_item_get_group()
   instead.

   -----------------------------------------------------------------------

  gtk_radio_menu_item_set_group ()

 void        gtk_radio_menu_item_set_group   (GtkRadioMenuItem *radio_menu_item,
                                              GSList *group);

   Sets the group of a radio menu item, or changes it.

   radio_menu_item : a GtkRadioMenuItem.
   group :           the new group.

   -----------------------------------------------------------------------

  gtk_radio_menu_item_get_group ()

 GSList*     gtk_radio_menu_item_get_group   (GtkRadioMenuItem *radio_menu_item);

   Returns the group to which the radio menu item belongs, as a GList of
   GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.

   radio_menu_item : a GtkRadioMenuItem.
   Returns :         the group of radio_menu_item.

Property Details

  The "group" property

   "group"                GtkRadioMenuItem      : Write

   The radio menu item whose group this widget belongs to.

   Since 2.8

Signal Details

  The "group-changed" signal

 void        user_function                  (GtkRadioMenuItem *radiomenuitem,
                                             gpointer          user_data)          : Run first

   radiomenuitem : the object which received the signal.
   user_data :     user data set when the signal handler was connected.

See Also

   GtkMenuItem      because a radio menu item is a menu item.
   GtkCheckMenuItem to know how to handle the check.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#signal_proto
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#GtkRadioMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new-with-label
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new-with-mnemonic
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new-from-widget
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new-with-label-from-widget
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-new-with-mnemonic-from-widget
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-group
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-set-group
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-get-group
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
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
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#GtkRadioMenuItem--group
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#GtkRadioMenuItem-group-changed
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkLabel
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html#gtk-label-new-with-mnemonic
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html#gtk-label-new-with-mnemonic
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html#gtk-radio-menu-item-get-group
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
