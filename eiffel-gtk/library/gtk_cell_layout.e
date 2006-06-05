indexing
	description: "GTK_CELL_LAYOUT: interface for packing cells."
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
	
	-- Known Implementations: GtkCellLayout is implemented by
	-- GtkCellView, GtkEntryCompletion, GtkTreeViewColumn,
	-- GtkComboBox, GtkIconView and GtkComboBoxEntry.
	
	-- Description: GtkCellLayout is an interface to be
	-- implemented by all objects which want to provide a
	-- GtkTreeViewColumn-like API for packing cells, setting
	-- attributes and data funcs.
	

deferred class GTK_CELL_LAYOUT
inherit
	-- Note: since "GtkCellLayout requires GObject" I assume it is
	-- actually a G_OBJECT: GObject type system lacks multiple
	-- inheritance. Paolo 2006-04-28.
	
	-- GtkCellLayout should also inherit from G_INTERFACE (GInterface)
	G_OBJECT
			
feature 
	pack_start (a_cell_renderer: GTK_CELL_RENDERER; expand: BOOLEAN) is
	-- Packs the cell into the beginning of Current cell
	-- layout. If expand is FALSE, then the cell is allocated no
	-- more space than it needs. Any unused space is divided
	-- evenly between cells for which expand is TRUE.

	-- Note that reusing the same cell renderer is not supported.
		require valid_renderer: a_cell_renderer /= Void
		do
	gtk_cell_layout_pack_start (handle, a_cell_renderer.handle, expand.to_integer)
		end
	
	pack_end (a_cell_renderer: GTK_CELL_RENDERER; expand: BOOLEAN) is
			-- Packs the cell to the end of Current cell layout. If expand is
			-- FALSE, then the cell is allocated no more space than it needs. Any
			-- unused space is divided evenly between cells for which expand is
			-- TRUE.
		
			-- Note that reusing the same cell renderer is not supported.
		require valid_renderer: a_cell_renderer /= Void
		do
			gtk_cell_layout_pack_end (handle, a_cell_renderer.handle, expand.to_integer)
		end
	
	reorder  (a_cell_renderer: GTK_CELL_RENDERER; a_position: INTEGER) is
			-- Re-inserts cell at position. Note that cell has already to be packed
			-- into cell_layout for this to function properly.
		require
			valid_renderer: a_cell_renderer /= Void
			-- TODO: cell shall be already inserted
		do
			gtk_cell_layout_reorder (handle, a_cell_renderer.handle a_position)
		end


	clear is
			-- Unsets all the mappings on all renderers on cell_layout and removes
			-- all renderers from cell_layout.
		do
			gtk_cell_layout_clear (handle)
		end			

	
	-- gtk_cell_layout_set_attributes ()
	
	-- void gtk_cell_layout_set_attributes (GtkCellLayout *cell_layout,
	-- GtkCellRenderer *cell, ...);

	-- Sets the attributes in list as the attributes of cell_layout. The
	-- attributes should be in attribute/column order, as in
	-- gtk_cell_layout_add_attribute(). All existing attributes are removed, and
	-- replaced with the new attributes.
	
	-- cell_layout : 	A GtkCellLayout.
	-- cell : 	A GtkCellRenderer.
	-- ... : 	A NULL-terminated list of attributes.

	-- gtk_cell_layout_add_attribute ()

	-- void gtk_cell_layout_add_attribute (GtkCellLayout *cell_layout,
	-- GtkCellRenderer *cell, const gchar *attribute, gint column);
	
-- Adds an attribute mapping to the list in cell_layout. The column is the column of the model to get a value from, and the attribute is the parameter on cell to be set from the value. So for example if column 2 of the model contains strings, you could have the "text" attribute of a GtkCellRendererText get its values from column 2.

-- cell_layout : 	A GtkCellLayout.
-- cell : 	A GtkCellRenderer.
-- attribute : 	An attribute on the renderer.
-- column : 	The column position on the model to get the attribute from.

-- Since 2.4
-- gtk_cell_layout_set_cell_data_func ()

-- void        gtk_cell_layout_set_cell_data_func
--                                             (GtkCellLayout *cell_layout,
--                                              GtkCellRenderer *cell,
--                                              GtkCellLayoutDataFunc func,
--                                              gpointer func_data,
--                                              GDestroyNotify destroy);

-- Sets the GtkCellLayoutDataFunc to use for cell_layout. This function is used instead of the standard attributes mapping for setting the column value, and should set the value of cell_layout's cell renderer(s) as appropriate. func may be NULL to remove and older one.

-- cell_layout : 	A GtkCellLayout.
-- cell : 	A GtkCellRenderer.
-- func : 	The GtkCellLayoutDataFunc to use.
-- func_data : 	The user data for func.
-- destroy : 	The destroy notification for func_data.

-- Since 2.4
-- gtk_cell_layout_clear_attributes ()

-- void        gtk_cell_layout_clear_attributes
--                                             (GtkCellLayout *cell_layout,
--                                              GtkCellRenderer *cell);

-- Clears all existing attributes previously set with gtk_cell_layout_set_attributes().

-- cell_layout : 	A GtkCellLayout.
-- cell : 	A GtkCellRenderer to clear the attribute mapping on.

-- Since 2.4

feature {NONE} -- size
	size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellLayout)"
		end

feature {NONE}	-- External calls

	-- Structs: GtkCellLayout  GtkCellLayoutIface

	-- void (*GtkCellLayoutDataFunc) (a_cell_layout: POINTER,
	-- GtkCellRenderer *cell, GtkTreeModel *tree_model, GtkTreeIter
	-- *iter, gpointer data);

	gtk_cell_layout_pack_start (a_cell_layout, a_cell_renderer: POINTER;
										 a_expand_bool: INTEGER ) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_pack_end (a_cell_layout, a_cell_renderer: POINTER;
									  a_expand_bool: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_reorder (a_cell_layout, a_cell_renderer: POINTER;
									 a_position: INTEGER) is
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_clear (a_cell_layout: POINTER) is
		external "C use <gtk/gtk.h>"
		end
	
	-- gtk_cell_layout_set_attributes is variadic, therefore it cannot
	-- be wrapped correctly. It is therefore wrapped many times with a
	-- growing number of arguments as (gtk_cell_layout_set_attribute,
	-- gtk_cell_layout_set_two_attributes,
	-- gtk_cell_layout_set_three_attributes,
	-- gtk_cell_layout_set_four_attributes).
	
	gtk_cell_layout_set_attribute (a_cell_layout, a_cell_renderer: POINTER;
		an_attribute: POINTER; a_column: INTEGER;
		terminator: POINTER) is
		require valid_terminator: terminator.is_null
		external "C use <gtk/gtk.h>"
		alias "gtk_cell_layout_set_attributes"
		end

	gtk_cell_layout_set_two_attributes (a_cell_layout, a_cell_renderer: POINTER;
		first_attribute: POINTER; first_column: INTEGER;
		second_attribute: POINTER; second_column: INTEGER;
		terminator: POINTER) is
		require valid_terminator: terminator.is_null
		external "C use <gtk/gtk.h>"
		alias "gtk_cell_layout_set_attributes"
		end

	gtk_cell_layout_set_three_attributes (a_cell_layout, a_cell_renderer: POINTER;
		first_attribute: POINTER; first_column: INTEGER;
		second_attribute: POINTER; second_column: INTEGER;
		third_attribute: POINTER; third_column: INTEGER;
		terminator: POINTER) is
		require valid_terminator: terminator.is_null
		external "C use <gtk/gtk.h>"
		alias "gtk_cell_layout_set_attributes"
		end

	gtk_cell_layout_set_four_attributes (a_cell_layout: POINTER, a_cell_renderer: POINTER;
		first_attribute: POINTER; first_column: INTEGER;
		second_attribute: POINTER; second_column: INTEGER;
		third_attribute: POINTER; third_column: INTEGER;
		fourth_attribute: POINTER; fourth_column: INTEGER;
		terminator: POINTER) is
		require valid_terminator: terminator.is_null
		external "C use <gtk/gtk.h>"
		alias "gtk_cell_layout_set_attributes"
		end
	
	gtk_cell_layout_add_attribute (a_cell_layout, a_cell_renderer:
		POINTER; attribute: POINTER; a_column: INTEGER; terminator: POINTER) is
		require valid_terminator: terminator.is_null
		external "C use <gtk/gtk.h>"
		end

	-- gtk_cell_layout_set_cell_data_func (a_cell_layout: POINTER, a_cell_renderer: POINTER, GtkCellLayoutDataFunc func, gpointer func_data, GDestroyNotify destroy) is	external "C use <gtk/gtk.h>"	end

	-- gtk_cell_layout_clear_attributes (a_cell_layout: POINTER, a_cell_renderer: POINTER) is	external "C use <gtk/gtk.h>"	end
	
	-- GtkCellLayout is an interface to be implemented by all objects which want to provide a GtkTreeViewColumn-like API for packing cells, setting attributes and data funcs.
	-- Details
	-- GtkCellLayout
	
	-- typedef struct _GtkCellLayout GtkCellLayout;

	-- GtkCellLayoutIface

	-- typedef struct {
	-- GTypeInterface g_iface;

	-- /* Virtual Table */
	-- void (* pack_start) (GtkCellLayout *cell_layout, GtkCellRenderer *cell, gboolean expand);
	-- void (* pack_end) (GtkCellLayout *cell_layout, GtkCellRenderer *cell, gboolean expand);
	-- void (* clear) (GtkCellLayout *cell_layout);
	-- void (* add_attribute) (GtkCellLayout *cell_layout, GtkCellRenderer *cell, const gchar *attribute, gint column);
	-- void (* set_cell_data_func) (GtkCellLayout *cell_layout, GtkCellRenderer *cell, GtkCellLayoutDataFunc func, gpointer func_data, GDestroyNotify destroy);
	-- void (* clear_attributes) (GtkCellLayout *cell_layout, GtkCellRenderer *cell);
	-- void (* reorder) (GtkCellLayout *cell_layout, GtkCellRenderer *cell, gint position);
	-- } GtkCellLayoutIface;

	-- GtkCellLayoutDataFunc ()

	-- void (*GtkCellLayoutDataFunc) (a_cell_layout: POINTER, GtkCellRenderer *cell, GtkTreeModel *tree_model, GtkTreeIter *iter, gpointer data);

	-- A function which should set the value of cell_layout's cell renderer(s) as appropriate.
	-- cell_layout : 	a GtkCellLayout
	-- cell : 	the cell renderer whose value is to be set
	-- tree_model : 	the model
	-- iter : 	a GtkTreeIter indicating the row to set the value for
	-- data : 	user data passed to gtk_cell_layout_set_cell_data_func()
end
