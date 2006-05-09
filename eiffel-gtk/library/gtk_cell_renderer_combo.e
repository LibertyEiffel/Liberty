indexing
	description: "GtkCellRendererCombo Renders a combobox in a cell."
	copyright: "(C) 2006 Paolo Redaelli <paolo.redaelli@poste.it>"
	license: "LGPL v2 or later"
	date: "$Date:$"
	revision: "$Revision:$"

			-- Description: GtkCellRendererCombo renders text in a cell
			-- like GtkCellRendererText from which it is derived. But
			-- while GtkCellRendererText offers a simple entry to edit
			-- the text, GtkCellRendererCombo offers a GtkComboBox or
			-- GtkComboBoxEntry widget to edit the text. The values to
			-- display in the combo box are taken from the tree model
			-- specified in the model property.

			-- The combo cell renderer takes care of adding a text cell
			-- renderer to the combo box and sets it to display the
			-- column specified by its text-column property. Further cell
			-- renderers can be added in a handler for the
			-- editing-started signal.

class GTK_CELL_RENDERER_COMBO
inherit
	GTK_CELL_RENDERER_TEXT redefine make end
	GTK_CELL_RENDERER_COMBO_EXTERNALS
creation make

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererCombo)"
		end

feature {NONE} -- Creation
	make is
			-- Creates a new GtkCellRendererCombo. Adjust how text is
			-- drawn using object properties. Object properties can be
			-- set globally (with g_object_set()). Also, with
			-- GtkTreeViewColumn, you can bind a property to a value in a
			-- GtkTreeModel. For example, you can bind the "text"
			-- property on the cell renderer to a string value in the
			-- model, thus rendering a different string in each row of
			-- the GtkTreeView.
		do
			handle := gtk_cell_renderer_combo_new
			store_eiffel_wrapper
		end

feature -- TODO: Property Details
-- The "has-entry" property

--   "has-entry"            gboolean              : Read / Write

-- If TRUE, the cell renderer will include an entry and allow to enter values other than the ones in the popup list.

-- Default value: TRUE

-- Since 2.6
-- The "model" property

--   "model"                GtkTreeModel          : Read / Write

-- Holds a tree model containing the possible values for the combo box. Use the text_column property to specify the column holding the values.

-- Since 2.6
-- The "text-column" property

--   "text-column"          gint                  : Read / Write

-- Specifies the model column which holds the possible values for the combo box. Note that this refers to the model specified in the model property, not the model backing the tree view to which this cell renderer is attached.

-- GtkCellRendererCombo automatically adds a text cell renderer for this column to its combo box.

-- Allowed values: >= -1

-- Default value: -1

-- Since 2.6
end
