note
	description: "GtkCellView, a widget displaying a single row of a GtkTreeModel."
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

class GTK_CELL_VIEW
	-- A GtkCellView displays a single row of a GtkTreeModel, using
	-- cell renderers just like GtkTreeView. GtkCellView doesn't
	-- support some of the more complex features of GtkTreeView, like
	-- cell editing and drag and drop.
	
inherit
	GTK_WIDGET
	GTK_CELL_LAYOUT
		undefine
			store_eiffel_wrapper
		end
		-- GtkCellView also implements AtkImplementorIface.
		
create {ANY} make, from_external_pointer

feature {} -- Creation

	make
			-- Creates a new GtkCellView widget.
		do
			from_external_pointer (gtk_cell_view_new)
		end

	make_with_text (a_text: STRING)
			-- Creates a new GtkCellView widget, adds a
			-- GtkCellRendererText to it, and makes its show `a_text'.
		require valide_text: a_text /= Void
		do
			handle:=gtk_cell_view_new_with_text (a_text.to_external)
			store_eiffel_wrapper
		end
	
	new_with_markup (a_markup: STRING)
			-- Creates a new GtkCellView widget, adds a
			-- GtkCellRendererText to it, and makes its show
			-- `a_markup'. The text can be marked up with the Pango text
			-- markup language.
		require valid_text: a_markup /= Void
		do
			from_external_pointer (gtk_cell_view_new_with_markup (a_markup.to_external))
		end

	make_with_pixbuf (a_pixbuf: GDK_PIXBUF)
		-- Creates a new GtkCellView widget, adds a
		-- GtkCellRendererPixbuf to it, and makes its show `a_pixbuf'.
		do
			handle:=gtk_cell_view_new_with_pixbuf (a_pixbuf.handle)
			store_eiffel_wrapper
		end

feature {ANY}
	set_model (a_model: GTK_TREE_MODEL)
			-- Sets the model for cell_view. If Current already has a
			-- model set, it will remove it before setting the new model.
		require valid_model: a_model /= Void
		do
			gtk_cell_view_set_model (handle, a_model.handle)
		end

	unset_model
			-- Unset the old model.
		do
			gtk_cell_view_set_model (handle, default_pointer)
		end

	set_displayed_row (a_path: GTK_TREE_PATH)
			-- Sets the row of the model that is currently displayed by
			-- the GtkCellView. If the `a_path' is unset, then the
			-- contents of the cellview "stick" at their last value; this
			-- is not normally a desired result, but may be a needed
			-- intermediate state if say, the model for the GtkCellView
			-- becomes temporarily empty.
		require valid_path: a_path /= Void
		do
			gtk_cell_view_set_displayed_row (handle, a_path.handle)
		end

	unset_displayed_row
			-- Unset the displayed row; it is not normally a desired
			-- result, but may be a needed intermediate state if say, the
			-- model for the GtkCellView becomes temporarily empty.
		do
			gtk_cell_view_set_displayed_row (handle, default_pointer)
		end

	displayed_row: GTK_TREE_PATH
			-- A GtkTreePath referring to the currently displayed row. It
			-- is Void ff no row is currently displayed.
		local
			ptr: POINTER
		do
			ptr := gtk_cell_view_get_displayed_row (handle)
			if ptr.is_not_null then create Result.from_external_pointer (ptr) end
		end

	size_of_row (a_path: GTK_TREE_PATH): GTK_REQUISITION
			-- the size needed by Current to display the model row pointed to by `a_path'.
		require valid_path: a_path /= Void
		local shall_be_true: INTEGER
		do
			create Result.make
			shall_be_true:=gtk_cell_view_get_size_of_row (handle, a_path.handle,
																		 Result.handle)
		end

	set_background_color (a_color: GDK_COLOR)
			-- Sets the background color of view.
		do
			gtk_cell_view_set_background_color (handle, a_color.handle)
		end

	cell_renderers: G_LIST [GTK_CELL_RENDERER]
			-- the cell renderers which have been added to Current
			-- cell_view.
		do
			create {G_OBJECT_LIST[GTK_CELL_RENDERER]}
			Result.from_external_pointer (gtk_cell_view_get_cell_renderers (handle))
			debug print (once "Warning! Possible memory problems in GTK_CELL_VIEW.cell_renderers%N") end
			-- TODO: The returned list, but not the renderers has been newly
			-- allocated and should be freed with g_list_free() when no
			-- longer needed.
		end

feature {ANY} 	-- The "background" property
	set_backgroud_color_name (a_color_name: STRING)
		do
			set_string_property (background_property_name, a_color_name)
		end
	
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

feature {ANY} -- size
	struct_size: INTEGER
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellView)"
		end

feature {} -- Properties string-names
		background_property_name: STRING is "background"

feature {} -- External calls
	gtk_cell_view_new: POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_new_with_text (a_text: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_new_with_markup (a_markup: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_new_with_pixbuf (a_pixbuf: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_set_model (a_cell_view, a_model: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_view_set_displayed_row (a_cell_view, a_path: POINTER)
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_get_displayed_row (a_cell_view: POINTER): POINTER
		external "C use <gtk/gtk.h>"
		end
	gtk_cell_view_get_size_of_row (a_cell_view, a_path, a_gtk_requisiton: POINTER): INTEGER is -- gboolean
		external "C use <gtk/gtk.h>"
		end

	gtk_cell_view_set_background_color (a_cell_view a_gdk_color: POINTER)
		external "C use <gtk/gtk.h>"
		end
	
	gtk_cell_view_get_cell_renderers (a_cell_view: POINTER): POINTER is -- GList*
		external "C use <gtk/gtk.h>"
		end
end
