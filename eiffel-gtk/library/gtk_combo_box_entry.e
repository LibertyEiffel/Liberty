   Link: GTK+ Reference Manual (start)
   Link: Menus, Combo Box, Toolbar (parent)
   Link: GtkComboBox (previous)
   Link: GtkMenu (next)
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

   GtkComboBoxEntry

   GtkComboBoxEntry -- A text entry field with a dropdown list

Synopsis


 #include <gtk/gtk.h>


             GtkComboBoxEntry;
 GtkWidget*  gtk_combo_box_entry_new         (void);
 GtkWidget*  gtk_combo_box_entry_new_with_model
                                             (GtkTreeModel *model,
                                              gint text_column);
 GtkWidget*  gtk_combo_box_entry_new_text    (void);
 void        gtk_combo_box_entry_set_text_column
                                             (GtkComboBoxEntry *entry_box,
                                              gint text_column);
 gint        gtk_combo_box_entry_get_text_column
                                             (GtkComboBoxEntry *entry_box);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkBin
                                  +----GtkComboBox
                                        +----GtkComboBoxEntry

Implemented Interfaces

   GtkComboBoxEntry implements AtkImplementorIface, GtkCellEditable and
   GtkCellLayout.

Properties


   "text-column"          gint                  : Read / Write

Description

   A GtkComboBoxEntry is a widget that allows the user to choose from a
   list of valid choices or enter a different value. It is very similar to
   a GtkComboBox, but it displays the selected value in an entry to allow
   modifying it.

   In contrast to a GtkComboBox, the underlying model of a
   GtkComboBoxEntry must always have a text column (see
   gtk_combo_box_entry_set_text_column()), and the entry will show the
   content of the text column in the selected row. To get the text from
   the entry, use gtk_combo_box_get_active_text().

   The changed signal will be emitted while typing into a
   GtkComboBoxEntry, as well as when selecting an item from the
   GtkComboBoxEntry's list. Use gtk_combo_box_get_active() or
   gtk_combo_box_get_active_iter() to discover whether an item was
   actually selected from the list.

   Connect to the activate signal of the GtkEntry (use
   gtk_bin_get_child()) to detect when the user actually finishes entering
   text.

   The convenience API to construct simple text-only GtkComboBoxes can
   also be used with GtkComboBoxEntrys which have been constructed with
   gtk_combo_box_entry_new_text().

Details

  GtkComboBoxEntry

 typedef struct _GtkComboBoxEntry GtkComboBoxEntry;

   -----------------------------------------------------------------------

  gtk_combo_box_entry_new ()

 GtkWidget*  gtk_combo_box_entry_new         (void);

   Creates a new GtkComboBoxEntry which has a GtkEntry as child. After
   construction, you should set a model using gtk_combo_box_set_model()
   and a text_column * using gtk_combo_box_entry_set_text_column().

   Returns : A new GtkComboBoxEntry.

   Since 2.4

   -----------------------------------------------------------------------

  gtk_combo_box_entry_new_with_model ()

 GtkWidget*  gtk_combo_box_entry_new_with_model
                                             (GtkTreeModel *model,
                                              gint text_column);

   Creates a new GtkComboBoxEntry which has a GtkEntry as child and a list
   of strings as popup. You can get the GtkEntry from a GtkComboBoxEntry
   using GTK_ENTRY (GTK_BIN (combo_box_entry)->child). To add and remove
   strings from the list, just modify model using its data manipulation
   API.

   model :       A GtkTreeModel.
   text_column : A column in model to get the strings from.
   Returns :     A new GtkComboBoxEntry.

   Since 2.4

   -----------------------------------------------------------------------

  gtk_combo_box_entry_new_text ()

 GtkWidget*  gtk_combo_box_entry_new_text    (void);

   Convenience function which constructs a new editable text combo box,
   which is a GtkComboBoxEntry just displaying strings. If you use this
   function to create a text combo box, you should only manipulate its
   data source with the following convenience functions:
   gtk_combo_box_append_text(), gtk_combo_box_insert_text(),
   gtk_combo_box_prepend_text() and gtk_combo_box_remove_text().

   Returns : A new text GtkComboBoxEntry.

   Since 2.4

   -----------------------------------------------------------------------

  gtk_combo_box_entry_set_text_column ()

 void        gtk_combo_box_entry_set_text_column
                                             (GtkComboBoxEntry *entry_box,
                                              gint text_column);

   Sets the model column which entry_box should use to get strings from to
   be text_column.

   entry_box :   A GtkComboBoxEntry.
   text_column : A column in model to get the strings from.

   Since 2.4.

   -----------------------------------------------------------------------

  gtk_combo_box_entry_get_text_column ()

 gint        gtk_combo_box_entry_get_text_column
                                             (GtkComboBoxEntry *entry_box);

   Returns the column which entry_box is using to get the strings from.

   entry_box : A GtkComboBoxEntry.
   Returns :   A column in the data source model of entry_box.

   Since 2.4

Property Details

  The "text-column" property

   "text-column"          gint                  : Read / Write

   A column in the data source model to get the strings from.

   Allowed values: >= -1

   Default value: -1

See Also

   GtkComboBox

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MenusAndCombos.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkMenu.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#top_of_page
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#desc
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#object_hierarchy
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#properties
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#GtkComboBoxEntry-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-new
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-new-with-model
   . GtkTreeModel
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTreeModel.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-new-text
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-set-text-column
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-get-text-column
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkObject
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkObject.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . GtkBin
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkBin.html
   . GtkComboBox
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . GtkCellEditable
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCellEditable.html
   . GtkCellLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkCellLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#GtkComboBoxEntry--text-column
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBox
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . GtkComboBox
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-set-text-column
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-get-active-text
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-get-active
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-get-active-iter
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkBin.html#gtk-bin-get-child
   . GtkComboBox
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-new-text
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-set-model
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html#gtk-combo-box-entry-set-text-column
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkTreeModel
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTreeModel.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkEntry.html
   . GtkEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkEntry.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkTreeModel
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkTreeModel.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-append-text
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-insert-text
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-prepend-text
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html#gtk-combo-box-remove-text
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBoxEntry
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBoxEntry.html
   . GtkComboBox
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkComboBox.html
