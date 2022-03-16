note
	description: "GtkCellRendererCombo Renders a combobox in a cell."
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
					

class GTK_CELL_RENDERER_COMBO
	-- GTK_CELL_RENDERER_COMBO renders text in a cell like
	-- GTK_CELL_RENDERER_TEXT from which it is derived. But while
	-- GTK_CELL_RENDERER_TEXT offers a simple entry to edit the text,
	-- GTK_CELL_RENDERER_COMBO offers a GTK_COMBO_BOX or
	-- GTK_COMBO_BOX_ENTRY widget to edit the text. The values to
	-- display in the combo box are taken from the tree model specified
	-- in the model property.

	-- The combo cell renderer takes care of adding a text cell
	-- renderer to the combo box and sets it to display the column
	-- specified by its text-column property. Further cell renderers
	-- can be added in a handler for the editing-started signal.
	
inherit
	GTK_CELL_RENDERER_TEXT
		redefine 
			make, struct_size 
		end

insert
	GTK_CELL_RENDERER_COMBO_EXTERNALS

create {ANY} make, from_external_pointer

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRendererCombo)"
		end

feature {} -- Creation
	make
			-- Creates a new GtkCellRendererCombo. Adjust how text is
			-- drawn using object properties. Object properties can be
			-- set globally (with g_object_set()). Also, with
			-- GtkTreeViewColumn, you can bind a property to a value in a
			-- GtkTreeModel. For example, you can bind the "text"
			-- property on the cell renderer to a string value in the
			-- model, thus rendering a different string in each row of
			-- the GtkTreeView.
		do
			from_external_pointer (gtk_cell_renderer_combo_new)
		end

feature {ANY} -- TODO: Property Details
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
