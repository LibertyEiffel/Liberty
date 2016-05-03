note
	description: "GtkCellRendererToggle Renders a toggle button in a cell."
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
					

class GTK_CELL_RENDERER_TOGGLE
	-- GtkCellRendererToggle renders a toggle button in a cell. The
	-- button is drawn as a radio- or checkbutton, depending on the
	-- radio property. When activated, it emits the toggled signal.
	
inherit
	GTK_CELL_RENDERER
	
insert
	GTK_CELL_RENDERER_TOGGLE_EXTERNALS
	
create {ANY} make, from_external_pointer

feature {} -- size
	struct_size: INTEGER is
		external "C inline use <gtk/gtk.h>"
		alias "sizeof(GtkCellRenderer)"
		end

feature {} -- Creation
	make is
			-- Creates a new GtkCellRendererToggle. Adjust rendering
			-- parameters using object properties. Object properties can
			-- be set globally (with G_OBJECT.set). Also, with
			-- GtkTreeViewColumn, you can bind a property to a value in a
			-- GtkTreeModel. For example, you can bind the "active"
			-- property on the cell renderer to a boolean value in the
			-- model, thus causing the check button to reflect the state
			-- of the model.
		do
			from_external_pointer (gtk_cell_renderer_toggle_new)
		end

feature {ANY} 
	is_radio_toggle: BOOLEAN is
			-- Is Current cell rendering a radio toggle rather than a checkbox?
		do
			Result:=(gtk_cell_renderer_toggle_get_radio(handle).to_boolean)
		end
	
	set_radio is
			-- Makes the cell renderer to render a radio toggle (i.e. a
			-- toggle in a group of mutually-exclusive toggles). This can
			-- be set globally for the cell renderer, or changed just
			-- before rendering each cell in the model (for GtkTreeView,
			-- you set up a per-row setting using GtkTreeViewColumn to
			-- associate model columns with cell renderer properties).
		do
			gtk_cell_renderer_toggle_set_radio (handle,1)
		ensure set: is_radio_toggle
		end

	unset_radio is
			-- Makes the cell renderer to render a check toggle (a
			-- standalone boolean option). See also 'set_radio'.
			-- with cell renderer properties).
		do
			gtk_cell_renderer_toggle_set_radio (handle,0)
		ensure unset: not is_radio_toggle
		end

feature {ANY} -- State
	is_active: BOOLEAN is
			-- Is the cell renderer is active? See 'set_active'.
		do
			Result:=gtk_cell_renderer_toggle_get_active(handle).to_boolean
		end

	set_active is
			-- Activates a cell renderer.
		do
			gtk_cell_renderer_toggle_set_active (handle,1)
		ensure set: is_active
		end

	unset_active, set_inactive is
			-- Deactivates a cell renderer. Note TODO: this feature has 
			-- a double name currently: 'unset_active' is more 
			-- consistent and follow a common naming scheme while 
			-- 'set_inactive' should be "easier" to read and understand. 
			-- Paolo 2006-03-15.
		do
			gtk_cell_renderer_toggle_set_active (handle,0)
		ensure set: is_active
		end

feature {ANY} -- TODO: Property Details
-- The "activatable" property

--   "activatable"          gboolean              : Read / Write

-- The toggle button can be activated.

-- Default value: TRUE
-- The "active" property

--   "active"               gboolean              : Read / Write

-- The toggle state of the button.

-- Default value: FALSE
-- The "inconsistent" property

--   "inconsistent"         gboolean              : Read / Write

-- The inconsistent state of the button.

-- Default value: FALSE
-- The "radio" property

--   "radio"                gboolean              : Read / Write

-- Draw the toggle button as a radio button.

-- Default value: FALSE
-- Signal Details
-- The "toggled" signal

-- void        user_function                  (GtkCellRendererToggle *cell_renderer,
--                                             gchar *path,
--                                             gpointer user_data);

-- The ::toggled signal is emitted when the cell is toggled.

-- cell_renderer : 	the object which received the signal
-- path : 	string representation of GtkTreePath describing the event location
-- user_data : 	user data set when the signal handler was connected.
end
