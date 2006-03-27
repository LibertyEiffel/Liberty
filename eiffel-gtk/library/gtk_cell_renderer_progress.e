-- Prev 	Up 	Home 	GTK+ Reference Manual 	Next
-- Top  |  Description  |  Object Hierarchy  |  Properties
-- GtkCellRendererProgress

-- GtkCellRendererProgress %GÅ‚Äî%@ Renders numbers as progress bars
	
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
