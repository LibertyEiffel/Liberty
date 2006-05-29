   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkCheckMenuItem (previous)
   Link: GtkTearoffMenuItem (next)
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

   Prev  Up Home                GTK+ Reference Manual                 Next
   Top  |  Description  |  Object Hierarchy

   GtkSeparatorMenuItem

   GtkSeparatorMenuItem -- A separator used in menus

Synopsis


 #include <gtk/gtk.h>


             GtkSeparatorMenuItem;
 GtkWidget*  gtk_separator_menu_item_new     (void);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkBin
                                  +----GtkItem
                                        +----GtkMenuItem
                                              +----GtkSeparatorMenuItem

Implemented Interfaces

   GtkSeparatorMenuItem implements AtkImplementorIface.

Description

   The GtkSeparatorMenuItem is a separator used to group items within a
   menu. It displays a horizontal line with a shadow to make it appear
   sunken into the interface.

Details

  GtkSeparatorMenuItem

 typedef struct _GtkSeparatorMenuItem GtkSeparatorMenuItem;

   The GtkSeparatorMenuItem-struct struct contains private data only, and
   should be accessed using the functions below.

   -----------------------------------------------------------------------

  gtk_separator_menu_item_new ()

 GtkWidget*  gtk_separator_menu_item_new     (void);

   Creates a new GtkSeparatorMenuItem.

   Returns : a new GtkSeparatorMenuItem.

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTearoffMenuItem.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCheckMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTearoffMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#GtkSeparatorMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#gtk-separator-menu-item-new
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
   . GtkSeparatorMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html#GtkSeparatorMenuItem-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkSeparatorMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
   . GtkSeparatorMenuItem
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkSeparatorMenuItem.html
