   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkMenuBar (previous)
   Link: GtkMenuShell (next)
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

   Prev        Up       Home          GTK+ Reference Manual     Next
   Top  |  Description  |  Object Hierarchy  |  Style Properties  |
   Signals

   GtkMenuItem

   GtkMenuItem -- The widget used for item in menus

Synopsis


 #include <gtk/gtk.h>


             GtkMenuItem;
 GtkWidget*  gtk_menu_item_new               (void);
 GtkWidget*  gtk_menu_item_new_with_label    (const gchar *label);
 GtkWidget*  gtk_menu_item_new_with_mnemonic (const gchar *label);
 void        gtk_menu_item_set_right_justified
                                             (GtkMenuItem *menu_item,
                                              gboolean right_justified);
 void        gtk_menu_item_set_submenu       (GtkMenuItem *menu_item,
                                              GtkWidget *submenu);
 void        gtk_menu_item_set_accel_path    (GtkMenuItem *menu_item,
                                              const gchar *accel_path);
 void        gtk_menu_item_remove_submenu    (GtkMenuItem *menu_item);
 void        gtk_menu_item_select            (GtkMenuItem *menu_item);
 void        gtk_menu_item_deselect          (GtkMenuItem *menu_item);
 void        gtk_menu_item_activate          (GtkMenuItem *menu_item);
 void        gtk_menu_item_toggle_size_request
                                             (GtkMenuItem *menu_item,
                                              gint *requisition);
 void        gtk_menu_item_toggle_size_allocate
                                             (GtkMenuItem *menu_item,
                                              gint allocation);
 #define     gtk_menu_item_right_justify     (menu_item)
 gboolean    gtk_menu_item_get_right_justified
                                             (GtkMenuItem *menu_item);
 GtkWidget*  gtk_menu_item_get_submenu       (GtkMenuItem *menu_item);



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
                                              +----GtkImageMenuItem
                                              +----GtkSeparatorMenuItem
                                              +----GtkTearoffMenuItem

Implemented Interfaces

   GtkMenuItem implements AtkImplementorIface.

Style Properties


   "arrow-spacing"        gint                  : Read
   "horizontal-padding"   gint                  : Read
   "selected-shadow-type" GtkShadowType         : Read
   "toggle-spacing"       gint                  : Read

Signals


 "activate"  void        user_function      (GtkMenuItem *menuitem,
                                             gpointer     user_data)      : Run first / Action
 "activate-item"
             void        user_function      (GtkMenuItem *menuitem,
                                             gpointer     user_data)      : Run first
 "toggle-size-allocate"
             void        user_function      (GtkMenuItem *menuitem,
                                             gint         arg1,
                                             gpointer     user_data)      : Run first
 "toggle-size-request"
             void        user_function      (GtkMenuItem *menuitem,
                                             gpointer     arg1,
                                             gpointer     user_data)      : Run first

Description

   The GtkMenuItem widget and the derived widgets are the only valid
   childs for menus. Their function is to correctly handle highlighting,
   alignment, events and submenus.

   As it derives from GtkBin it can hold any valid child widget, altough
   only a few are really useful.

Details

  GtkMenuItem

 typedef struct _GtkMenuItem GtkMenuItem;

   -----------------------------------------------------------------------

  gtk_menu_item_new ()

 GtkWidget*  gtk_menu_item_new               (void);

   Creates a new GtkMenuItem.

   Returns : the newly created GtkMenuItem

   -----------------------------------------------------------------------

  gtk_menu_item_new_with_label ()

 GtkWidget*  gtk_menu_item_new_with_label    (const gchar *label);

   Creates a new GtkMenuItem whose child is a GtkLabel.

   label :   the text for the label
   Returns : the newly created GtkMenuItem

   -----------------------------------------------------------------------

  gtk_menu_item_new_with_mnemonic ()

 GtkWidget*  gtk_menu_item_new_with_mnemonic (const gchar *label);

   Creates a new GtkMenuItem containing a label. The label will be created
   using gtk_label_new_with_mnemonic(), so underscores in label indicate
   the mnemonic for the menu item.

   label :   The text of the button, with an underscore in front of the
             mnemonic character
   Returns : a new GtkMenuItem

   -----------------------------------------------------------------------

  gtk_menu_item_set_right_justified ()

 void        gtk_menu_item_set_right_justified
                                             (GtkMenuItem *menu_item,
                                              gboolean right_justified);

   Sets whether the menu item appears justified at the right side of a
   menu bar. This was traditionally done for "Help" menu items, but is now
   considered a bad idea. (If the widget layout is reversed for a
   right-to-left language like Hebrew or Arabic,
   right-justified-menu-items appear at the left.)

   menu_item :       a GtkMenuItem.
   right_justified : if TRUE the menu item will appear at the far right if
                     added to a menu bar.

   -----------------------------------------------------------------------

  gtk_menu_item_set_submenu ()

 void        gtk_menu_item_set_submenu       (GtkMenuItem *menu_item,
                                              GtkWidget *submenu);

   Sets the widget submenu, or changes it.

   menu_item : the menu item widget
   submenu :   the submenu

   -----------------------------------------------------------------------

  gtk_menu_item_set_accel_path ()

 void        gtk_menu_item_set_accel_path    (GtkMenuItem *menu_item,
                                              const gchar *accel_path);

   Set the accelerator path on menu_item, through which runtime changes of
   the menu item's accelerator caused by the user can be identified and
   saved to persistant storage (see gtk_accel_map_save() on this). To
   setup a default accelerator for this menu item, call
   gtk_accel_map_add_entry() with the same accel_path. See also
   gtk_accel_map_add_entry() on the specifics of accelerator paths, and
   gtk_menu_set_accel_path() for a more convenient variant of this
   function.

   This function is basically a convenience wrapper that handles calling
   gtk_widget_set_accel_path() with the appropriate accelerator group for
   the menu item.

   Note that you do need to set an accelerator on the parent menu with
   gtk_menu_set_accel_group() for this to work.

   menu_item :  a valid GtkMenuItem
   accel_path : accelerator path, corresponding to this menu item's
                functionality, or NULL to unset the current path.

   -----------------------------------------------------------------------

  gtk_menu_item_remove_submenu ()

 void        gtk_menu_item_remove_submenu    (GtkMenuItem *menu_item);

   Removes the widget's submenu.

   menu_item : the menu item widget

   -----------------------------------------------------------------------

  gtk_menu_item_select ()

 void        gtk_menu_item_select            (GtkMenuItem *menu_item);

   Emits the "select" signal on the given item. Behaves exactly like
   gtk_item_select.

   menu_item : the menu item

   -----------------------------------------------------------------------

  gtk_menu_item_deselect ()

 void        gtk_menu_item_deselect          (GtkMenuItem *menu_item);

   Emits the "deselect" signal on the given item. Behaves exactly like
   gtk_item_deselect.

   menu_item : the menu item

   -----------------------------------------------------------------------

  gtk_menu_item_activate ()

 void        gtk_menu_item_activate          (GtkMenuItem *menu_item);

   Emits the "activate" signal on the given item

   menu_item : the menu item

   -----------------------------------------------------------------------

  gtk_menu_item_toggle_size_request ()

 void        gtk_menu_item_toggle_size_request
                                             (GtkMenuItem *menu_item,
                                              gint *requisition);

   Emits the "toggle_size_request" signal on the given item.

   menu_item :   the menu item
   requisition : the requisition to use as signal data.

   -----------------------------------------------------------------------

  gtk_menu_item_toggle_size_allocate ()

 void        gtk_menu_item_toggle_size_allocate
                                             (GtkMenuItem *menu_item,
                                              gint allocation);

   Emits the "toggle_size_allocate" signal on the given item.

   menu_item :  the menu item.
   allocation : the allocation to use as signal data.

   -----------------------------------------------------------------------

  gtk_menu_item_right_justify()

 #define gtk_menu_item_right_justify(menu_item) gtk_menu_item_set_right_justified ((menu_item), TRUE)

  Warning

   gtk_menu_item_right_justify is deprecated and should not be used in
   newly-written code.

   Sets the menu item to be right-justified. Only useful for menu bars.

   menu_item : the menu item

   -----------------------------------------------------------------------

  gtk_menu_item_get_right_justified ()

 gboolean    gtk_menu_item_get_right_justified
                                             (GtkMenuItem *menu_item);

   Gets whether the menu item appears justified at the right side of the
   menu bar.

   menu_item : a GtkMenuItem
   Returns :   TRUE if the menu item will appear at the far right if added
               to a menu bar.

   -----------------------------------------------------------------------

  gtk_menu_item_get_submenu ()

 GtkWidget*  gtk_menu_item_get_submenu       (GtkMenuItem *menu_item);

   Gets the submenu underneath this menu item, if any. See
   gtk_menu_item_set_submenu().

   menu_item : a GtkMenuItem
   Returns :   submenu for this menu item, or NULL if none.

Style Property Details

  The "arrow-spacing" style property

   "arrow-spacing"        gint                  : Read

   Space between label and arrow.

   Allowed values: >= 0

   Default value: 10

   -----------------------------------------------------------------------

  The "horizontal-padding" style property

   "horizontal-padding"   gint                  : Read

   Padding to left and right of the menu item.

   Allowed values: >= 0

   Default value: 3

   -----------------------------------------------------------------------

  The "selected-shadow-type" style property

   "selected-shadow-type" GtkShadowType         : Read

   Shadow type when item is selected.

   Default value: GTK_SHADOW_NONE

   -----------------------------------------------------------------------

  The "toggle-spacing" style property

   "toggle-spacing"       gint                  : Read

   Space between icon and label.

   Allowed values: >= 0

   Default value: 5

Signal Details

  The "activate" signal

 void        user_function                  (GtkMenuItem *menuitem,
                                             gpointer     user_data)      : Run first / Action

   Emitted when the item is activated.

   menuitem :  the object which received the signal.
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "activate-item" signal

 void        user_function                  (GtkMenuItem *menuitem,
                                             gpointer     user_data)      : Run first

   Emitted when the item is activated, but also if the menu item has a
   submenu. For normal applications, the relevant signal is "activate".

   menuitem :  the object which received the signal.
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "toggle-size-allocate" signal

 void        user_function                  (GtkMenuItem *menuitem,
                                             gint         arg1,
                                             gpointer     user_data)      : Run first

   menuitem :  the object which received the signal.
   arg1 :
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "toggle-size-request" signal

 void        user_function                  (GtkMenuItem *menuitem,
                                             gpointer     arg1,
                                             gpointer     user_data)      : Run first

   menuitem :  the object which received the signal.
   arg1 :
   user_data : user data set when the signal handler was connected.

See Also

   GtkBin       for how to handle the child.
   GtkItem      is the abstract class for all sorts of items.
   GtkMenuShell is always the parent of GtkMenuItem.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#style_properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#signal_proto
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-new
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-new-with-label
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-new-with-mnemonic
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-set-right-justified
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-set-submenu
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-set-accel-path
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-remove-submenu
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-select
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-deselect
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-activate
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-toggle-size-request
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-toggle-size-allocate
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-right-justify
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-get-right-justified
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-get-submenu
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
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
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkImageMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . GtkSeparatorMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
   . GtkTearoffMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTearoffMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem--arrow-spacing
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem--horizontal-padding
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem--selected-shadow-type
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkShadowType
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem--toggle-spacing
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem-activate
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem-activate-item
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem-toggle-size-allocate
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#GtkMenuItem-toggle-size-request
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkBin
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkBin.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkLabel
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html#gtk-label-new-with-mnemonic
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Accelerator-Maps.html#gtk-accel-map-save
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Accelerator-Maps.html#gtk-accel-map-add-entry
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Accelerator-Maps.html#gtk-accel-map-add-entry
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html#gtk-menu-set-accel-path
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html#gtk-widget-set-accel-path
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html#gtk-menu-set-accel-group
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkItem.html#gtk-item-select
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkItem.html#gtk-item-deselect
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html#gtk-menu-item-set-submenu
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkShadowType
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkBin
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkBin.html
   . GtkItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
