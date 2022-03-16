note
	description: "External calls for GTK_CELL_RENDERER_PIXBUF"
	copyright: "[
					Copyright (C) 2006-2022: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_CELL_RENDERER_PIXBUF_EXTERNALS

inherit ANY undefine is_equal, copy end

feature {} -- External calls

	gtk_cell_renderer_pixbuf_new: POINTER is -- GtkCellRenderer*
		external "C use <gtk/gtk.h>"
		ensure not_null: Result.is_not_null
		end

-- Prev 	Up 	Home 	GTK+ Reference Manual 	Next
-- Top  |  Description  |  Object Hierarchy  |  Properties
-- GtkCellRendererPixbuf

-- GtkCellRendererPixbuf Renders a pixbuf in a cell

-- Synopsis

-- #include <gtk/gtk.h>


--             GtkCellRendererPixbuf;
-- GtkCellRenderer* gtk_cell_renderer_pixbuf_new
--                                             (void);



-- Object Hierarchy

--   GObject
--    +----GtkObject
--          +----GtkCellRenderer
--                +----GtkCellRendererPixbuf

-- Properties

--   "follow-state"         gboolean              : Read / Write
--   "icon-name"            gchararray            : Read / Write
--   "pixbuf"               GdkPixbuf             : Read / Write
--   "pixbuf-expander-closed" GdkPixbuf             : Read / Write
--   "pixbuf-expander-open" GdkPixbuf             : Read / Write
--   "stock-detail"         gchararray            : Read / Write
--   "stock-id"             gchararray            : Read / Write
--   "stock-size"           guint                 : Read / Write

-- Description

-- A GtkCellRendererPixbuf can be used to render an image in a cell. It allows to render either a given GdkPixbuf (set via the pixbuf property) or a stock icon (set via the stock-id property).

-- To support the tree view, GtkCellRendererPixbuf also supports rendering two alternative pixbufs, when the is-expander property is TRUE. If the is-expanded property is TRUE and the pixbuf-expander-open property is set to a pixbuf, it renders that pixbuf, if the is-expanded property is FALSE and the pixbuf-expander-closed property is set to a pixbuf, it renders that one.
-- Details
-- GtkCellRendererPixbuf

-- typedef struct _GtkCellRendererPixbuf GtkCellRendererPixbuf;

-- gtk_cell_renderer_pixbuf_new ()

-- GtkCellRenderer* gtk_cell_renderer_pixbuf_new
--                                             (void);

-- Creates a new GtkCellRendererPixbuf. Adjust rendering parameters using object properties. Object properties can be set globally (with g_object_set()). Also, with GtkTreeViewColumn, you can bind a property to a value in a GtkTreeModel. For example, you can bind the "pixbuf" property on the cell renderer to a pixbuf value in the model, thus rendering a different image in each row of the GtkTreeView.

-- Returns : 	the new cell renderer
-- Property Details
-- The "follow-state" property

--   "follow-state"         gboolean              : Read / Write

-- Specifies whether the rendered pixbuf should be colorized according to the GtkCellRendererState.

-- Default value: FALSE

-- Since 2.8
-- The "icon-name" property

--   "icon-name"            gchararray            : Read / Write

-- The name of the themed icon to display. This property only has an effect if not overridden by "stock_id" or "pixbuf" properties.

-- Default value: NULL

-- Since 2.8
-- The "pixbuf" property

--   "pixbuf"               GdkPixbuf             : Read / Write

-- The pixbuf to render.
-- The "pixbuf-expander-closed" property

--   "pixbuf-expander-closed" GdkPixbuf             : Read / Write

-- Pixbuf for closed expander.
-- The "pixbuf-expander-open" property

--   "pixbuf-expander-open" GdkPixbuf             : Read / Write

-- Pixbuf for open expander.
-- The "stock-detail" property

--   "stock-detail"         gchararray            : Read / Write

-- Render detail to pass to the theme engine.

-- Default value: NULL
-- The "stock-id" property

--   "stock-id"             gchararray            : Read / Write

-- The stock ID of the stock icon to render.

-- Default value: NULL
-- The "stock-size" property

--   "stock-size"           guint                 : Read / Write

-- The GtkIconSize value that specifies the size of the rendered icon.

-- Default value: 1

end
