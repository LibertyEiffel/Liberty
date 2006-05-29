   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkMenuItem (previous)
   Link: GtkImageMenuItem (next)
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

   GtkMenuShell

   GtkMenuShell -- A base class for menu objects

Synopsis


 #include <gtk/gtk.h>


             GtkMenuShell;
 void        gtk_menu_shell_append           (GtkMenuShell *menu_shell,
                                              GtkWidget *child);
 void        gtk_menu_shell_prepend          (GtkMenuShell *menu_shell,
                                              GtkWidget *child);
 void        gtk_menu_shell_insert           (GtkMenuShell *menu_shell,
                                              GtkWidget *child,
                                              gint position);
 void        gtk_menu_shell_deactivate       (GtkMenuShell *menu_shell);
 void        gtk_menu_shell_select_item      (GtkMenuShell *menu_shell,
                                              GtkWidget *menu_item);
 void        gtk_menu_shell_select_first     (GtkMenuShell *menu_shell,
                                              gboolean search_sensitive);
 void        gtk_menu_shell_deselect         (GtkMenuShell *menu_shell);
 void        gtk_menu_shell_activate_item    (GtkMenuShell *menu_shell,
                                              GtkWidget *menu_item,
                                              gboolean force_deactivate);
 void        gtk_menu_shell_cancel           (GtkMenuShell *menu_shell);
 void        gtk_menu_shell_set_take_focus   (GtkMenuShell *menu_shell,
                                              gboolean take_focus);
 gboolean    gtk_menu_shell_get_take_focus   (GtkMenuShell *menu_shell);
 enum        GtkMenuDirectionType;



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkMenuShell
                                  +----GtkMenuBar
                                  +----GtkMenu

Implemented Interfaces

   GtkMenuShell implements AtkImplementorIface.

Properties


   "take-focus"           gboolean              : Read / Write

Signals


 "activate-current"
             void        user_function      (GtkMenuShell *menushell,
                                             gboolean      force_hide,
                                             gpointer      user_data)       : Run last / Action
 "cancel"    void        user_function      (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run last / Action
 "cycle-focus"
             void        user_function      (GtkMenuShell     *menushell,
                                             GtkDirectionType *arg1,
                                             gpointer          user_data)      : Run last / Action
 "deactivate"
             void        user_function      (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run first
 "move-current"
             void        user_function      (GtkMenuShell        *menushell,
                                             GtkMenuDirectionType direction,
                                             gpointer             user_data)      : Run last / Action
 "selection-done"
             void        user_function      (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run first

Description

   A GtkMenuShell is the abstract base class used to derive the GtkMenu
   and GtkMenuBar subclasses.

   A GtkMenuShell is a container of GtkMenuItem objects arranged in a list
   which can be navigated, selected, and activated by the user to perform
   application functions. A GtkMenuItem can have a submenu associated with
   it, allowing for nested hierarchical menus.

Details

  GtkMenuShell

 typedef struct _GtkMenuShell GtkMenuShell;

   The GtkMenuShell-struct struct contains the following fields. (These
   fields should be considered read-only. They should never be set by an
   application.)

   GList *children; The list of GtkMenuItem objects contained by this
                    GtkMenuShell.

   -----------------------------------------------------------------------

  gtk_menu_shell_append ()

 void        gtk_menu_shell_append           (GtkMenuShell *menu_shell,
                                              GtkWidget *child);

   Adds a new GtkMenuItem to the end of the menu shell's item list.

   menu_shell : a GtkMenuShell.
   child :      The GtkMenuItem to add.

   -----------------------------------------------------------------------

  gtk_menu_shell_prepend ()

 void        gtk_menu_shell_prepend          (GtkMenuShell *menu_shell,
                                              GtkWidget *child);

   Adds a new GtkMenuItem to the beginning of the menu shell's item list.

   menu_shell : a GtkMenuShell.
   child :      The GtkMenuItem to add.

   -----------------------------------------------------------------------

  gtk_menu_shell_insert ()

 void        gtk_menu_shell_insert           (GtkMenuShell *menu_shell,
                                              GtkWidget *child,
                                              gint position);

   Adds a new GtkMenuItem to the menu shell's item list at the position
   indicated by position.

   menu_shell : a GtkMenuShell.
   child :      The GtkMenuItem to add.
   position :   The position in the item list where child is added.
                Positions are numbered from 0 to n-1.

   -----------------------------------------------------------------------

  gtk_menu_shell_deactivate ()

 void        gtk_menu_shell_deactivate       (GtkMenuShell *menu_shell);

   Deactivates the menu shell. Typically this results in the menu shell
   being erased from the screen.

   menu_shell : a GtkMenuShell.

   -----------------------------------------------------------------------

  gtk_menu_shell_select_item ()

 void        gtk_menu_shell_select_item      (GtkMenuShell *menu_shell,
                                              GtkWidget *menu_item);

   Selects the menu item from the menu shell.

   menu_shell : a GtkMenuShell.
   menu_item :  The GtkMenuItem to select.

   -----------------------------------------------------------------------

  gtk_menu_shell_select_first ()

 void        gtk_menu_shell_select_first     (GtkMenuShell *menu_shell,
                                              gboolean search_sensitive);

   Select the first visible or selectable child of the menu shell; don't
   select tearoff items unless the only item is a tearoff item.

   menu_shell :       a GtkMenuShell
   search_sensitive : if TRUE, search for the first selectable menu item,
                      otherwise select nothing if the first item isn't
                      sensitive. This should be FALSE if the menu is being
                      popped up initially.

   Since 2.2

   -----------------------------------------------------------------------

  gtk_menu_shell_deselect ()

 void        gtk_menu_shell_deselect         (GtkMenuShell *menu_shell);

   Deselects the currently selected item from the menu shell, if any.

   menu_shell : a GtkMenuShell.

   -----------------------------------------------------------------------

  gtk_menu_shell_activate_item ()

 void        gtk_menu_shell_activate_item    (GtkMenuShell *menu_shell,
                                              GtkWidget *menu_item,
                                              gboolean force_deactivate);

   Activates the menu item within the menu shell.

   menu_shell :       a GtkMenuShell.
   menu_item :        The GtkMenuItem to activate.
   force_deactivate : If TRUE, force the deactivation of the menu shell
                      after the menu item is activated.

   -----------------------------------------------------------------------

  gtk_menu_shell_cancel ()

 void        gtk_menu_shell_cancel           (GtkMenuShell *menu_shell);

   Cancels the selection within the menu shell.

   menu_shell : a GtkMenuShell

   Since 2.4

   -----------------------------------------------------------------------

  gtk_menu_shell_set_take_focus ()

 void        gtk_menu_shell_set_take_focus   (GtkMenuShell *menu_shell,
                                              gboolean take_focus);

   If take_focus is TRUE (the default) the menu shell will take the
   keyboard focus so that it will receive all keyboard events which is
   needed to enable keyboard navigation in menus.

   Setting take_focus to FALSE is useful only for special applications
   like virtual keyboard implementations which should not take keyboard
   focus.

   The take_focus state of a menu or menu bar is automatically propagated
   to submenus whenever a submenu is popped up, so you don't have to worry
   about recursively setting it for your entire menu hierarchy. Only when
   programmatically picking a submenu and popping it up manually, the
   take_focus property of the submenu needs to be set explicitely.

   Note that setting it to FALSE has side-effects:

   If the focus is in some other app, it keeps the focus and keynav in the
   menu doesn't work. Consequently, keynav on the menu will only work if
   the focus is on some toplevel owned by the onscreen keyboard.

   To avoid confusing the user, menus with take_focus set to FALSE should
   not display mnemonics or accelerators, since it cannot be guaranteed
   that they will work.

   See also gdk_keyboard_grab()

   menu_shell : a GtkMenuShell
   take_focus : TRUE if the menu shell should take the keyboard focus on
                popup.

   Since 2.8

   -----------------------------------------------------------------------

  gtk_menu_shell_get_take_focus ()

 gboolean    gtk_menu_shell_get_take_focus   (GtkMenuShell *menu_shell);

   Returns TRUE if the menu shell will take the keyboard focus on popup.

   menu_shell : a GtkMenuShell
   Returns :    TRUE if the menu shell will take the keyboard focus on
                popup.

   Since 2.8

   -----------------------------------------------------------------------

  enum GtkMenuDirectionType

 typedef enum
 {
   GTK_MENU_DIR_PARENT,
   GTK_MENU_DIR_CHILD,
   GTK_MENU_DIR_NEXT,
   GTK_MENU_DIR_PREV
 } GtkMenuDirectionType;

   An enumeration representing directional movements within a menu.

   GTK_MENU_DIR_PARENT  To the parent menu shell.
   GTK_MENU_DIR_CHILD   To the submenu, if any, associated with the item.
   GTK_MENU_DIR_NEXT    To the next menu item.
   GTK_MENU_DIR_PREV    To the previous menu item.

Property Details

  The "take-focus" property

   "take-focus"           gboolean              : Read / Write

   A boolean that determines whether the menu and its submenus grab the
   keyboard focus. See gtk_menu_shell_set_take_focus() and
   gtk_menu_shell_get_take_focus().

   Default value: TRUE

   Since 2.8

Signal Details

  The "activate-current" signal

 void        user_function                  (GtkMenuShell *menushell,
                                             gboolean      force_hide,
                                             gpointer      user_data)       : Run last / Action

   An action signal that activates the current menu item within the menu
   shell.

   menushell :  the object which received the signal.
   force_hide : if TRUE, hide the menu after activating the menu item.
   user_data :  user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "cancel" signal

 void        user_function                  (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run last / Action

   An action signal which cancels the selection within the menu shell.
   Causes the GtkMenuShell::selection-done signal to be emitted.

   menushell : the object which received the signal.
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "cycle-focus" signal

 void        user_function                  (GtkMenuShell     *menushell,
                                             GtkDirectionType *arg1,
                                             gpointer          user_data)      : Run last / Action

   menushell : the object which received the signal.
   arg1 :
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "deactivate" signal

 void        user_function                  (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run first

   This signal is emitted when a menu shell is deactivated.

   menushell : the object which received the signal.
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "move-current" signal

 void        user_function                  (GtkMenuShell        *menushell,
                                             GtkMenuDirectionType direction,
                                             gpointer             user_data)      : Run last / Action

   An action signal which moves the current menu item in the direction
   specified by direction.

   menushell : the object which received the signal.
   direction : the direction to move.
   user_data : user data set when the signal handler was connected.

   -----------------------------------------------------------------------

  The "selection-done" signal

 void        user_function                  (GtkMenuShell *menushell,
                                             gpointer      user_data)      : Run first

   This signal is emitted when a selection has been completed within a
   menu shell.

   menushell : the object which received the signal.
   user_data : user data set when the signal handler was connected.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkImageMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#signal_proto
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-struct
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-append
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-prepend
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-insert
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-deactivate
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-select-item
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-select-first
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-deselect
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-activate-item
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-cancel
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-set-take-focus
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-get-take-focus
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuDirectionType
   . GtkObject
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkObject.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenu
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell--take-focus
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-activate-current
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-cancel
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-cycle-focus
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkDirectionType
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-deactivate
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-move-current
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuDirectionType
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-selection-done
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenu
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuShell-struct
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gdk/gdk-General.html#gdk-keyboard-grab
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-set-take-focus
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#gtk-menu-shell-get-take-focus
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkDirectionType
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html#GtkMenuDirectionType
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
