   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkRadioMenuItem (previous)
   Link: GtkSeparatorMenuItem (next)
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
   Top  |  Description  |  Object Hierarchy  |  Properties  |  Style
   Properties  |  Signals

   GtkCheckMenuItem

   GtkCheckMenuItem -- A menu item with a check box

Synopsis


 #include <gtk/gtk.h>


             GtkCheckMenuItem;
 GtkWidget*  gtk_check_menu_item_new         (void);
 GtkWidget*  gtk_check_menu_item_new_with_label
                                             (const gchar *label);
 GtkWidget*  gtk_check_menu_item_new_with_mnemonic
                                             (const gchar *label);
 #define     gtk_check_menu_item_set_state
 gboolean    gtk_check_menu_item_get_active  (GtkCheckMenuItem *check_menu_item);
 void        gtk_check_menu_item_set_active  (GtkCheckMenuItem *check_menu_item,
                                              gboolean is_active);
 void        gtk_check_menu_item_set_show_toggle
                                             (GtkCheckMenuItem *menu_item,
                                              gboolean always);
 void        gtk_check_menu_item_toggled     (GtkCheckMenuItem *check_menu_item);
 gboolean    gtk_check_menu_item_get_inconsistent
                                             (GtkCheckMenuItem *check_menu_item);
 void        gtk_check_menu_item_set_inconsistent
                                             (GtkCheckMenuItem *check_menu_item,
                                              gboolean setting);
 void        gtk_check_menu_item_set_draw_as_radio
                                             (GtkCheckMenuItem *check_menu_item,
                                              gboolean draw_as_radio);
 gboolean    gtk_check_menu_item_get_draw_as_radio
                                             (GtkCheckMenuItem *check_menu_item);



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

   GtkCheckMenuItem implements AtkImplementorIface.

Properties


   "active"               gboolean              : Read / Write
   "draw-as-radio"        gboolean              : Read / Write
   "inconsistent"         gboolean              : Read / Write

Style Properties


   "indicator-size"       gint                  : Read

Signals


 "toggled"   void        user_function      (GtkCheckMenuItem *checkmenuitem,
                                             gpointer          user_data)          : Run first

Description

   A GtkCheckMenuItem is a menu item that maintains the state of a boolean
   value in addition to a GtkMenuItem's usual role in activating
   application code.

   A check box indicating the state of the boolean value is displayed at
   the left side of the GtkMenuItem. Activating the GtkMenuItem toggles
   the value.

Details

  GtkCheckMenuItem

 typedef struct _GtkCheckMenuItem GtkCheckMenuItem;

   The GtkCheckMenuItem-struct struct contains the following fields.
   (These fields should be considered read-only. They should never be set
   by an application.)

   guint active;              TRUE if the check box is active.

   -----------------------------------------------------------------------

  gtk_check_menu_item_new ()

 GtkWidget*  gtk_check_menu_item_new         (void);

   Creates a new GtkCheckMenuItem.

   Returns : a new GtkCheckMenuItem.

   -----------------------------------------------------------------------

  gtk_check_menu_item_new_with_label ()

 GtkWidget*  gtk_check_menu_item_new_with_label
                                             (const gchar *label);

   Creates a new GtkCheckMenuItem with a label.

   label :   the string to use for the label.
   Returns : a new GtkCheckMenuItem.

   -----------------------------------------------------------------------

  gtk_check_menu_item_new_with_mnemonic ()

 GtkWidget*  gtk_check_menu_item_new_with_mnemonic
                                             (const gchar *label);

   Creates a new GtkCheckMenuItem containing a label. The label will be
   created using gtk_label_new_with_mnemonic(), so underscores in label
   indicate the mnemonic for the menu item.

   label :   The text of the button, with an underscore in front of the
             mnemonic character
   Returns : a new GtkCheckMenuItem

   -----------------------------------------------------------------------

  gtk_check_menu_item_set_state

 #define gtk_check_menu_item_set_state           gtk_check_menu_item_set_active

  Warning

   gtk_check_menu_item_set_state is deprecated and should not be used in
   newly-written code.

   This macro is provided to preserve compatibility with older code. New
   code should use gtk_check_menu_item_set_active() function instead.

   -----------------------------------------------------------------------

  gtk_check_menu_item_get_active ()

 gboolean    gtk_check_menu_item_get_active  (GtkCheckMenuItem *check_menu_item);

   Returns whether the check menu item is active. See
   gtk_check_menu_item_set_active().

   check_menu_item : a GtkCheckMenuItem
   Returns :         TRUE if the menu item is checked.

   -----------------------------------------------------------------------

  gtk_check_menu_item_set_active ()

 void        gtk_check_menu_item_set_active  (GtkCheckMenuItem *check_menu_item,
                                              gboolean is_active);

   Sets the active state of the menu item's check box.

   check_menu_item : a GtkCheckMenuItem.
   is_active :       boolean value indicating whether the check box is
                     active.

   -----------------------------------------------------------------------

  gtk_check_menu_item_set_show_toggle ()

 void        gtk_check_menu_item_set_show_toggle
                                             (GtkCheckMenuItem *menu_item,
                                              gboolean always);

  Warning

   gtk_check_menu_item_set_show_toggle is deprecated and should not be
   used in newly-written code.

   Controls whether the check box is shown at all times. Normally the
   check box is shown only when it is active or while the menu item is
   selected.

   menu_item : a GtkCheckMenuItem.
   always :    boolean value indicating whether to always show the check
               box.

   -----------------------------------------------------------------------

  gtk_check_menu_item_toggled ()

 void        gtk_check_menu_item_toggled     (GtkCheckMenuItem *check_menu_item);

   Emits the GtkCheckMenuItem::toggled signal.

   check_menu_item : a GtkCheckMenuItem.

   -----------------------------------------------------------------------

  gtk_check_menu_item_get_inconsistent ()

 gboolean    gtk_check_menu_item_get_inconsistent
                                             (GtkCheckMenuItem *check_menu_item);

   Retrieves the value set by gtk_check_menu_item_set_inconsistent().

   check_menu_item : a GtkCheckMenuItem
   Returns :         TRUE if inconsistent

   -----------------------------------------------------------------------

  gtk_check_menu_item_set_inconsistent ()

 void        gtk_check_menu_item_set_inconsistent
                                             (GtkCheckMenuItem *check_menu_item,
                                              gboolean setting);

   If the user has selected a range of elements (such as some text or
   spreadsheet cells) that are affected by a boolean setting, and the
   current values in that range are inconsistent, you may want to display
   the check in an "in between" state. This function turns on "in between"
   display. Normally you would turn off the inconsistent state again if
   the user explicitly selects a setting. This has to be done manually,
   gtk_check_menu_item_set_inconsistent() only affects visual appearance,
   it doesn't affect the semantics of the widget.

   check_menu_item : a GtkCheckMenuItem
   setting :         TRUE to display an "inconsistent" third state check

   -----------------------------------------------------------------------

  gtk_check_menu_item_set_draw_as_radio ()

 void        gtk_check_menu_item_set_draw_as_radio
                                             (GtkCheckMenuItem *check_menu_item,
                                              gboolean draw_as_radio);

   Sets whether check_menu_item is drawn like a GtkRadioMenuItem

   check_menu_item : a GtkCheckMenuItem
   draw_as_radio :   whether check_menu_item is drawn like a
                     GtkRadioMenuItem

   Since 2.4

   -----------------------------------------------------------------------

  gtk_check_menu_item_get_draw_as_radio ()

 gboolean    gtk_check_menu_item_get_draw_as_radio
                                             (GtkCheckMenuItem *check_menu_item);

   Returns whether check_menu_item looks like a GtkRadioMenuItem

   check_menu_item : a GtkCheckMenuItem
   Returns :         Whether check_menu_item looks like a GtkRadioMenuItem

   Since 2.4

Property Details

  The "active" property

   "active"               gboolean              : Read / Write

   Whether the menu item is checked.

   Default value: FALSE

   -----------------------------------------------------------------------

  The "draw-as-radio" property

   "draw-as-radio"        gboolean              : Read / Write

   Whether the menu item looks like a radio menu item.

   Default value: FALSE

   -----------------------------------------------------------------------

  The "inconsistent" property

   "inconsistent"         gboolean              : Read / Write

   Whether to display an "inconsistent" state.

   Default value: FALSE

Style Property Details

  The "indicator-size" style property

   "indicator-size"       gint                  : Read

   Size of check or radio indicator.

   Allowed values: >= 0

   Default value: 12

Signal Details

  The "toggled" signal

 void        user_function                  (GtkCheckMenuItem *checkmenuitem,
                                             gpointer          user_data)          : Run first

   This signal is emitted when the state of the check box is changed.

   A signal handler can examine the active field of the
   GtkCheckMenuItem-struct struct to discover the new state.

   checkmenuitem : the object which received the signal.
   user_data :     user data set when the signal handler was connected.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#style_properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#signal_proto
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-new
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-new-with-label
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-new-with-mnemonic
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-state
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-get-active
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-active
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-show-toggle
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-toggled
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-get-inconsistent
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-inconsistent
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-draw-as-radio
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-get-draw-as-radio
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
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
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem--active
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem--draw-as-radio
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem--inconsistent
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem--indicator-size
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem-toggled
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLabel.html#gtk-label-new-with-mnemonic
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-active
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-active
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-inconsistent
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#gtk-check-menu-item-set-inconsistent
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . GtkRadioMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkRadioMenuItem.html
   . GtkCheckMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html#GtkCheckMenuItem-struct
