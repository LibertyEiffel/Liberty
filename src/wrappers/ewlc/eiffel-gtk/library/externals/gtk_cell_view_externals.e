note
	description: "External calls for GtkCellView: A widget displaying a single row of a GtkTreeModel"
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

	date: "$Date:$"
	revision: "$Revision:$"

deferred class GTK_CELL_VIEW_EXTERNALS

inherit ANY undefine is_equal, copy end

-- Synopsis

-- #include <gtk/gtk.h>


--             GtkCellView;
-- GtkWidget*  gtk_cell_view_new               (void);
-- GtkWidget*  gtk_cell_view_new_with_text     (const gchar *text);
-- GtkWidget*  gtk_cell_view_new_with_markup   (const gchar *markup);
-- GtkWidget*  gtk_cell_view_new_with_pixbuf   (GdkPixbuf *pixbuf);
-- void        gtk_cell_view_set_model         (GtkCellView *cell_view,
--                                              GtkTreeModel *model);
-- void        gtk_cell_view_set_displayed_row (GtkCellView *cell_view,
--                                              GtkTreePath *path);
-- GtkTreePath* gtk_cell_view_get_displayed_row
--                                             (GtkCellView *cell_view);
-- gboolean    gtk_cell_view_get_size_of_row   (GtkCellView *cell_view,
--                                              GtkTreePath *path,
--                                              GtkRequisition *requisition);
-- void        gtk_cell_view_set_background_color
--                                             (GtkCellView *cell_view,
--                                              const GdkColor *color);
-- GList*      gtk_cell_view_get_cell_renderers
--                                             (GtkCellView *cell_view);



-- Object Hierarchy

--   GObject
--    +----GtkObject
--          +----GtkWidget
--                +----GtkCellView

-- Implemented Interfaces

-- GtkCellView implements AtkImplementorIface and GtkCellLayout.
-- Properties

--   "background"           gchararray            : Write
--   "background-gdk"       GdkColor              : Read / Write
--   "background-set"       gboolean              : Read / Write

-- Description

-- A GtkCellView displays a single row of a GtkTreeModel, using cell renderers just like GtkTreeView. GtkCellView doesn't support some of the more complex features of GtkTreeView, like cell editing and drag and drop.
-- Details
-- GtkCellView

-- typedef struct _GtkCellView GtkCellView;

-- gtk_cell_view_new ()

-- GtkWidget*  gtk_cell_view_new               (void);

-- Creates a new GtkCellView widget.

-- Returns : 	A newly created GtkCellView widget.

-- Since 2.6
-- gtk_cell_view_new_with_text ()

-- GtkWidget*  gtk_cell_view_new_with_text     (const gchar *text);

-- Creates a new GtkCellView widget, adds a GtkCellRendererText to it, and makes its show text.

-- text : 	the text to display in the cell view
-- Returns : 	A newly created GtkCellView widget.

-- Since 2.6
-- gtk_cell_view_new_with_markup ()

-- GtkWidget*  gtk_cell_view_new_with_markup   (const gchar *markup);

-- Creates a new GtkCellView widget, adds a GtkCellRendererText to it, and makes its show markup. The text can text can be marked up with the Pango text markup language.

-- markup : 	the text to display in the cell view
-- Returns : 	A newly created GtkCellView widget.

-- Since 2.6
-- gtk_cell_view_new_with_pixbuf ()

-- GtkWidget*  gtk_cell_view_new_with_pixbuf   (GdkPixbuf *pixbuf);

-- Creates a new GtkCellView widget, adds a GtkCellRendererPixbuf to it, and makes its show pixbuf.

-- pixbuf : 	the image to display in the cell view
-- Returns : 	A newly created GtkCellView widget.

-- Since 2.6
-- gtk_cell_view_set_model ()

-- void        gtk_cell_view_set_model         (GtkCellView *cell_view,
--                                              GtkTreeModel *model);

-- Sets the model for cell_view. If cell_view already has a model set, it will remove it before setting the new model. If model is NULL, then it will unset the old model.

-- cell_view : 	a GtkCellView
-- model : 	a GtkTreeModel

-- Since 2.6
-- gtk_cell_view_set_displayed_row ()

-- void        gtk_cell_view_set_displayed_row (GtkCellView *cell_view,
--                                              GtkTreePath *path);

-- Sets the row of the model that is currently displayed by the GtkCellView. If the path is unset, then the contents of the cellview "stick" at their last value; this is not normally a desired result, but may be a needed intermediate state if say, the model for the GtkCellView becomes temporarily empty.

-- cell_view : 	a GtkCellView
-- path : 	a GtkTreePath or NULL to unset.

-- Since 2.6
-- gtk_cell_view_get_displayed_row ()

-- GtkTreePath* gtk_cell_view_get_displayed_row
--                                             (GtkCellView *cell_view);

-- Returns a GtkTreePath referring to the currently displayed row. If no row is currently displayed, NULL is returned.

-- cell_view : 	a GtkCellView
-- Returns : 	the currently displayed row or NULL

-- Since 2.6
-- gtk_cell_view_get_size_of_row ()

-- gboolean    gtk_cell_view_get_size_of_row   (GtkCellView *cell_view,
--                                              GtkTreePath *path,
--                                              GtkRequisition *requisition);

-- Sets requisition to the size needed by cell_view to display the model row pointed to by path.

-- cell_view : 	a GtkCellView
-- path : 	a GtkTreePath
-- requisition : 	return location for the size
-- Returns : 	TRUE

-- Since 2.6
-- gtk_cell_view_set_background_color ()

-- void        gtk_cell_view_set_background_color
--                                             (GtkCellView *cell_view,
--                                              const GdkColor *color);

-- Sets the background color of view.

-- cell_view : 	a GtkCellView
-- color : 	the new background color

-- Since 2.6
-- gtk_cell_view_get_cell_renderers ()

-- GList*      gtk_cell_view_get_cell_renderers
--                                             (GtkCellView *cell_view);

-- Returns the cell renderers which have been added to cell_view.

-- cell_view : 	a GtkCellView
-- Returns : 	a list of cell renderers. The list, but not the renderers has been newly allocated and should be freed with g_list_free() when no longer needed.

-- Since 2.6
-- Property Details
-- The "background" property

--   "background"           gchararray            : Write

-- Background color as a string.

-- Default value: NULL
-- The "background-gdk" property

--   "background-gdk"       GdkColor              : Read / Write

-- Background color as a GdkColor.
-- The "background-set" property

--   "background-set"       gboolean              : Read / Write

-- Whether this tag affects the background color.

-- Default value: FALSE

end -- class GTK_CELL_VIEW_EXTERNALS
