note
	description: "External calls for GtkCellRendererProgress: Renders numbers as progress bars"
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

deferred class GTK_CELL_RENDERER_PROGRESS_EXTERNALS

inherit ANY undefine is_equal, copy end

-- Synopsis

-- #include <gtk/gtk.h>


--             GtkCellRendererProgress;
-- GtkCellRenderer* gtk_cell_renderer_progress_new
--                                             (void);



-- Object Hierarchy

--   GObject
--    +----GtkObject
--          +----GtkCellRenderer
--                +----GtkCellRendererProgress

-- Properties

--   "text"                 gchararray            : Read / Write
--   "value"                gint                  : Read / Write

-- Description

-- Details
-- GtkCellRendererProgress

-- typedef struct _GtkCellRendererProgress GtkCellRendererProgress;

-- gtk_cell_renderer_progress_new ()

-- GtkCellRenderer* gtk_cell_renderer_progress_new
--                                             (void);

-- Creates a new GtkCellRendererProgress.

-- Returns : 	the new cell renderer

-- Since 2.6
-- Property Details
-- The "text" property

--   "text"                 gchararray            : Read / Write

-- The "text" property determines the label which will be drawn over the progress bar. Setting this property to NULL causes the default label to be displayed. Setting this property to an empty string causes no label to be displayed.

-- Default value: NULL

-- Since 2.6
-- The "value" property

--   "value"                gint                  : Read / Write

-- The "value" property determines the percentage to which the progress bar will be "filled in".

-- Allowed values: [0,100]

-- Default value: 0

-- Since 2.6
end -- class GTK_CELL_RENDERER_PROGRESS_EXTERNALS
