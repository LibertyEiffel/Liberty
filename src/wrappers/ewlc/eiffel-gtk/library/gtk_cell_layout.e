note
	description: "GTK_CELL_LAYOUT: interface for packing cells."
	copyright: "[
					Copyright (C) 2006-2017: eiffel-libraries team, GTK+ team
					
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

deferred class GTK_CELL_LAYOUT
	-- GtkCellLayout is an interface to be implemented by all objects
	-- which want to provide a GtkTreeViewColumn-like API for packing
	-- cells, setting attributes and data funcs.

inherit
	-- Note: since "GtkCellLayout requires GObject" I assume it is
	-- actually a G_OBJECT: GObject type system lacks multiple
	-- inheritance. Paolo 2006-04-28.
	
	-- GtkCellLayout should also inherit from G_INTERFACE (GInterface)
	G_OBJECT
	-- Known Implementations: GtkCellLayout is implemented by
	-- 
	-- GtkComboBox, GtkIconView and GtkComboBoxEntry.
	

feature {ANY}
	pack_start (a_cell_renderer: GTK_CELL_RENDERER; expand: BOOLEAN)
			-- Packs `a_cell_renderer' into the beginning of Current cell
			-- layout. If expand is False, then the cell is allocated no
			-- more space than it needs. Any unused space is divided
			-- evenly between cells for which expand is True.

			-- Note that reusing the same cell renderer is not supported.
		require valid_renderer: a_cell_renderer /= Void
		do
	gtk_cell_layout_pack_start (handle, a_cell_renderer.handle, expand.to_integer)
		end
	
	pack_end (a_cell_renderer: GTK_CELL_RENDERER; expand: BOOLEAN)
			-- Packs the cell to the end of Current cell layout. If expand is
			-- FALSE, then the cell is allocated no more space than it needs. Any
			-- unused space is divided evenly between cells for which expand is
			-- TRUE.
		
			-- Note that reusing the same cell renderer is not supported.
		require valid_renderer: a_cell_renderer /= Void
		do
			gtk_cell_layout_pack_end (handle, a_cell_renderer.handle, expand.to_integer)
		end

	reorder  (a_cell_renderer: GTK_CELL_RENDERER; a_position: INTEGER)
			-- Re-inserts cell at position. Note that cell has already to be packed
			-- into cell_layout for this to function properly.
		require
			valid_renderer: a_cell_renderer /= Void
			-- TODO: cell shall be already inserted
		do
			gtk_cell_layout_reorder (handle, a_cell_renderer.handle, a_position)
		end


	clear
			-- Unsets all the mappings on all renderers on cell_layout and removes
			-- all renderers from cell_layout.
		do
			gtk_cell_layout_clear (handle)
		end			

	set_attributes (a_cell_renderer: GTK_CELL_RENDERER; some_attributes: COLLECTION[TUPLE[STRING,INTEGER]])
			-- Sets `some_attributes' as the attributes of the cell
			-- layout. All existing attributes are removed, and replaced
			-- with the new attributes.

			-- Each tuple contains the name of the attribute and the 
			-- column number as in `add_attribute'.

			-- Note: the equivalent C function
			-- "gtk_cell_layout_set_attributes" is variadic, so it hasn't
			-- been used to implement this feature. The Eiffel
			-- implementation mimicks the original C function.
		require
			renderer_not_void: a_cell_renderer /= Void
			attributes_not_void: some_attributes/=Void
			attribute_names_not_void: some_attributes.for_all (agent is_tuple_valid (?))

			-- TODO: no void string attribute
		local ai: ITERATOR[TUPLE[STRING,INTEGER]]
		do
			clear_attributes(a_cell_renderer)
			from ai:=some_attributes.get_new_iterator; ai.start until ai.is_off loop
				check string_not_void: ai.item.item_1/=Void end
				add_attribute (a_cell_renderer, ai.item.item_1, ai.item.item_2)
				ai.next
			end
		end

	add_attribute (a_cell_renderer: GTK_CELL_RENDERER; an_attribute: STRING; a_column: INTEGER)
			-- Adds `an_attribute' mapping to the list in cell
			-- layout. `a_column' is the column of the model to get a
			-- value from, and `an_attribute' is the parameter on cell to
			-- be set from the value. So for example if column 2 of the
			-- model contains strings, you could have the "text"
			-- attribute of a GtkCellRendererText get its values from
			-- column 2.
		require			
			renderer_not_void: a_cell_renderer /= Void
			attribute_not_void: an_attribute/=Void
		do
			gtk_cell_layout_add_attribute (handle, a_cell_renderer.handle, an_attribute.to_external, a_column)
		end

	-- gtk_cell_layout_set_cell_data_func ()
	
	-- void gtk_cell_layout_set_cell_data_func (GtkCellLayout
	-- *cell_layout, GtkCellRenderer *cell, GtkCellLayoutDataFunc func,
	-- gpointer func_data, GDestroyNotify destroy);

	-- Sets the GtkCellLayoutDataFunc to use for cell_layout. This
	-- function is used instead of the standard attributes mapping for
	-- setting the column value, and should set the value of
	-- cell_layout's cell renderer(s) as appropriate. func may be NULL
	-- to remove and older one.

	-- cell_layout : 	A GtkCellLayout.
	-- cell : 	A GtkCellRenderer.
	-- func : 	The GtkCellLayoutDataFunc to use.
	-- func_data : 	The user data for func.
	-- destroy : 	The destroy notification for func_data.

	clear_attributes (a_cell_renderer: GTK_CELL_RENDERER)
			-- Clears all existing attributes previously set with
			-- `set_attributes'.
		require			
			renderer_not_void: a_cell_renderer /= Void
		do
			gtk_cell_layout_clear_attributes(handle, a_cell_renderer.handle)	
		end
feature {ANY} -- Precondition helping features
	is_tuple_valid (item: TUPLE[STRING,INTEGER]): BOOLEAN
			-- Is `item' not Void and then the string contained not Void?
		do
			Result := ((item /= Void) and then (item.item_1 /= Void))
		end

feature {} -- External calls
	-- size must be left deferred since GTK_CELL_LAYOUT is deferred

	-- struct_size: INTEGER is external "C inline use <gtk/gtk.h>"
	-- alias "sizeof(GtkCellLayout)" end

	-- Structs: GtkCellLayout  GtkCellLayoutIface

	-- void (*GtkCellLayoutDataFunc) (a_cell_layout: POINTER,
	-- GtkCellRenderer *cell, GtkTreeModel *tree_model, GtkTreeIter
	-- *iter, gpointer data);

	gtk_cell_layout_pack_start (a_cell_layout, a_cell_renderer: POINTER;
										 a_expand_bool: INTEGER )
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_pack_end (a_cell_layout, a_cell_renderer: POINTER;a_expand_bool: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_reorder (a_cell_layout, a_cell_renderer: POINTER;
									 a_position: INTEGER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_layout_clear (a_cell_layout: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	-- Note gtk_cell_layout_set_attributes is variadic, therefore it cannot
	-- be wrapped correctly and it hasn't been wrapped. The high level 
	-- set_attibutes has been implemented mimicking the C implementation.
	
	gtk_cell_layout_add_attribute (a_cell_layout, a_cell_renderer: POINTER; an_attribute: POINTER; a_column: INTEGER)
		external "C use <gtk/gtk.h>"
		end

	-- gtk_cell_layout_set_cell_data_func (a_cell_layout: POINTER, a_cell_renderer: POINTER, GtkCellLayoutDataFunc func, gpointer func_data, GDestroyNotify destroy) is	external "C use <gtk/gtk.h>"	end

	gtk_cell_layout_clear_attributes (a_cell_layout: POINTER; a_cell_renderer: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
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
