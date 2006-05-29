   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkMenu (previous)
   Link: GtkMenuItem (next)
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
   Top  |  Description  |  Object Hierarchy  |  Properties  |  Style
   Properties

   GtkMenuBar

   GtkMenuBar -- A subclass widget for GtkMenuShell which holds
   GtkMenuItem widgets

Synopsis


 #include <gtk/gtk.h>


             GtkMenuBar;
 GtkWidget*  gtk_menu_bar_new                (void);
 #define     gtk_menu_bar_append             (menu,child)
 #define     gtk_menu_bar_prepend            (menu,child)
 #define     gtk_menu_bar_insert             (menu,child,pos)
 enum        GtkPackDirection;
 void        gtk_menu_bar_set_pack_direction (GtkMenuBar *menubar,
                                              GtkPackDirection pack_dir);
 GtkPackDirection gtk_menu_bar_get_pack_direction
                                             (GtkMenuBar *menubar);
 void        gtk_menu_bar_set_child_pack_direction
                                             (GtkMenuBar *menubar,
                                              GtkPackDirection child_pack_dir);
 GtkPackDirection gtk_menu_bar_get_child_pack_direction
                                             (GtkMenuBar *menubar);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkMenuShell
                                  +----GtkMenuBar

Implemented Interfaces

   GtkMenuBar implements AtkImplementorIface.

Properties


   "child-pack-direction" GtkPackDirection      : Read / Write
   "pack-direction"       GtkPackDirection      : Read / Write

Style Properties


   "internal-padding"     gint                  : Read
   "shadow-type"          GtkShadowType         : Read

Description

   The GtkMenuBar is a subclass of GtkMenuShell which contains one to many
   GtkMenuItem. The result is a standard menu bar which can hold many menu
   items. GtkMenuBar allows for a shadow type to be set for aesthetic
   purposes. The shadow types are defined in the
   gtk_menu_bar_set_shadow_type function.

Details

  GtkMenuBar

 typedef struct _GtkMenuBar GtkMenuBar;

   The GtkMenuBar struct contains the following fields. (These fields
   should be considered read-only. They should never be set by an
   application.)

   -----------------------------------------------------------------------

  gtk_menu_bar_new ()

 GtkWidget*  gtk_menu_bar_new                (void);

   Creates the new GtkMenuBar

   Returns : the GtkMenuBar

   -----------------------------------------------------------------------

  gtk_menu_bar_append()

 #define gtk_menu_bar_append(menu,child)     gtk_menu_shell_append  ((GtkMenuShell *)(menu),(child))

  Warning

   gtk_menu_bar_append is deprecated and should not be used in
   newly-written code.

   Adds a new GtkMenuItem to the end of the GtkMenuBar

   menu :  a GtkMenuBar
   child : the GtkMenuItem to add

   -----------------------------------------------------------------------

  gtk_menu_bar_prepend()

 #define gtk_menu_bar_prepend(menu,child)    gtk_menu_shell_prepend ((GtkMenuShell *)(menu),(child))

  Warning

   gtk_menu_bar_prepend is deprecated and should not be used in
   newly-written code.

   Adds a new GtkMenuItem to the beginning of the GtkMenuBar

   menu :  a GtkMenuBar
   child : the GtkMenuItem to add

   -----------------------------------------------------------------------

  gtk_menu_bar_insert()

 #define gtk_menu_bar_insert(menu,child,pos) gtk_menu_shell_insert ((GtkMenuShell *)(menu),(child),(pos))

  Warning

   gtk_menu_bar_insert is deprecated and should not be used in
   newly-written code.

   Adds a new GtkMenuItem to the GtkMenuBar at the position defined by
   position

   menu :  a GtkMenuBar
   child : the GtkMenuItem to add
   pos :   the position in the item list where the child is added.

   -----------------------------------------------------------------------

  enum GtkPackDirection

 typedef enum
 {
   GTK_PACK_DIRECTION_LTR,
   GTK_PACK_DIRECTION_RTL,
   GTK_PACK_DIRECTION_TTB,
   GTK_PACK_DIRECTION_BTT
 } GtkPackDirection;

   -----------------------------------------------------------------------

  gtk_menu_bar_set_pack_direction ()

 void        gtk_menu_bar_set_pack_direction (GtkMenuBar *menubar,
                                              GtkPackDirection pack_dir);

   Sets how items should be packed inside a menubar.

   menubar :  a GtkMenuBar.
   pack_dir : a new GtkPackDirection.

   Since 2.8

   -----------------------------------------------------------------------

  gtk_menu_bar_get_pack_direction ()

 GtkPackDirection gtk_menu_bar_get_pack_direction
                                             (GtkMenuBar *menubar);

   Retrieves the current pack direction of the menubar. See
   gtk_menu_bar_set_pack_direction().

   menubar : a GtkMenuBar
   Returns : the pack direction

   Since 2.8

   -----------------------------------------------------------------------

  gtk_menu_bar_set_child_pack_direction ()

 void        gtk_menu_bar_set_child_pack_direction
                                             (GtkMenuBar *menubar,
                                              GtkPackDirection child_pack_dir);

   Sets how widgets should be packed inside the children of a menubar.

   menubar :        a GtkMenuBar.
   child_pack_dir : a new GtkPackDirection.

   Since 2.8

   -----------------------------------------------------------------------

  gtk_menu_bar_get_child_pack_direction ()

 GtkPackDirection gtk_menu_bar_get_child_pack_direction
                                             (GtkMenuBar *menubar);

   Retrieves the current child pack direction of the menubar. See
   gtk_menu_bar_set_child_pack_direction().

   menubar : a GtkMenuBar
   Returns : the child pack direction

   Since 2.8

Property Details

  The "child-pack-direction" property

   "child-pack-direction" GtkPackDirection      : Read / Write

   The pack direction of the menubar. It determines how the widgets
   contained in child menuitems are arranged.

   Default value: GTK_PACK_DIRECTION_LTR

   Since 2.8

   -----------------------------------------------------------------------

  The "pack-direction" property

   "pack-direction"       GtkPackDirection      : Read / Write

   The pack direction of the menubar. It determines how menuitems are
   arranged in the menubar.

   Default value: GTK_PACK_DIRECTION_LTR

   Since 2.8

Style Property Details

  The "internal-padding" style property

   "internal-padding"     gint                  : Read

   Amount of border space between the menubar shadow and the menu items.

   Allowed values: >= 0

   Default value: 1

   -----------------------------------------------------------------------

  The "shadow-type" style property

   "shadow-type"          GtkShadowType         : Read

   Style of bevel around the menubar.

   Default value: GTK_SHADOW_OUT

See Also

   GtkMenuShell, GtkMenu, GtkMenuItem

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#style_properties
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkMenuBar-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-new
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-append
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-prepend
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-insert
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-set-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-get-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-set-child-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-get-child-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkObject
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkObject.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkMenuBar--child-pack-direction
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkMenuBar--pack-direction
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkMenuBar--internal-padding
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkMenuBar--shadow-type
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkShadowType
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-set-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#gtk-menu-bar-set-child-pack-direction
   . GtkMenuBar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuBar.html#GtkPackDirection
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-Standard-Enumerations.html#GtkShadowType
   . GtkMenuShell
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuShell.html
   . GtkMenu
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . GtkMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenuItem.html
