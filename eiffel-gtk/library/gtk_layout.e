   Link: GTK+ Reference Manual (start)
   Link: Layout Containers (parent)
   Link: GtkVPaned (previous)
   Link: GtkNotebook (next)
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
   Link: Printing (chapter)
   Link: Miscellaneous (chapter)
   Link: Abstract Base Classes (chapter)
   Link: Cross-process Embedding (chapter)
   Link: Special-purpose features (chapter)
   Link: Recently Used Documents (chapter)
   Link: Deprecated (chapter)
   Link: Part IV. Migrating from Previous Versions of GTK+ (part)
   Link: Migration Checklist (chapter)
   Link: Migrating from GtkFileSelection to GtkFileChooser (chapter)
   Link: Migrating from old menu and toolbar systems to GtkAction (chapter)
   Link: Migrating from GtkOptionMenu and GtkCombo to GtkComboBox and
     GtkComboBoxEntry (chapter)
   Link: Migrating from GnomeIconList to GtkIconView (chapter)
   Link: Migrating from GnomeAbout to GtkAboutDialog (chapter)
   Link: Migrating from GnomeColorPicker to GtkColorButton (chapter)
   Link: Migrating from GnomeDruid to GtkAssistant (chapter)
   Link: Migrating from EggRecent to GtkRecentChooser (chapter)
   Link: Migrating from GnomeHRef to GtkLinkButton (chapter)
   Link: Part V. GTK+ Tools (part)
   Link: Glossary (glossary)
   Link: Index (index)
   Link: Index of deprecated symbols (index)
   Link: Index of new symbols in 2.2 (index)
   Link: Index of new symbols in 2.4 (index)
   Link: Index of new symbols in 2.6 (index)
   Link: Index of new symbols in 2.8 (index)
   Link: Index of new symbols in 2.10 (index)

   Prev        Up        Home           GTK+ Reference Manual      Next
   Top  |  Description  |  Object Hierarchy  |  Implemented Interfaces  |
   Properties  |  Child Properties  |  Signals

   GtkLayout

   GtkLayout -- Infinite scrollable area containing child widgets and/or
   custom drawing

Synopsis


 #include <gtk/gtk.h>


             GtkLayout;
 GtkWidget*  gtk_layout_new                  (GtkAdjustment *hadjustment,
                                              GtkAdjustment *vadjustment);
 void        gtk_layout_put                  (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);
 void        gtk_layout_move                 (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);
 void        gtk_layout_set_size             (GtkLayout *layout,
                                              guint width,
                                              guint height);
 void        gtk_layout_get_size             (GtkLayout *layout,
                                              guint *width,
                                              guint *height);
 void        gtk_layout_freeze               (GtkLayout *layout);
 void        gtk_layout_thaw                 (GtkLayout *layout);
 GtkAdjustment* gtk_layout_get_hadjustment   (GtkLayout *layout);
 GtkAdjustment* gtk_layout_get_vadjustment   (GtkLayout *layout);
 void        gtk_layout_set_hadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);
 void        gtk_layout_set_vadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);



Object Hierarchy


   GObject
    +----GInitiallyUnowned
          +----GtkObject
                +----GtkWidget
                      +----GtkContainer
                            +----GtkLayout

Implemented Interfaces

   GtkLayout implements AtkImplementorIface.

Properties


   "hadjustment"          GtkAdjustment         : Read / Write
   "height"               guint                 : Read / Write
   "vadjustment"          GtkAdjustment         : Read / Write
   "width"                guint                 : Read / Write

Child Properties


   "x"                    gint                  : Read / Write
   "y"                    gint                  : Read / Write

Signals


 "set-scroll-adjustments"
             void        user_function      (GtkLayout     *layout,
                                             GtkAdjustment *arg1,
                                             GtkAdjustment *arg2,
                                             gpointer       user_data)      : Run last / Action

Description

   GtkLayout is similar to GtkDrawingArea in that it's a "blank slate" and
   doesn't do anything but paint a blank background by default. It's
   different in that it supports scrolling natively (you can add it to a
   GtkScrolledWindow), and it can contain child widgets, since it's a
   GtkContainer. However if you're just going to draw, a GtkDrawingArea is a
   better choice since it has lower overhead.

   When handling expose events on a GtkLayout, you must draw to GTK_LAYOUT
   (layout)->bin_window, rather than to GTK_WIDGET (layout)->window, as you
   would for a drawing area.

Details

  GtkLayout

 typedef struct {
   GdkWindow *bin_window;
 } GtkLayout;

   --------------------------------------------------------------------------

  gtk_layout_new ()

 GtkWidget*  gtk_layout_new                  (GtkAdjustment *hadjustment,
                                              GtkAdjustment *vadjustment);

   Creates a new GtkLayout. Unless you have a specific adjustment you'd like
   the layout to use for scrolling, pass NULL for hadjustment and
   vadjustment.

   hadjustment : horizontal scroll adjustment, or NULL
   vadjustment : vertical scroll adjustment, or NULL
   Returns :     a new GtkLayout

   --------------------------------------------------------------------------

  gtk_layout_put ()

 void        gtk_layout_put                  (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);

   Adds child_widget to layout, at position (x,y). layout becomes the new
   parent container of child_widget.

   layout :       a GtkLayout
   child_widget : child widget
   x :            X position of child widget
   y :            Y position of child widget

   --------------------------------------------------------------------------

  gtk_layout_move ()

 void        gtk_layout_move                 (GtkLayout *layout,
                                              GtkWidget *child_widget,
                                              gint x,
                                              gint y);

   Moves a current child of layout to a new position.

   layout :       a GtkLayout
   child_widget : a current child of layout
   x :            X position to move to
   y :            Y position to move to

   --------------------------------------------------------------------------

  gtk_layout_set_size ()

 void        gtk_layout_set_size             (GtkLayout *layout,
                                              guint width,
                                              guint height);

   Sets the size of the scrollable area of the layout.

   layout : a GtkLayout
   width :  width of entire scrollable area
   height : height of entire scrollable area

   --------------------------------------------------------------------------

  gtk_layout_get_size ()

 void        gtk_layout_get_size             (GtkLayout *layout,
                                              guint *width,
                                              guint *height);

   Gets the size that has been set on the layout, and that determines the
   total extents of the layout's scrollbar area. See gtk_layout_set_size().

   layout : a GtkLayout
   width :  location to store the width set on layout, or NULL
   height : location to store the height set on layout, or NULL

   --------------------------------------------------------------------------

  gtk_layout_freeze ()

 void        gtk_layout_freeze               (GtkLayout *layout);

  Warning

   gtk_layout_freeze is deprecated and should not be used in newly-written
   code.

   This is a deprecated function, it doesn't do anything useful.

   layout : a GtkLayout

   --------------------------------------------------------------------------

  gtk_layout_thaw ()

 void        gtk_layout_thaw                 (GtkLayout *layout);

  Warning

   gtk_layout_thaw is deprecated and should not be used in newly-written
   code.

   This is a deprecated function, it doesn't do anything useful.

   layout : a GtkLayout

   --------------------------------------------------------------------------

  gtk_layout_get_hadjustment ()

 GtkAdjustment* gtk_layout_get_hadjustment   (GtkLayout *layout);

   This function should only be called after the layout has been placed in a
   GtkScrolledWindow or otherwise configured for scrolling. It returns the
   GtkAdjustment used for communication between the horizontal scrollbar and
   layout.

   See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

   layout :  a GtkLayout
   Returns : horizontal scroll adjustment

   --------------------------------------------------------------------------

  gtk_layout_get_vadjustment ()

 GtkAdjustment* gtk_layout_get_vadjustment   (GtkLayout *layout);

   This function should only be called after the layout has been placed in a
   GtkScrolledWindow or otherwise configured for scrolling. It returns the
   GtkAdjustment used for communication between the vertical scrollbar and
   layout.

   See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

   layout :  a GtkLayout
   Returns : vertical scroll adjustment

   --------------------------------------------------------------------------

  gtk_layout_set_hadjustment ()

 void        gtk_layout_set_hadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);

   Sets the horizontal scroll adjustment for the layout.

   See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

   layout :     a GtkLayout
   adjustment : new scroll adjustment

   --------------------------------------------------------------------------

  gtk_layout_set_vadjustment ()

 void        gtk_layout_set_vadjustment      (GtkLayout *layout,
                                              GtkAdjustment *adjustment);

   Sets the vertical scroll adjustment for the layout.

   See GtkScrolledWindow, GtkScrollbar, GtkAdjustment for details.

   layout :     a GtkLayout
   adjustment : new scroll adjustment

Property Details

  The "hadjustment" property

   "hadjustment"          GtkAdjustment         : Read / Write

   The GtkAdjustment for the horizontal position.

   --------------------------------------------------------------------------

  The "height" property

   "height"               guint                 : Read / Write

   The height of the layout.

   Allowed values: <= G_MAXINT

   Default value: 100

   --------------------------------------------------------------------------

  The "vadjustment" property

   "vadjustment"          GtkAdjustment         : Read / Write

   The GtkAdjustment for the vertical position.

   --------------------------------------------------------------------------

  The "width" property

   "width"                guint                 : Read / Write

   The width of the layout.

   Allowed values: <= G_MAXINT

   Default value: 100

Child Property Details

  The "x" child property

   "x"                    gint                  : Read / Write

   X position of child widget.

   Default value: 0

   --------------------------------------------------------------------------

  The "y" child property

   "y"                    gint                  : Read / Write

   Y position of child widget.

   Default value: 0

Signal Details

  The "set-scroll-adjustments" signal

 void        user_function                  (GtkLayout     *layout,
                                             GtkAdjustment *arg1,
                                             GtkAdjustment *arg2,
                                             gpointer       user_data)      : Run last / Action

   layout :    the object which received the signal.
   arg1 :
   arg2 :
   user_data : user data set when the signal handler was connected.

See Also

   GtkDrawingArea, GtkScrolledWindow

References

   Visible links
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/LayoutContainers.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkVPaned.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkNotebook.html
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
   . file:///usr/share/doc/libgtk2.0-doc/gtk/Printing.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/MiscObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/AbstractObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/PlugSocket.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/SpecialObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/RecentDocuments.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/DeprecatedObjects.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/migrating.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-checklist.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkFileChooser.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkAction.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkComboBox.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkIconView.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkAboutDialog.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkColorButton.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkAssistant.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkRecentChooser.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/gtk-migrating-GtkLinkButton.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/pt05.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/glossary.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix01.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix02.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix03.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix04.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix05.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix06.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/ix07.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkVPaned.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/LayoutContainers.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/index.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkNotebook.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3738855
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3740083
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3739804
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3739858
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3739881
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3739966
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#id3740017
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout-struct
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-new
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-put
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-move
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-set-size
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-get-size
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-freeze
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-thaw
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-get-hadjustment
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-get-vadjustment
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-set-hadjustment
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-set-vadjustment
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkObject
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkObject.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--hadjustment
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--height
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--vadjustment
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--width
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--x
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout--y
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#GtkLayout-set-scroll-adjustments
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkDrawingArea
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkDrawingArea.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkContainer
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkContainer.html
   . GtkDrawingArea
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkDrawingArea.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkWidget
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkWidget.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html#gtk-layout-set-size
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkScrollbar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrollbar.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkScrollbar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrollbar.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkScrollbar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrollbar.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
   . GtkScrollbar
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrollbar.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkLayout
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkLayout.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkAdjustment
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkAdjustment.html
   . GtkDrawingArea
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkDrawingArea.html
   . GtkScrolledWindow
	file:///usr/share/doc/libgtk2.0-doc/gtk/GtkScrolledWindow.html
